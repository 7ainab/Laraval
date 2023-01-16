using CollegeProject.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeProject
{
    public partial class Login : System.Web.UI.Page
    {
        private string connString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                    else if (user.Role == "booking")
                    {
                        Response.Redirect("Booking.aspx");
                    }
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection sqlCon = new SqlConnection(connString);
            SqlCommand sqlCmd = new SqlCommand("Select * FROM Users WHERE UserName='" + txtUsername.Text + "' and Password='" + txtPassword.Text + "'", sqlCon);
            SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            sqlCon.Open();
            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            if (dt.Rows.Count > 0)
            {
                Users user = new Users();
                foreach (DataRow row in dt.Rows)
                {
                    user = new Users();
                    user.UserId = int.Parse(row["UserId"].ToString());
                    user.Role = row["Role"].ToString();
                }
                Session["User"] = user;
                if (user.Role == "faculty")
                {
                    Response.Redirect("Faculty.aspx");
                }
                else if (user.Role == "key")
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
                lblmsg.Text = "Username or Password is invalid";
            }
        }
    }
}