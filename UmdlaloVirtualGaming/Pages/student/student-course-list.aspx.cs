using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business_Logic;

namespace UmdlaloVirtualGaming.Pages.student
{
    public partial class student_course_list : System.Web.UI.Page
    {
        public clsAuthentication authclass = new clsAuthentication();
        public clsCourseOperations courseclass = new clsCourseOperations();
        public clsCommunicate communicateclass = new clsCommunicate();
        public clsUserDetails userclass = new clsUserDetails();
        public clsProjects projectclass = new clsProjects();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        protected void BindGridView()
        {

            DataTable dt = courseclass.GetCourses();
            gvCourses.DataSource = dt;
            gvCourses.DataBind();
        }

        protected void gvCourses_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCourses.PageIndex = e.NewPageIndex;
            BindGridView();
        }

        protected void gvCourses_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {

            int Id = Convert.ToInt32(e.CommandArgument) + 1;
            Session["course_id"] = Id;
            Response.Redirect("course-single.aspx");
        }

    }
}