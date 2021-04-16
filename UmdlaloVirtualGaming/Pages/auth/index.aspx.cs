using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Windows.Forms;
using System.Web.UI.WebControls;
using Business_Logic;
using MySql.Data.MySqlClient;

namespace UmdlaloVirtualGaming.Pages.auth
{
    public partial class index : System.Web.UI.Page
    {
        public clsAuthentication objDataOpps = new clsAuthentication();
        public MySqlConnection conn; 
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void kt_login_signin_submit_ServerClick(object sender, EventArgs e)
        {
            string username, password;
            username = txtEmail.Value.ToString().ToLower().Trim();
            password = txtPassword.Value.ToString().ToLower().Trim();

            var msg = objDataOpps.authUser(username, password);
            if (msg.Equals("Success"))
            {
                Response.Redirect("WebForm2.aspx");
            }
            else {
                MessageBox.Show(msg);
            }
        }
    }
}