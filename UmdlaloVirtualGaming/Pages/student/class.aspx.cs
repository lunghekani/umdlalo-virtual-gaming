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
    public partial class _class : System.Web.UI.Page
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
                var id =  Request.QueryString["ID"];
                if (id == null)
                {
                    
                }
                else
                {
                    DataTable dt = courseclass.GetTopicContent(Convert.ToInt32(id));
                    string content = dt.Rows[0].Field<string>("Structure");

                    PlaceHolder1.Controls.Add(new Literal { Text = content});
                }
            }
        }
    }
}