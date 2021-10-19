using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business_Logic;

namespace UmdlaloVirtualGaming.Pages.lecturer
{
    public partial class content_creator : System.Web.UI.Page
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
                int topicId = Convert.ToInt32(Session["topic_id"]);
                LoadDetails(1);
            }
        }
        

        protected void LoadDetails(int topicId)
        {
            // this is  going to be code that is designed to populate all the fields of the current form
            DataTable dtTopic = courseclass.GetTopic(topicId);
            DataRow row = dtTopic.Rows[0];
            txtTopicName.Text = row.Field<string>("Name");
            txtDescr.Text = row.Field<string>("Description");


            DataTable dtContent = courseclass.GetTopicContent(topicId);
            DataRow rowContent = dtContent.Rows[0];
            txtIntroduction.InnerText = rowContent.Field<string>("Introduction");
            txtContentDescr.InnerText = rowContent.Field<string>("Description");
            txtContent.InnerText = rowContent.Field<string>("Structure");


        }
        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            string summerData = Server.HtmlEncode( txtContent.Value);
        }

        protected void btnSaveDetailChanges_OnClick(object sender, EventArgs e)
        {
            string name = txtTopicName.Text;
            string descr = txtDescr.Text;
            int marks = Convert.ToInt32( txtMark.Text);

            
            string uId = Session["user_id"].ToString();
            int visibility = 0;
            if (!checkVisible.Checked)
            {
                visibility = 1;
            }
            var topicDetails = courseclass.UpdateTopic(name, descr, uId, marks, visibility);

            if (topicDetails.Equals("Success"))
            {
                // display a notification saying project changes successfully implemented
                communicateclass.ShowMessage(this, "Topic Details have been Updated Successfully", clsCommunicate.MessageType.success);

                Response.Redirect("create.aspx?ID=" + authclass.EncryptString(projectclass.lastProjectInsert));
            }
            else
            {
                communicateclass.ShowMessage(this, "There was an error in editing your topic, try again in a few minutes", clsCommunicate.MessageType.error);
            }
        }
    }
}