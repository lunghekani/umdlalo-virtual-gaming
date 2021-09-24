using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business_Logic;

namespace UmdlaloVirtualGaming.Pages.student
{
    public partial class student_project_list : System.Web.UI.Page
    {
        public clsAuthentication authclass = new clsAuthentication();
        public clsCourseOperations objModOperations = new clsCourseOperations();
        public clsCommunicate communicateclass = new clsCommunicate();
        public clsUserDetails userclass = new clsUserDetails();

        private clsProjects projectsclass = new clsProjects();

        protected void Page_Load(object sender, EventArgs e)
        {
            string projectlist = "";
            var dt = projectsclass.GetAllProjects();


            foreach (DataRow row in dt.Rows)
            {
                projectlist += DisplayProjects(row["Id"].ToString(), row["Name"].ToString(), row["Creator"].ToString(), row["Likes"].ToString(),
                    row["Comments"].ToString(), row["Views"].ToString(), row["Description"].ToString(), row["HTMLLines"].ToString(),
                    row["JSSLines"].ToString(), row["CSSLines"].ToString(), Convert.ToDateTime(row["DateCreated"]));
            }

            projectInstance.InnerHtml = projectlist;
        }

        protected string DisplayProjects(string id, string name, string creator, string likes, string comments, string views, string description, string htmlLines, string jssLines, string cssLines, DateTime date)
        {
            var stream = new StreamReader(Server.MapPath("~/Pages/student/sampleproject.txt"));
            string projectblock = stream.ReadToEnd();



            projectblock = projectblock.Replace("#projectPP#", null);
            projectblock = projectblock.Replace("#projectName#", name);
            projectblock = projectblock.Replace("#projectCreator#", creator);
            projectblock = projectblock.Replace("#projectCreatedDate#", date.ToString("D"));
            projectblock = projectblock.Replace("#projectHTMLLines#", htmlLines);
            projectblock = projectblock.Replace("#projectCssLines#", cssLines);
            projectblock = projectblock.Replace("#projectJsLines#", jssLines);
            projectblock = projectblock.Replace("#projectLikes#", likes);
            projectblock = projectblock.Replace("#projectComments#", comments);
            projectblock = projectblock.Replace("#projectViews#", views);
            projectblock = projectblock.Replace("#projectDescription#", description);
            projectblock = projectblock.Replace("#projectID#", authclass.EncryptString(id));

            return projectblock;
        }

    }
}