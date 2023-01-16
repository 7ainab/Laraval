<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Faculty.aspx.cs" Inherits="CollegeProject.Faculty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="jumbotron">
        <h2>Faculty</h2>
       </div>

    <div class="row">
        
        <div class="col-md-6">
            <a runat="server" href="~/FacultyList"><img src="images/FacultyList.png" style="width:150px" />
            <h3>Faculty List</h3></a>
        </div>
        <div class="col-md-6">
            <a runat="server" href="~/AddFaculty">
            <img src="images/AddFaculty.png" style="width:150px" />
            <h3>Add Faculty</h3>
                </a>
        </div>
    </div>
</asp:Content>
