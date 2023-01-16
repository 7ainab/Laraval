<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BorrowKey.aspx.cs" Inherits="CollegeProject.BorrowKey" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label" BackColor="#c0c0c0" ForeColor="#ffffff" Font-Size="30px" Width="1250px">Borrow Key</asp:Label>
    <asp:Label ID="Label2" runat="server" Text=" " BackColor="#cccccc" ForeColor="#cccccc" Font-Size="10px" Width="1250px"> .    </asp:Label>
    <br />
    <br />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <asp:Table ID="Table1" runat="server" Height="309px" Width="500px" BackColor="">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label3" runat="server" Text="Key Number"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="KeyNumberLbl" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label11" runat="server" Text="Member"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <table style="float: right; margin-bottom: 5px;">
                            <tr>
                                <td>
                                    <asp:DropDownList ID="drpMember" class="form-control" runat="server">
                                        <asp:ListItem>Select Member</asp:ListItem>
                                        <asp:ListItem>Faculty</asp:ListItem>
                                        <asp:ListItem>Other Employee</asp:ListItem>
                                    </asp:DropDownList></td>
                                <td>
                                    <asp:TextBox ID="TextBoxSearch" class="form-control" runat="server" TextMode="Search"></asp:TextBox></td>
                                <td>
                                    <asp:ImageButton ID="ImageButtonSearch" runat="server" ImageUrl="~/images/Search.png" Width="20px" Height="20px" OnClick="ImageButtonSearch_Click" AutoPostback="false" />
                                </td>
                                </tr>
                        </table>
                        <asp:HiddenField ID="hdFID" runat="server" />
                         <asp:Label ID="lblFEMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lblFSMsg" runat="server" Text="" ForeColor="Green"></asp:Label>
                    <br />
                        <asp:Button ID="Button1" CssClass="btn btn-link" OnClick="ButtonRedirect_Click" runat="server" Text="Add Other Employee" />
                        
                       </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label15" runat="server" Text="Condition"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownListCondition" class="form-control" runat="server">
                            <asp:ListItem>Select Condition</asp:ListItem>
                            <asp:ListItem>Good</asp:ListItem>
                            <asp:ListItem>Bad</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="DropDownListCondition" ErrorMessage="Plese Select Section." Text="*" ToolTip="Plese Select Section." ValidationGroup="AddFaculty"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lbl" runat="server" Text="Borrow Date"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Calendar ID="Calinput" runat="server"></asp:Calendar>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label16" runat="server" Text="Lost"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>

                        <asp:CheckBox ID="CheckBoxLost" runat="server" />
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label17" runat="server" Text="Returned"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:CheckBox ID="CheckBoxReturned" runat="server" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <br />
            <br />
            <br />
            <div id="Button">
                <asp:Button ID="ButtonAdd" runat="server" Text="Borrow" CommandName="add" OnClick="ButtonAdd_Click"/>
                <asp:Button ID="ButtonCancel" runat="server" Text="Cancel"  OnClick="ButtonCancel_Click" />
            </div>


            <br />
            <asp:Label ID="LabelErrorM" runat="server" Text="" ForeColor="Red" />
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
