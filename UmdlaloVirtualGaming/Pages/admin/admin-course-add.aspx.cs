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

            string name = txt_course_name.Value.ToString().Trim();
            string Code = txt_course_code.Value; 
            string Description = txt_description.Value;
         //   DateTime Startdate = Start.Value;
         //   DateTime Enddate = End.Value;
            string uId = Session["user_id"].ToString();
            int visibility = 0;
            //if (!chkVisible.Checked)
            //{
            //    visibility = 1;
            //}
            //var Course = objModOperations.CreateCourse(name, Code, Description,Startdate,Enddate, visibility, disabledInt);

            //if (Course.Equals("Success"))
            //{
            //    // display a notification saying course successfully added
            //    communicateclass.ShowMessage(this, "Course Created Successfully", clsCommunicate.MessageType.success);

            //    Response.Redirect("create.aspx?ID=" + authclass.EncryptString(projectclass.lastProjectInsert));
            //}
            //else
            //{
            //    communicateclass.ShowMessage(this, "There was an error in creating the course, try again in a few minutes", clsCommunicate.MessageType.error);
            //}
        }

        
    }
}