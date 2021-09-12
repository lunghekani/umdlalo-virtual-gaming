using Business_Logic;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.IO;
using System.Web;
using System.Windows.Forms;

namespace UmdlaloVirtualGaming.Pages.auth
{
    public partial class index : System.Web.UI.Page
    {
        public clsAuthentication authclass = new clsAuthentication();
        public clsCourseOperations objModOperations = new clsCourseOperations();
        public clsCommunicate communicateclass = new clsCommunicate();
        public clsUserDetails userclass = new clsUserDetails();
        public MySqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.Cookies["secureVGC"] != null && Request.Cookies["secureMemcld"] != null)
                {
                    txtUsername.Text = authclass.DecryptString( Request.Cookies["secureVGC"].Value);
                    txtPass.Attributes["value"] = authclass.DecryptString( Request.Cookies["secureMemcld"].Value);
                }
            }
        }
        
        protected string PopulateBody(string username, string fullname)
        {
            var stream = new StreamReader(Server.MapPath("~/Pages/auth/email-reg.html"));
            string body = stream.ReadToEnd();

            body = body.Replace("#username#", username);
            body = body.Replace("#fullname#", fullname);

            return body;
        }

        protected void btnSignUp_OnClick(object sender, EventArgs e)
        {
            string User_Name, User_LstName, User_Email, User_Password;

            User_Name = txtSignUpFullName.Text.Trim();
            User_LstName = txtSignUpLastName.Text.Trim();
            User_Email = txtSignUpEmail.Text.Trim();
            User_Password = txtSignUpPassword.Text.Trim();

            var user = authclass.AddUser(User_Name, User_LstName, User_Email, User_Password);
            if (user.msg.Equals("Success"))
            {
                var names = User_Name + " " + User_LstName;
                var body = PopulateBody(User_Email, names);
                communicateclass.SendHTMLEmail(User_Email, "Welcome To Umdlalo", body);
                var uID = user.uid;
                var dt = userclass.GetUserAccDetails(uID);

                if (dt.Rows[0].Field<string>("Role") == "Admin")
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
                MessageBox.Show(user.msg);
            }
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            string username, password;
            username = txtUsername.Text;
            password = txtPass.Text;

            var msg = authclass.AuthUser(username, password);
            var uID = msg.uid;
            if (msg.msg.Equals("Success"))
            {
                if (checkRemember.Checked)
                {
                    Response.Cookies["secureVGC"].Expires = DateTime.Now.AddDays(30);
                    Response.Cookies["secureMemcld"].Expires = DateTime.Now.AddDays(30);
                }
                else
                {
                    Response.Cookies["secureVGC"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["secureMemcld"].Expires = DateTime.Now.AddDays(-1);

                }
                Response.Cookies["secureVGC"].Value = authclass.EncryptString( txtUsername.Text.Trim());
                Response.Cookies["secureMemcld"].Value = authclass.EncryptString(txtPass.Text);


                var dt = userclass.GetUserAccDetails(uID);

                if (dt.Rows[0].Field<string>("Role") == "Admin")
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
    }
}