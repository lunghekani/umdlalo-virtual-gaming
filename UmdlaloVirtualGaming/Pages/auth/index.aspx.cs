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
            clsAuthentication objHash = new clsAuthentication();
            string username, firstname, lastname, email, password;

             string username = txt_email
        }
    }
}