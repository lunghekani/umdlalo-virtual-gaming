using DataAccess;
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
        public clsBasicUserDetails AddUser(string User_Name, string User_LstName, string User_Email, string User_Password)
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
            cmd.Parameters.AddWithValue("@UserRole_In", "Student");

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
            using(Aes encryptor = Aes.Create())   
            {  
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {  
                    0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76  
                });  
                encryptor.Key = pdb.GetBytes(32);  
                encryptor.IV = pdb.GetBytes(16);  
                using(MemoryStream ms = new MemoryStream())   
                {  
                    using(CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write)) {  
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
            using(Aes encryptor = Aes.Create())   
            {  
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {  
                    0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76  
                });  
                encryptor.Key = pdb.GetBytes(32);  
                encryptor.IV = pdb.GetBytes(16);  
                using(MemoryStream ms = new MemoryStream())  
                {  
                    using(CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write)) {  
                        cs.Write(clearBytes, 0, clearBytes.Length);  
                        cs.Close();  
                    }  
                    encryptString = Convert.ToBase64String(ms.ToArray());  
                }  
            }  
            return encryptString;  
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
    }

    public class clsCourseOperations
    {
        private clsDataConnection objConn = new clsDataConnection();
        
        public string CreateCourse(string name, string descr, string code, DateTime startTime, DateTime endTime, string Uid,
            int disabledInt)
        {
            var cmd = new MySqlCommand();
            cmd.Connection = objConn.CreateSQLConnection();

            cmd.CommandText = "Course_Create";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@modID_IN", _moduleID);
            cmd.Parameters.AddWithValue("@modName_IN", _moduleName);
            cmd.Parameters.AddWithValue("@modCode_IN", _moduleCode);
            cmd.Parameters.AddWithValue("@modDescription_IN", _description);
            cmd.Parameters.AddWithValue("@modDisabled_IN", _disabled);

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
                            int Id =Convert.ToInt32(sqlReader.GetValue(0).ToString());
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

                            
                        
                        
                            dt.Rows.Add(Id,name,descr,code,start,end, lecturerName, lecturerEmail);
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

        public string CreateTopic(string name, string descr, string Uid, int marks, int courseID,   int disabledInt)
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

        public DataTable GetTopics(int courseId)
        {
            var dt = new DataTable();
            
            dt.Columns.Add("Id", typeof(int));
            dt.Columns.Add("Name", typeof(string));
            dt.Columns.Add("Description", typeof(string));
            dt.Columns.Add("Marks", typeof(string));
            dt.Columns.Add("Disabled", typeof(string));
           

            var conn = objConn.CreateSQLConnection();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "Topic_Get";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("CourseId_in", courseId);

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

                            string marks = String.Empty;
                            if (sqlReader["Marks"].Equals(DBNull.Value))
                            {
                                marks = "-";
                            }
                            else
                            {
                                marks = sqlReader["Marks"].ToString();
                            }

                            string status = String.Empty;
                            if (sqlReader["Disabled"].Equals(DBNull.Value))
                            {
                                status = "-";
                            }
                            else
                            {
                                status = sqlReader["Disabled"].ToString();
                            }
                            dt.Rows.Add(Id, name, descr, marks, status);
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

    }

    //CODE TO STORE CALENDAR EVENT TO DATABASE

    //public class clsCalendar
    //{
    //    private clsDataConnection objConn = new clsDataConnection();

    //    public DataTable GetData()
    //    {
    //        var dt = new DataTable();

    //        dt.Columns.Add("ScheduleId", typeof(int));
    //        dt.Columns.Add("Title ", typeof(string));
    //        dt.Columns.Add("ScheduleDate", typeof(string));

    //        var conn = objConn.CreateSQLConnection();
    //        MySqlCommand cmd = new MySqlCommand();
    //        cmd.Connection = conn;

    //        MySqlDataReader sqlReader = cmd.ExecuteReader();
    //        try
    //        {
    //            if (sqlReader.HasRows)
    //            {
    //                while (sqlReader.Read())
    //                {

    //                    int ScheduleId = Convert.ToInt32(sqlReader.GetValue(0));
    //                    string Title = sqlReader.GetValue(1).ToString();
    //                    string ScheduleDate = sqlReader.GetValue(2).ToString();


    //                    dt.Rows.Add(ScheduleId, Title, ScheduleDate);
    //                }
    //            }
    //        }
    //        catch (Exception ex)
    //        {
    //            dt.Rows.Add(ex.Message);
    //        }
    //        finally
    //        {
    //            sqlReader.Close();
    //            cmd.Connection.Close();
    //        }

    //        return dt;
        
    //    }


    //}

    //END CALENDAR EVENT CODE

    
    
    public class clsProjects
    {
        public string lastProjectInsert;
        //Start: Project creation command
        public string CreateProject(string proj_Name, string htmlCode, string cssCode, string jsCode, int visibility, string User_id)
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
                    while (sqlReader.Read())
                    {

                        string name = string.Empty;
                        if( sqlReader.GetValue(4).Equals(DBNull.Value))
                        {
                            name = "-";
                        }
                        else
                        {
                            name = sqlReader.GetValue(4).ToString();
                        }
                        string comments = string.Empty;
                        if( sqlReader.GetValue(2).Equals(DBNull.Value))
                        {
                            comments = "-";
                        }
                        else
                        {
                            comments = sqlReader.GetValue(2).ToString();
                        }
                   
                        string datecreated = string.Empty;
                        if( sqlReader.GetValue(3).Equals(DBNull.Value))
                        {
                            datecreated = "-";
                        }
                        else
                        {
                            datecreated = sqlReader.GetValue(3).ToString();
                        }
                        
                        dt.Rows.Add(name,comments, datecreated );
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

        //End: Create Comment

        //Start: Project View command

        public string UpdateProject(string proj_Name, string htmlCode, string cssCode, string jsCode, int visibility, string projectId)
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
        { //public DataTable View_Project(int User_ID) - was here before
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

                        
                        int Id =Convert.ToInt32(sqlReader.GetValue(0));
                        string name = sqlReader.GetValue(1).ToString();
                        string likes = Convert.ToInt32( sqlReader.GetValue(2)).ToString("##,###");
                        string comments = Convert.ToInt32( sqlReader.GetValue(3)).ToString("##,###");
                        string views = Convert.ToInt32( sqlReader.GetValue(4)).ToString("##,###");
                        string descr = sqlReader.GetValue(5).ToString();
                        string HTML = sqlReader.GetValue(6).ToString();
                        string htmlLines = HTML.Split('\n').Length.ToString("##,###");
                        string CSS = sqlReader.GetValue(7).ToString();
                        string cssLines = CSS.Split('\n').Length.ToString("##,###");
                        string JSS = sqlReader.GetValue(8).ToString();
                        string jsLines = JSS.Split('\n').Length.ToString("##,###");
                        string datecreated = sqlReader.GetValue(9).ToString();
                        int enabled = Convert.ToInt32( sqlReader.GetValue(10));
                        string userId = sqlReader.GetValue(11).ToString();
                        string creator = sqlReader.GetValue(12).ToString();
                        dt.Rows.Add(Id,name,creator,likes,comments,views,descr,HTML,htmlLines,JSS,jsLines,CSS,cssLines,userId,datecreated,enabled);
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

                        int Id =Convert.ToInt32(sqlReader.GetValue(0));
                        string name = sqlReader.GetValue(1).ToString();
                        string likes = Convert.ToInt32( sqlReader.GetValue(2)).ToString("##,###");
                        string comments = Convert.ToInt32( sqlReader.GetValue(3)).ToString("##,###");
                        string views = Convert.ToInt32( sqlReader.GetValue(4)).ToString("##,###");
                        string descr = sqlReader.GetValue(5).ToString();
                        string HTML = sqlReader.GetValue(6).ToString().Split('\n').Length.ToString("##,###");
                        string CSS = sqlReader.GetValue(7).ToString().Split('\n').Length.ToString("##,###");
                        string JSS = sqlReader.GetValue(8).ToString().Split('\n').Length.ToString("##,###");
                       string datecreated = sqlReader.GetValue(9).ToString();
                       int enabled = Convert.ToInt32( sqlReader.GetValue(10));
                       string creator = sqlReader.GetValue(12).ToString();
                        dt.Rows.Add(Id,name,creator,likes,comments,views,descr,HTML,JSS,CSS,datecreated,enabled);
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

                        int Id =Convert.ToInt32(sqlReader.GetValue(0));
                        string name = sqlReader.GetValue(1).ToString();
                        string likes = Convert.ToInt32( sqlReader.GetValue(2)).ToString("##,###");
                        string comments = Convert.ToInt32( sqlReader.GetValue(3)).ToString("##,###");
                        string views = Convert.ToInt32( sqlReader.GetValue(4)).ToString("##,###");
                        string descr = sqlReader.GetValue(5).ToString();
                        string HTML = sqlReader.GetValue(6).ToString().Split('\n').Length.ToString("##,###");
                        string CSS = sqlReader.GetValue(7).ToString().Split('\n').Length.ToString("##,###");
                        string JSS = sqlReader.GetValue(8).ToString().Split('\n').Length.ToString("##,###");
                        string datecreated = sqlReader.GetValue(9).ToString();
                        int enabled = Convert.ToInt32( sqlReader.GetValue(10));
                        string creator = sqlReader.GetValue(12).ToString();
                        dt.Rows.Add(Id,name,creator,likes,comments,views,descr,HTML,JSS,CSS,datecreated,enabled);
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

            public enum MessageType { success, error, info, warning };
            public void ShowMessage(Page page,string Message, MessageType type)
            {
                
                ScriptManager.RegisterStartupScript(page, page.GetType(), System.Guid.NewGuid().ToString(), "$.notify({ message: '"+Message+".'},{type: '"+type+"',showProgressbar: true,animate: {\r\n\t\tenter: 'animated fadeInDown',\r\n\t\texit: 'animated fadeOutUp'\r\n\t},});", true);
               
            }
        }
    public class clsPrivateChat
        {
            private MySqlCommand cmd;
            private MySqlDataReader sqlReader;
            private string user_id;

            public clsPrivateChat(object user_id)
            {
                this.user_id = user_id.ToString();
            }

            //create notification on when fetching messages
            public void CreateNotification(object course_id)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    /*
                     * when fetch messages, we create the notification and set to 0 if not exist for later updates
                     * for later update
                     */

                    cmd = new MySqlCommand(
                        $"SELECT* FROM umdlalo_lms.private_chat_notification WHERE user_id='{user_id}'and  course_id={course_id}",
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
                            $"INSERT INTO  umdlalo_lms.private_chat_notification (user_id,course_id,notification,time,belong_to) VALUES('{user_id}','{course_id}',0,'','{user_id}')";
                        var cmd = new MySqlCommand(str, objConn);
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                        resetNotification(course_id); //set the current user notification to 0
                    }
                }
            }

            //set the notication value to 0 and return 0
            public object resetNotification(object course_id)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    //update all the the current user notification in the current course
                    cmd = new MySqlCommand(
                        $"UPDATE  umdlalo_lms.private_chat_notification SET notification =0 WHERE course_id={course_id}  AND user_id={user_id} and belong_to={user_id} ",
                        objConn);
                    cmd.ExecuteNonQuery();

                    cmd = new MySqlCommand(
                        $"SELECT * FROM  umdlalo_lms.private_chat_notification WHERE  course_id={course_id}  AND user_id={user_id} LIMIT 1 ",
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
                    return new { notification = notification, time = time };
                }
            }

            /// <summary>
            /// return the current notification value
            /// </summary>
            /// <param name="course_id"></param>
            /// <returns></returns>
            public object current_user_Notification(string course_id)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    cmd = new MySqlCommand(
                        $"SELECT * FROM umdlalo_lms.private_chat_notification WHERE  course_id={course_id}  AND user_id={user_id} LIMIT 1 ",
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
                    return new { notification = notification, time = time };
                }
            }

            /// <summary>
            /// update all the user id
            /// </summary>
            /// <param name="course_id"></param>
            /// <returns></returns>
            public void updateAllNotifications(string course_id, string time)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    //update all the the current user notification in the current course
                    cmd = new MySqlCommand(
                        $"SELECT* FROM umdlalo_lms.private_chat_notification WHERE  course_id='{course_id}' AND user_id='{user_id}' ",
                        objConn);
                    sqlReader = cmd.ExecuteReader();

                    List<string> c_ids = new List<string>();
                    List<string> u_ids = new List<string>();

                    while (sqlReader.Read())
                    {
                        var current_course_id = sqlReader.GetString("course_id");
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
                            $"UPDATE umdlalo_lms.private_chat_notification SET notification =notification+1,time='{time}' WHERE course_id ='{c_id}' and user_id='{u_id}'";
                        cmd = new MySqlCommand(str, objConn);
                        cmd.ExecuteNonQuery();
                    }

                    //set the current user notification to 0
                    resetNotification(course_id);
                }
            }

            public List<object> FetchMesssges(object course_id, object messagesLimit)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    //create notification when fetch messages
                    CreateNotification(course_id);

                    var ListOfMessages = new List<object>();

                    cmd = new MySqlCommand(
                        $"SELECT * FROM umdlalo_lms.private_chat WHERE course_id='{course_id}' AND user_id='{user_id}' ",
                        objConn);
                    sqlReader = cmd.ExecuteReader();

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
                        var cmd = new MySqlCommand($"SELECT Name  FROM umdlalo_lms.course WHERE code='{item}'", objConn);
                        sqlReader = cmd.ExecuteReader();

                        while (sqlReader.Read())
                        {
                            var course_name = sqlReader.GetValue(0).ToString();
                            course_list[item] = course_name;
                        }

                        sqlReader.Close();
                    }

                    return course_list;
                }
            }

            public void InsertMessage(string user_name, string user_id, string course_id, string time, string message)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    //Update all notification excpet the current user
                    updateAllNotifications(course_id, time);
                    //insert the message data
                    var str =
                        $"INSERT INTO  umdlalo_lms.private_chat(user_name,user_id,course_id,time,message) VALUES('{user_name}','{user_id}','{course_id}','{time}','{message}')";
                    cmd = new MySqlCommand(str, objConn);
                    cmd.ExecuteNonQuery();
                }
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
            public void CreateNotification(object course_id)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    /*
                     * when fetch messages, we create the notification and set to 0 if not exist for later updates
                     * for later update
                     */

                    cmd = new MySqlCommand(
                        $"SELECT* FROM umdlalo_lms.group_chat_notification WHERE user_id='{user_id}'and  course_id='{course_id}'",
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
                            $"INSERT INTO  umdlalo_lms.group_chat_notification (user_id,course_id,notification,time) VALUES('{user_id}','{course_id}',0,'')";
                        var cmd = new MySqlCommand(str, objConn);
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                        resetNotification(course_id); //set the current user notification to 0
                    }
                }
            }

            //set the notication value to 0 and return 0
            public object resetNotification(object course_id)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    //update all the the current user notification in the current course
                    cmd = new MySqlCommand(
                        $"UPDATE umdlalo_lms.group_chat_notification SET notification =0 WHERE course_id='{course_id}'  AND user_id='{user_id}' ",
                        objConn);
                    cmd.ExecuteNonQuery();

                    cmd = new MySqlCommand(
                        $"SELECT * FROM umdlalo_lms.group_chat_notification WHERE  course_id='{course_id}'  AND user_id='{user_id}' LIMIT 1 ",
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
                    return new { notification = notification, time = time };
                }
            }

            /// <summary>
            /// return the current notification value
            /// </summary>
            /// <param name="course_id"></param>
            /// <returns></returns>
            public object current_user_Notification(string course_id)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    cmd = new MySqlCommand(
                        $"SELECT * FROM umdlalo_lms.group_chat_notification WHERE  course_id='{course_id}'  AND user_id='{user_id}' LIMIT 1 ",
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
                    return new { notification = notification, time = time };
                }
            }

            /// <summary>
            /// update all the user id
            /// </summary>
            /// <param name="course_id"></param>
            /// <returns></returns>
            public void updateAllNotifications(string course_id, string time)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    //update all the the current user notification in the current course
                    cmd = new MySqlCommand(
                        $"SELECT* FROM umdlalo_lms.group_chat_notification WHERE  course_id='{course_id}' ", objConn);
                    sqlReader = cmd.ExecuteReader();

                    var course_ids = new Dictionary<string, string>();

                    while (sqlReader.Read())
                    {
                        var current_course_id = sqlReader.GetString("course_id");
                        var current_user_id = sqlReader.GetString("user_id");
                        course_ids.Add(current_user_id, current_course_id);
                    }

                    sqlReader.Close();

                    foreach (var id in course_ids)
                    {
                        var str =
                            $"UPDATE umdlalo_lms.group_chat_notification SET notification =notification+1,time='{time}' WHERE course_id ='{id.Value}' and user_id='{id.Key}'";
                        cmd = new MySqlCommand(str, objConn);
                        cmd.ExecuteNonQuery();
                    }

                    //set the current user notification to 0
                    resetNotification(course_id);
                }
            }

            public List<object> FetchMesssges(object course_id, object messagesLimit)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    //create notification when fetch messages
                    CreateNotification(course_id);

                    var ListOfMessages = new List<object>();

                    cmd = new MySqlCommand($"SELECT * FROM umdlalo_lms.group_chat WHERE course_id= '{course_id}'  ",
                        objConn);
                    sqlReader = cmd.ExecuteReader();

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
                    List<adminStore> stores = new List<adminStore>();
                    ; //get user name
                    cmd = new MySqlCommand($"SELECT Name,Code,User_id FROM  umdlalo_lms.course WHERE User_id='{user_id}'",
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
                        var cmd = new MySqlCommand($"SELECT Name  FROM umdlalo_lms.course WHERE code='{item}'", objConn);
                        sqlReader = cmd.ExecuteReader();

                        while (sqlReader.Read())
                        {
                            var course_name = sqlReader.GetValue(0).ToString();
                            course_list[item] = course_name;
                        }

                        sqlReader.Close();
                    }

                    return course_list;
                }
            }

            public void InsertMessage(string user_name, string user_id, string course_id, string time, string message)
            {
                using (var objConn = new clsDataConnection().CreateSQLConnection())
                {
                    //insert the message data
                    var str =
                        $"INSERT INTO  umdlalo_lms.group_chat(user_name,user_id,course_id,time,message) VALUES('{user_name}','{user_id}','{course_id}','{time}','{message}')";
                    cmd = new MySqlCommand(str, objConn);
                    cmd.ExecuteNonQuery();

                    //Update all notification excpet the current user
                    updateAllNotifications(course_id, time);
                }
            }
        }

   


}