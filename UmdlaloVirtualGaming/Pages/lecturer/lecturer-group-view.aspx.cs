using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using  Business_Logic;

namespace UmdlaloVirtualGaming.Pages.lecturer
{
    public partial class lecturer_group_view : System.Web.UI.Page
    {
        public object user_id;
        public object user_name;
       public List<clsGroupChat.adminStore> course_list = new List<clsGroupChat.adminStore>();
        protected void Page_Load(object sender, EventArgs e)
        {

            //redirect to the main page
            if (clsSmallItemsHandler.SessionIdIsSet == false) Response.Redirect("/");
            //end

            //HttpContext.Current.Session["user_id"] = "98bc0920-e8c0-41da-a54e-855973651aff";
            var session = HttpContext.Current.Session["user_id"];
            clsGroupChat groupChat = new clsGroupChat(session);//public chat



            //if send a message
            if (Request.Params["user_id"] != null)
            {
                var name = Request.Params["user_name"];
                var user_id = Request.Params["user_id"];
                var course_id = Request.Params["course_id"];
                var time = Request.Params["time"].ToString().Replace("_", " ");
                var message = Request.Params["message"];

              groupChat.InsertMessage(name, user_id, course_id, time, message);

            }

           course_list = groupChat.CURRENT_ADMIN_All_COURSE_ID_AND_NAME();

            user_id = HttpContext.Current.Session["user_id"];
            user_name = HttpContext.Current.Session["user_name"];
        }
    }
}