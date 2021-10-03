using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business_Logic;

namespace UmdlaloVirtualGaming.Pages.admin
{
    public partial class admin_course_add : System.Web.UI.Page
    {
        public clsAuthentication authclass = new clsAuthentication();
        public clsCourseOperations courseClass = new clsCourseOperations();
        public clsCommunicate communicateclass = new clsCommunicate();
        public clsUserDetails userclass = new clsUserDetails();
        public clsProjects projectclass = new clsProjects();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string name = txtCourseName.Text.Trim();
            string description = txtDescription.Text.Trim();
            string code = txtCode.Text.Trim();
            DateTime startTime = Convert.ToDateTime(txtStartTime.Text.Trim());
            DateTime endTime = Convert.ToDateTime(txtEndTime.Text.Trim());
            string uId = Session["user_id"].ToString();
            int visible = 0;
            if (!checkVisible.Checked)
            {
                visible = 1;
            }
            string msgCourse = courseClass.CreateCourse(name, description, code, startTime, endTime, uId, visible);

            if (msgCourse.Equals("Success"))
            {
                // display a notification saying project changes successfully implemented
                communicateclass.ShowMessage(this, "Course has been created successfully", clsCommunicate.MessageType.success);

                Response.Redirect("admin-course-list.aspx");
            }
            else
            {
                communicateclass.ShowMessage(this, msgCourse, clsCommunicate.MessageType.error);
            }

        }

    }
}