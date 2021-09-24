﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business_Logic;
using System.Data;
using System.Diagnostics.Eventing.Reader;
using System.Windows.Forms;

namespace UmdlaloVirtualGaming
{
    public partial class Student : System.Web.UI.MasterPage
    {
        clsUserDetails objUserDtls = new clsUserDetails();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (HttpContext.Current.Session["user_id"] != null)
                {

                    var dt = objUserDtls.GetUserAccDetails(Session["user_id"].ToString());
                    lblFullName.InnerText = dt.Rows[0].Field<string>("Name") + " " + dt.Rows[0].Field<string>("LastName");
                    lblNames.InnerText = dt.Rows[0].Field<string>("Name") + " " + dt.Rows[0].Field<string>("LastName");
                    lblRole.InnerText = dt.Rows[0].Field<string>("Role");
                    lblEmail.InnerText = dt.Rows[0].Field<string>("Email");

                    
                }
                else
                {
                    
                }
            }
        }
    }
}