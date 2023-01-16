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
    public partial class EditFaculty : System.Web.UI.Page
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
                        string id = Request.QueryString["id"];
                        if (id != "" && id != null && Regex.IsMatch(id, @"^\d+$"))
                        {
                            GetFacultyById(int.Parse(id));
                        }
                        else
                        {
                                Response.Redirect("FacultyList.aspx");
                        }
                    }
                    else if(user.Role == "key")
                    {
                        Response.Redirect("Key.aspx");
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
        private void GetFacultyById(int id)
        {
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Faculty where ID="+id, sqlCon);
                sqlDa.Fill(datTbl);
            }
            if (datTbl.Rows.Count > 0)
            {
                foreach (DataRow row in datTbl.Rows)
                {
                    hdText.Value = id.ToString();
                    TextBoxFID.Text = row["FacultyID"].ToString();
                    TextBoxName.Text = row["FacultyName"].ToString();
                    TextBoxMobile.Text = row["MobileNumber"].ToString();
                    TextBoxExtension.Text = row["ExtensionNumber"].ToString();
                    DropDownListFSection.SelectedValue = row["Section"].ToString();
                    TextBoxOffice.Text = row["OfficeNumber"].ToString();
                    TextBoxEmail.Text = row["Email"].ToString();
                    DropDownListFState.SelectedValue = row["State"].ToString();
                }

            }
            else
            {
                Response.Redirect("FacultyList.aspx");
            }
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            if (TextBoxFID.Text != "" && TextBoxName.Text != "" && TextBoxMobile.Text != "" && TextBoxExtension.Text != ""
            && DropDownListFSection.SelectedValue != "Select Section" &&
            TextBoxOffice.Text != "" &&
            TextBoxEmail.Text != "" &&
            DropDownListFState.SelectedValue != "Select State")
            {
                if (lblMemIdError.Text == "")
                {
                    try
                    {
                        using (SqlConnection sqlCon = new SqlConnection(connString))
                        {
                            sqlCon.Open();
                            string query = "UPDATE Faculty SET FacultyID = @FacultyID, FacultyName = @FacultyName,MobileNumber = @MobileNumber, ExtensionNumber = @ExtensionNumber,Section = @Section, OfficeNumber = @OfficeNumber,Email = @Email, State = @State WHERE ID=" + hdText.Value;
                            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                            sqlCmd.Parameters.AddWithValue("@FacultyID", TextBoxFID.Text);
                            sqlCmd.Parameters.AddWithValue("@FacultyName", TextBoxName.Text);
                            sqlCmd.Parameters.AddWithValue("@MobileNumber", TextBoxMobile.Text);
                            sqlCmd.Parameters.AddWithValue("@ExtensionNumber", TextBoxExtension.Text);
                            sqlCmd.Parameters.AddWithValue("@Section", DropDownListFSection.SelectedValue);
                            sqlCmd.Parameters.AddWithValue("@OfficeNumber", TextBoxOffice.Text);
                            sqlCmd.Parameters.AddWithValue("@Email", TextBoxEmail.Text);
                            sqlCmd.Parameters.AddWithValue("@State", DropDownListFState.SelectedValue);
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
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Faculty ID not found, please enter valid Faculty ID')", true);

                }
            }
            else
            {
                    LabelErrorM.Text = "please fill all the fields";
                
            }
               
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("FacultyList.aspx");
        }

        protected void TextBoxMemId_TextChanged(object sender, EventArgs e)
        {
            DataTable datTbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connString))
            {
                string query = "SELECT * FROM Faculty where FacultyID =" + TextBoxFID.Text;
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter(query, sqlCon);
                sqlDa.Fill(datTbl);
            }
            if (datTbl.Rows.Count > 0)
            {
                lblMemIdError.Text = "";
            }
            else
            {
                lblMemIdError.Text = "*Faculty not found";
            }
        }
    }
}