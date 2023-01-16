<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="CollegeProject.Booking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>Booking</h2>
       </div>

    <div class="row">
        
        <div class="col-md-4">
            <a runat="server" href="~/RoomList"><img src="images/room.png" style="width:150px" />
            <h3>Rooms List</h3></a>
        </div>
        <div class="col-md-4">
            <a runat="server" href="~/BookingList">
            <img src="images/BookiList.png" style="width:150px" />
            <h3>Booking List</h3>
                </a>
        </div>
        <div class="col-md-4">
            <a runat="server" href="~/AddBooking">
            <img src="images/addbooking.png" style="width:150px" />
            <h3>Create Booking</h3>
                </a>
        </div>
    </div>
</asp:Content>
