using CollegeProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeProject
{
    public partial class SiteMaster : MasterPage
    {
        public Users user = new Users();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                user = new Users();
                user = (Users)Session["User"];
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["User"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}