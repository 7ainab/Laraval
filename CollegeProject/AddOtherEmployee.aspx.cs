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
    public partial class AddOtherEmployee : System.Web.UI.Page
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
                        ViewState["key"] = key;
                    }
                    else if (user.Role == "faculty")
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
        }
        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            if (LabelErrorM.Text != ""&&
            TextBoxFID.Text != ""&&
            TextBoxName.Text != ""&&
            TextBoxMobile.Text != ""&&
            TextBoxExtension.Text != ""&&
            DropDownListFSection.SelectedValue != "Select Section"&&
            TextBoxOffice.Text != ""&&
            TextBoxEmail.Text != ""&&
            DropDownListFState.SelectedValue != "Select State")
            {
                if (KeyNumberMsg.Text == "")
                {
                    try
                    {
                        using (SqlConnection sqlCon = new SqlConnection(connString))
                        {
                            sqlCon.Open();
                            string query = "INSERT INTO Faculty (FacultyID,FacultyName,MobileNumber,ExtensionNumber,Section,OfficeNumber,Email,State,IsFaculty) VALUES (@FacultyID,@FacultyName,@MobileNumber,@ExtensionNumber,@Section,@OfficeNumber,@Email,@State,@IsFaculty)";
                            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                            sqlCmd.Parameters.AddWithValue("@FacultyID", TextBoxFID.Text);
                            sqlCmd.Parameters.AddWithValue("@FacultyName", TextBoxName.Text);
                            sqlCmd.Parameters.AddWithValue("@MobileNumber", TextBoxMobile.Text);
                            sqlCmd.Parameters.AddWithValue("@ExtensionNumber", TextBoxExtension.Text);
                            sqlCmd.Parameters.AddWithValue("@Section", DropDownListFSection.SelectedValue);
                            sqlCmd.Parameters.AddWithValue("@OfficeNumber", TextBoxOffice.Text);
                            sqlCmd.Parameters.AddWithValue("@Email", TextBoxEmail.Text);
                            sqlCmd.Parameters.AddWithValue("@State", DropDownListFState.SelectedValue);
                            sqlCmd.Parameters.AddWithValue("@IsFaculty", false);

                            sqlCmd.ExecuteNonQuery();
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);

                            LabelErrorM.Text = "";
                            TextBoxFID.Text = "";
                            TextBoxName.Text = "";
                            TextBoxMobile.Text = "";
                            TextBoxExtension.Text = "";
                            DropDownListFSection.SelectedValue = "Select Section";
                            TextBoxOffice.Text = "";
                            TextBoxEmail.Text = "";
                            DropDownListFState.SelectedValue = "Select State";
                            if (ViewState["key"].ToString() != "" && ViewState["key"].ToString() != null)
                            {
                                Response.Redirect("BorrowKey.aspx?key=" + ViewState["key"].ToString());
                            }
                            else
                            {
                                Response.Redirect("KeyList.aspx");
                            }
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
                LabelErrorM.Text = "please fill all the fields";
            }
               

        }
        protected void TextBoxkeyNum_TextChanged(object sender, EventArgs e)
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
                KeyNumberMsg.Text = "*Job Number already exists";
            }
            else
            {
                KeyNumberMsg.Text = "";
            }
        }
        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            LabelErrorM.Text = "";
            TextBoxFID.Text = "";
            TextBoxName.Text = "";
            TextBoxMobile.Text = "";
            TextBoxExtension.Text = "";
            DropDownListFSection.SelectedValue = "Select Section";
            TextBoxOffice.Text = "";
            TextBoxEmail.Text = "";
            DropDownListFState.SelectedValue = "Select State";
        }
    }
}