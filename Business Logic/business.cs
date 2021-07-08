using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Threading.Tasks;
using DataAccess;
using System.Data;
using System.Security.Cryptography;
using MySql.Data.MySqlClient;

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
        clsDataConnection objConn = new clsDataConnection();

        public string HashPassword(string password)
        { // Hash the password

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
        public clsBasicUserDetails authUser(string username, string password)
        {

            var cmd = new MySqlCommand
            {
                Connection = objConn.CreateSQLConnection(),
                CommandText = "Password_Verify",
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("userEmail_IN", username);
            cmd.Parameters.AddWithValue("UserPass_IN", HashPassword(password));
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
                        string firstname = sqlReader.GetValue(0).ToString();
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
        clsDataConnection objConn = new clsDataConnection();
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
    }

    //pumi's code for signup 
    public class NewUserAdd
    {
        clsDataConnection objConn = new clsDataConnection();
        public string AddUser(string User_Name, string User_LstName, string User_Email, string User_Password)
        {
            var cmd = new MySqlCommand();
            cmd.Connection = objConn.CreateSQLConnection();

            cmd.CommandText = "New_User_Add";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserName_IN", User_Name);
            cmd.Parameters.AddWithValue("@UserLastName_IN", User_LstName);
            cmd.Parameters.AddWithValue("@User_Email_IN", User_Email);
            cmd.Parameters.AddWithValue("@UserPassword_IN", User_Password);


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
    }
}
