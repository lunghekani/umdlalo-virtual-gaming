using System;
using Business_Logic;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UmdlaloVirtualGaming.Pages.student
{
    public partial class student_projects_view : System.Web.UI.Page
    {
        public clsModuleOperations objModOperations = new clsModuleOperations();
        clsUserDetails objUserDtls = new clsUserDetails();


        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        //code to view the coding platform when view project is clciked 
        //protected void btnViewProject_OnClick(object sender, EventArgs e)
        //{
        //    string HTML, JSS, CSS/*, FRAME*/;

        //    HTML = btnViewproject.InnerHtml.Trim();
        //    JSS = btnViewproject.InnerHtml.Trim();
        //    CSS = btnViewproject.InnerHtml.Trim();
        //    //FRAME = btnViewproject.Text.Trim();

        //    if (!Page.IsPostBack)
        //    {
        //        if (HttpContext.Current.Session["user_id"] != null)
        //        {
        //            var dt = objModOperations.View_Project(HTML, JSS, CSS);

        //            if (HTML = btnViewproject.InnerHtml = dt.Rows[0].Field<string>("HTML")) 
        //            {
        //                Response.Redirect("~/Pages/student/code.aspx");
        //            }
        //            else if ( JSS = btnViewproject.InnerHtml= dt.Rows[0].Field<string>("JSS"))
        //            {
        //                Response.Redirect("~/Pages/student/code.aspx");
        //            }
        //            else if (CSS = btnViewproject.InnerHtml= dt.Rows[0].Field<string>("CSS"))
        //            {
        //                Response.Redirect("~/Pages/student/code.aspx");
        //            }              
                               
        //        }
        //    }
                
            
        //}


    }
}