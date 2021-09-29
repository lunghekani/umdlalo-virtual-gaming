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
        public clsCourseOperations objModOperations = new clsCourseOperations();
        public clsCommunicate communicateclass = new clsCommunicate();
        public clsUserDetails userclass = new clsUserDetails();
        public clsProjects projectclass = new clsProjects();
        public string uId;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Onclick(object sender, EventArgs e)
        {
            string name = txt_course_name.Value.Trim();
            string description = txt_description.Value.Trim();
            string code = txt_course_code.Value.Trim();
            DateTime startTime = Convert.ToDateTime(Start.Value.Trim());
            DateTime endTime = Convert.ToDateTime(End.Value.Trim());
            string uId = Session["user_id"].ToString();
            int visible = 0;
            if (!checkVisible.Checked)
            {
                visible = 1;
            }
            string msgCourse = objModOperations.CreateCourse(name, description, code, startTime, endTime, uId, visible);

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