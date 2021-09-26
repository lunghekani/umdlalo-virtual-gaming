using Business_Logic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace UmdlaloVirtualGaming.Pages.student
{
    public partial class rest_chat_get : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {

            //redirect to the main page
            if (clsSmallItemsHandler.SessionIdIsSet == false) Response.Redirect("/");
            //end

            var session = HttpContext.Current.Session["user_id"];
            clsGroupChat groupChat = new clsGroupChat(session);///group chat

            clsPrivateChat privateChat = new clsPrivateChat(session);//private


            var javaScriptSerializer = new JavaScriptSerializer();

            var course_id = Request.Params["course_id"];
            var messageLimit = Request.Params["limit"];

            var token = Request.Params["token"];

            if (Request.Params["reset_group_notification"] != null)
            {
               groupChat.resetNotification(course_id);
            }

            else if (Request.Params["get_group_notification"]!=null)
            {
                var notification= groupChat.current_user_Notification(course_id);
                //OBJECT -> JSON
                string myObjectJson = javaScriptSerializer.Serialize(notification);
                //return JSON   
                Response.Clear();
                Response.ContentType = "application/json; charset=utf-8";
                Response.Write(myObjectJson);
                Response.End();
            }
            else if (token =="get_group_messages")
            { 
                
                var messages = groupChat.FetchMesssges(course_id, messageLimit);
                //OBJECT -> JSON
                string myObjectJson = javaScriptSerializer.Serialize(messages);
                //return JSON   
                Response.Clear();
                Response.ContentType = "application/json; charset=utf-8";
                Response.Write(myObjectJson);
                Response.End();
            }
            else if (Request.Params["reset_group_notification"] != null)
            {
                privateChat.resetNotification(course_id);
            }

            else if (Request.Params["get_private_notification"] != null)
            {
                
                var notification = privateChat.current_user_Notification(course_id);
                //OBJECT -> JSON
                string myObjectJson = javaScriptSerializer.Serialize(notification);
                //return JSON   
                Response.Clear();
                Response.ContentType = "application/json; charset=utf-8";
                Response.Write(myObjectJson);
                Response.End();
            }
            else if (token == "get_private_messages")
            {
                var messages = privateChat.FetchMesssges(course_id, messageLimit);
                //OBJECT -> JSON
                string myObjectJson = javaScriptSerializer.Serialize(messages);
                //return JSON   
                Response.Clear();
                Response.ContentType = "application/json; charset=utf-8";
                Response.Write(myObjectJson);
                Response.End();
            }
        }
    }
}