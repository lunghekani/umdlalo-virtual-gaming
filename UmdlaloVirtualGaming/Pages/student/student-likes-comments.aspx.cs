using Business_Logic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UmdlaloVirtualGaming.Pages.student
{
    public partial class student_likes_comments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var project_id = Request.Params["id"];
            var type = Request.Params["type"];
            //undone there is an error and exception on this variable 
          //  var session = clsSmallItemsHandler.GetSessionId;

            clsProjects project = new clsProjects();

            if (type == "send-likes")
            {
                // undone this line gives an error

                //project.checkLikes(project_id, session);
                return;
            }
            if (type == "get-likes")
            {
                //return JSON   
                Response.ContentType = "application/json; charset=utf-8";
                // undone this line gives an error
                //Response.Write("{'likes':" + project.getLikes(project_id) + "}");
                Response.End();

            }
        }
    }
}