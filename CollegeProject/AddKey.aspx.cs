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
    public partial class AddKey : System.Web.UI.Page
    {
        private string connString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                Users user = (Users)Session["User"];
                if (user.Role == "faculty")
                {
                    Response.Redirect("Faculty.aspx");
                }
                else if (user.Role == "booking")
                {
                    Response.Redirect("Booking.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            if(TextBoxkeyNum.Text != ""&&
            DropDownListCategory.SelectedValue != "Select Category"&&
            DropDownListFloor.SelectedValue != "Select Floor"&&
            DropDownListFCondition.SelectedValue != "Select Condition"&&
            TextBoxCopies.Text != ""&&
            TextBoxOriginals.Text != ""&&
            TextBoxTotal.Text != ""&&
            ListBoxDescription.Text != ""){
                if (KeyNumberMsg.Text == "")
                {
                    try
                    {
                        using (SqlConnection sqlCon = new SqlConnection(connString))
                        {
                            sqlCon.Open();
                            string query = "INSERT INTO Keys (KeyNumber,Category,Floor,Condition,Copies,Originals,Total,Description) VALUES (@KeyNumber,@Category ,@Floor,@Condition,@Copies,@Originals,@Total,@Description)";
                            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                            sqlCmd.Parameters.AddWithValue("@KeyNumber", TextBoxkeyNum.Text);
                            sqlCmd.Parameters.AddWithValue("@Category ", DropDownListCategory.SelectedValue);
                            sqlCmd.Parameters.AddWithValue("@Floor", DropDownListFloor.SelectedValue);
                            sqlCmd.Parameters.AddWithValue("@Condition", DropDownListFCondition.SelectedValue);
                            sqlCmd.Parameters.AddWithValue("@Copies", TextBoxCopies.Text);
                            sqlCmd.Parameters.AddWithValue("@Originals", TextBoxOriginals.Text);
                            sqlCmd.Parameters.AddWithValue("@Total", TextBoxTotal.Text);
                            sqlCmd.Parameters.AddWithValue("@Description", ListBoxDescription.Text);
                            sqlCmd.ExecuteNonQuery();
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
                            LabelErrorM.Text = "";
                            TextBoxkeyNum.Text = "";
                            DropDownListCategory.SelectedValue = "Select Category";
                            DropDownListFloor.SelectedValue = "Select Floor";
                            DropDownListFCondition.SelectedValue = "Select Condition";
                            TextBoxCopies.Text = "";
                            TextBoxOriginals.Text = "";
                            TextBoxTotal.Text = "";
                            ListBoxDescription.Text = "";
                        }
                    }
                    catch (Exception ex)
                    {
                        LabelErrorM.Text = ex.Message;
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Key Number already exists, please try another one')", true);
                }
            }
            else
            {
                LabelErrorM.Text = "*please fill all the fields";
            }
           
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            LabelErrorM.Text = "";
            TextBoxkeyNum.Text = "";
            DropDownListCategory.SelectedValue = "Select Category";
            DropDownListFloor.SelectedValue = "Select Floor";
            DropDownListFCondition.SelectedValue = "Select Condition";
            TextBoxCopies.Text = "";
            TextBoxOriginals.Text = "";
            TextBoxTotal.Text = "";
            ListBoxDescription.Text = "";
        }

        protected void TextBoxkeyNum_TextChanged(object sender, EventArgs e)
        {
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                string query= "SELECT * FROM Keys where KeyNumber = '" + TextBoxkeyNum.Text+"'";
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter(query, sqlCon);
                sqlDa.Fill(datTbl);
            }
            if (datTbl.Rows.Count > 0)
            {
                KeyNumberMsg.Text = "*Key Number already exists, please try another one";
            }
            else
            {
                KeyNumberMsg.Text = "";
            }
            }
    }
}