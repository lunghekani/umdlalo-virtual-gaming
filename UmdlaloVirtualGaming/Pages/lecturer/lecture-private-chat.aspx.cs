using Business_Logic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using static Business_Logic.clsGroupChat;

namespace UmdlaloVirtualGaming.Pages.lecturer
{
    public partial class lecture_private_chat : System.Web.UI.Page
    {
        clsPrivateChat privateChat;
        public object user_id;
        public object user_name;
        public List<adminStore> course_list = new List<adminStore>();

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Session["user_id"] = 6;
            var session = HttpContext.Current.Session["user_id"];

            privateChat = new clsPrivateChat(session);

            var current_course_code = Request.QueryString["course_code"];
           

            //get the selected code
            if (current_course_code != null)
            {
                course_list = privateChat.CURRENT_STUDENT_LIST(current_course_code);
                user_id = HttpContext.Current.Session["user_id"];
                user_name = HttpContext.Current.Session["user_name"];
            }
            //foreach (var item in Request.Params.AllKeys)
            //{
            //    MessageBox.Show(item);
            //}
           
            if (Request.Params["user_id"] != null)
            {
                var name = Request.Params["user_name"];
                var user_id = Request.Params["user_id"];
                var course_id = Request.Params["course_id"];
                var time = Request.Params["time"].ToString().Replace("_", " ");
                var message = Request.Params["message"];
                MessageBox.Show(current_course_code);
                privateChat.InsertMessage(name, user_id, course_id, time, message);
            }

           
        }
    }
}