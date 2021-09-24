using Business_Logic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UmdlaloVirtualGaming.Pages.student
{
    public partial class student_chat_view : System.Web.UI.Page
    {
        public Dictionary<string, string> course_list = new Dictionary<string, string>();
        public object user_id;
        public object user_name;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Session["user_id"] = 6;
            var session = HttpContext.Current.Session["user_id"];
            clsPrivateChat privateChat = new clsPrivateChat(session);

            if (Request.Params["user_id"] != null)
            {
                var name = Request.Params["user_name"];
                var user_id = Request.Params["user_id"];
                var course_id = Request.Params["course_id"];
                var time = Request.Params["time"].ToString().Replace("_", " ");
                var message = Request.Params["message"];

                privateChat.InsertMessage(name, user_id, course_id, time, message);
            }

            course_list = privateChat.CURRENT_USER_All_COURSE_ID_AND_NAME();
            user_id = HttpContext.Current.Session["user_id"];
            user_name = HttpContext.Current.Session["user_name"];



        }
    }
}