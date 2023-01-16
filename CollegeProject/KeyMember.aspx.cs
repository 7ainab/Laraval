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
    public partial class KeyMember : System.Web.UI.Page
    {
        private string connString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        public Users userDetail = new Users();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridView1();
                if (Session["User"] != null)
                {
                    userDetail = new Users();
                    userDetail = (Users)Session["User"];
                    if (userDetail.Role == "faculty")
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
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT DISTINCT f.* FROM Faculty f JOIN BorrowKey b ON f.ID = b.FID", sqlCon);
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
        void PopulateGridViewDetail(int id)
        {
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT b.IsLost,b.IsReturn,b.Condition,b.BorrowDate,t.KeyNumber,t.Category,t.Floor,t.Description FROM BorrowKey b JOIN Keys t ON b.KeyID = t.KeyNumber where b.FID=" + id, sqlCon);
                sqlDa.Fill(datTbl);
            }
            // when the tabel not embty
            if (datTbl.Rows.Count > 0)
            {
                GridViewKeyDetail.DataSource = datTbl;
                GridViewKeyDetail.DataBind();

            }
            // when the tabel embty
            else
            {
                datTbl.Rows.Add(datTbl.NewRow());
                GridViewKeyDetail.DataSource = datTbl;
                GridViewKeyDetail.DataBind();
                GridViewKeyDetail.Rows[0].Cells.Clear();
                GridViewKeyDetail.Rows[0].Cells.Add(new TableCell());
                GridViewKeyDetail.Rows[0].Cells[0].ColumnSpan = datTbl.Columns.Count;
                GridViewKeyDetail.Rows[0].Cells[0].Text = "No Data Found ..!";
                GridViewKeyDetail.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }
        protected void BtnDetailHandler(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            PopulateGridViewDetail(int.Parse(btn.CommandArgument.ToString()));
            lblkey.Text = btn.CommandArgument.ToString();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "openModel", "openModelFun()", true);
        }
    }
}