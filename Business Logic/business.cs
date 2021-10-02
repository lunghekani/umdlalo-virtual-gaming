﻿using DataAccess;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Diagnostics.Eventing.Reader;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Windows.Forms;
using Microsoft.SqlServer.Server;
using Business_Logic;

namespace Business_Logic
{
    // This is a comment to show how git works

    public class clsBasicUserDetails
    {
        public string msg { get; set; }
        public string uid { get; set; }
    }

    public class genfunctions
    {

    }

    public class clsAuthentication
    {
        private clsDataConnection objConn = new clsDataConnection();

        public string HashPassword(string password)
        {
            // Hash the password

            SHA1 algorithm = SHA1.Create();
            byte[] byteArray = null;
            byteArray = algorithm.ComputeHash(Encoding.Default.GetBytes(password));
            string hashedPassword = "";
            for (int i = 0; i < byteArray.Length - 1; i++)
            {
                hashedPassword += byteArray[i].ToString("x2");
            }

            return hashedPassword;
        }

        //pumi's code for signup
        public clsBasicUserDetails AddUser(string User_Name, string User_LstName, string User_Email,
            string User_Password, string Role)
        {
            var cmd = new MySqlCommand();
            cmd.Connection = objConn.CreateSQLConnection();

            cmd.CommandText = "New_User_Add";
            cmd.CommandType = CommandType.StoredProcedure;
            Guid userGuid = Guid.NewGuid();
            cmd.Parameters.AddWithValue("@UserID_In", userGuid.ToString());
            cmd.Parameters.AddWithValue("@UserName_In", User_Name);
            cmd.Parameters.AddWithValue("@UserLastName_In", User_LstName);
            cmd.Parameters.AddWithValue("@UserEmail_In", User_Email);
            cmd.Parameters.AddWithValue("@UserPassword_In", HashPassword(User_Password));
            cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);
            cmd.Parameters.AddWithValue("@UserRole_In", Role);

            MySqlTransaction myTrans;

            myTrans = cmd.Connection.BeginTransaction();
            cmd.Transaction = myTrans;

            try
            {
                cmd.ExecuteNonQuery();
                myTrans.Commit();
                return new clsBasicUserDetails
                {
                    msg = "Success",
                    uid = userGuid.ToString()
                };
                cmd.Connection.Close();
            }
            catch (Exception ex)
            {
                myTrans.Rollback();
                return new clsBasicUserDetails
                {
                    msg = ex.Message
                };

            }

        }

