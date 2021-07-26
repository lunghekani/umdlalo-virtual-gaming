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
        private clsProjects projectsclass = new clsProjects(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            string projectlist = "";
            var dt = projectsclass.GetAllProjects();


            foreach (DataRow row in dt.Rows)
            {
                projectlist += DisplayProjects(row["Id"].ToString(),row["Name"].ToString(),row["Likes"].ToString(),
                    row["Comments"].ToString(),row["Views"].ToString(),row["HTMLLines"].ToString(),
                    row["JSSLines"].ToString(),row["CSSLines"].ToString(),row["DateCreated"].ToString() );
            }

            projectInstance.InnerHtml = projectlist;
        }

        protected string DisplayProjects(string id, string name, string likes, string comments, string views, string htmlLines, string jssLines, string cssLines, string date)
        {
            var stream = new StreamReader(Server.MapPath("~/Pages/student/sampleproject.txt"));
            string projectblock = stream.ReadToEnd();



            projectblock = projectblock.Replace("#projectPP#", null);
            projectblock = projectblock.Replace("#projectName#", name);
            projectblock = projectblock.Replace("#projectCreatedDate#", date);
            projectblock = projectblock.Replace("#projectHTMLLines#", htmlLines);
            projectblock = projectblock.Replace("#projectCssLines#", cssLines);
            projectblock = projectblock.Replace("#projectJsLines#", jssLines);
            projectblock = projectblock.Replace("#projectLikes#", likes);
            projectblock = projectblock.Replace("#projectComments#", comments);
            projectblock = projectblock.Replace("#projectViews#", views);
            projectblock = projectblock.Replace("#projectID#", id);

            return projectblock;
        }
        //protected string DisplayProjects()
        //{
        //    var stream = new StreamReader(Server.MapPath("~/Pages/student/sampleproject.txt"));
        //    string projectblock = stream.ReadToEnd();
            
            

        //    projectblock += projectblock.Replace("#projectPP#", null);
        //    projectblock += projectblock.Replace("#projectName#", null);
        //    projectblock += projectblock.Replace("#projectCreatedDate#", null);
        //    projectblock += projectblock.Replace("#projectHTMLLines#", null);
        //    projectblock += projectblock.Replace("#projectCssLines#", null);
        //    projectblock += projectblock.Replace("#projectJsLines#", null);
        //    projectblock += projectblock.Replace("#projectLikes#", null);
        //    projectblock += projectblock.Replace("#projectComments#", null);
        //    projectblock += projectblock.Replace("#projectViews#", null);
        //    projectblock += projectblock.Replace("#projectID#", null);
            
        //    return projectblock;
        //}
    }
}