using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Business_Logic;

namespace UmdlaloVirtualGaming.Pages.student
{
    public partial class build : System.Web.UI.Page
    {
        public clsAuthentication authclass = new clsAuthentication();
        public clsCourseOperations objModOperations = new clsCourseOperations();
        public clsCommunicate communicateclass = new clsCommunicate();
        public clsUserDetails userclass = new clsUserDetails();
        public clsProjects projectclass = new clsProjects();
        public string uId;
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.QueryString["ID"];
            
            if (id == null)
            {
                // if ID is null it means they starting from the create page 
                liDateCreated.Visible = false;
                lblProjectName.Visible = false;
                btnSaveChanges.Visible = false;
                btnDownload.Visible = false;
            }
            else
            {
                PopulateCode(int.Parse(authclass.DecryptString(id)));
                PopulateComments(int.Parse(authclass.DecryptString(id)));
                if (Session["user_id"].ToString()==uId) // when it is your project
                {
                    lblVisible.Visible = true;
                    spVisible.Visible = true;
                    btnSave.Visible = false;
                    btnSaveChanges.Visible = true;
                    txtName.Enabled = true;
                    lblProjectName.Visible = false;
                }
                else // when its not your project
                {
                    iconEdit.Visible = false;
                    lblVisible.Visible = false;
                    spVisible.Visible = false;
                    btnSave.Visible = false;
                    btnSaveChanges.Visible = false;
                    txtName.Visible= false; 
                    
                }

            }
            
        }

        //send button for comments  
        protected void btnSendcomment_OnClick(object sender, EventArgs e)
        {
            var id = Request.QueryString["ID"];
            int Project_ID = int.Parse(authclass.DecryptString(id));
            string Comment = txtcomment.InnerText;
            string uId = Session["user_id"].ToString();

            var Comments = projectclass.CreateComment(Project_ID, uId, Comment);

            if (Comments.Equals("Success"))
            {
                // display a notification saying comment successfully sent
                communicateclass.ShowMessage(this, "Comment sent", clsCommunicate.MessageType.success);
            }
            else
            {
                communicateclass.ShowMessage(this, "Error ocurred", clsCommunicate.MessageType.error);
            }
        }
        //end of send comments button 
        protected void PopulateComments(int projectID)
        {
            var dt = projectclass.GetProjectComments(projectID); // this is where the business code you created gets called

            string commentList = "";

            string Null = null;  
            
            ///put if statement here for no comments

            if (commentList == Null)
            {
                foreach (DataRow row in dt.Rows)
                {
                    commentList += DisplayComments(row["Name"].ToString(), row["Comments"].ToString(), Convert.ToDateTime(row["DateCreated"]));
                }
             
            }
            else
            {
                 Console.WriteLine("No comments");
            }
           
            dvComment.InnerHtml = commentList;

        }
        protected string DisplayComments(string name, string comments, DateTime date)
        {
            var stream = new StreamReader(Server.MapPath("~/Pages/student/commentSample.txt"));
            string projectblock = stream.ReadToEnd();



            projectblock = projectblock.Replace("#CommentDate#", date.ToString("dd MMM  yy"));
            projectblock = projectblock.Replace("#CommentText#", comments);
            projectblock = projectblock.Replace("#CommentName#", name);
           

            return projectblock;
        }
        protected void PopulateCode(int projectID)
        {
            string likes, comments, views;
            DateTime date;



            var dt = projectclass.View_Project(projectID); // this is where the business code you created gets called
            // this is how you populate the elements on the front end
            foreach (DataRow row in dt.Rows)
            {
                txtName.Text= row["Name"].ToString();
                likes = row["Likes"].ToString();
                comments = row["Comments"].ToString();
                views =row["Views"].ToString();
                date =Convert.ToDateTime( row["DateCreated"]); 
                string details = $"Likes: {likes} \t Comments: {comments} \t Views:{views} \t\t Date Created: {date.ToString("D")}";
                if (Convert.ToBoolean(row["Enabled"]))
                {
                    chkVisible.Checked = false;
                }
                else
                {
                    chkVisible.Checked = true;
                }
               
            htmlCode.Text = row["HTML"].ToString();
            cssCode.InnerText= row["CSS"].ToString();
            jsCode.InnerText= row["JS"].ToString();
            lblProjectName.InnerText = row["Name"].ToString();
            lblDateCreated.InnerText = date.ToString("D");
            lblProjectCreator.InnerText = "\t"+row["Creator"].ToString();
            uId= row["UserID"].ToString();
            }

        }

     

        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            
            string name = txtName.Text.ToString().Trim();
            string htmlCode = this.htmlCode.Text;
            string cssCode = this.cssCode.Value;
            string jsCode = this.jsCode.Value;
            string uId = Session["user_id"].ToString();
            int visibility = 0;
            if (!chkVisible.Checked)
            {
                visibility = 1;
            }
            var project = projectclass.CreateProject(name,htmlCode,cssCode,jsCode,visibility ,uId);

            if (project.Equals("Success"))
            {
                // display a notification saying project changes successfully implemented
                communicateclass.ShowMessage(this,"Project Created Successfully",clsCommunicate.MessageType.success);
                
                Response.Redirect("create.aspx?ID="+authclass.EncryptString(projectclass.lastProjectInsert));
            }
            else
            {
                communicateclass.ShowMessage(this,"There was an error in creating your project, try again in a few minutes",clsCommunicate.MessageType.error);
            }
        }

        protected void btnDownload_OnClick(object sender, EventArgs e)
        {
            
        }

    

        protected void btnSaveChanges_OnClick(object sender, EventArgs e)
        {
            var id = Request.QueryString["ID"];
            string name = txtName.Text.Trim();
            string htmlCode = this.htmlCode.Text;
            string cssCode = this.cssCode.Value;
            string jsCode = this.jsCode.Value;
            string uId = Session["user_id"].ToString();
            int visibility = 0;
            if (!chkVisible.Checked)
            {
                visibility = 1;
            }
            var project = projectclass.UpdateProject(name,htmlCode,cssCode,jsCode,visibility,authclass.DecryptString(id));

            if (project.Equals("Success"))
            {
                // display a notification saying project changes successfully implemented
                communicateclass.ShowMessage(this,"Updated Project Successfully",clsCommunicate.MessageType.success);
                
                
            }
            else
            {
                communicateclass.ShowMessage(this,"There was an error in updating your project, try again in a few minutes",clsCommunicate.MessageType.error);
            }
        }

        protected void htmlCode_OnTextChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "test", "showPreview();", true);
        }

      
    }
}
