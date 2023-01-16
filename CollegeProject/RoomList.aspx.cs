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
    public partial class RoomList : System.Web.UI.Page
    {

        private string connString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        public Users userDetail = new Users();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Drpcolumn.SelectedValue = "RoomID";
                PopulateGridView1();
                if (Session["User"] != null)
                {
                    userDetail = new Users();
                    userDetail = (Users)Session["User"];
                    if (userDetail.Role == "booking")
                    {

                        GridViewList.Columns[10].Visible = true;
                    }
                    else if (userDetail.Role == "faculty")
                    {
                        Response.Redirect("Faculty.aspx");
                    }
                    else if (userDetail.Role == "key")
                    {
                        Response.Redirect("Key.aspx");
                    }
                }
                else
                {
                    GridViewList.Columns[10].Visible = false;
                }
            }
        }
        void PopulateGridView1()
        {
            string date = DateTime.Now.ToString("yyyy-MM-dd");
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Rooms where AvailableDate>'" + date + "'" , sqlCon);
                sqlDa.Fill(datTbl);
            }
            // when the tabel not embty
            if (datTbl.Rows.Count > 0)
            {
                GridViewList.DataSource = datTbl;
                GridViewList.DataBind();

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
            }

        }
        void PopulateGridViewByRoomNumber(string id)
        {
            string date = DateTime.Now.ToString("yyyy-MM-dd");
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Rooms WHERE AvailableDate>'" + date + "' and "+Drpcolumn.SelectedValue+" LIKE '%" + id + "%'", sqlCon);
                sqlDa.Fill(datTbl);
            }
            // when the tabel not embty
            if (datTbl.Rows.Count > 0)
            {
                GridViewList.DataSource = datTbl;
                GridViewList.DataBind();

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
            }

        }
        protected void ImageButtonSearch_Click(object sender, ImageClickEventArgs e)
        {
            if (TextBoxSearch.Text != null && TextBoxSearch.Text != "")
            {
                PopulateGridViewByRoomNumber(TextBoxSearch.Text);
            }
            else
            {
                PopulateGridView1();
            }
        }
        protected void BookBtnHandler(Object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Rooms WHERE RoomID="+ btn.CommandArgument.ToString(), sqlCon);
                sqlDa.Fill(datTbl);
            }
            // when the tabel not embty
            if (datTbl.Rows.Count > 0)
            {
                foreach (DataRow row in datTbl.Rows)
                {
                    Response.Redirect("AddBooking.aspx?id=" + btn.CommandArgument.ToString() + "&roomnumber="+ row["RoomNumber"].ToString());
                }
                }
            
        }

    }
}