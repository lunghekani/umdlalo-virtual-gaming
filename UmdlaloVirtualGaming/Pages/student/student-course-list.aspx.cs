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
    public partial class student_course_list : System.Web.UI.Page
    {
        public clsAuthentication authclass = new clsAuthentication();
        public clsCourseOperations courseclass = new clsCourseOperations();
        public clsCommunicate communicateclass = new clsCommunicate();
        public clsUserDetails userclass = new clsUserDetails();
        public clsProjects projectclass = new clsProjects();

        protected void Page_Load(object sender, EventArgs e)
        {
            string projectlist = "";
            var dt = courseclass.GetCourses();


            foreach (DataRow row in dt.Rows)
            {
                projectlist += DisplayCourses(row["Id"].ToString(), row["Name"].ToString(),
                    row["Description"].ToString(), row["Code"].ToString(),
                     Convert.ToDateTime(row["Start"]),Convert.ToDateTime( row["End"].ToString()), row["Instructor"].ToString(),
                    row["Email"].ToString());
            }

            courseInstance.InnerHtml = projectlist;
        }

        protected string DisplayCourses(string id, string name, string description, string code, DateTime start,  DateTime end, string instructor, string email)
        {
            var stream = new StreamReader(Server.MapPath("~/Pages/student/coursecard.txt"));
            string projectblock = stream.ReadToEnd();


            projectblock = projectblock.Replace("#classId#", id);
            projectblock = projectblock.Replace("#courseTitle#", name);
            projectblock = projectblock.Replace("#courseTime#", start.ToString("d") +" - "+ end.ToString("d"));
            projectblock = projectblock.Replace("#LecturerName#", instructor);

            projectblock = projectblock.Replace("#description#", description);
            projectblock = projectblock.Replace("#descriptionFull#", description);
            
            stream.Close();
            return projectblock;
        }


       

    }
}