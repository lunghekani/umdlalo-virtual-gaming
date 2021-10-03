using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business_Logic;

namespace UmdlaloVirtualGaming.Pages.admin
{
    public partial class admin_student_add : System.Web.UI.Page
    {
        public clsAuthentication authclass = new clsAuthentication();
        public clsBasicUserDetails NewUser = new clsBasicUserDetails();
        public clsCommunicate communicateclass = new clsCommunicate();
        public clsUserDetails userclass = new clsUserDetails();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
           // string name = txtFirstName.Text.Trim();
           // string LstNme =txtLstName.Text.Trim();
           // string email = txtEmail.Text.Trim();
           // DateTime date = DateTime.Now;
           // string role = dropdownlist1.value
           //;
           // string uId = Session["user_id"].ToString();
           // int visible = 0;
           // if (!DropDownList1.SelectedValue)
           // {
           //     visible = 1;
           // }
           // string msgCourse = courseClass.New_User_Add(name, description, code, startTime, endTime, uId, visible);

           // if (msgCourse.Equals("Success"))
           // {
           //     // display a notification saying project changes successfully implemented
           //     communicateclass.ShowMessage(this, "Course has been created successfully", clsCommunicate.MessageType.success);

           //     Response.Redirect("admin-course-list.aspx");
           // }
           // else
           // {
           //     communicateclass.ShowMessage(this, msgCourse, clsCommunicate.MessageType.error);
           // }

        }
    }
}