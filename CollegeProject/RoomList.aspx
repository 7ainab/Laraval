<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoomList.aspx.cs" Inherits="CollegeProject.RoomList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top: 15px">
        <div class="col-sm-12">
            <div class="jumbotron">
        <h2>Room List</h2>
       </div>
            <br />
            <asp:UpdatePanel runat="server">
                <ContentTemplate>

                    <div class="row">
                        <div class="col-sm-12">
                            <div id="search">
                                <table style="float: right; margin-bottom: 5px;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label10" runat="server" Text="Label">Search By: </asp:Label></td>
                                         <td>
                                            <asp:DropDownList ID="Drpcolumn" class="form-control" runat="server" >
                        <asp:ListItem Value="RoomID">Room ID</asp:ListItem>
                        <asp:ListItem Value="RoomNumber">Room Number</asp:ListItem>                          
                        <asp:ListItem Value="NumberOfSeats">Capacity</asp:ListItem>
                        <asp:ListItem Value="LightingStatus">Lighting Status</asp:ListItem>
                                                <asp:ListItem Value="AirConditioning">Air Conditioning</asp:ListItem>
                                                <asp:ListItem Value="Floor">Floor</asp:ListItem>
                                                <asp:ListItem Value="Equipment">Equipment</asp:ListItem>


                    </asp:DropDownList></td>
                                        
                                        <td>
                                            <asp:TextBox ID="TextBoxSearch" class="form-control" runat="server" TextMode="Search"></asp:TextBox></td>
                                        <td>
                                            <asp:ImageButton ID="ImageButtonSearch" runat="server" ImageUrl="~/images/Search.png" Width="20px" Height="20px" OnClick="ImageButtonSearch_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                    <asp:GridView ID="GridViewList" CssClass="table" Width="100%" runat="server" AutoGenerateColumns="False" DataKeyNames="RoomID" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                        <Columns>
                            <asp:BoundField DataField="RoomID" HeaderText="Room ID" ReadOnly="True" SortExpression="KeyNumber" />
                            <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" SortExpression="RoomNumber" />
                            <asp:BoundField DataField="NumberOfSeats" HeaderText="Capacity" SortExpression="NumberOfSeats" />
                            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                            <asp:TemplateField>
                                <ItemTemplate>

                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("AvailableTime") != DBNull.Value?DateTime.Parse(Eval("AvailableTime").ToString(), System.Globalization.CultureInfo.CurrentCulture).ToString("hh:mm tt"):Eval("AvailableTime")%>'></asp:Label>
                                    
                                </ItemTemplate>
                                <HeaderTemplate>
                                    Available Time
                                </HeaderTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("AvailableDate") !=  DBNull.Value? Convert.ToDateTime(Eval("AvailableDate")).ToString("MM/dd/yyyy"):Eval("AvailableDate")%>'></asp:Label>
                                    
                                </ItemTemplate>
                                <HeaderTemplate>
                                    Date
                                </HeaderTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="LightingStatus" HeaderText="Lighting Status" SortExpression="LightingStatus" />
                            <asp:BoundField DataField="AirConditioning" HeaderText="Air Conditioning" SortExpression="AirConditioning" />
                            <asp:BoundField DataField="Floor" HeaderText="Floor" SortExpression="Floor" />
                            <asp:BoundField DataField="Equipment" HeaderText="Equipment" SortExpression="Equipment" />
                            <asp:TemplateField>
                                <ItemTemplate>

                                    <asp:ImageButton ID="ImageButtonEdit" runat="server" ImageUrl="~/images/addbooking.png" CommandName="Add Booking" CommandArgument='<%#Eval("RoomID")%>' ToolTip="Create Booking" Width="20px" Height="20px" OnClick="BookBtnHandler" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>

                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>
</asp:Content>
