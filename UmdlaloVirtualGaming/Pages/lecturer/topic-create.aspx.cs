using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business_Logic;

namespace UmdlaloVirtualGaming.Pages.lecturer
{
    public partial class lecturer_topic_create : System.Web.UI.Page
    {
        public clsAuthentication authclass = new clsAuthentication();
        public clsCourseOperations courseclass = new clsCourseOperations();
        public clsCommunicate communicateclass = new clsCommunicate();
        public clsUserDetails userclass = new clsUserDetails();
        public clsProjects projectclass = new clsProjects();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
            }

        }

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            string name = txtTopicName.Text.Trim();
            string descr = txtDescr.Text.Trim();
            int mark = Convert.ToInt32(txtMark.Text);
            int visible = 1;
            string uId = Session["user_id"].ToString();
            int courseId = Convert.ToInt32( Session["course_id"].ToString());

            if (checkVisible.Checked)
            {
                visible = 0;
            }

            string msg = courseclass.CreateTopic(name, descr, uId, mark, courseId, visible);
            if (msg.Equals("Success"))
            {
                Response.Redirect("topics.aspx");
            }
            else
            {communicateclass.ShowMessage(this,msg,clsCommunicate.MessageType.error);
            }


        }
    }
}