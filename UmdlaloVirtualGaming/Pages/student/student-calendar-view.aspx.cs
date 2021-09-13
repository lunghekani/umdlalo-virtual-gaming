using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Business_Logic;

namespace UmdlaloVirtualGaming.Pages.student
{
    public partial class student_calendar_view : System.Web.UI.Page
    {
        public clsAuthentication authclass = new clsAuthentication();
        public clsCourseOperations objModOperations = new clsCourseOperations();
        public clsCommunicate communicateclass = new clsCommunicate();
        public clsUserDetails userclass = new clsUserDetails();

       // private clsCalendar calendarclass = new clsCalendar();

        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        //protected void Btn_AddTask_Command(object sender, EventArgs e)
        //{
        //    // Calendar1.SelectedDate = DateTime.Now;
        //}
        //protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        //{
        //        DataTable dt = GetData();



        //        string link = "<a href='ScheduleDetails.aspx?scheduleID=";



        //        string s = e.Day.Date.ToShortDateString();



        //        e.Cell.Text = e.Day.Date.Day.ToString() + "<BR>";



        //        LiteralControl l = new LiteralControl();

        //        l.Text = e.Day.Date.Day.ToString() + "<BR>";

        //        e.Cell.Controls.Add(l);



        //        foreach (DataRow row in dt.Rows)

        //        {

        //            string scheduledDate = Convert.ToDateTime(row["ScheduleDate"]).ToShortDateString();



        //            if (scheduledDate.Equals(s))

        //            {

        //                LinkButton lb = new LinkButton();

        //                lb.Text = link + (int)row["ScheduleID"] + "'>" + row["Title"] as String + "</a>" + "<BR>";

        //                e.Cell.Controls.Add(lb);

        //            }

        //        }

        //    // code to create the “Add” link 

        //    HtmlAnchor anchor = new HtmlAnchor();

        //        anchor.InnerHtml = "Add";



        //        string method = "ShowAddTaskPane(event,'" + e.Day.Date.ToShortDateString() + "')";



        //        anchor.HRef = "#";

        //        anchor.Attributes.Add("onclick", method);

        //        e.Cell.Controls.Add(anchor);




        //}

       



    }
}

       

