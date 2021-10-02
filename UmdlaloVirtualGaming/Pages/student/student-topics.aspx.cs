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
    public partial class student_topics : System.Web.UI.Page
    {
        public clsAuthentication authclass = new clsAuthentication();
        public clsCourseOperations courseclass = new clsCourseOperations();
        public clsCommunicate communicateclass = new clsCommunicate();
        public clsUserDetails userclass = new clsUserDetails();
        public clsProjects projectclass = new clsProjects();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGridView();
        }
        protected void BindGridView()
        {
            int topicId = Convert.ToInt32( Request.QueryString["ID"]);
         
            DataTable dt = courseclass.GetTopics(topicId);
            gvTopics.DataSource = dt;
            gvTopics.DataBind();
        }
        protected void gvTopics_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            throw new NotImplementedException();
        }

        protected void gvTopics_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
           if (e.CommandName == "View")
            {
                int Id = Convert.ToInt32(e.CommandArgument) + 1;
                Session["topic_id"] = Id;
                Response.Redirect("~/Pages/student/class.aspx");
            }

        }
    }
}