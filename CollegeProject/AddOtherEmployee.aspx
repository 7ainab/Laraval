<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddOtherEmployee.aspx.cs" Inherits="CollegeProject.AddOtherEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label" BackColor="#c0c0c0" ForeColor="#ffffff" Font-Size="30px" Width="1250px">Add Other Employee</asp:Label>
    <asp:Label ID="Label2" runat="server" Text=" " BackColor="#cccccc" ForeColor="#cccccc" Font-Size="10px" Width="1250px"> .    </asp:Label>
    <br /><br />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            
            <asp:Table ID="Table2" runat="server" Height="309px" Width="434px" BackColor="">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="Label4" runat="server" Text="Job Number"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="TextBoxFID" class="form-control" OnTextChanged="TextBoxkeyNum_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox><asp:Label ID="KeyNumberMsg" ForeColor="Red" runat="server" Text=""></asp:Label>
                                        
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorID" runat="server" ControlToValidate="TextBoxFID" ErrorMessage="Missing ID." Text="*" ToolTip="Missing ID." ValidationGroup="AddFaculty"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>

                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="Label12" runat="server" Text="Name"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="TextBoxName" class="form-control" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxName" ErrorMessage="Missing Name." Text="*" ToolTip="Missing Name." ValidationGroup="AddFaculty"></asp:RequiredFieldValidator>

                                    </asp:TableCell>
                                </asp:TableRow>

                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="Label13" runat="server" Text="Mobile Number"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="TextBoxMobile" class="form-control" runat="server"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>

                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="Label14" runat="server" Text="Extension Number"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="TextBoxExtension" class="form-control" runat="server"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>

                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="Label5" runat="server" Text="Department"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList ID="DropDownListFSection" class="form-control" runat="server">
                                            <asp:ListItem>Select Department</asp:ListItem>
                                            <asp:ListItem>Computer Science</asp:ListItem>
                                            <asp:ListItem>Information system</asp:ListItem>
                                            <asp:ListItem>Network</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="DropDownListFSection" ErrorMessage="Plese Select Section." Text="*" ToolTip="Plese Select Section." ValidationGroup="AddFaculty"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>

                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="Label6" runat="server" Text="Office Number"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="TextBoxOffice" class="form-control" runat="server"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>

                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="Label7" runat="server" Text="Email"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="TextBoxEmail" class="form-control" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBoxEmail" runat="server" ErrorMessage="Invalid Email Address" Text="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                                    </asp:TableCell>
                                </asp:TableRow>

                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="Label18" runat="server" Text="Status"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:DropDownList class="form-control" ID="DropDownListFState" runat="server">
                                            <asp:ListItem>Select Status</asp:ListItem>
                                            <asp:ListItem>On Duty</asp:ListItem>
                                            <asp:ListItem>On Vacation</asp:ListItem>
                                            <asp:ListItem>Scholarship</asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>

            <br /><br /><br />
            <div id="Button">
                <asp:Button ID="ButtonAdd" runat="server" Text="+ Add"  CommandName="add" OnClick="ButtonAdd_Click"/>
                <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" OnClick="ButtonCancel_Click"/>
            </div>

            
    <br />
    <asp:Label ID="LabelErrorM" runat="server" Text="" ForeColor="Red"/>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
           
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
