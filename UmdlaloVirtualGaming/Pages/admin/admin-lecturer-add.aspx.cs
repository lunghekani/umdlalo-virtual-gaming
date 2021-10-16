using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business_Logic;
using System.IO;
using MySql.Data.MySqlClient;
using System.Windows.Forms;
using System.Data;

namespace UmdlaloVirtualGaming.Pages.admin
{
    public partial class admin_lecturer_add : System.Web.UI.Page
    {

        public clsAuthentication authclass = new clsAuthentication();
        public clsCourseOperations objModOperations = new clsCourseOperations();
        public clsCommunicate communicateclass = new clsCommunicate();
        public clsUserDetails userclass = new clsUserDetails();
        public clsProjects projectclass = new clsProjects();
        public string uId;

        protected void Page_Load(object sender, EventArgs e)
        {
            // todo make the page to add lecturers

            
        }

        protected string PopulateBody(string username, string fullname)
        {
            var stream = new StreamReader(Server.MapPath("~/Pages/auth/email-reg.html"));
            string body = stream.ReadToEnd();

            body = body.Replace("#username#", username);
            body = body.Replace("#fullname#", fullname);

            return body;
        }

        protected void btnSubmit_OnClick(object sender, EventArgs e) 
        { string Name, LstName, User_Email;
            Name = txtfrstname.Value;
            LstName = txtLstname.Value;
            User_Email = txtEmail.Value;
            var user = authclass.AddUser(Name,LstName, User_Email, Name ,"Lecturer");
            if (user.msg.Equals("Success"))
            {
                var names = Name + " " + LstName;
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
                    Response.Redirect("~/Pages/admin/student-dashboard.aspx");
                }
            }
            else
            {
                MessageBox.Show(user.msg);
            }

        }
    }
}