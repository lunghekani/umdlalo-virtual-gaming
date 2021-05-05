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
    public class business
    {
    }
    public class clsAuthentication {
        clsDataConnection objConn = new clsDataConnection();

        public string HashPassword(string password) { // Hash the password

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
        public string authUser(string username, string password)
        {

            var cmd = new MySqlCommand
            {
                Connection = objConn.CreateSQLConnection(),
                CommandText = "Password_Verify",
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("userEmail_IN", username);
            cmd.Parameters.AddWithValue("UserPass_IN", HashPassword( password));
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
                return "Success";
            }
            catch (Exception ex)
            {

                return ex.Message;
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
}
