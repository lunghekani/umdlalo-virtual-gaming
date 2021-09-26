using Business_Logic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UmdlaloVirtualGaming.Pages.lecturer
{
    public partial class lecturer_chat_view : System.Web.UI.Page
    {
        public clsPrivateChat chat;
        protected void Page_Load(object sender, EventArgs e)
        {
            //redirect to the main page
            if (clsSmallItemsHandler.SessionIdIsSet == false) Response.Redirect("/");
            //end

          
            var session = HttpContext.Current.Session["user_id"];
            chat = new clsPrivateChat(session);
            

           
        }
    }
}