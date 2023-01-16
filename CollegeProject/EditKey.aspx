<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditKey.aspx.cs" Inherits="CollegeProject.EditKey" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <asp:Label ID="Label1" runat="server" Text="Label" BackColor="#c0c0c0" ForeColor="#ffffff" Font-Size="30px" Width="1250px">Update Key</asp:Label>
    <asp:Label ID="Label2" runat="server" Text=" " BackColor="#cccccc" ForeColor="#cccccc" Font-Size="10px" Width="1250px"> .    </asp:Label>
    <br /><br />

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            
            <asp:Table ID="Table1" runat="server" Height="309px" Width="434px" BackColor="">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label11" runat="server" Text="Key Number"></asp:Label></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="TextBoxkeyNum" ReadOnly="true" class="form-control" OnTextChanged="TextBoxkeyNum_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox><asp:Label ID="KeyNumberMsg" ForeColor="Red" runat="server" Text=""></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorkeyNum" runat="server" ControlToValidate="TextBoxkeyNum" ErrorMessage="Missing key Number" Text="*"></asp:RequiredFieldValidator></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label12" runat="server" Text="Category"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownListCategory" class="form-control" runat="server" >
                        <asp:ListItem>Select Category</asp:ListItem>
                        <asp:ListItem>Library</asp:ListItem>                          
                        <asp:ListItem>Classroom</asp:ListItem>
                        <asp:ListItem>Lab</asp:ListItem>
                        <asp:ListItem>Student Club</asp:ListItem>
                        <asp:ListItem>Audio & Video</asp:ListItem>
                        <asp:ListItem>Meeting Room</asp:ListItem>
                        <asp:ListItem>Office</asp:ListItem>
                        <asp:ListItem>Bathroom</asp:ListItem>
                        <asp:ListItem>Student Activity</asp:ListItem>
                        <asp:ListItem>Storage</asp:ListItem>
                        <asp:ListItem>Browsing Area</asp:ListItem>
                        <asp:ListItem>Auditorium</asp:ListItem>
                        <asp:ListItem>Library</asp:ListItem>
                    </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="DropDownListCategory" ErrorMessage="Plese Select Category" Text="*"></asp:RequiredFieldValidator>
                    
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label13" runat="server" Text="Floor"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                      <asp:DropDownList ID="DropDownListFloor" class="form-control" runat="server" >
                        <asp:ListItem>Select Floor</asp:ListItem>
                        <asp:ListItem>Ground</asp:ListItem>                          
                        <asp:ListItem>First</asp:ListItem>
                        <asp:ListItem>Second</asp:ListItem>
                    </asp:DropDownList>
                        </asp:TableCell>            
                        </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label14" runat="server" Text="Description"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="ListBoxDescription" class="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                        </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label15" runat="server" Text="Condition"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList class="form-control" ID="DropDownListFCondition" runat="server" >
                        <asp:ListItem>Select Condition</asp:ListItem>
                        <asp:ListItem>Good</asp:ListItem>                          
                        <asp:ListItem>Satisfactory</asp:ListItem>
                        <asp:ListItem>Bad</asp:ListItem>
                    </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                  <asp:TableRow>
                         <asp:TableCell>
                               <asp:Label ID="Label17" runat="server" Text="Copies"></asp:Label></asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="TextBoxCopies" class="form-control" runat="server"></asp:TextBox>
                                         <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxCopies" ErrorMessage="Plese Add Number of copies keys" Text="*"></asp:RequiredFieldValidator>

                                    </asp:TableCell>
                                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label16" runat="server" Text="Originals"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBoxOriginals" class="form-control" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBoxOriginals" ErrorMessage="Plese Add Number of Originals keys" Text="*"></asp:RequiredFieldValidator>

                    </asp:TableCell>

                </asp:TableRow>

              
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label3" runat="server" Text="Total"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBoxTotal" class="form-control" runat="server"></asp:TextBox>

                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>

            <br /><br /><br />
            <div id="Button">
                <asp:Button ID="ButtonUpdate" runat="server" Text="Update"  CommandName="AddUpdate" OnClick="ButtonUpdate_Click"/>
                <asp:Button ID="ButtonCancel" runat="server" Text="Go Back" OnClick="ButtonCancel_Click"  />
            </div>

            <br />
    <asp:Label ID="LabelErrorM" runat="server" Text="" ForeColor="Red"/>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
           
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

