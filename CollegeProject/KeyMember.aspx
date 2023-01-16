<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="KeyMember.aspx.cs" Inherits="CollegeProject.KeyMember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top: 25px">
        <div class="col-sm-12">
            <div class="jumbotron">
        <h2>Key Members</h2>
       </div>
            <br />
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridViewList" CssClass="table" Width="100%" runat="server" AutoGenerateColumns="False" DataKeyNames="ID,FacultyID" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                        <Columns>
                            <asp:BoundField DataField="FacultyID" HeaderText="Member ID" ReadOnly="True" SortExpression="FacultyID" />
                            <asp:BoundField DataField="FacultyName" HeaderText="Member Name" SortExpression="FacultyName" />
                            <asp:BoundField DataField="MobileNumber" HeaderText="Mobile Number" SortExpression="MobileNumber" />
                            <asp:BoundField DataField="ExtensionNumber" HeaderText="Extension Number" SortExpression="ExtensionNumber" />
                            <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
                            <asp:BoundField DataField="OfficeNumber" HeaderText="Office Number" SortExpression="OfficeNumber" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnViewDetail" CssClass="btn btn-link" runat="server" Text="View Details" CommandArgument='<%#Eval("ID")%>' OnClick="BtnDetailHandler" />
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
                    <!-- Modal -->
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Member Key Details</h4>
                                </div>
                                <div class="modal-body">
                                    <h6>Key Number: <asp:Label ID="lblkey" runat="server" Text="Label"></asp:Label></h6>
                                    <asp:GridView ID="GridViewKeyDetail" CssClass="table" Width="100%" runat="server" AutoGenerateColumns="False" DataKeyNames="KeyNumber" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                                        <Columns>
                                            <asp:BoundField DataField="KeyNumber" HeaderText="Key Number" ReadOnly="True" SortExpression="KeyNumber" />
                                            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                                            <asp:BoundField DataField="Floor" HeaderText="Floor" SortExpression="Floor" />
                                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                            <asp:BoundField DataField="BorrowDate" HeaderText="Borrow Date" SortExpression="BorrowDate" />
                                            <asp:BoundField DataField="IsLost" HeaderText="Lost" SortExpression="IsLost" />
                                            <asp:BoundField DataField="IsReturn" HeaderText="Return" SortExpression="IsReturn" />
                                            <asp:BoundField DataField="Condition" HeaderText="Condition" SortExpression="Condition" />
                                            
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
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>
</asp:Content>
