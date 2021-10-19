using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business_Logic;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using System.IO;

namespace UmdlaloVirtualGaming.Pages.admin
{
    public partial class admin_student_add : System.Web.UI.Page
    {
        public clsAuthentication authclass = new clsAuthentication();
        public clsBasicUserDetails NewUser = new clsBasicUserDetails();
        public clsCommunicate communicateclass = new clsCommunicate();
        public clsUserDetails userclass = new clsUserDetails();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

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

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            
            string User_Name = txtFirstName.Text.Trim();
            string User_LstName = txtLstName.Text.Trim();
            string User_Email = txtEmail.Text.Trim();
            DateTime date = DateTime.Now;
            string Role = DropDownList1.SelectedValue;
            string User_Password = User_Name+User_LstName;
            

            
            var user = authclass.AddUser(User_Name, User_LstName, User_Email, User_Password, Role);
            if (user.msg.Equals("Success"))
            {
                var names = User_Name + " " + User_LstName;
                var body = PopulateBody(User_Email, names);
                communicateclass.SendHTMLEmail(User_Email, "Welcome To Umdlalo", body);
                var uID = user.uid;
                

                if (Role == "Admin")
                {
                    communicateclass.SendHTMLEmail(User_Email,"Your default password is:",User_Password);
                    Response.Redirect("~/Pages/admin/admin-dashboard.aspx");
                }
                else if (Role == "Lecturer")
                {
                    communicateclass.SendHTMLEmail(User_Email, "Your default password is:", User_Password);
                    Response.Redirect("~/Pages/admin/admin-lecturer-list.aspx");
                }
                else if (Role == "Student")
                {
                     communicateclass.SendHTMLEmail(User_Email,"Your default password is:",User_Password);
                    Response.Redirect("~/Pages/admin/admin-student-list.aspx");
                }
            }
            else
            {
                MessageBox.Show(user.msg);
            }
        }
    }
}