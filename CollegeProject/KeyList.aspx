<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="KeyList.aspx.cs" Inherits="CollegeProject.KeyList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top:15px">
        <div class="col-sm-12">
            <div class="jumbotron">
        <h2>Key List</h2>
       </div>
            <br />
            <asp:UpdatePanel runat="server">
                <ContentTemplate>

                    <div class="row">
                        <div class="col-sm-12">
                            <div id="search">
                                <table style="float:right;margin-bottom:5px;">
                                    <tr>
                                        <td><asp:Label ID="Label10" runat="server" Text="Label">Search by: </asp:Label></td>
                                        <td>
                                            <asp:DropDownList ID="Drpcolumn" class="form-control" runat="server" >
                        <asp:ListItem Value="KeyNumber">Key Number</asp:ListItem>
                        <asp:ListItem Value="Category">Category</asp:ListItem>                          
                        <asp:ListItem Value="Floor">Floor</asp:ListItem>
                        <asp:ListItem Value="Condition">Condition</asp:ListItem>
                                                <asp:ListItem Value="Copies">Copies</asp:ListItem>
                                                <asp:ListItem Value="Originals">Originals</asp:ListItem>
                                                <asp:ListItem Value="Total">Total</asp:ListItem>
                                                <asp:ListItem Value="Description">Description</asp:ListItem>

                    </asp:DropDownList></td>
                                        <td><asp:TextBox ID="TextBoxSearch" class="form-control" runat="server" TextMode="Search"></asp:TextBox></td>
    <td>
                                        <asp:ImageButton ID="ImageButtonSearch" runat="server" ImageUrl="~/images/Search.png"  Width="20px" Height="20px" OnClick="ImageButtonSearch_Click"/>
        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <asp:GridView ID="GridViewList" CssClass="table" Width="100%" runat="server" AutoGenerateColumns="False" DataKeyNames="KeyNumber" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        
                        <Columns>
                            <asp:BoundField DataField="KeyNumber" HeaderText="Key Number" ReadOnly="True" SortExpression="KeyNumber" />
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:BoundField DataField="Floor" HeaderText="Floor" SortExpression="Floor" />
            <asp:BoundField DataField="Condition" HeaderText="Condition" SortExpression="Condition" />
            <asp:BoundField DataField="Copies" HeaderText="Copies" SortExpression="Copies" />
            <asp:BoundField DataField="Originals" HeaderText="Originals" SortExpression="Originals" />
            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButtonEdit" runat="server" ImageUrl="~/images/edit.png" CommandName="Edit" CommandArgument='<%#Eval("KeyNumber")%>' ToolTip="Edit Key" Width="20px" Height="20px" OnClick="EditBtnHandler" />
                    <asp:ImageButton ID="ImageButtonDelete" runat="server" ImageUrl="~/images/Delet.png" CommandName="Delete" CommandArgument='<%#Eval("KeyNumber")%>' ToolTip="Delete Key" Width="20px" Height="20px" OnClick="DeleteBtnHandler"/>
                    <asp:ImageButton ID="ImageButtonBorrow" runat="server" ImageUrl="~/images/Bkey.png" CommandName="borrow" CommandArgument='<%#Eval("KeyNumber")%>' ToolTip="Borrow Key" Width="20px" Height="20px" OnClick="BorrowBtnHandler"/>
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
