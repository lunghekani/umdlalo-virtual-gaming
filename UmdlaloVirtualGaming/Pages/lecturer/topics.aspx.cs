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
    public partial class topics : System.Web.UI.Page
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
            int courseId = Convert.ToInt32(Session["course_id"].ToString());
            DataTable dt = courseclass.GetTopics(courseId);
            gvTopics.DataSource = dt;
            gvTopics.DataBind();
        }


        protected void gvTopics_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            throw new NotImplementedException();
        }

        protected void gvTopics_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int Id = Convert.ToInt32(e.CommandArgument) + 1;
                Session["topic_id"] = Id;
                Response.Redirect("content-creator.aspx");
            }
            else if (e.CommandName =="View")
            {
                int Id = Convert.ToInt32(e.CommandArgument) + 1;
                Session["topic_id"] = Id;
                Response.Redirect("content-view.aspx");
            }
           
        }
    }
}