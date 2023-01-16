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
    public partial class BookingList : System.Web.UI.Page
    {
        private string connString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User"] != null)
                {
                    Users user = (Users)Session["User"];
                    if(user.Role == "booking")
                    {
                        PopulateGridView1();
                    }
                    else if (user.Role == "faculty")
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
        void PopulateGridView1()
        {
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT Faculty.FacultyID, Faculty.FacultyName, Faculty.Email, Faculty.OfficeNumber, Rooms.RoomNumber, Rooms.Floor, Booking.BkID,Booking.BDate,Booking.BTime FROM Faculty JOIN Booking ON Booking.FID = Faculty.ID JOIN Rooms ON Booking.RID = Rooms.RoomID", sqlCon);
                sqlDa.Fill(datTbl);
            }
            if (datTbl.Rows.Count > 0)
            {
                GridViewList.DataSource = datTbl;
                GridViewList.DataBind();
                LabelErrorM.Text = "";
            }
            else
            {
                datTbl.Rows.Add(datTbl.NewRow());
                GridViewList.DataSource = datTbl;
                GridViewList.DataBind();
                GridViewList.Rows[0].Cells.Clear();
                GridViewList.Rows[0].Cells.Add(new TableCell());
                GridViewList.Rows[0].Cells[0].ColumnSpan = datTbl.Columns.Count;
                GridViewList.Rows[0].Cells[0].Text = "No Data Found ..!";
                GridViewList.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                LabelErrorM.Text = "";
            }

        }
        protected void EditBtnHandler(Object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            Response.Redirect("EditBooking.aspx?id=" + btn.CommandArgument.ToString());
        }
        protected void DeleteBtnHandler(Object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            using (SqlConnection connection = new SqlConnection(connString))
            {
                string query = "DELETE FROM Booking WHERE BkID=" + btn.CommandArgument.ToString();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Deleted Successfully')", true);

            PopulateGridView1();
            LabelErrorM.Text = "";
        }
        void PopulateGridViewByBkId(int id)
        {
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT Faculty.FacultyID, Faculty.FacultyName, Faculty.Email, Faculty.OfficeNumber, Rooms.RoomNumber, Rooms.Floor, Booking.BkID FROM Faculty JOIN Booking ON Booking.FID = Faculty.ID JOIN Rooms ON Booking.RID = Rooms.RoomID where Faculty.FacultyID LIKE '%" + id + "%'", sqlCon);
                sqlDa.Fill(datTbl);
                LabelErrorM.Text = "";
            }
            // when the tabel not embty
            if (datTbl.Rows.Count > 0)
            {
                GridViewList.DataSource = datTbl;
                GridViewList.DataBind();
                LabelErrorM.Text = "";

            }
            // when the tabel embty
            else
            {
                datTbl.Rows.Add(datTbl.NewRow());
                GridViewList.DataSource = datTbl;
                GridViewList.DataBind();
                GridViewList.Rows[0].Cells.Clear();
                GridViewList.Rows[0].Cells.Add(new TableCell());
                GridViewList.Rows[0].Cells[0].ColumnSpan = datTbl.Columns.Count;
                GridViewList.Rows[0].Cells[0].Text = "No Data Found ..!";
                GridViewList.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                LabelErrorM.Text = "";
            }

        }

        protected void ImageButtonSearch_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (TextBoxSearch.Text != null && TextBoxSearch.Text != "")
                 {
                        PopulateGridViewByBkId(int.Parse(TextBoxSearch.Text));
                        LabelErrorM.Text = "";
                }
                else
                 {
                PopulateGridView1();
                  LabelErrorM.Text = "";
                }
            }
            catch (Exception ex)
            {


                LabelErrorM.Text = ex.Message;
            }
        }

    }
}