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
    public partial class BorrowKey : System.Web.UI.Page
    {
        private string connString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        private string key = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User"] != null)
                {
                    Users user = (Users)Session["User"];
                    if (user.Role == "key")
                    {
                        key = Request.QueryString["key"];
                        if (key != "" && key!=null)
                        {
                            KeyNumberLbl.Text=key;
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
        void GetFacultyById(int id,bool isF)
        {
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Faculty WHERE IsFaculty='"+ isF + "' and FacultyID="+id, sqlCon);
                sqlDa.Fill(datTbl);
            }
            if (datTbl.Rows.Count > 0)
            {
                lblFEMsg.Text = "";
                lblFSMsg.Text = drpMember.SelectedValue+" is available";
                var row = datTbl.Rows[0];
                hdFID.Value = row["ID"].ToString();
            }
            else
            {
                lblFEMsg.Text = drpMember.SelectedValue + " is not available";
                lblFSMsg.Text = "";
            }
        }
        protected void ButtonRedirect_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddOtherEmployee.aspx?key="+ KeyNumberLbl.Text);
        }
            protected void ImageButtonSearch_Click(object sender, ImageClickEventArgs e)
        {
            if (drpMember.SelectedValue == "Faculty")
            {
                if (TextBoxSearch.Text != null && TextBoxSearch.Text != "")
                {
                    GetFacultyById(int.Parse(TextBoxSearch.Text),true);
                }
            }
            if(drpMember.SelectedValue == "Other Employee")
            {
                if (TextBoxSearch.Text != null && TextBoxSearch.Text != "")
                {
                    GetFacultyById(int.Parse(TextBoxSearch.Text),false);
                }
            }
            
        }
        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                string query = "SELECT * FROM BorrowKey where KeyID = '" + KeyNumberLbl.Text + "' and FID="+ hdFID.Value;
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter(query, sqlCon);
                sqlDa.Fill(datTbl);
            }
            if (datTbl.Rows.Count > 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('The member is already assigned with the same key')", true);
            }
            else
            {
                if(DropDownListCondition.SelectedValue != "Select Condition"&&
                TextBoxSearch.Text!= ""){
                    string date = Calinput.SelectedDate.ToString("yyyy-MM-dd");
                    if (lblFSMsg.Text != "")
                    {
                        try
                        {
                            using (SqlConnection sqlCon = new SqlConnection(connString))
                            {
                                sqlCon.Open();
                                string query = "INSERT INTO BorrowKey (IsLost,IsReturn,Condition,FID,KeyID,BorrowDate) VALUES (@IsLost,@IsReturn ,@Condition,@FID,@KeyID,@BorrowDate)";
                                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                                sqlCmd.Parameters.AddWithValue("@IsLost", CheckBoxLost.Checked);
                                sqlCmd.Parameters.AddWithValue("@IsReturn ", CheckBoxReturned.Checked);
                                sqlCmd.Parameters.AddWithValue("@Condition", DropDownListCondition.SelectedValue);
                                sqlCmd.Parameters.AddWithValue("@FID", hdFID.Value);
                                sqlCmd.Parameters.AddWithValue("@KeyID", KeyNumberLbl.Text);
                                sqlCmd.Parameters.AddWithValue("@BorrowDate", date);

                                sqlCmd.ExecuteNonQuery();
                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
                                CheckBoxLost.Checked = false;
                                CheckBoxReturned.Checked = false;
                                Calinput.SelectedDate = DateTime.Now;
                                DropDownListCondition.SelectedValue = "Select Condition";
                                TextBoxSearch.Text = "";
                                LabelErrorM.Text = "";
                            }
                        }
                        catch (Exception ex)
                        {
                            LabelErrorM.Text = ex.Message;
                        }
                    }
                }
                else
                {
                    LabelErrorM.Text = "fill all fields";
                }
               
            }
            
            
        }

            protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            CheckBoxLost.Checked = false;
            CheckBoxReturned.Checked = false;
            Calinput.SelectedDate = DateTime.Now;
            DropDownListCondition.SelectedValue = "Select Condition";
            TextBoxSearch.Text = "";
            LabelErrorM.Text = "";
        }
    }
}