using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using Business_Logic;
namespace UmdlaloVirtualGaming
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        clsUserDetails objUserDtls = new clsUserDetails();

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (HttpContext.Current.Session["user_id"] != null)
                {
                    
                   var dt = objUserDtls.GetUserAccDetails(Session["user_id"].ToString());
                    //lblFullName.InnerText = dt.Rows[0].Field<string>("FirstName")+ " " + dt.Rows[0].Field<string>("LastName");
                    lblFullName.InnerText = "Food";
                    lblFullName.Style.Add("Color", "red");
                }
            }
        }
    }
}