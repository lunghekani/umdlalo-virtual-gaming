using DataAccess;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Text;
using System.Web;

namespace Business_Logic
{
    // This is a comment to show how git works
    public class clsBasicUserDetails
    {
        public string msg { get; set; }
        public string uid { get; set; }
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

            try
            {
                cmd.ExecuteNonQuery();
                return new clsBasicUserDetails
                {
                    msg = "Success",
                    uid = userGuid.ToString()
                };
            }
            catch (Exception ex)
            {
                return new clsBasicUserDetails
                {
                    msg = ex.Message
                };
                throw;
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
       
       
    }

    public class clsModuleOperations
    {
        private clsDataConnection objConn = new clsDataConnection();

        public string CreateModule(int _moduleID, string _moduleName,
            string _moduleCode, string _description,
            int _disabled)
        {
            var cmd = new MySqlCommand();
            cmd.Connection = objConn.CreateSQLConnection();

            cmd.CommandText = "Modules_Create";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@modID_IN", _moduleID);
            cmd.Parameters.AddWithValue("@modName_IN", _moduleName);
            cmd.Parameters.AddWithValue("@modCode_IN", _moduleCode);
            cmd.Parameters.AddWithValue("@modDescription_IN", _description);
            cmd.Parameters.AddWithValue("@modDisabled_IN", _disabled);

            try
            {
                cmd.ExecuteNonQuery();
                return "Success";
            }
            catch (Exception ex)
            {
                return ex.Message;
                throw;
            }
        }
        //Start: Project creation command
        public string CreateProject(string proj_Name, string User_id) 
        {
            using (var objConn = new clsDataConnection().CreateSQLConnection())
            {
                var cmd_session = new MySqlCommand($"SELECT Name FROM umdlalo_lms.user WHERE ID='{User_id}' LIMIT 1", objConn);
                var sqlReader = cmd_session.ExecuteReader();
                while (sqlReader.Read())
                {
                    var name = sqlReader.GetValue(0).ToString();
                    HttpContext.Current.Session["user_name"] = User_id;
                }
            }

            var cmd = new MySqlCommand();
            cmd.Connection = objConn.CreateSQLConnection();

            cmd.CommandText = "Projects_Create";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Name_IN", proj_Name);
            cmd.Parameters.AddWithValue("@User_ID_IN", User_id);
            
            try
            {
                cmd.ExecuteNonQuery();
                return"Success";
            }
            catch (Exception ex)
            {
                return ex.Message;
                throw;
            }

        }
        //End of project creation command


        //Start: Project View command
        public DataTable View_Project(int User_ID)
        {
            clsDataConnection objConn = new clsDataConnection();
            var dt = new DataTable();

            HttpContext.Current.Session["user_id"] = User_ID;

            dt.Columns.Add("HTML", typeof(string));
            dt.Columns.Add("JSS", typeof(string));
            dt.Columns.Add("CSS", typeof(string));


            var conn = objConn.CreateSQLConnection();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "Project_Get";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("User_ID_IN", User_ID);

            MySqlDataReader sqlReader = cmd.ExecuteReader();
            try
            {
                if (sqlReader.HasRows)
                {
                    while (sqlReader.Read())
                    {
                        string HTML = sqlReader.GetString(0);
                        string JSS = sqlReader.GetValue(1).ToString();
                        string CSS = sqlReader.GetValue(2).ToString();


                        dt.Rows.Add(HTML, JSS, CSS);
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

        public object View_Project(string hTML, string jSS, string cSS)
        {
            throw new NotImplementedException();
        }
        //End: Project View command
    }




    public class clsCommunicate
    {
        public  void SendEmail(string mailto, string subject, string body)
        {
            SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
            using (MailMessage mm = new MailMessage(smtpSection.From, mailto))
            {
                mm.Subject = subject;
                mm.Body = body;
                mm.IsBodyHtml = false;
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

        public  void SendHTMLEmail(string mailto, string subject, string body)
        {
            SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
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