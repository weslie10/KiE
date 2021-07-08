<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="Project.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login KiE</title>
    <link rel="stylesheet" type="text/css" href="../../Assets/css/index.css" />
</head>
<body>
    <div class="login-container-outer">
        <div class="login-container-inner">
            <form id="loginForm" runat="server">
                <h1 style="text-align: center; margin-bottom: 10px;">
                    <asp:Label runat="server" Text="Login"></asp:Label>
                </h1>
                <hr />
                <div class="form-group">
                    <asp:Label runat="server" Text="Username" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="userTxt" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="userTxt" ErrorMessage="Harus memasukkan username" Display="Dynamic" />
                </div>
                <div class="form-group">
                    <asp:Label runat="server" Text="Password" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="passTxt" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="passTxt" ErrorMessage="Harus memasukkan password" Display="Dynamic" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-login" />
                </div>
            </form>
            <div style="text-align: center">
                <asp:Label ID="Label1" runat="server" Text="Belum Punya Akun? ">
                    <asp:HyperLink runat="server" NavigateUrl="~/Main/login/daftar.aspx">Daftar</asp:HyperLink>
                </asp:Label>
            </div>
        </div>
    </div>
</body>
</html>
