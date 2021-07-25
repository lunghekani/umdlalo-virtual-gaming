using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business_Logic;
using MySql.Data.MySqlClient;

namespace UmdlaloVirtualGaming.Pages.student
{
    public partial class student_projects_view : System.Web.UI.Page
    {
        public clsAuthentication authclass = new clsAuthentication();
        public clsCourseOperations objModOperations = new clsCourseOperations();
        public clsCommunicate communicateclass = new clsCommunicate();
        public clsProjects projectclass = new clsProjects();
        public clsUserDetails userclass = new clsUserDetails();
        public MySqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateProject_OnClick(object sender, EventArgs e)
        {
            var name = txtName.Text.Trim();
            var userid = Session["user_id"].ToString();
            var msg = projectclass.CreateProject(name, userid);

            Response.Redirect("code.aspx");
        }
    }
}