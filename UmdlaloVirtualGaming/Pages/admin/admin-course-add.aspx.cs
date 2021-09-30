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

            //string name = txt_course_name.Text.ToString().Trim();
            //string Code = txt_course_code.Text;
            //string Description = txt_description.Text;
            //DateTime Startdate = this.Start.Value;
            //DateTime Enddate = this.End.Value;
            //string uId = Session["user_id"].ToString();
            //int visibility = 0;
            //if (!chkVisible.Checked)
            //{
            //    visibility = 1;
            //}
            //var Course = objModOperations.CreateModule(name, Code, Description,Startdate,Enddate, visibility);

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