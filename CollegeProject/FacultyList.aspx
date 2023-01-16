<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FacultyList.aspx.cs" Inherits="CollegeProject.FacultyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top:15px">
        <div class="col-sm-12">
            <div class="jumbotron">
        <h2>Faculty List</h2>
       </div>
            <br />
            <asp:UpdatePanel runat="server">
                <ContentTemplate>

                    <div class="row">
                        <div class="col-sm-12">
                            <div id="search">
                                <table style="float:right;margin-bottom:5px;">
                                    <tr>
                                        <td><asp:Label ID="Label10" runat="server" Text="Label">Search By:</asp:Label></td>
                                        <td>
                                            <asp:DropDownList ID="Drpcolumn" class="form-control" runat="server" >
                        <asp:ListItem Value="ID">ID</asp:ListItem>
                        <asp:ListItem Value="FacultyID">Faculty ID</asp:ListItem>                          
                        <asp:ListItem Value="FacultyName">Faculty Name</asp:ListItem>
                        <asp:ListItem Value="MobileNumber">Mobile Number</asp:ListItem>
                                                <asp:ListItem Value="ExtensionNumber">Extension Number</asp:ListItem>
                                                <asp:ListItem Value="Section">Section</asp:ListItem>
                                                <asp:ListItem Value="OfficeNumber">Office Number</asp:ListItem>
                                                <asp:ListItem Value="MobileNumber">Mobile Number</asp:ListItem>
                                                <asp:ListItem Value="Email">Email</asp:ListItem>
                                                <asp:ListItem Value="State">State</asp:ListItem>

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
                    
                    <asp:GridView ID="GridViewList" CssClass="table" Width="100%" runat="server" AutoGenerateColumns="False" DataKeyNames="ID,FacultyID" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="FacultyID" HeaderText="Faculty ID" ReadOnly="True" SortExpression="FacultyID" />
                            <asp:BoundField DataField="FacultyName" HeaderText="Faculty Name" SortExpression="FacultyName" />
                            <asp:BoundField DataField="MobileNumber" HeaderText="Mobile Number" SortExpression="MobileNumber" />
                            <asp:BoundField DataField="ExtensionNumber" HeaderText="Extension Number" SortExpression="ExtensionNumber" />
                            <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
                            <asp:BoundField DataField="OfficeNumber" HeaderText="Office Number" SortExpression="OfficeNumber" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                           
                            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButtonEdit" runat="server" ImageUrl="~/images/edit.png" CommandName="Edit" CommandArgument='<%#Eval("ID")%>' ToolTip="Edit" Width="20px" Height="20px" OnClick="EditBtnHandler" />
                    <asp:ImageButton ID="ImageButtonDelete" runat="server" ImageUrl="~/images/Delet.png" CommandName="Delete" CommandArgument='<%#Eval("ID")%>' ToolTip="Delete" Width="20px" Height="20px" OnClick="DeleteBtnHandler"/>
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
