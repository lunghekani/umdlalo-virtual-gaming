using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Business_Logic;

namespace UmdlaloVirtualGaming.Pages.student
{
    public partial class code2 : System.Web.UI.Page
    {
        public clsAuthentication authclass = new clsAuthentication();
        public clsCourseOperations objModOperations = new clsCourseOperations();
        public clsCommunicate communicateclass = new clsCommunicate();
        public clsUserDetails userclass = new clsUserDetails();
        public clsProjects projectclass = new clsProjects();
        protected void Page_Load(object sender, EventArgs e)
        {
            //todo add the isnotpostback script

            MessageBox.Show("Test");
                    var id = authclass.DecryptString(Request.QueryString["id"]);
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
            
            htmlCode.InnerText= dt.Rows[0].Field<string>("HTML");
            cssCode.InnerText= dt.Rows[0].Field<string>("CSS");
            jsCode.InnerText= dt.Rows[0].Field<string>("JSS");

        }
    }
}