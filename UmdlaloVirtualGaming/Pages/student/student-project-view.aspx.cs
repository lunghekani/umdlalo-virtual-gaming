using System;
using Business_Logic;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business_Logic;
using MySql.Data.MySqlClient;

namespace UmdlaloVirtualGaming.Pages.student
{
    public partial class student_projects_view : System.Web.UI.Page
    {
        public clsAuthentication authclass = new clsAuthentication();
        public clsCourseOperations objModOperations = new clsCourseOperations();
        public clsCommunicate communicateclass = new clsCommunicate();
        public clsUserDetails userclass = new clsUserDetails();
        public clsProjects projectclass = new clsProjects();
        protected void Page_Load(object sender, EventArgs e)
        {
            PopulateCode(1);   
        }
        
        protected void PopulateCode(int projectID)
        {
            int likes, comments, views;
            DateTime date;



                var dt = projectclass.View_Project(projectID); // this is where the business code you created gets called
            // this is how you populate the elements on the front end
            
            likes =dt.Rows[0].Field<int>("Likes");
            comments =dt.Rows[0].Field<int>("Comments");
            views =dt.Rows[0].Field<int>("Views");
            date = dt.Rows[0].Field<DateTime>("DateCreated");
            string details = $"Likes: {likes} \t Comments: {comments} \t Views:{views} \t\t Date Created: {date.ToString("D")}";
            spName.InnerText = dt.Rows[0].Field<string>("Name");
            spSubDetails.InnerText = details;
           htmlCode.InnerText= dt.Rows[0].Field<string>("HTML");
           cssCode.InnerText= dt.Rows[0].Field<string>("CSS");
           jsCode.InnerText= dt.Rows[0].Field<string>("JSS");
          
        }
        protected void btnViewProject_OnClick(object sender, EventArgs e)
        {
            //string HTML, JSS, CSS/*, FRAME*/;

            //HTML = btnViewproject.InnerHtml.Trim();
            //JSS = btnViewproject.InnerHtml.Trim();
            //CSS = btnViewproject.InnerHtml.Trim();
            ////FRAME = btnViewproject.Text.Trim();

            //if (!Page.IsPostBack)
            //{
            //    if (HttpContext.Current.Session["user_id"] != null)
            //    {
            //        var dt = objModOperations.View_Project(HTML, JSS, CSS);


        }
    }
}