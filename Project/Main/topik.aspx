<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="topik.aspx.vb" Inherits="Project.topik" MasterPageFile="~/KiE.Master" Title="Knowledge is Everything" %>
<asp:Content ContentPlaceHolderID="content" runat="server">
    <div class="main-container">
        <!--#include file="../Template/sidebar.aspx"--> 
        <div class="content">
            <!--#include file="../Template/session.aspx"-->
            <%
                Dim id = Request.QueryString("id")
                Try
                    con.connect()
                    con.sqlcon.Open()
                    con.sqlcommand.Connection = con.sqlcon
                    con.sqlcommand.CommandText = "SELECT * FROM tbl_topik where id_topik = '" & id & "'"
                    con.reader = con.sqlcommand.ExecuteReader
                    If (con.reader.HasRows) Then
                        If con.reader.Read() Then
            %>
            <div class="card">
                <h1><%= con.reader.GetString(1) %></h1>
                <div class="content-topik">
                    <%= con.reader.GetString(3) %>
                </div>
            </div>
            <a href="latihan.aspx?id=<%= id %>">Klik disini untuk latihan ---》 </a>
            <%
                        End If
                    End If
                Catch ex As Exception
                    Response.Write("<script>" + Err.Description + "\n" + con.sqlcommand.CommandText + "</script>")
                End Try
            %>
        </div>
    </div>
</asp:Content>