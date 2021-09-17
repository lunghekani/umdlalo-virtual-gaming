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
    public partial class content_view : System.Web.UI.Page
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
                int Id = Convert.ToInt32(Session["topic_id"].ToString());
                DataTable dt = courseclass.GetTopicContent(1);
                string content = dt.Rows[0].Field<string>("Structure").ToString();
                // plContent.Controls.Add(New Literal With {.Text = Content})
                PlaceHolder1.Controls.Add(new Literal{Text = content.ToString()});
            }
        }
    }
}