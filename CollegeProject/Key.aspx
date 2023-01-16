<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Key.aspx.cs" Inherits="CollegeProject.Key" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>Key</h2>
       </div>

    <div class="row">
        
        <div class="col-md-4">
            <a runat="server" href="~/KeyList"><img src="images/keylist.png" style="width:150px" />
            <h3>Key List</h3></a>
        </div>
        <div class="col-md-4">
            <a runat="server" href="~/AddKey">
            <img src="images/addKey.jpg" style="width:150px" />
            <h3>Add Key</h3>
                </a>
        </div>
        <div class="col-md-4">
            <a runat="server" href="~/KeyMember">
            <img src="images/Bkey.png" style="width:150px" />
            <h3>Key Member</h3>
                </a>
        </div>
    </div>
</asp:Content>
