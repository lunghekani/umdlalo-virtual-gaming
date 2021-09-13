using System;
using System.Collections.Generic;
using System.Data;
using System.Windows.Forms;
using Business_Logic;
using MySql.Data.Types;

namespace UmdlaloVirtualGaming.Pages.student
{
    public partial class student_profile_edit : System.Web.UI.Page
    {
        clsUserDetails objUserDtls = new clsUserDetails();
        private clsCommunicate communicate = new clsCommunicate();
        //public string uId;

       

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
            {
              var dt = objUserDtls.GetUserAccDetails(Session["user_id"].ToString());
            student_fullname.InnerText = dt.Rows[0].Field<string>("Name") + " " + dt.Rows[0].Field<string>("LastName");
            txtName.Text = dt.Rows[0].Field<string>("Name");
            txtLastName.Text = dt.Rows[0].Field<string>("LastName");
            
            txtEmail.Text= dt.Rows[0].Field<string>("Email");  
            }
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string lastname = txtLastName.Text;
            string email = txtEmail.Text;
            string msg = objUserDtls.UpdateUser(Session["user_id"].ToString(), name, lastname, email,0);
            if (msg.Equals("Success"))
            {
                communicate.ShowMessage(this, "Your details have been updated successfully", clsCommunicate.MessageType.success);
            }
            else
            {
                communicate.ShowMessage(this, msg, clsCommunicate.MessageType.error);
            }
        }

        protected void btnProfileCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("student-dashboard.aspx");
        }

        protected void btnTest_OnClick(object sender, EventArgs e)
        {
            MessageBox.Show("Did");
        }


    }
}