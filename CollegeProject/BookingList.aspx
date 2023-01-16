<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingList.aspx.cs" Inherits="CollegeProject.BookingList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top: 15px">
        <div class="col-sm-12">
            <br />
            <div class="jumbotron">
        <h2>Booking List</h2>
       </div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-sm-12">
                            <div id="search">
                                <table style="float:right;margin-bottom:5px;">
                                    <tr>
                                        <td><asp:Label ID="Label10" runat="server" Text="Label">Search By: </asp:Label></td>
                                        <td><asp:TextBox ID="TextBoxSearch" class="form-control" runat="server" TextMode="Search"></asp:TextBox></td>
    <td>
                                        <asp:ImageButton ID="ImageButtonSearch" runat="server" ImageUrl="~/images/Search.png"  Width="20px" Height="20px" OnClick="ImageButtonSearch_Click"/>
        </td>                            <asp:Label ID="LabelErrorM" ForeColor="Red" runat="server" Text=""></asp:Label>

                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <asp:GridView ID="GridViewList" CssClass="table" Width="100%" runat="server" AutoGenerateColumns="False" DataKeyNames="BkID" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                        <Columns>
                            <asp:BoundField DataField="BkID" HeaderText="Booking ID" ReadOnly="True" SortExpression="BkID" />
                            <asp:BoundField DataField="FacultyID" HeaderText="Faculty ID" ReadOnly="True" SortExpression="FacultyID" />
                            <asp:BoundField DataField="FacultyName" HeaderText="Faculty Name" SortExpression="FacultyName" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            
                           
                            <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" SortExpression="RoomNumber" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("BDate") !=  DBNull.Value? Convert.ToDateTime(Eval("BDate")).ToString("MM/dd/yyyy"):Eval("BDate")%>'></asp:Label>
                                    
                                </ItemTemplate>
                                <HeaderTemplate>
                                    Date
                                </HeaderTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="BTime" HeaderText="BTime" SortExpression="BTime" />

                            <asp:BoundField DataField="Floor" HeaderText="Floor" SortExpression="Floor" />

                           <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/edit.png" CommandName="Edit" CommandArgument='<%#Eval("BkID")%>' ToolTip="Edit" Width="20px" Height="20px" OnClick="EditBtnHandler" />
                    <asp:ImageButton ID="ImageButtonDelete" runat="server" ImageUrl="~/images/Delet.png" CommandName="Delete" CommandArgument='<%#Eval("BkID")%>' ToolTip="Delete" Width="20px" Height="20px" OnClick="DeleteBtnHandler"/>
                
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