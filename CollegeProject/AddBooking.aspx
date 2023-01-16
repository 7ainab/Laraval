<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddBooking.aspx.cs" Inherits="CollegeProject.AddBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">       
    <asp:Label ID="Label1" runat="server" Text="Label" BackColor="#c0c0c0" ForeColor="#ffffff" Font-Size="30px" Width="1250px">Add New Booking</asp:Label>
    <asp:Label ID="Label2" runat="server" Text=" " BackColor="#cccccc" ForeColor="#cccccc" Font-Size="10px" Width="1250px"> .    </asp:Label>
    <br /><br />

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            
            <asp:Table ID="Table1" runat="server" Height="309px" Width="434px" BackColor="">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label14" runat="server" Text="Room Number:"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox class="form-control" ReadOnly="true" ID="txtRoomNum"  OnTextChanged="TextBoxRoomNum_TextChanged" AutoPostBack="true" runat="server" Text=""></asp:TextBox>
                        <asp:Label ID="lblRoomNumberError" ForeColor="Red" runat="server" Text=""></asp:Label>
                        <asp:Label ID="lblRoomNumberSuccess" ForeColor="Green" runat="server" Text=""></asp:Label>
                        <asp:HiddenField ID="hdRoomId" runat="server" />
                         </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="BookingDate" runat="server" Text="Date:"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Calendar ID="Calinput" runat="server"></asp:Calendar>

                        </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="BookingTime" runat="server" Text="Time:"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="drptime" runat="server">
                            <asp:ListItem>Select Time</asp:ListItem>
                            <asp:ListItem>8:00 AM - 10:00 AM</asp:ListItem>
                            <asp:ListItem>10:30 AM - 12:30 PM</asp:ListItem>
                            <asp:ListItem>1:00 PM - 3:00 PM</asp:ListItem>
                            <asp:ListItem>3:30 PM - 5:30 PM</asp:ListItem>
                        </asp:DropDownList>
                        </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label11" runat="server" Text="Member ID:"></asp:Label></asp:TableCell>
                        <asp:TableCell>
                            <asp:HiddenField ID="hdFid" runat="server" />
                            <asp:TextBox ID="txtMemId" class="form-control" OnTextChanged="TextBoxkeyNum_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox><asp:Label ID="lblMsg" ForeColor="Green" runat="server" Text=""></asp:Label>
                            <asp:Label ID="lblError" ForeColor="Red" runat="server" Text=""></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorkeyNum" runat="server" ControlToValidate="txtMemId" ErrorMessage="Missing Member ID" Text="*"></asp:RequiredFieldValidator></asp:TableCell>
                </asp:TableRow>
                

            </asp:Table>

            <br /><br /><br />
            <div id="Button">
                <asp:Button ID="ButtonAdd" runat="server" Text="+ Add"  CommandName="AddNew" OnClick="ButtonAdd_Click"/>
                
            </div>

            <br />
    <asp:Label ID="LabelErrorM" runat="server" Text="" ForeColor="Red"/>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
           
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>