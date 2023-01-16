<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditFaculty.aspx.cs" Inherits="CollegeProject.EditFaculty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label" BackColor="#c0c0c0" ForeColor="#ffffff" Font-Size="30px" Width="1250px">Edit Faculty</asp:Label>
    <asp:Label ID="Label2" runat="server" Text=" " BackColor="#cccccc" ForeColor="#cccccc" Font-Size="10px" Width="1250px"> .    </asp:Label>
    <br /><br />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            
            <asp:Table ID="Table1" runat="server" Height="309px" Width="434px" BackColor="">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:HiddenField ID="hdText" runat="server" />
                        <asp:Label ID="Label11" runat="server" Text="Faculty ID"></asp:Label></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="TextBoxFID" OnTextChanged="TextBoxMemId_TextChanged" AutoPostBack="true" class="form-control" runat="server"></asp:TextBox>
                            <asp:Label ID="lblMemIdError" ForeColor="Red" runat="server" Text=""></asp:Label>
                        
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorID" runat="server" ControlToValidate="TextBoxFID" ErrorMessage="Missing ID." Text="*" ToolTip="Missing ID." ValidationGroup="AddFaculty"></asp:RequiredFieldValidator></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label12" runat="server" Text="Faculty Name"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBoxName"  class="form-control" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxName" ErrorMessage="Missing Name." Text="*" ToolTip="Missing Name." ValidationGroup="AddFaculty"></asp:RequiredFieldValidator>

                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label13" runat="server" Text="Mobile Number"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBoxMobile"  class="form-control" runat="server"></asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label14" runat="server" Text="Extension Number"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBoxExtension"  class="form-control" runat="server"></asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label15" runat="server" Text="Section"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownListFSection" class="form-control" runat="server" >
                        <asp:ListItem>Select Section</asp:ListItem>
                        <asp:ListItem>Computer Science</asp:ListItem>                          
                        <asp:ListItem>Information system</asp:ListItem>
                        <asp:ListItem>Network</asp:ListItem>
                    </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="DropDownListFSection" ErrorMessage="Plese Select Section." Text="*" ToolTip="Plese Select Section." ValidationGroup="AddFaculty"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label16" runat="server" Text="Office Number"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBoxOffice" class="form-control" runat="server"></asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label17" runat="server" Text="Email"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBoxEmail" class="form-control" runat="server"></asp:TextBox>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBoxEmail" runat="server" ErrorMessage="Invalid Email Address" Text="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label18"  runat="server" Text="State"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList class="form-control" ID="DropDownListFState" runat="server" >
                        <asp:ListItem>Select State</asp:ListItem>
                        <asp:ListItem>On Duty</asp:ListItem>                          
                        <asp:ListItem>On Vacation</asp:ListItem>
                        <asp:ListItem>Scholarship</asp:ListItem>
                        <asp:ListItem>  </asp:ListItem>
                         </asp:DropDownList>   
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <br /><br /><br />
            <div id="Button">
                <asp:Button ID="ButtonUpdate" runat="server" Text="Update"  CommandName="update" OnClick="ButtonUpdate_Click"/>
                <asp:Button ID="ButtonCancel" runat="server" Text="Go Back" OnClick="ButtonCancel_Click"/>
            </div>
    <br />
    <asp:Label ID="LabelErrorM" runat="server" Text="" ForeColor="Red"/>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
           
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
