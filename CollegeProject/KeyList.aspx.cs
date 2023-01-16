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
    public partial class KeyList : System.Web.UI.Page
    {
        private string connString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        public Users userDetail = new Users();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Drpcolumn.SelectedValue = "KeyNumber";
                PopulateGridView1();
                if (Session["User"] != null)
                {
                    userDetail = new Users();
                    userDetail = (Users)Session["User"];
                    if (userDetail.Role == "key")
                    {

                        GridViewList.Columns[8].Visible = true;
                    }
                    else if (userDetail.Role == "faculty")
                    {
                        Response.Redirect("Faculty.aspx");
                    }
                    else if (userDetail.Role == "booking")
                    {
                        Response.Redirect("Booking.aspx");
                    }
                }
                else
                {
                    GridViewList.Columns[8].Visible = false;
                }
            }
        }
        void PopulateGridView1()
        {
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Keys", sqlCon);
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
        void PopulateGridViewByKeyNumber(string id)
        {
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Keys WHERE "+Drpcolumn.SelectedValue+" LIKE '%" + id + "%'", sqlCon);
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
                PopulateGridViewByKeyNumber(TextBoxSearch.Text);
            }
            else
            {
                PopulateGridView1();
            }
        }
        protected void EditBtnHandler(Object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            Response.Redirect("EditKey.aspx?id=" + btn.CommandArgument.ToString());
        }
        protected void BorrowBtnHandler(Object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            Response.Redirect("BorrowKey.aspx?key=" + btn.CommandArgument.ToString());
        }
        
        protected void DeleteBtnHandler(Object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            using (SqlConnection connection = new SqlConnection(connString))
            {
                string query2 = "DELETE FROM Keys WHERE KeyNumber='" + btn.CommandArgument.ToString()+"'";
                string query1 = "DELETE FROM BorrowKey WHERE KeyID='" + btn.CommandArgument.ToString() + "'";
                using (SqlCommand command = new SqlCommand(query1, connection))
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
                using (SqlCommand command = new SqlCommand(query2, connection))
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }

            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Deleted Successfully')", true);
            if (TextBoxSearch.Text != "" && TextBoxSearch.Text!=null)
            {
                PopulateGridView1();
            }
            else
            {
                PopulateGridViewByKeyNumber(TextBoxSearch.Text);
            }
        }
    }
}