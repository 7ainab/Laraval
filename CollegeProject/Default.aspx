<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CollegeProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h2>College of Computer Science & Informaiton Technology</h2>
       </div>

    <div class="row">
        
        <div class="col-md-4">
            <a runat="server" href="~/FacultyList"><img src="images/FacultyList.png" style="width:150px" />
            <h3>Faculty List</h3></a>
        </div>
        <div class="col-md-4">
            <a runat="server" href="~/KeyList">
            <img src="images/keylist.png" style="width:150px" />
            <h3>Key List</h3>
                </a>
        </div>
        <div class="col-md-4">
            <a runat="server" href="~/RoomList">
            <img src="images/BookiList.png" style="width:150px" />
            <h3>Room List</h3>
                </a>
        </div>
    </div>
</asp:Content>
