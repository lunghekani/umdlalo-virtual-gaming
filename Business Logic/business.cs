using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Threading.Tasks;
using DataAccess;
using System.Data;
using MySql.Data.MySqlClient;

namespace Business_Logic
{
    public class business
    {
    }
    public class clsAuthentication {
        clsDataConnection objConn = new clsDataConnection();
        public string authUser(string username, string password)
        {

            var cmd = new MySqlCommand();
            cmd.Connection = objConn.CreateSQLConnection();
            cmd.CommandText = "Password_Verify";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("userEmail_IN", username);
            cmd.Parameters.AddWithValue("UserPass_IN", password);
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

            dt.Columns.Add("FirstName", typeof(string));
            dt.Columns.Add("LastName", typeof(string));
            dt.Columns.Add("Email", typeof(string));
            dt.Columns.Add("Cellphone", typeof(string));
            dt.Columns.Add("DOB", typeof(string));
            dt.Columns.Add("Gender", typeof(string));
            // dt.Columns.Add("Avatar", typeof(string));
            dt.Columns.Add("LastLogin", typeof(string));
            var conn = objConn.CreateSQLConnection();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "View_User_Account";
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("userID_IN", userID);

            MySqlDataReader sqlReader = cmd.ExecuteReader();
            try
            {
                if (sqlReader.HasRows)
                {
                    while (sqlReader.Read())
                    {
                        string firstname = sqlReader.GetValue(1).ToString();
                        string lastname = sqlReader.GetValue(2).ToString();
                        string email = sqlReader.GetValue(3).ToString();
                        string cellphone = sqlReader.GetValue(4).ToString();
                        string dob = sqlReader.GetValue(5).ToString();
                        string gender = sqlReader.GetValue(6).ToString();
                        //string avatar = sqlReader.GetValue(7).ToString();
                        string lastlogin = sqlReader.GetValue(9).ToString();


                        dt.Rows.Add(firstname, lastname, email, cellphone, dob, gender, lastlogin);
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
}
