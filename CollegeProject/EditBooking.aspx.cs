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
    public partial class EditBooking : System.Web.UI.Page
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
                        if (id != "")
                        {
                            GetBookingById(id);
                        }
                        else
                        {
                            Response.Redirect("KeyList.aspx");
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
        private void GetBookingById(string id)
        {
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT Faculty.FacultyID, Faculty.FacultyName, Faculty.Email, Faculty.OfficeNumber, Rooms.RoomNumber, Rooms.Floor, Booking.BkID,Booking.FID,Booking.RID,Booking.BDate,Booking.BTime FROM Faculty JOIN Booking ON Booking.FID = Faculty.ID JOIN Rooms ON Booking.RID = Rooms.RoomID where Booking.BkID=" + int.Parse(id), sqlCon);
                sqlDa.Fill(datTbl);
            }
            if (datTbl.Rows.Count > 0)
            {
                foreach (DataRow row in datTbl.Rows)
                {
                    hdBkid.Value = id;
                    txtRoomNum.Text = row["RoomNumber"].ToString();
                    hdRoomId.Value = row["RID"].ToString();
                    txtMemId.Text = row["FacultyID"].ToString();
                    hdFid.Value = row["FID"].ToString();
                    if(row["BDate"]!=DBNull.Value)
                    Calinput.SelectedDate =Convert.ToDateTime(row["BDate"].ToString());

                    drptime.SelectedValue = row["BTime"].ToString();
                }
            }
            else
            {
                Response.Redirect("BookingList.aspx");
            }
        }
        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            if (txtRoomNum.Text != "" && txtRoomNum.Text != null && txtMemId.Text != "" && txtMemId.Text != null) {
                if (lblRoomNumberError.Text == "" && lblMemIdError.Text == "")
                {
                    try
                    {
                        using (SqlConnection sqlCon = new SqlConnection(connString))
                        {
                            sqlCon.Open();
                            string query = "UPDATE Booking SET FID = @FID, RID = @RID,BDate=@BDate,BTime=@BTime WHERE BkID=" + hdBkid.Value;
                            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                            sqlCmd.Parameters.AddWithValue("@FID", hdFid.Value);
                            sqlCmd.Parameters.AddWithValue("@RID", hdRoomId.Value);
                            sqlCmd.Parameters.AddWithValue("@BDate", Calinput.SelectedDate);
                            sqlCmd.Parameters.AddWithValue("@BTime", drptime.SelectedValue);
                            sqlCmd.ExecuteNonQuery();
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Updated Successfully')", true);
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
        protected void TextBoxMemId_TextChanged(object sender, EventArgs e)
        {
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                string query = "SELECT * FROM Faculty where FacultyID = " + txtMemId.Text;
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter(query, sqlCon);
                sqlDa.Fill(datTbl);
            }
            if (datTbl.Rows.Count > 0)
            {
                if (datTbl.Rows.Count > 0)
                {
                    foreach (DataRow row in datTbl.Rows)
                    {
                        hdFid.Value = row["ID"].ToString();
                    }
                }
                lblMemIdSuccess.Text = "*Member exists";
                lblMemIdError.Text = "";
            }
            else
            {
                lblMemIdError.Text = "*Member not found";
                lblMemIdSuccess.Text = "";
            }
        }
        protected void TextBoxRoomNum_TextChanged(object sender, EventArgs e)
        {
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                string query = "SELECT * FROM Rooms where RoomNumber = '" + txtRoomNum.Text+"'";
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
                lblRoomNumberError.Text = "*Room not found";
                lblRoomNumberSuccess.Text = "";
            }
        }
    }
}