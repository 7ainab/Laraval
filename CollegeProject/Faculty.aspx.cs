using CollegeProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeProject
{
    public partial class Faculty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                Users user = (Users)Session["User"];
                if (user.Role == "key")
                {
                    Response.Redirect("Key.aspx");
                }
                else if (user.Role == "booking")
                {
                    Response.Redirect("Booking.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}