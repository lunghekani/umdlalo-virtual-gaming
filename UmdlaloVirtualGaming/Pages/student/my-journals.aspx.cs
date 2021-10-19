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
    public partial class my_journals : System.Web.UI.Page
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
            string Id = Session["user_id"].ToString();

            DataTable dt = userclass.GetJournals(Id);
            gvJournal.DataSource = dt;
            gvJournal.DataBind();
        }
        protected void gvJournal_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            throw new NotImplementedException();
        }

        protected void gvJournal_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                int Id = Convert.ToInt32(e.CommandArgument) + 1;
                Session["journal_id"] = Id;
                Response.Redirect("~/Pages/student/journal.aspx");
            }
        }
    }
}