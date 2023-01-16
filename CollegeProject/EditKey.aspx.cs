using CollegeProject.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeProject
{
    public partial class EditKey : System.Web.UI.Page
    {
        private string connString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User"] != null)
                {
                    Users user = (Users)Session["User"];
                    if (user.Role == "key")
                    {
                        string id = Request.QueryString["id"];
                        if (id != "")
                        {
                            GetKeyById(id);
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
                    else if (user.Role == "booking")
                    {
                        Response.Redirect("Booking.aspx");
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
        private void GetKeyById(string id)
        {
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Keys where KeyNumber='" + id+"'", sqlCon);
                sqlDa.Fill(datTbl);
            }
            if (datTbl.Rows.Count > 0)
            {
                foreach (DataRow row in datTbl.Rows)
                {
                    TextBoxkeyNum.Text = row["KeyNumber"].ToString();
                    DropDownListCategory.SelectedValue = row["Category"].ToString();
                    DropDownListFloor.SelectedValue = row["Floor"].ToString();
                    DropDownListFCondition.SelectedValue = row["Condition"].ToString();
                    TextBoxCopies.Text = row["Copies"].ToString();
                    TextBoxOriginals.Text = row["Originals"].ToString();
                    TextBoxTotal.Text = row["Total"].ToString();
                    ListBoxDescription.Text = row["Description"].ToString();
                }
            }
            else
            {
                Response.Redirect("KeyList.aspx");
            }
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            if (TextBoxkeyNum.Text != "" &&
            DropDownListCategory.SelectedValue != "Select Category" &&
            DropDownListFloor.SelectedValue != "Select Floor" &&
            DropDownListFCondition.SelectedValue != "Select Condition" &&
            TextBoxCopies.Text != "" &&
            TextBoxOriginals.Text != "" &&
            TextBoxTotal.Text != "" &&
            ListBoxDescription.Text != "")
            {
                if (KeyNumberMsg.Text == "")
                {
                    try
                    {
                        using (SqlConnection sqlCon = new SqlConnection(connString))
                        {
                            sqlCon.Open();
                            string query = "UPDATE Keys SET Category = @Category, Floor = @Floor,Condition = @Condition, Copies = @Copies,Originals = @Originals, Total = @Total,Description = @Description WHERE KeyNumber='" + TextBoxkeyNum.Text + "'";
                            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                            sqlCmd.Parameters.AddWithValue("@Category", DropDownListCategory.SelectedValue);
                            sqlCmd.Parameters.AddWithValue("@Floor", DropDownListFloor.SelectedValue);
                            sqlCmd.Parameters.AddWithValue("@Condition", DropDownListFCondition.SelectedValue);
                            sqlCmd.Parameters.AddWithValue("@Copies", TextBoxCopies.Text);
                            sqlCmd.Parameters.AddWithValue("@Originals", TextBoxOriginals.Text);
                            sqlCmd.Parameters.AddWithValue("@Total", TextBoxTotal.Text);
                            sqlCmd.Parameters.AddWithValue("@Description", ListBoxDescription.Text);
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
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Key Number not found, please enter valid Key Number')", true);
                }
            }
            else
            {

            }
               }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("KeyList.aspx");
        }
        protected void TextBoxkeyNum_TextChanged(object sender, EventArgs e)
        {
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                string query = "SELECT * FROM Keys where KeyNumber = '" + TextBoxkeyNum.Text + "'";
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter(query, sqlCon);
                sqlDa.Fill(datTbl);
            }
            if (datTbl.Rows.Count > 0)
            {
                KeyNumberMsg.Text = "";
            }
            else
            {
                KeyNumberMsg.Text = "*Key Number not found, please enter valid Key Number";
            }
        }
    }
}