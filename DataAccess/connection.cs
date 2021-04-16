using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace DataAccess
{
    public class connection
    {
    }

    public class clsDataConnection
    {
        public MySqlConnection CreateSQLConnection() {
            //string connString = "Server=umdlalo-vg.mysql.database.azure.com; Port=3306; Database=umdlalo_lms; Uid=luu@umdlalo-vg; Pwd=5xP9oJ2UQ0nu; SslMode=Preferred;";
            string connString = "Server=umdlalo-lms.mysql.database.azure.com; Port=3306; Database=umdlalo_lms; Uid=luu@umdlalo-lms; Pwd=5xP9oJ2UQ0nu; SslMode=Preferred;";

            var conn = new MySqlConnection(connString);
            try
            {

            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();

                return conn;
            }
            }
            catch (Exception ex)
            {

                return null;
            }
            return conn;
        }


    }
}
