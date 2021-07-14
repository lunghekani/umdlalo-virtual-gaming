using System;
using System.Windows.Forms;
using Business_Logic;
using MySql.Data.MySqlClient;
using System.Data;

namespace UmdlaloVirtualGaming.Pages.auth
{
    public partial class index : System.Web.UI.Page
    {
        public clsAuthentication objDataOpps = new clsAuthentication();
        public clsModuleOperations objModOperations = new clsModuleOperations();
        public NewUserAdd objconn= new NewUserAdd();
        public MySqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void kt_login_signin_submit_ServerClick(object sender, EventArgs e)
        {
            clsUserDetails objUserDtls = new clsUserDetails();
            string username, password;
            username = txtEmail.Value.ToString().ToLower().Trim();
            password = txtPassword.Value.ToString().ToLower().Trim();

            var msg = objDataOpps.authUser(username, password);
            var uID = msg.uid;
            if (msg.msg.Equals("Success"))
            {
                var dt = objUserDtls.GetUserAccDetails(uID);
               
                if (dt.Rows[0].Field<string>("Role")=="Admin")
                {
                    Response.Redirect("~/Pages/admin/admin-dashboard.aspx");
                }
                else if (dt.Rows[0].Field<string>("Role") == "Lecturer")
                {
                    Response.Redirect("~/Pages/lecturer/lecturer-dashboard.aspx");
                }
                else if (dt.Rows[0].Field<string>("Role") == "Student")
                {
                    Response.Redirect("~/Pages/student/student-dashboard.aspx");
                }
            }
            else
            {
                MessageBox.Show(msg.msg); 
            }

          
        }

        protected void kt_login_signup_submit_ServerClick(object sender, EventArgs e)
        {
            NewUserAdd objAddUserDtls = new NewUserAdd();
            string User_Name,  User_LstName,  User_Email,  User_Password;

            User_Name = txtFullname.Value.ToString().ToLower().Trim(); 
            User_LstName = txtLastname.Value.ToString().ToLower().Trim();
            User_Email = txtemaill.Value.ToString().ToLower().Trim();     
            User_Password = txtpassword.Value.ToString().ToLower().Trim();

            var msg = objconn.AddUser(User_Name, User_LstName, User_Email, User_Password);
            //var uID = msg.uid;
            //if (msg.msg.Equals("Success"))
            //{
            //    var dt = objAddUserDtls.AddUser(uID);

            //    if (dt.Rows[0].Field<string>("Role") == "Admin")
            //    {
            //        Response.Redirect("~/Pages/admin/admin-dashboard.aspx");
            //    }
            //    else if (dt.Rows[0].Field<string>("Role") == "Lecturer")
            //    {
            //        Response.Redirect("~/Pages/lecturer/lecturer-dashboard.aspx");
            //    }
            //    else if (dt.Rows[0].Field<string>("Role") == "Student")
            //    {
            //        Response.Redirect("~/Pages/student/student-dashboard.aspx");
            //    }
            //}
            //else
            //{
            //    MessageBox.Show(msg.msg);
            //}


        }

    }
}