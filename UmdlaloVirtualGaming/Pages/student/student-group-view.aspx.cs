using Business_Logic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UmdlaloVirtualGaming.Pages.student
{
    public partial class student_group_view : System.Web.UI.Page
    {
        public Dictionary<string, string> course_list = new Dictionary<string, string>();
        public object user_id;
        public object user_name;

        protected void Page_Load(object sender, EventArgs e)
        {
            //redirect to the main page
            if (clsSmallItemsHandler.SessionIdIsSet == false) Response.Redirect("/");
            //end


            var session = HttpContext.Current.Session["user_id"];
            clsGroupChat groupChat =new clsGroupChat(session);//public chat

            

            //if send a message
            if (Request.Params["user_id"] !=null )
            {
                var name = Request.Params["user_name"];
                var user_id = Request.Params["user_id"];
                var course_id = Request.Params["course_id"];
                var time = Request.Params["time"].ToString().Replace("_"," ");
                var message = Request.Params["message"];

                groupChat.InsertMessage(name, user_id, course_id, time, message);

            }
            


           //load all the chat to this page
            course_list = groupChat.CURRENT_USER_All_COURSE_ID_AND_NAME();
            user_id = HttpContext.Current.Session["user_id"];
            user_name= HttpContext.Current.Session["user_name"];

        }
    }
}