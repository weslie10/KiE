<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="Project.index3" MasterPageFile="~/KiE.Master" Title="List Mata Pelajaran" %>
<asp:Content ContentPlaceHolderID="content" runat="server">
    <div class="main-container">
        <!--#include file="../../../Template/sidebar.aspx"-->
        <div class="content">
            <h1>List Mata Pelajaran</h1>
            <asp:Button runat="server" class="btn btn-primary my-15" PostBackUrl="~/Main/Pengajar/Mapel/create.aspx" Text="Tambah Mata Pelajaran" />
            <input type="hidden" runat="server" class="help" />
            <table class="table">
                <tr>
                    <th>No</th>
                    <th>Nama Pelajaran</th>
                    <th>Pembuat</th>
                    <th colspan="3">Aksi</th>
                </tr>
                <%
                    Dim i As Integer = 1
                    Try
                        con.connect()
                        con.sqlcon.Open()
                        con.sqlcommand.Connection = con.sqlcon
                        con.sqlcommand.CommandText = "SELECT m.*, u.username FROM tbl_mapel m join tbl_user u on u.id_user = m.fk_user and m.fk_user = '" + Session("id_user") + "'"
                        con.reader = con.sqlcommand.ExecuteReader
                        If (con.reader.HasRows) Then
                            While con.reader.Read()
                %>
                                <tr>
                                    <td style="display: none"><%= con.reader.GetString(0) %></td>
                                    <td><%= i %></td>
                                    <td><%= con.reader.GetString(1) %></td>
                                    <td><%= con.reader.GetString(3) %></td>
                                    <td><asp:Button ID="Button1" runat="server" Text="Lihat Topik" class="btn btn-primary" OnClientClick="saveVariable(event, 'lihat')" /></td>
                                    <td><asp:Button ID="editMapel" runat="server" Text="Edit Mata Pelajaran" class="btn btn-warning" OnClientClick="saveVariable(event, 'edit')" /></td>
                                    <td><asp:Button ID="deleteMapel" runat="server" Text="Hapus Mata Pelajaran" class="btn btn-danger" OnClientClick="saveVariable(event, 'hapus')"  /></td>
                                </tr>
                <%
                                i += 1
                            End While
                        End If
                    Catch ex As Exception
                        Response.Write("<script>" + Err.Description + "\n" + con.sqlcommand.CommandText + "</script>")
                    End Try
                %>
            </table>
        </div>
    </div>
    <script>
        const saveVariable = (e, type) => {
            e.preventDefault();
            const value = e.target.parentNode.parentNode.children[0].innerText
            if (type === "lihat") {
                location.href = `<%= url %>Main/Pengajar/Topik/index.aspx?mapel=${value}`;
            }
            else if (type === "edit") {
                location.href = `<%= url %>Main/Pengajar/Mapel/update.aspx?mapel=${value}`;
            }
            else if (type === "hapus") {
                location.href = `<%= url %>Main/Pengajar/delete.aspx?id=${value}&tipe=mapel`;
            }
        }
    </script>
</asp:Content>