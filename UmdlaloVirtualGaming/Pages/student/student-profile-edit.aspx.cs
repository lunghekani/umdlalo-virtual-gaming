using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business_Logic;

namespace UmdlaloVirtualGaming.Pages.student
{
    public partial class student_profile_edit : System.Web.UI.Page
    {
        clsUserDetails objUserDtls = new clsUserDetails();
        protected void Page_Load(object sender, EventArgs e)
        {
            var dt = objUserDtls.GetUserAccDetails(Session["user_id"].ToString());
            txtName.Text = dt.Rows[0].Field<string>("Name");
            txtLastName.Text = dt.Rows[0].Field<string>("LastName");
            txtEmail.Text= dt.Rows[0].Field<string>("Role");
            txtEmail.Text= dt.Rows[0].Field<string>("Email");
            
        }
    }
}