        public clsBasicUserDetails AuthUser(string username, string password)
        {
            var cmd = new MySqlCommand
            {
                Connection = objConn.CreateSQLConnection(),
                CommandText = "Password_Verify",
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("userEmail_IN", username);
            cmd.Parameters.AddWithValue("UserPass_IN", HashPassword((password)));
            cmd.Parameters.Add("Authenticated", MySqlDbType.Int64);
            cmd.Parameters.Add("userID_OUT", MySqlDbType.VarChar, 50);
            cmd.Parameters["Authenticated"].Direction = ParameterDirection.Output;
            cmd.Parameters["userID_OUT"].Direction = ParameterDirection.Output;

            try
            {
                cmd.ExecuteNonQuery();
                Boolean userExists = Convert.ToBoolean(cmd.Parameters["Authenticated"].Value);
                string userID = cmd.Parameters["userID_OUT"].Value.ToString();
                if (userExists)
                {
                    HttpContext.Current.Session["user_id"] = userID;
                }

                return new clsBasicUserDetails
                {
                    msg = "Success",
                    uid = userID
                };
            }
            catch (Exception ex)
            {
                return new clsBasicUserDetails
                {
                    msg = ex.Message
                };
            }
        }

        // code to quickly decrypt 
        public string DecryptString(string cipherText)
        {
            string EncryptionKey = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            cipherText = cipherText.Replace(" ", "+");
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[]
                {
                    0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
                });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }

                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }

            return cipherText;
        }

        // code to quickly encrypt
        public string EncryptString(string encryptString)
        {
            string EncryptionKey = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            byte[] clearBytes = Encoding.Unicode.GetBytes(encryptString);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[]
                {
                    0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
                });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }

                    encryptString = Convert.ToBase64String(ms.ToArray());
                }
            }

            return encryptString;
        }


        public DataTable GetStudents(int userId)
        {
            var dt = new DataTable();

            var conn = objConn.CreateSQLConnection();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "Students_Get";
            cmd.CommandType = CommandType.StoredProcedure;

            MySqlDataReader sqlReader = cmd.ExecuteReader();
            try
            {
                if (sqlReader.HasRows)
                {
                    dt.Load(sqlReader);
                }
            }
            catch (Exception ex)
            {
                dt.Rows.Add(ex.Message);
            }
            finally
            {
                sqlReader.Close();
                cmd.Connection.Close();
            }

            return dt;
        }

    }
    public class clsUserDetails
        {
            private clsAuthentication authclass = new clsAuthentication();
            private clsDataConnection objConn = new clsDataConnection();

            public DataTable GetUserAccDetails(string userID)
            {
                clsDataConnection objConn = new clsDataConnection();
                var dt = new DataTable();

                dt.Columns.Add("Name", typeof(string));
                dt.Columns.Add("LastName", typeof(string));
                dt.Columns.Add("Email", typeof(string));
                dt.Columns.Add("LastLogin", typeof(string));
                dt.Columns.Add("Role", typeof(string));

                var conn = objConn.CreateSQLConnection();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "User_Details_Get";
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("userID_IN", userID);

                MySqlDataReader sqlReader = cmd.ExecuteReader();
                try
                {
                    if (sqlReader.HasRows)
                    {
                        while (sqlReader.Read())
                        {
                            string firstname = sqlReader.GetString(0);
                            string lastname = sqlReader.GetValue(1).ToString();
                            string email = sqlReader.GetValue(2).ToString();
                            string lastlogin = sqlReader.GetValue(3).ToString();
                            string role = sqlReader.GetValue(4).ToString();

                            dt.Rows.Add(firstname, lastname, email, lastlogin, role);
                        }
                    }
                }
                catch (Exception ex)
                {
                    dt.Rows.Add(ex.Message);
                }
                finally
                {
                    sqlReader.Close();
                }

                conn.Close();
                return dt;
            }

            public string UpdateUser(string userId, string name, string lastName, string email, int disabled)
            {
                var cmd = new MySqlCommand();
                cmd.Connection = objConn.CreateSQLConnection();

                cmd.CommandText = "User_Self_Update";
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserID_In", userId);
                cmd.Parameters.AddWithValue("@Name_IN", name);
                cmd.Parameters.AddWithValue("@LastName_IN", lastName);
                cmd.Parameters.AddWithValue("@Email_IN", email);
                cmd.Parameters.AddWithValue("@Disabled_IN", disabled);

                MySqlTransaction myTrans;

                myTrans = cmd.Connection.BeginTransaction();
                cmd.Transaction = myTrans;

                try
                {
                    cmd.ExecuteNonQuery();
                    myTrans.Commit();
                    cmd.Connection.Close();
                    return "Success";
                }
                catch (Exception ex)
                {
                    myTrans.Rollback();
                    cmd.Connection.Close();
                    return ex.Message;

                }

            }

            public DataTable GetStudents(int userId)
            {
                var dt = new DataTable();

                var conn = objConn.CreateSQLConnection();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "Students_Get";
                cmd.CommandType = CommandType.StoredProcedure;

                MySqlDataReader sqlReader = cmd.ExecuteReader();
                try
                {
                    if (sqlReader.HasRows)
                    {
                        dt.Load(sqlReader);
                    }
                }
                catch (Exception ex)
                {
                    dt.Rows.Add(ex.Message);
                }
                finally
                {
                    sqlReader.Close();
                    cmd.Connection.Close();
                }

                return dt;
            }
        }


        public class clsCourseOperations
        {
            private clsDataConnection objConn = new clsDataConnection();

            public string CreateCourse(string name, string descr, string code, DateTime startTime, DateTime endTime,
                string Uid,
                int disabledInt)
            {
                var cmd = new MySqlCommand();
                cmd.Connection = objConn.CreateSQLConnection();

                cmd.CommandText = "Course_Create";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CourseName", name);
                cmd.Parameters.AddWithValue("@CourseDescrip", descr);
                cmd.Parameters.AddWithValue("@CourseCode", code);
                cmd.Parameters.AddWithValue("@StartTime", startTime);
                cmd.Parameters.AddWithValue("@EndTime", endTime);
                cmd.Parameters.AddWithValue("@Uid", Uid);
                cmd.Parameters.AddWithValue("@DisabledIN", disabledInt);

                MySqlTransaction myTrans;

                myTrans = cmd.Connection.BeginTransaction();
                cmd.Transaction = myTrans;
                try
                {
                    cmd.ExecuteNonQuery();
                    myTrans.Commit();
                    return "Success";
                }
                catch (Exception ex)
                {
                    myTrans.Rollback();
                    return ex.Message;

                }
                finally
                {
                    cmd.Connection.Close();
                }

            }

            public DataTable GetCourses()
            {
                var dt = new DataTable();
                // Removed this because this gets passed in
                // HttpContext.Current.Session["user_id"] = User_ID;

                dt.Columns.Add("Id", typeof(int));
                dt.Columns.Add("Name", typeof(string));
                dt.Columns.Add("Description", typeof(string));
                dt.Columns.Add("Code", typeof(string));
                dt.Columns.Add("Start", typeof(string));
                dt.Columns.Add("End", typeof(string));
                dt.Columns.Add("Instructor", typeof(string));
                dt.Columns.Add("Email", typeof(string));

                var conn = objConn.CreateSQLConnection();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = conn;
                //incorrect procedure name
                cmd.CommandText = "Courses_Get";
                cmd.CommandType = CommandType.StoredProcedure;


                MySqlDataReader sqlReader = cmd.ExecuteReader();
                try
                {
                    if (sqlReader.HasRows)
                    {
                        while (sqlReader.Read())
                        {
                            {
                                int Id = Convert.ToInt32(sqlReader.GetValue(0).ToString());
                                string name = String.Empty;
                                if (sqlReader["Name"].Equals(DBNull.Value))
                                {
                                    name = "-";
                                }
                                else
                                {
                                    name = sqlReader["Name"].ToString();
                                }

                                string descr = String.Empty;
                                if (sqlReader["Description"].Equals(DBNull.Value))
                                {
                                    descr = "No description provided";
                                }
                                else
                                {
                                    descr = sqlReader["Description"].ToString();
                                }

                                string code = String.Empty;
                                if (sqlReader["Code"].Equals(DBNull.Value))
                                {
                                    code = "-";
                                }
                                else
                                {
                                    code = sqlReader["Code"].ToString();
                                }

                                string start = String.Empty;
                                if (sqlReader["Start"].Equals(DBNull.Value))
                                {
                                    start = "-";
                                }
                                else
                                {
                                    start = sqlReader["Start"].ToString();
                                }

                                string end = String.Empty;
                                if (sqlReader["End"].Equals(DBNull.Value))
                                {
                                    end = "-";
                                }
                                else
                                {
                                    end = sqlReader["End"].ToString();
                                }

                                string lecturerName = String.Empty;
                                if (sqlReader["Lecturer"].Equals(DBNull.Value))
                                {
                                    lecturerName = "-";
                                }
                                else
                                {
                                    lecturerName = sqlReader["Lecturer"].ToString();
                                }

                                string lecturerEmail = String.Empty;
                                if (sqlReader["Email"].Equals(DBNull.Value))
                                {
                                    lecturerEmail = "-";
                                }
                                else
                                {
                                    lecturerEmail = sqlReader["Email"].ToString();
                                }




                                dt.Rows.Add(Id, name, descr, code, start, end, lecturerName, lecturerEmail);
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    dt.Rows.Add(ex.Message);
                }
                finally
                {
                    sqlReader.Close();
                    cmd.Connection.Close();
                }

                return dt;
            }

            public string CreateTopic(string name, string descr, string Uid, int marks, int courseID, int disabledInt)
            {
                var cmd = new MySqlCommand();
                cmd.Connection = objConn.CreateSQLConnection();

                cmd.CommandText = "Topic_Create";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TopicName", name);
                cmd.Parameters.AddWithValue("@TopicDescription", descr);
                cmd.Parameters.AddWithValue("@TopicMarks", marks);
                cmd.Parameters.AddWithValue("@CourseID", courseID);
                cmd.Parameters.AddWithValue("@Uid_in", Uid);
                cmd.Parameters.AddWithValue("@disabled_in", disabledInt);


                MySqlTransaction myTrans;

                myTrans = cmd.Connection.BeginTransaction();
                cmd.Transaction = myTrans;
                try
                {
                    cmd.ExecuteNonQuery();
                    myTrans.Commit();
                    return "Success";
                }
                catch (Exception ex)
                {
                    myTrans.Rollback();
                    return ex.Message;

                }
                finally
                {
                    cmd.Connection.Close();
                }

            }

            public DataTable CreateAssessment(int topicId)
            {
                var dt = new DataTable();

                var conn = objConn.CreateSQLConnection();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "Assessment_Create";
                cmd.CommandType = CommandType.StoredProcedure;

                MySqlDataReader sqlReader = cmd.ExecuteReader();
                try
                {
                    if (sqlReader.HasRows)
                    {
                        dt.Load(sqlReader);
                    }
                }
                catch (Exception ex)
                {
                    dt.Rows.Add(ex.Message);
                }
                finally
                {
                    sqlReader.Close();
                    cmd.Connection.Close();
                }

                return dt;
            }

            public string UpdateTopic(string name, string descr, string Uid, int marks, int disabledInt)
            {
                var cmd = new MySqlCommand();
                cmd.Connection = objConn.CreateSQLConnection();

                cmd.CommandText = "Topic_Update";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name_In", name);
                cmd.Parameters.AddWithValue("@Descr_In", descr);
                cmd.Parameters.AddWithValue("@Marks_In", marks);
                cmd.Parameters.AddWithValue("@Uid", Uid);
                cmd.Parameters.AddWithValue("@Disabled_In", disabledInt);


                MySqlTransaction myTrans;

                myTrans = cmd.Connection.BeginTransaction();
                cmd.Transaction = myTrans;
                try
                {
                    cmd.ExecuteNonQuery();
                    myTrans.Commit();
                    return "Success";
                }
                catch (Exception ex)
                {
                    myTrans.Rollback();
                    return ex.Message;

                }
                finally
                {
                    cmd.Connection.Close();
                }

            }

            public DataTable GetTopics(int courseId)
            {
                var dt = new DataTable();

                var conn = objConn.CreateSQLConnection();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "Topics_Per_Course_Get";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("Course_ID_IN", courseId);

                MySqlDataReader sqlReader = cmd.ExecuteReader();
                try
                {
                    if (sqlReader.HasRows)
                    {
                        dt.Load(sqlReader);
                    }
                }
                catch (Exception ex)
                {
                    dt.Rows.Add(ex.Message);
                }
                finally
                {
                    sqlReader.Close();
                    cmd.Connection.Close();
                }

                return dt;
            }

            public DataTable GetTopic(int topicId)
            {
                var dt = new DataTable();

                var conn = objConn.CreateSQLConnection();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "Topic_Get";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("topicId", topicId);

                MySqlDataReader sqlReader = cmd.ExecuteReader();
                try
                {
                    if (sqlReader.HasRows)
                    {
                        dt.Load(sqlReader);
                    }
                }
                catch (Exception ex)
                {
                    dt.Rows.Add(ex.Message);
                }
                finally
                {
                    sqlReader.Close();
                    cmd.Connection.Close();
                }

                return dt;

            }

            public DataTable GetTopicContent(int topicId)
            {
                var dt = new DataTable();

                var conn = objConn.CreateSQLConnection();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "Content_Get";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("topic_id", topicId);

                MySqlDataReader sqlReader = cmd.ExecuteReader();
                try
                {
                    if (sqlReader.HasRows)
                    {
                        dt.Load(sqlReader);

                    }

                    return dt;
                }
                catch (Exception ex)
                {
                    dt.Rows.Add(ex.Message);
                    return dt;
                }
                finally
                {
                    sqlReader.Close();
                    cmd.Connection.Close();
                }


            }

            public string UpdateContent(int topicId)
            {
                //todo finsih the parameters for this procedure on both ends
                var cmd = new MySqlCommand();
                cmd.Connection = objConn.CreateSQLConnection();

                cmd.CommandText = "Topic_Update";
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@Name_In", name);
                //cmd.Parameters.AddWithValue("@Descr_In", descr);
                //cmd.Parameters.AddWithValue("@Marks_In", marks);
                //cmd.Parameters.AddWithValue("@Uid", Uid);
                //cmd.Parameters.AddWithValue("@Disabled_In", disabledInt);


                MySqlTransaction myTrans;

                myTrans = cmd.Connection.BeginTransaction();
                cmd.Transaction = myTrans;
                try
                {
                    cmd.ExecuteNonQuery();
                    myTrans.Commit();
                    return "Success";
                }
                catch (Exception ex)
                {
                    myTrans.Rollback();
                    return ex.Message;

                }
                finally
                {
                    cmd.Connection.Close();
                }


            }

        }

    public class clsProjects
    {
        public string lastProjectInsert;

        //Start: Project creation command
        public string CreateProject(string proj_Name, string htmlCode, string cssCode, string jsCode,
            int visibility, string User_id)
        {
            //using (var objConn = new clsDataConnection().CreateSQLConnection())
            //{
            //    var cmd_session = new MySqlCommand($"SELECT Name FROM umdlalo_lms.user WHERE ID='{User_id}' LIMIT 1", objConn);
            //    var sqlReader = cmd_session.ExecuteReader();
            //    while (sqlReader.Read())
            //    {
            //        var name = sqlReader.GetValue(0).ToString();
            //        HttpContext.Current.Session["user_name"] = User_id;
            //    }
            //}
            // Use the following to get the user ID it gets created when the user logs in Session["user_id"].ToString()

            var objConn = new clsDataConnection();
            var cmd = new MySqlCommand();
            cmd.Connection = objConn.CreateSQLConnection();

            cmd.CommandText = "Projects_Create";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@User_ID_IN", User_id);
            cmd.Parameters.AddWithValue("@Name_IN", proj_Name);
            cmd.Parameters.AddWithValue("@HTML_IN", htmlCode);
            cmd.Parameters.AddWithValue("@CSS_IN", cssCode);
            cmd.Parameters.AddWithValue("@JS_IN", jsCode);
            cmd.Parameters.AddWithValue("@Enabled_IN", visibility);
            MySqlTransaction myTrans;

            myTrans = cmd.Connection.BeginTransaction();
            cmd.Transaction = myTrans;
            try
            {
                cmd.ExecuteNonQuery();
                myTrans.Commit();
                MySqlDataReader sqlReader = cmd.ExecuteReader();
                while (sqlReader.Read())
                {

                    lastProjectInsert = sqlReader.GetValue(0).ToString();

                }

                return "Success";
            }
            catch (Exception ex)
            {
                myTrans.Rollback();
                return ex.Message;

            }
        }

        //End of project creation command


        //Start of Comment creation command
        public string CreateComment(int Project_ID, string User_ID, string Comment)
        {
            var objConn = new clsDataConnection();
            var cmd = new MySqlCommand();
            cmd.Connection = objConn.CreateSQLConnection();

            cmd.CommandText = "Comment_Create";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@User_ID_IN", User_ID);
            cmd.Parameters.AddWithValue("@Project_ID_IN", Project_ID);
            cmd.Parameters.AddWithValue("@Comment_IN", Comment);
            MySqlTransaction myTrans;

            myTrans = cmd.Connection.BeginTransaction();
            cmd.Transaction = myTrans;
            try
            {
                cmd.ExecuteNonQuery();
                myTrans.Commit();
                MySqlDataReader sqlReader = cmd.ExecuteReader();
                while (sqlReader.Read())
                {

                    lastProjectInsert = sqlReader.GetValue(0).ToString();

                }

                return "Success";
            }
            catch (Exception ex)
            {
                myTrans.Rollback();
                return ex.Message;

            }
        }

        public DataTable GetProjectComments(int project_ID)
        {
            clsDataConnection objConn = new clsDataConnection();
            var dt = new DataTable();
            // Removed this because this gets passed in
            // HttpContext.Current.Session["user_id"] = User_ID;


            dt.Columns.Add("Name", typeof(string));

            dt.Columns.Add("Comments", typeof(string));

            dt.Columns.Add("DateCreated", typeof(DateTime));



            var conn = objConn.CreateSQLConnection();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conn;
            //incorrect procedure name
            cmd.CommandText = "Comment_Get";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Project_ID_IN", project_ID);

            MySqlDataReader sqlReader = cmd.ExecuteReader();
            try
            {
                if (sqlReader.HasRows)
                {
                    dt.Load(sqlReader);
                }
            }
            catch (Exception ex)
            {
                dt.Rows.Add(ex.Message);
            }
            finally
            {
                sqlReader.Close();
                cmd.Connection.Close();
            }

            return dt; //Forgot to put a curly bracket and a return statement in the code

        }

        //End: Create Comment

        //Start: Project View command

        public string UpdateProject(string proj_Name, string htmlCode, string cssCode, string jsCode,
            int visibility, string projectId)
        {
            //using (var objConn = new clsDataConnection().CreateSQLConnection())
            //{
            //    var cmd_session = new MySqlCommand($"SELECT Name FROM umdlalo_lms.user WHERE ID='{User_id}' LIMIT 1", objConn);
            //    var sqlReader = cmd_session.ExecuteReader();
            //    while (sqlReader.Read())
            //    {
            //        var name = sqlReader.GetValue(0).ToString();
            //        HttpContext.Current.Session["user_name"] = User_id;
            //    }
            //}
            // Use the following to get the user ID it gets created when the user logs in Session["user_id"].ToString()

            var objConn = new clsDataConnection();
            var cmd = new MySqlCommand();
            cmd.Connection = objConn.CreateSQLConnection();

            cmd.CommandText = "Projects_Update";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Project_ID_IN", projectId);
            cmd.Parameters.AddWithValue("@Name_IN", proj_Name);
            cmd.Parameters.AddWithValue("@HTML_IN", htmlCode);
            cmd.Parameters.AddWithValue("@CSS_IN", cssCode);
            cmd.Parameters.AddWithValue("@JS_IN", jsCode);
            cmd.Parameters.AddWithValue("@Enabled_IN", visibility);
            MySqlTransaction myTrans;

            myTrans = cmd.Connection.BeginTransaction();
            cmd.Transaction = myTrans;
            try
            {
                cmd.ExecuteNonQuery();
                myTrans.Commit();
                MySqlDataReader sqlReader = cmd.ExecuteReader();

                return "Success";
            }
            catch (Exception ex)
            {
                myTrans.Rollback();
                return ex.Message;

            }
        }

        public DataTable View_Project(int projectId)
        {
            //public DataTable View_Project(int User_ID) - was here before
            //this should take in a project ID because we are viewing a project
            clsDataConnection objConn = new clsDataConnection();
            var dt = new DataTable();
            // Removed this because this gets passed in
            // HttpContext.Current.Session["user_id"] = User_ID;

            dt.Columns.Add("Id", typeof(int));
            dt.Columns.Add("Name", typeof(string));
            dt.Columns.Add("Creator", typeof(string));
            dt.Columns.Add("Likes", typeof(string));
            dt.Columns.Add("Comments", typeof(string));
            dt.Columns.Add("Views", typeof(string));
            dt.Columns.Add("Description", typeof(string));
            dt.Columns.Add("HTML", typeof(string));
            dt.Columns.Add("HTMLLines", typeof(string));
            dt.Columns.Add("JS", typeof(string));
            dt.Columns.Add("JSSLines", typeof(string));
            dt.Columns.Add("CSS", typeof(string));
            dt.Columns.Add("CSSLines", typeof(string));
            dt.Columns.Add("UserID", typeof(string));
            dt.Columns.Add("DateCreated", typeof(DateTime));
            dt.Columns.Add("Enabled", typeof(int));


            var conn = objConn.CreateSQLConnection();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conn;
            //incorrect procedure name
            cmd.CommandText = "Projects_Get";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("Project_ID_IN", projectId);

            MySqlDataReader sqlReader = cmd.ExecuteReader();
            try
            {
                if (sqlReader.HasRows)
                {
                    while (sqlReader.Read())
                    {


                        int Id = Convert.ToInt32(sqlReader.GetValue(0));
                        string name = sqlReader.GetValue(1).ToString();
                        string likes = Convert.ToInt32(sqlReader.GetValue(2)).ToString("##,###");
                        string comments = Convert.ToInt32(sqlReader.GetValue(3)).ToString("##,###");
                        string views = Convert.ToInt32(sqlReader.GetValue(4)).ToString("##,###");
                        string descr = sqlReader.GetValue(5).ToString();
                        string HTML = sqlReader.GetValue(6).ToString();
                        string htmlLines = HTML.Split('\n').Length.ToString("##,###");
                        string CSS = sqlReader.GetValue(7).ToString();
                        string cssLines = CSS.Split('\n').Length.ToString("##,###");
                        string JSS = sqlReader.GetValue(8).ToString();
                        string jsLines = JSS.Split('\n').Length.ToString("##,###");
                        string datecreated = sqlReader.GetValue(9).ToString();
                        int enabled = Convert.ToInt32(sqlReader.GetValue(10));
                        string userId = sqlReader.GetValue(11).ToString();
                        string creator = sqlReader.GetValue(12).ToString();
                        dt.Rows.Add(Id, name, creator, likes, comments, views, descr, HTML, htmlLines, JSS, jsLines,
                            CSS, cssLines, userId, datecreated, enabled);
                    }
                }
            }
            catch (Exception ex)
            {
                dt.Rows.Add(ex.Message);
            }
            finally
            {
                sqlReader.Close();
            }

            return dt; //Forgot to put a curly bracket and a return statement in the code
        }

        public DataTable GetAllProjects()
        {
            clsDataConnection objConn = new clsDataConnection();
            var dt = new DataTable();
            // Removed this because this gets passed in
            // HttpContext.Current.Session["user_id"] = User_ID;

            dt.Columns.Add("Id", typeof(int));
            dt.Columns.Add("Name", typeof(string));
            dt.Columns.Add("Creator", typeof(string));
            dt.Columns.Add("Likes", typeof(string));
            dt.Columns.Add("Comments", typeof(string));
            dt.Columns.Add("Views", typeof(string));
            dt.Columns.Add("Description", typeof(string));
            dt.Columns.Add("HTMLLines", typeof(string));
            dt.Columns.Add("JSSLines", typeof(string));
            dt.Columns.Add("CSSLines", typeof(string));
            dt.Columns.Add("DateCreated", typeof(DateTime));
            dt.Columns.Add("Enabled", typeof(int));


            var conn = objConn.CreateSQLConnection();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conn;
            //incorrect procedure name
            cmd.CommandText = "E_Sports_Get";
            cmd.CommandType = CommandType.StoredProcedure;


            MySqlDataReader sqlReader = cmd.ExecuteReader();
            try
            {
                if (sqlReader.HasRows)
                {
                    while (sqlReader.Read())
                    {

                        int Id = Convert.ToInt32(sqlReader.GetValue(0));
                        string name = sqlReader.GetValue(1).ToString();
                        string likes = Convert.ToInt32(sqlReader.GetValue(2)).ToString("##,###");
                        string comments = Convert.ToInt32(sqlReader.GetValue(3)).ToString("##,###");
                        string views = Convert.ToInt32(sqlReader.GetValue(4)).ToString("##,###");
                        string descr = sqlReader.GetValue(5).ToString();
                        string HTML = sqlReader.GetValue(6).ToString().Split('\n').Length.ToString("##,###");
                        string CSS = sqlReader.GetValue(7).ToString().Split('\n').Length.ToString("##,###");
                        string JSS = sqlReader.GetValue(8).ToString().Split('\n').Length.ToString("##,###");
                        string datecreated = sqlReader.GetValue(9).ToString();
                        int enabled = Convert.ToInt32(sqlReader.GetValue(10));
                        string creator = sqlReader.GetValue(12).ToString();
                        dt.Rows.Add(Id, name, creator, likes, comments, views, descr, HTML, JSS, CSS, datecreated,
                            enabled);
                    }
                }
            }
            catch (Exception ex)
            {
                dt.Rows.Add(ex.Message);
            }
            finally
            {
                sqlReader.Close();
                cmd.Connection.Close();
            }

            return dt; //Forgot to put a curly bracket and a return statement in the code


        }

        public DataTable GetAllUserProjects(string userId)
        {
            clsDataConnection objConn = new clsDataConnection();
            var dt = new DataTable();
            // Removed this because this gets passed in
            // HttpContext.Current.Session["user_id"] = User_ID;
            dt.Columns.Add("Id", typeof(int));
            dt.Columns.Add("Name", typeof(string));
            dt.Columns.Add("Creator", typeof(string));
            dt.Columns.Add("Likes", typeof(string));
            dt.Columns.Add("Comments", typeof(string));
            dt.Columns.Add("Views", typeof(string));
            dt.Columns.Add("Description", typeof(string));
            dt.Columns.Add("HTMLLines", typeof(string));
            dt.Columns.Add("JSSLines", typeof(string));
            dt.Columns.Add("CSSLines", typeof(string));
            dt.Columns.Add("DateCreated", typeof(DateTime));
            dt.Columns.Add("Enabled", typeof(int));

            var conn = objConn.CreateSQLConnection();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conn;
            //incorrect procedure name
            cmd.CommandText = "Personal_Projects_Get";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@userID", userId);

            MySqlDataReader sqlReader = cmd.ExecuteReader();
            try
            {
                if (sqlReader.HasRows)
                {
                    while (sqlReader.Read())
                    {

                        int Id = Convert.ToInt32(sqlReader.GetValue(0));
                        string name = sqlReader.GetValue(1).ToString();
                        string likes = Convert.ToInt32(sqlReader.GetValue(2)).ToString("##,###");
                        string comments = Convert.ToInt32(sqlReader.GetValue(3)).ToString("##,###");
                        string views = Convert.ToInt32(sqlReader.GetValue(4)).ToString("##,###");
                        string descr = sqlReader.GetValue(5).ToString();
                        string HTML = sqlReader.GetValue(6).ToString().Split('\n').Length.ToString("##,###");
                        string CSS = sqlReader.GetValue(7).ToString().Split('\n').Length.ToString("##,###");
                        string JSS = sqlReader.GetValue(8).ToString().Split('\n').Length.ToString("##,###");
                        string datecreated = sqlReader.GetValue(9).ToString();
                        int enabled = Convert.ToInt32(sqlReader.GetValue(10));
                        string creator = sqlReader.GetValue(12).ToString();
                        dt.Rows.Add(Id, name, creator, likes, comments, views, descr, HTML, JSS, CSS, datecreated,
                            enabled);
                    }
                }
            }
            catch (Exception ex)
            {
                dt.Rows.Add(ex.Message);
            }
            finally
            {
                sqlReader.Close();
                cmd.Connection.Close();
            }

            return dt; //Forgot to put a curly bracket and a return statement in the code


        }





        public void checkLikes(object project_id, object user_id)
        {
            //not logged in
            if (clsSmallItemsHandler.SessionIdIsSet == false) return;

            var value = false;
            using (var objConn = new clsDataConnection().CreateSQLConnection())
            {
                var cmd = new MySqlCommand(
                    $" SELECT * FROM umdlalo_lms.likes  WHERE Project_Id='{project_id}'  AND User_Id='{user_id}' LIMIT 1 ",
                    objConn);

                var sqlReader = cmd.ExecuteReader();
                while (sqlReader.Read())
                {
                    value = true;

                }

                sqlReader.Close();

            }

            if (value == true) return;
            //inserting like to the likes table
            using (var objConn = new clsDataConnection().CreateSQLConnection())
            {
                var str =
                    $"INSERT INTO  umdlalo_lms.likes(Project_Id,User_Id) VALUES('{project_id}', '{user_id}')";
                var cmd = new MySqlCommand(str, objConn);
                cmd.ExecuteNonQuery();
            }

            ////inserting like to the likes table
            //using (var objConn = new clsDataConnection().CreateSQLConnection())
            //{
            //    var str =
            //        $"INSERT INTO  umdlalo_lms.likes(Project_Id,User_Id) VALUES('{project_id}', '{user_id}')";
            //    var cmd = new MySqlCommand(str, objConn);
            //    cmd.ExecuteNonQuery();
            //}


        }

        public Dictionary<string, string> current_project_chats(string decoded_id)
        {
            Dictionary<string, string> course_list = new Dictionary<string, string>();
            if (decoded_id.Trim().Length == 0) return course_list;
            //is a numer
            int num;
            var isNumber = int.TryParse(decoded_id.Trim(), out num);
            if(isNumber==false) return course_list;
            //end

            ///course names
            using (var objConn = new clsDataConnection().CreateSQLConnection())
            {
                var cmd = new MySqlCommand($"SELECT Name,ID  FROM umdlalo_lms.projects WHERE ID={decoded_id}", objConn);
                var sqlReader = cmd.ExecuteReader();

                while (sqlReader.Read())
                {
                    var course_name = sqlReader.GetValue(0).ToString();
                    var course_code = sqlReader.GetValue(1).ToString();
                    course_list[course_code] = course_name;
                }

            }
            return course_list;
        }

        public void InsertMessage(string name, string user_id, string project_id, string time, string message)
        {
            var user_name = clsSmallItemsHandler.User_Name(user_id);
            using (var objConn = new clsDataConnection().CreateSQLConnection())
            {
                var str =
                    $"INSERT INTO umdlalo_lms.comments_clone(project_id,user_id,message,time,user_name) VALUES('{project_id}','{user_id}','{message}','{time}','{user_name}')";
                 var cmd = new MySqlCommand(str, objConn);
                cmd.ExecuteNonQuery();

               
            }
        }

        public object FetchMesssges(string project_id, string messageLimit)
        {
            using (var objConn = new clsDataConnection().CreateSQLConnection())
            {
                //create notification when fetch messages
                //CreateNotification(course_code);

                var ListOfMessages = new List<object>();

                var cmd = new MySqlCommand($"SELECT * FROM   umdlalo_lms.comments_clone WHERE project_id= '{project_id}' ",
                    objConn);
                var sqlReader = cmd.ExecuteReader();

                while (sqlReader.Read())
                {
                    var name = sqlReader.GetString("user_name");
                    var user_id = sqlReader.GetString("user_id");

                    var time = sqlReader.GetString("time");
                    var message = sqlReader.GetString("message");
                    ListOfMessages.Add(new { user_name = name, user_id = user_id, message = message, time = time });
                }

                sqlReader.Close();
                return ListOfMessages;
            }
        }
    }
    public class clsCommunicate
    {


            public void SendHTMLEmail(string mailto, string subject, string body)
            {
                SmtpSection smtpSection = (SmtpSection) ConfigurationManager.GetSection("system.net/mailSettings/smtp");
                using (MailMessage mm = new MailMessage(smtpSection.From, mailto))
                {
                    mm.Subject = subject;
                    mm.Body = body;
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = smtpSection.Network.Host;
                    smtp.EnableSsl = smtpSection.Network.EnableSsl;
                    NetworkCredential networkCred =
                        new NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
                    smtp.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
                    smtp.Credentials = networkCred;
                    smtp.Port = smtpSection.Network.Port;
                    smtp.Send(mm);
                }
            }

            public enum MessageType
            {
                success,
                error,
                info,
                warning
            };

            public void ShowMessage(Page page, string Message, MessageType type)
            {

                ScriptManager.RegisterStartupScript(page, page.GetType(), System.Guid.NewGuid().ToString(),
                    "$.notify({ message: '" + Message + ".'},{type: '" + type +
                    "',showProgressbar: true,animate: {\r\n\t\tenter: 'animated fadeInDown',\r\n\t\texit: 'animated fadeOutUp'\r\n\t},});",
                    true);

            }
     }

        public class clsSmallItemsHandler
        {
            private MySqlCommand cmd;

        public static string User_Name(object user_id)
        {
            var value = "";
            using (var objConn = new clsDataConnection().CreateSQLConnection())
            {
                //get user name
               var  cmd = new MySqlCommand($"SELECT Name FROM umdlalo_lms.user WHERE ID='{user_id}' LIMIT 1", objConn);
                var sqlReader = cmd.ExecuteReader();
                while (sqlReader.Read())
                {
                    var role = sqlReader.GetValue(0).ToString();
                    value = role;
                }

                //end user name
                sqlReader.Close();
            }
            return value.ToLower();
        }

        //get the user role
        public string User_Role(object user_id)
            {
                var value = "";
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    //get user name
                    cmd = new MySqlCommand($"SELECT Role FROM umdlalo_lms.user WHERE ID='{user_id}' LIMIT 1", objConn);
                    var sqlReader = cmd.ExecuteReader();
                    while (sqlReader.Read())
                    {
                        var role = sqlReader.GetValue(0).ToString();
                        value = role;
                    }

                //end user name
                sqlReader.Close();
            }
            return value.ToLower() ;
        }
        //session helper
        public static bool SessionIdIsSet => HttpContext.Current.Session["user_id"] == null ? false : true;

            public string Lecturer_ID(object course_code)
            {
                var value = "";
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    cmd = new MySqlCommand(
                        $"SELECT Uid FROM umdlalo_lms.Course WHERE  Code='{course_code}'  LIMIT 1 ",
                        objConn);

                    var sqlReader = cmd.ExecuteReader();
                    while (sqlReader.Read())
                    {
                        value = sqlReader.GetValue(0).ToString();

                    }

                    sqlReader.Close();

                }

                return value;
            }

            public string FullCourseName(object course_code)
            {
                var value = "";
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    cmd = new MySqlCommand($"SELECT Name FROM umdlalo_lms.course WHERE Code='{course_code}'  LIMIT 1",
                        objConn);
                    var sqlReader = cmd.ExecuteReader();

                    while (sqlReader.Read())
                    {
                        value = sqlReader.GetValue(0).ToString();


                    }

                    sqlReader.Close();

                }

                return value;
            }

            public string GetEmail(object user_id)
            {
                var value = "";
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    cmd = new MySqlCommand(
                        $"SELECT Email FROM umdlalo_lms.user WHERE  ID='{user_id}'  LIMIT 1 ",
                        objConn);

                    var sqlReader = cmd.ExecuteReader();
                    while (sqlReader.Read())
                    {
                        value = sqlReader.GetValue(0).ToString();

                    }

                    sqlReader.Close();

                }

                return value;
            }

            public void SendEmail(string to_email, string message, string course_name)
            {


                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                mail.From = new MailAddress("api.noreplay.test@gmail.com");
                mail.To.Add(to_email);
                mail.Subject = $"New Message From  {course_name}";
                mail.Body = $"{message}";



                SmtpServer.Port = 587;
                SmtpServer.Credentials =
                    new System.Net.NetworkCredential("api.noreplay.test@gmail.com", "api.noreplay@12");
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);
            }

            public string Course_Name(object course_code)
            {
                var value = "";
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    cmd = new MySqlCommand(
                        $"SELECT Name FROM umdlalo_lms.Course WHERE  Code='{course_code}'  LIMIT 1 ",
                        objConn);

                    var sqlReader = cmd.ExecuteReader();
                    while (sqlReader.Read())
                    {
                        value = sqlReader.GetValue(0).ToString();

                    }

                    sqlReader.Close();

                }

                return value;
            }


        }

        public class clsPrivateChat
        {
            private MySqlCommand cmd;
            private MySqlDataReader sqlReader;
            private string user_id;
            public string param_course_code;

            public string setCurrentCourse_code { get; set; }

            public clsPrivateChat(object user_id)
            {
                this.user_id = user_id.ToString();
            }

            //create notification on when fetching messages
            public void CreateNotification(object course_code)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    /*
                     * when fetch messages, we create the notification and set to 0 if not exist for later updates
                     * for later update
                     */

                    cmd = new MySqlCommand(
                        $"SELECT* FROM umdlalo_lms.private_chat_notification WHERE user_id='{user_id}'and  course_code='{course_code}'",
                        objConn);

                    sqlReader = cmd.ExecuteReader();

                    var list = new List<string>();
                    //if not user_notification row then we create one
                    if (sqlReader.Read())
                    {
                        list.Add("got a mtach");
                    }

                    sqlReader.Close();

                    if (list.Count == 0)
                    {
                        var str =
                            $"INSERT INTO  umdlalo_lms.private_chat_notification (user_id,course_code,notification,time,belong_to) VALUES('{user_id}','{course_code}',0,'','{user_id}')";
                        var cmd = new MySqlCommand(str, objConn);
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                        //resetNotification(course_code); //set the current user notification to 0
                    }
                }
            }

            //set the notication value to 0 and return 0
            public object resetNotification(object course_code)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    //update all the the current user notification in the current course
                    cmd = new MySqlCommand(
                        $"UPDATE  umdlalo_lms.private_chat_notification SET notification =0 WHERE course_code='{course_code}'  AND user_id='{user_id}' and belong_to={user_id} ",
                        objConn);
                    cmd.ExecuteNonQuery();

                    cmd = new MySqlCommand(
                        $"SELECT * FROM  umdlalo_lms.private_chat_notification WHERE  course_code='{course_code}'  AND user_id={user_id} LIMIT 1 ",
                        objConn);
                    var notification = "";
                    var time = "";

                    sqlReader = cmd.ExecuteReader();
                    while (sqlReader.Read())
                    {
                        notification = sqlReader.GetString("notification");
                        time = sqlReader.GetString("time");
                    }

                    sqlReader.Close();
                    return new {notification = notification, time = time};
                }
            }

            /// <summary>
            /// return the current notification value
            /// </summary>
            /// <param name="course_id"></param>
            /// <returns></returns>
            public object Current_user_Notification(string course_code)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    cmd = new MySqlCommand(
                        $"SELECT * FROM umdlalo_lms.private_chat_notification WHERE  course_code='{course_code}'  AND user_id='{user_id}' LIMIT 1 ",
                        objConn);
                    var notification = "";
                    var time = "";
                    sqlReader = cmd.ExecuteReader();
                    while (sqlReader.Read())
                    {
                        notification = sqlReader.GetString("notification");
                        time = sqlReader.GetString("time");
                    }

                    sqlReader.Close();
                    return new {notification = notification, time = time};
                }
            }

            /// <summary>
            /// update all the user id
            /// </summary>
            /// <param name="course_id"></param>
            /// <returns></returns>
            public void UpdateAllNotifications(string course_code, string time)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    //update all the the current user notification in the current course
                    cmd = new MySqlCommand(
                        $"SELECT* FROM umdlalo_lms.private_chat_notification WHERE  course_code='{course_code}' AND user_id='{user_id}' ",
                        objConn);
                    sqlReader = cmd.ExecuteReader();

                    List<string> c_ids = new List<string>();
                    List<string> u_ids = new List<string>();

                    while (sqlReader.Read())
                    {
                        var current_course_id = sqlReader.GetString("course_code");
                        var current_user_id = sqlReader.GetString("user_id");

                        c_ids.Add(current_course_id);
                        u_ids.Add(current_user_id);
                    }

                    sqlReader.Close();

                    for (int i = 0; i < u_ids.Count; i++)
                    {
                        var c_id = c_ids[i];
                        var u_id = u_ids[i];
                        var str =
                            $"UPDATE umdlalo_lms.private_chat_notification SET notification =notification+1,time='{time}' WHERE course_code ='{c_id}' and user_id='{u_id}'";
                        cmd = new MySqlCommand(str, objConn);
                        cmd.ExecuteNonQuery();
                    }

                    //set the current user notification to 0
                    // resetNotification(course_code);
                }
            }

            public List<object> FetchMesssges(object course_code, object messagesLimit, string current_chat_id = "")
            {


                clsSmallItemsHandler item = new clsSmallItemsHandler();

                var type = item.User_Role(HttpContext.Current.Session["user_id"]) == "student";



                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    //create notification when fetch messages
                    // CreateNotification(course_code);

                    var ListOfMessages = new List<object>();

                    //student part
                    if (type == true)
                    {
                        cmd = new MySqlCommand(
                            $"SELECT * FROM umdlalo_lms.private_chat WHERE (course_code='{course_code}' AND user_id='{user_id}') OR " +
                            $" (course_code='{course_code}' AND user2_id='{user_id}')  ",
                            objConn);
                    } // lecturer part
                    else
                    {
                        cmd = new MySqlCommand(
                            $"SELECT * FROM umdlalo_lms.private_chat WHERE " +
                            $"(course_code='{course_code}' AND user_id='{user_id}' AND user2_id='{current_chat_id}')  OR  " +
                            $"  (course_code='{course_code}' AND user_id='{current_chat_id}' AND user2_id='{user_id}') ",
                            objConn);

                    }

                    sqlReader = cmd.ExecuteReader();

                    while (sqlReader.Read())
                    {
                        var name = sqlReader.GetString("user_name");
                        var user_id = sqlReader.GetString("user_id");

                        var time = sqlReader.GetString("time");
                        var message = sqlReader.GetString("message");
                        ListOfMessages.Add(new {user_name = name, user_id = user_id, message = message, time = time});
                    }

                    sqlReader.Close();
                    return ListOfMessages;
                }
            }


            /// <summary>
            /// method overloading , use the current course code to get the course data
            /// </summary>
            /// <param name="current_course_code"></param>
            /// <returns></returns>

            public List<clsGroupChat.adminStore> CURRENT_STUDENT_LIST(string current_course_code)
            {
                List<clsGroupChat.adminStore> studentList = new List<clsGroupChat.adminStore>();

                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    cmd = new MySqlCommand(
                        $"SELECT ID FROM umdlalo_lms.Course WHERE  Code='{current_course_code}'  LIMIT 1 ",
                        objConn);
                    var course_id = "";
                    sqlReader = cmd.ExecuteReader();
                    while (sqlReader.Read())
                    {
                        course_id = sqlReader.GetValue(0).ToString();

                    }

                    sqlReader.Close();

                    cmd = new MySqlCommand(
                        $"SELECT User_ID FROM umdlalo_lms.courseenrollements WHERE Course_ID={course_id} ",
                        objConn);
                    List<string> student_ids = new List<string>();
                    sqlReader = cmd.ExecuteReader();
                    while (sqlReader.Read())
                    {
                        var id = sqlReader.GetValue(0).ToString();
                        student_ids.Add(id);
                    }

                    sqlReader.Close();



                    foreach (var item in student_ids)
                    {
                        cmd = new MySqlCommand($"SELECT * FROM umdlalo_lms.user WHERE ID='{item}'", objConn);

                        sqlReader = cmd.ExecuteReader();
                        while (sqlReader.Read())
                        {

                            var name = sqlReader.GetValue(1).ToString();
                            var admin = new clsGroupChat.adminStore();
                            admin.course_id = current_course_code;
                            admin.course_name = name;
                            admin.user_id = item;
                            studentList.Add(admin);
                        }

                        sqlReader.Close();
                    }



                }


                return studentList;
            }

            public List<clsGroupChat.adminStore> CURRENT_ADMIN_All_COURSE_ID_AND_NAME()
            {
                var all = new clsGroupChat(user_id);

                return all.CURRENT_ADMIN_All_COURSE_ID_AND_NAME();
            }

            public Dictionary<string, string> CURRENT_USER_All_COURSE_ID_AND_NAME()
            {
                var all = new clsGroupChat(user_id);
                return all.CURRENT_USER_All_COURSE_ID_AND_NAME();
            }



            public void InsertMessage(string user_name, string chat_user_id, string course_code, string time,
                string message)
            {
                clsSmallItemsHandler item = new clsSmallItemsHandler();



                var user2 = item.User_Role(HttpContext.Current.Session["user_id"]) == "student"
                    ? item.Lecturer_ID(course_code) /// if is a student
                    : chat_user_id; /// if is a lectture


                /// ge the current user email
                var email = item.User_Role(HttpContext.Current.Session["user_id"]) == "student"
                    ? item.GetEmail(item.Lecturer_ID(course_code)) // get the lecture email
                    : item.GetEmail(chat_user_id); //student email



                var name = item.User_Role(HttpContext.Current.Session["user_id"]) == "student"
                    ? user_name /// if is a student
                    : item.Course_Name(course_code); /// if is a lectture



                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    //Update all notification excpet the current user
                    //updateAllNotifications(course_code, time);
                    //insert the message data
                    var str =
                        $"INSERT INTO  umdlalo_lms.private_chat(user_name,user_id,course_code,time,message,user2_id) VALUES('{name}','{user_id}','{course_code}','{time}','{message}','{user2}')";
                    cmd = new MySqlCommand(str, objConn);
                    cmd.ExecuteNonQuery();
                }

                var full_course_name = item.FullCourseName(course_code);
                //send the email
                item.SendEmail(email, message, $"{full_course_name}({course_code})");
                //end
            }
        }

    
    public class clsGroupChat
    {
        private MySqlCommand cmd;
        private MySqlDataReader sqlReader;


            private string user_id;

            public clsGroupChat(object user_id)
            {
                this.user_id = user_id.ToString();

            }

            //create notification on when fetching messages
            public void CreateNotification(object course_code)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    /*
                     * when fetch messages, we create the notification and set to 0 if not exist for later updates
                     * for later update
                     */

                    cmd = new MySqlCommand(
                        $"SELECT* FROM umdlalo_lms.group_chat_notification WHERE user_id='{user_id}'and  course_code='{course_code}'",
                        objConn);

                    sqlReader = cmd.ExecuteReader();

                    var list = new List<string>();
                    //if not user_notification row then we create one
                    if (sqlReader.Read())
                    {
                        list.Add("got a mtach");
                    }

                    sqlReader.Close();

                    if (list.Count == 0)
                    {
                        var str =
                            $"INSERT INTO  umdlalo_lms.group_chat_notification (user_id,course_code,notification,time) VALUES('{user_id}','{course_code}',0,'')";
                        var cmd = new MySqlCommand(str, objConn);
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                        // resetNotification(course_code); //set the current user notification to 0
                    }
                }
            }

            //set the notication value to 0 and return 0
            public object resetNotification(object course_code)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    //update all the the current user notification in the current course
                    cmd = new MySqlCommand(
                        $"UPDATE umdlalo_lms.group_chat_notification SET notification =0 WHERE course_code='{course_code}'  AND user_id='{user_id}' ",
                        objConn);
                    cmd.ExecuteNonQuery();

                    cmd = new MySqlCommand(
                        $"SELECT * FROM umdlalo_lms.group_chat_notification WHERE  course_code='{course_code}'  AND user_id='{user_id}' LIMIT 1 ",
                        objConn);
                    var notification = "";
                    var time = "";

                    sqlReader = cmd.ExecuteReader();
                    while (sqlReader.Read())
                    {
                        notification = sqlReader.GetString("notification");
                        time = sqlReader.GetString("time");
                    }

                    sqlReader.Close();
                    return new {notification = notification, time = time};
                }
            }

            /// <summary>
            /// return the current notification value
            /// </summary>
            /// <param name="course_id"></param>
            /// <returns></returns>
            public object current_user_Notification(string course_code)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    cmd = new MySqlCommand(
                        $"SELECT * FROM umdlalo_lms.group_chat_notification WHERE  course_code='{course_code}'  AND user_id='{user_id}' LIMIT 1 ",
                        objConn);
                    var notification = "";
                    var time = "";
                    sqlReader = cmd.ExecuteReader();
                    while (sqlReader.Read())
                    {
                        notification = sqlReader.GetString("notification");
                        time = sqlReader.GetString("time");
                    }

                    sqlReader.Close();
                    return new {notification = notification, time = time};
                }
            }

            /// <summary>
            /// update all the user id
            /// </summary>
            /// <param name="course_id"></param>
            /// <returns></returns>
            public void updateAllNotifications(string course_code, string time)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    //update all the the current user notification in the current course
                    cmd = new MySqlCommand(
                        $"SELECT* FROM umdlalo_lms.group_chat_notification WHERE  course_code='{course_code}' ",
                        objConn);
                    sqlReader = cmd.ExecuteReader();

                    var course_ids = new Dictionary<string, string>();

                    while (sqlReader.Read())
                    {
                        var current_course_code = sqlReader.GetString("course_code");
                        var current_user_id = sqlReader.GetString("user_id");
                        course_ids.Add(current_user_id, current_course_code);
                    }

                    sqlReader.Close();

                    foreach (var id in course_ids)
                    {
                        var str =
                            $"UPDATE umdlalo_lms.group_chat_notification SET notification =notification+1,time='{time}' WHERE course_code ='{id.Value}' and user_id='{id.Key}'";
                        cmd = new MySqlCommand(str, objConn);
                        cmd.ExecuteNonQuery();
                    }

                    //set the current user notification to 0
                    //resetNotification(course_code);
                }
            }

            public List<object> FetchMesssges(object course_code, object messagesLimit)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    //create notification when fetch messages
                    //CreateNotification(course_code);

                    var ListOfMessages = new List<object>();

                    cmd = new MySqlCommand($"SELECT * FROM umdlalo_lms.group_chat WHERE course_code= '{course_code}' ",
                        objConn);
                    sqlReader = cmd.ExecuteReader();

                    while (sqlReader.Read())
                    {
                        var name = sqlReader.GetString("user_name");
                        var user_id = sqlReader.GetString("user_id");

                        var time = sqlReader.GetString("time");
                        var message = sqlReader.GetString("message");
                        ListOfMessages.Add(new {user_name = name, user_id = user_id, message = message, time = time});
                    }

                    sqlReader.Close();
                    return ListOfMessages;
                }
            }

            public class adminStore
            {
                public string course_name { get; set; }
                public string course_id { get; set; }
                public string user_id { get; set; }
            }

            public List<adminStore> CURRENT_ADMIN_All_COURSE_ID_AND_NAME()
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    //admin data
                    List<adminStore> stores = new List<adminStore>();
                    //get user name
                    cmd = new MySqlCommand($"SELECT Name,Code,Uid FROM  umdlalo_lms.course WHERE Uid='{user_id}'",
                        objConn);
                    var sqlReader = cmd.ExecuteReader();
                    while (sqlReader.Read())
                    {
                        var name = sqlReader.GetValue(0).ToString();
                        var code = sqlReader.GetValue(1).ToString();
                        var id = sqlReader.GetValue(2).ToString();
                        HttpContext.Current.Session["user_name"] = name;

                        var admin = new adminStore();
                        admin.course_name = name;
                        admin.course_id = code;
                        admin.user_id = id;

                        stores.Add(admin);
                    }

                    //end user name
                    sqlReader.Close();
                    return stores;
                }
            }

            public Dictionary<string, string> CURRENT_USER_All_COURSE_ID_AND_NAME()
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    //get user name
                    cmd = new MySqlCommand($"SELECT Name FROM umdlalo_lms.user WHERE ID='{user_id}' LIMIT 1", objConn);
                    var sqlReader = cmd.ExecuteReader();
                    while (sqlReader.Read())
                    {
                        var name = sqlReader.GetValue(0).ToString();
                        HttpContext.Current.Session["user_name"] = name;
                    }

                    //end user name
                    sqlReader.Close();

                    cmd = new MySqlCommand(
                        $"SELECT Course_ID FROM umdlalo_lms.courseenrollements WHERE User_ID='{user_id}'", objConn);
                    var keys = new List<string>();

                    sqlReader = cmd.ExecuteReader();
                    while (sqlReader.Read())
                    {
                        var course_id = sqlReader.GetValue(0).ToString();
                        keys.Add(course_id);
                    }

                    sqlReader.Close();

                    //remove duplicates keys
                    keys = keys.Union(keys).ToList();

                    Dictionary<string, string> course_list = new Dictionary<string, string>();
                    ///course names
                    foreach (var item in keys)
                    {
                        var cmd = new MySqlCommand($"SELECT Name,Code  FROM umdlalo_lms.course WHERE ID='{item}'",
                            objConn);
                        sqlReader = cmd.ExecuteReader();

                        while (sqlReader.Read())
                        {
                            var course_name = sqlReader.GetValue(0).ToString();
                            var course_code = sqlReader.GetValue(1).ToString();
                            course_list[course_code] = course_name;
                        }

                        sqlReader.Close();
                    }

                    return course_list;
                }
            }

            public void InsertMessage(string user_name, string user_id, string course_code, string time, string message)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    //insert the message data
                    var str =
                        $"INSERT INTO  umdlalo_lms.group_chat(user_name,user_id,course_code,time,message) VALUES('{user_name}','{user_id}','{course_code}','{time}','{message}')";
                    cmd = new MySqlCommand(str, objConn);
                    cmd.ExecuteNonQuery();

                    //Update all notification excpet the current user
                    updateAllNotifications(course_code, time);

                //var full_course_name = item.FullCourseName(course_code);
                //send the email
                //item.SendEmail(email, message, $"{full_course_name}({course_code})");

                cmd = new MySqlCommand($"SELECT * FROM umdlalo_lms.group_chat WHERE course_code= '{course_code}' ", objConn);
                sqlReader = cmd.ExecuteReader();
                clsSmallItemsHandler item = new clsSmallItemsHandler();
                var full_course_name= item.Course_Name(course_code);
                while (sqlReader.Read())
                {
                    var users_id = sqlReader.GetString("user_id");
                    if(users_id!=user_id)
                    {
                        var email =item.GetEmail(users_id);
                        item.SendEmail(email, message, $"{full_course_name}({course_code})");
                    }
                    
                    
                }




            }
         }
        }
    }
