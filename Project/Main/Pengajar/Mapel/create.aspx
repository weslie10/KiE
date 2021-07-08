<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="create.aspx.vb" Inherits="Project.create" MasterPageFile="~/KiE.Master" %>
<asp:Content ContentPlaceHolderID="content" runat="server">
    <div class="main-container">
        <!--#include file="../../../Template/sidebar.aspx"--> 
        <div class="content">
            <form>
                <h1 style="text-align: center; margin-bottom: 10px;">
                    <asp:Label runat="server" Text="Buat Mata Pelajaran"></asp:Label>
                </h1>
                <hr />
                <div class="div50" style="font-size: 1.5em">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Mata Pelajaran" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="mapelTxt" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="mapelTxt" ErrorMessage="Harus memasukkan nama mata pelajaran" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:Button ID="buatMapel" runat="server" Text="Buat Mata Pelajaran" OnClick="buatMapel_Click" CssClass="btn btn-primary" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</asp:Content>