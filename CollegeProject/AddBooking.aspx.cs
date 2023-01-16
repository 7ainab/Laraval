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
    public partial class AddBooking : System.Web.UI.Page
    {
        private string connString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User"] != null)
                {
                    Users user = (Users)Session["User"];
                    if (user.Role == "booking")
                    {
                        string id = Request.QueryString["id"];
                        if (id != "" && Request.QueryString["id"]!=null && Request.QueryString["roomnumber"]!="" && Request.QueryString["roomnumber"] != null)
                        {
                            txtRoomNum.Text = Request.QueryString["roomnumber"];
                            hdRoomId.Value = id;
                        }
                        else
                        {
                            txtRoomNum.ReadOnly = false;
                        }
                    }
                    else if (user.Role == "faculty")
                    {
                        Response.Redirect("Faculty.aspx");
                    }
                    else if (user.Role == "key")
                    {
                        Response.Redirect("Key.aspx");
                    }
                    else
                    {
                        Response.Redirect("Login.aspx");
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
        protected void TextBoxkeyNum_TextChanged(object sender, EventArgs e)
        {
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                string query = "SELECT * FROM Faculty where FacultyID = '" + txtMemId.Text + "'";
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter(query, sqlCon);
                sqlDa.Fill(datTbl);
            }
            if (datTbl.Rows.Count > 0)
            {
                foreach (DataRow row in datTbl.Rows)
                {
                    hdFid.Value = row["ID"].ToString();
                }
                lblMsg.Text = "Member Available";
                lblError.Text = "";
            }
            else
            {
                lblMsg.Text = "";
                lblError.Text = "Member not found,please try another one";
            }
        }
        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            if (txtRoomNum.Text != "" && txtRoomNum.Text != null && txtMemId.Text != "" && txtMemId.Text != null && drptime.SelectedValue!= "Select Time")
            {
                if (lblRoomNumberError.Text == "" && lblError.Text == "")
                {
                    try
                    {
                        using (SqlConnection sqlCon = new SqlConnection(connString))
                        {
                            sqlCon.Open();
                            string query = "INSERT INTO Booking (RID,FID,BDate,BTime) VALUES (@RID,@FID,@BDate,@BTime)";
                            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                            sqlCmd.Parameters.AddWithValue("@RID", hdRoomId.Value);
                            sqlCmd.Parameters.AddWithValue("@FID ", hdFid.Value); ;
                            sqlCmd.Parameters.AddWithValue("@BDate", Calinput.SelectedDate);
                            sqlCmd.Parameters.AddWithValue("@BTime ", drptime.SelectedValue); ;
                            sqlCmd.ExecuteNonQuery();
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
                            LabelErrorM.Text = "";
                            txtMemId.Text = "";
                        }
                    }
                    catch (Exception ex)
                    {
                        LabelErrorM.Text = ex.Message;
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please fill the fields with valid values')", true);
                }
            }
            else
            {
                LabelErrorM.Text = "please fill all the fields";
            }
                

        }
        protected void TextBoxRoomNum_TextChanged(object sender, EventArgs e)
        {
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                string query = "SELECT * FROM Rooms where RoomNumber = '" + txtRoomNum.Text + "'";
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter(query, sqlCon);
                sqlDa.Fill(datTbl);
            }
            if (datTbl.Rows.Count > 0)
            {
                foreach (DataRow row in datTbl.Rows)
                {
                    hdRoomId.Value = row["RoomID"].ToString();
                }
                lblRoomNumberSuccess.Text = "*Room exists";
                lblRoomNumberError.Text = "";
            }
            else
            {
                lblRoomNumberError.Text = "*Room not found,please try another one";
                lblRoomNumberSuccess.Text = "";
            }
        }
    }
}