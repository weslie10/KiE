<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="mapel.aspx.vb" Inherits="Project.mapel" MasterPageFile="~/KiE.Master" Title="Knowledge is Everything" %>
<asp:Content runat="server" ContentPlaceHolderID="content">
    <div class="main-container">
        <!--#include file="../Template/sidebar.aspx"-->
        <div class="content">
            <!--#include file="../Template/session.aspx"-->
            <ul class="list-topik">
            <%
                Dim id = Request.QueryString("id")
                Try
                    con.connect()
                    con.sqlcon.Open()
                    con.sqlcommand.Connection = con.sqlcon
                    con.sqlcommand.CommandText = "SELECT * FROM tbl_topik where fk_mapel = '" & id & "'"
                    con.reader = con.sqlcommand.ExecuteReader
                    If (con.reader.HasRows) Then %>
                        <h1>Pilih Topik :</h1>
            <%
                    While con.reader.Read()
            %>
                            <a href="<%= url %>Main/topik.aspx?id=<%= con.reader.GetString(0) %>" onclick="topik(event);"><li><%= con.reader.GetString(1) %></li></a>
            <%
                        End While
                    Else %>
                        <h1>Belum ada topik</h1>
            <%      End If
                    Catch ex As Exception
                        Response.Write("<script>" + Err.Description + "\n" + con.sqlcommand.CommandText + "</script>")
                    End Try
            %>
            </ul>
        </div>
    </div>
</asp:Content>