using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UmdlaloVirtualGaming.Pages.student
{
    public partial class student_marks_view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMarkSearch(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "-1")
            {
                Response.Write("please select type");
            }
            else
            {
                Response.Write(DropDownList1.SelectedItem.Text);

                Response.Write(DropDownList1.SelectedItem.Value);
            }
        }
    }
}