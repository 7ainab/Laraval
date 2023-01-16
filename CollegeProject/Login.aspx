<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CollegeProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - College of Computer Science & Informaiton Technology</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <div class="container body-content">
        <div class="row" style="margin-top: 30px;">
            
            <div class="col-md-3">
            </div>
            <div class="col-md-6">
                <div class="row">
                    <div class="col-sm-4">
                    </div>
                    <div class="col-sm-4">
                        <img src="images/CCSITlogo.png" />
                    </div>
                    <div class="col-sm-4">
                    </div>
                </div>
                <form id="form1" runat="server">
                    <div class="panel panel-default">
                        <div class="panel-heading">Login</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-12" style="margin-bottom:5px;">
                                    <asp:Label ID="lblmsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:Label ID="lblUsername" runat="server" Text="Username: "></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox class="form-control" ID="txtUsername" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-sm-12" style="margin-top:5px;">
                                </div>
                                <div class="col-sm-4">
                                    <asp:Label ID="lblPassword" runat="server" Text="Password: "></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox class="form-control" TextMode="Password" ID="txtPassword" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-sm-12">
                                    <asp:Button ID="btnLogin" CssClass="btn btn-primary" style="float: right; margin-top: 10px;" runat="server" Text="Login" OnClick="btnLogin_Click" />
                                <a runat="server" href="~/" class="btn btn-info" style="float: right; margin-top: 10px;margin-right:10px;">Go To Home</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-3">
            </div>
        </div>

        <footer>
            <p style="text-align:center; background-color: #000000; color: #FFFFFF;">&copy; <%: DateTime.Now.Year %> - College of Computer Science & Informaiton Technology</p>
        </footer>
    </div>
</body>
</html>
