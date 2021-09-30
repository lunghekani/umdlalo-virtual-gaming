using Business_Logic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace UmdlaloVirtualGaming.Pages.student
{
    public partial class student_project_chat : System.Web.UI.Page
    {
        public Dictionary<string, string> course_list = new Dictionary<string, string>();
        public object user_id;
        public object user_name;
        protected void Page_Load(object sender, EventArgs e)
        {


            //redirect to the main page
            if (clsSmallItemsHandler.SessionIdIsSet == false) Response.Redirect("/");
            //end


            clsAuthentication authclass = new clsAuthentication();
            clsProjects projects = new clsProjects();

            var id = Request.QueryString["id"]==null?"" : Request.QueryString["id"];
            var decoded_id = authclass.DecryptString(id);

           

            //var session = HttpContext.Current.Session["user_id"];
            //clsPrivateChat privateChat = new clsPrivateChat(session);

            if (Request.Params["user_id"] != null)
            {
                var name = Request.Params["user_name"];
                var user_id = Request.Params["user_id"];
                var project_id = Request.Params["course_id"];
                var time = Request.Params["time"].ToString().Replace("_", " ");
                var message = Request.Params["message"];

                projects.InsertMessage(name, user_id, project_id, time, message);
            }

            // undone there is an error on the line below
            course_list = projects.current_project_chats(decoded_id);
            user_id = HttpContext.Current.Session["user_id"];
            user_name = HttpContext.Current.Session["user_name"];



        }
    }
}