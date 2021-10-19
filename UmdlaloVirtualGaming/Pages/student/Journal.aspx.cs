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
    public partial class Journal : System.Web.UI.Page
    {
        public clsAuthentication authclass = new clsAuthentication();
        public clsCourseOperations courseclass = new clsCourseOperations();
        public clsCommunicate communicateclass = new clsCommunicate();
        public clsUserDetails userclass = new clsUserDetails();
        public clsProjects projectclass = new clsProjects();
        public DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["journal_id"] != null)
                {
                    btnSubmit.Visible = false;
                    btnUpdate.Visible = true;
                    int Id = Convert.ToInt32(Session["journal_id"]);
                    dt = userclass.GetJournalEntry(Id);
                    string content = dt.Rows[0].Field<string>("Content");
                    DateTime date = dt.Rows[0].Field<DateTime>("Date");
                    lblDate.InnerText = "Date Recorded "+  date.ToString("d");
                    txtName.Text = dt.Rows[0].Field<string>("Name");

                    txtContent.InnerText = content;
                }
                else
                {
                    btnUpdate.Visible=false;
                }

            }
        }

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
           
            string name = txtName.Text;
            string content =  txtContent.Value;
            string Uid = Session["user_id"].ToString();
            string msg = userclass.CreateJournal(Uid, name, content);
            if (msg.Equals("Success"))
            {
                communicateclass.ShowMessage(this, "Journal entry created successfully", clsCommunicate.MessageType.success);
            }
            else
            {
                communicateclass.ShowMessage(this,"There was an error saving your content: Error"+ msg, clsCommunicate.MessageType.error);
            }







        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
         
            string name = txtName.Text;
            string content = txtContent.Value;
            string Id = Session["journal_id"].ToString();
            string msg = userclass.UpdateJournal(Id, name, content);
            if (msg.Equals("Success"))
            {
                communicateclass.ShowMessage(this, "Journal entry updated successfully", clsCommunicate.MessageType.success);
            }
            else
            {
                communicateclass.ShowMessage(this, "There was an error saving your content: Error" + msg, clsCommunicate.MessageType.error);
            }

        }
    }
}