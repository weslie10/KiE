﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="Project.index1" MasterPageFile="~/KiE.Master" Title="Home - Pengajar" %>
<asp:Content ContentPlaceHolderID="content" runat="server">
    <div class="main-container">
        <!--#include file="../../Template/sidebar.aspx"-->
        <div class="content">
            <h1>
                <asp:Label ID="Label1" runat="server" Text="Silahkan cek sidebar sebelah yang berisi mata pelajaran, disana anda akan menemukan beberaapa topik dari setiap mata pelajaran dan ada latihannya juga lo... :)"></asp:Label>
            </h1>
            <h1>
                <asp:Label ID="Label2" runat="server" Text="<--"></asp:Label>
            </h1>
            <h2>
                <asp:Label ID="Label3" runat="server" Text="Jika ingin membuat mata pelajaran, topik dan latihan silahkan klik List Mata Pelajaran di paling atas"></asp:Label>
            </h2>
        </div>
    </div>
</asp:Content>