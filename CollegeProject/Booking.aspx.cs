using CollegeProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeProject
{
    public partial class Booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["User"] != null)
            {
                Users user = (Users)Session["User"];
                if (user.Role == "faculty")
                {
                    Response.Redirect("Faculty.aspx");
                }
                else if (user.Role == "key")
                {
                    Response.Redirect("Key.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}