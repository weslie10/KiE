<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="daftar.aspx.vb" Inherits="Project.daftar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Daftar KiE</title>
    <link rel="stylesheet" type="text/css" href="../../Assets/css/index.css" />
</head>
<body>
    <label id="label" runat="server"></label>
    <div class="daftar-container-outer">
        <div class="daftar-container-inner">
            <form id="daftarForm" runat="server">
                <h1 style="text-align: center; margin-bottom: 10px;">
                    <asp:Label runat="server" Text="Daftar"></asp:Label>
                </h1>
                <div class="col-2">
                    <div>
                        <div class="form-group">
                            <asp:Label runat="server" Text="Username" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="userTxt" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="userTxt" ErrorMessage="Harus memasukkan username" Display="Dynamic" />
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" Text="Nama Lengkap" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="namaTxt" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="namaTxt" ErrorMessage="Harus memasukkan nama lengkap" Display="Dynamic" />
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" Text="Email" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="emailTxt" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="emailTxt" ErrorMessage="Harus memasukkan email" Display="Dynamic" />
                            <asp:RegularExpressionValidator class="RegularExpressionValidator" runat="server" ControlToValidate="emailTxt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Masukkan email yang valid" Display="Dynamic" />
                        </div>
                    </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
                    <div>
                        <div class="form-group">
                            <asp:Label runat="server" Text="Nomor Handphone" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="NoTxt" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="NoTxt" ErrorMessage="Harus memasukkan nomor hp" Display="Dynamic" />
                            <asp:RegularExpressionValidator class="RegularExpressionValidator" runat="server" ControlToValidate="NoTxt" ValidationExpression="^\d+$" ErrorMessage="Harus angka semua" Display="Dynamic" />
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" Text="Password" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="passTxt" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="passTxt" ErrorMessage="Harus memasukkan password" Display="Dynamic" />
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" Text="Masuk Sebagai" CssClass="form-label"></asp:Label>
                            <asp:DropDownList ID="level" runat="server" CssClass="form-control">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Murid</asp:ListItem>
                                <asp:ListItem>Pengajar</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="level" ErrorMessage="Harus memilih level" Display="Dynamic" />
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <asp:Button ID="btnDaftar" runat="server" Text="Daftar" CssClass="btn btn-daftar" />
                </div>
            </form>
            <div style="text-align: center">
                <asp:Label ID="Label1" runat="server" Text="Sudah Punya Akun? ">
                    <asp:HyperLink runat="server" NavigateUrl="~/Main/login/login.aspx">Login</asp:HyperLink>
                </asp:Label>
            </div>
        </div>
    </div>
</body>
</html>
