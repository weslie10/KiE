<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="Project.index5" MasterPageFile="~/KiE.Master" Title="List topik" %>
<asp:Content ContentPlaceHolderID="content" runat="server">
    <div class="main-container">
        <!--#include file="../../../Template/sidebar.aspx"-->
        <div class="content">
            <h1>Topik dari <span id="nama_mapel" runat="server"></span></h1>
            <asp:Button runat="server" class="btn btn-primary my-15" PostBackUrl="~/Main/Pengajar/Topik/create.aspx" Text="Tambah Topik" />
            <table class="table">
                <tr>
                    <th>No</th>
                    <th>Nama Topik</th>
                    <th>Isi Topik</th>
                    <th colspan="3">Aksi</th>
                </tr>
                <% 
                    Dim i As Integer = 1
                    Try
                        con.connect()
                        con.sqlcon.Open()
                        con.sqlcommand.Connection = con.sqlcon
                        con.sqlcommand.CommandText = "SELECT * FROM tbl_topik where fk_mapel = '" + Session("id_mapel") + "'"
                        con.reader = con.sqlcommand.ExecuteReader
                        If (con.reader.HasRows) Then
                            While con.reader.Read()
                                Dim Id = con.reader.GetString(0)
                %>
                                <tr>
                                    <td style="display: none"><%= con.reader.GetString(0) %></td>
                                    <td><%= i %></td>
                                    <td><%= con.reader.GetString(1) %></td>
                                    <td><%= con.reader.GetString(3) %></td>
                                    <td><asp:Button ID="Button1" runat="server" Text="Lihat Latihan" class="btn btn-primary" OnClientClick="saveVariable(event, 'lihat')" /></td>
                                    <td><asp:Button ID="editTopik" runat="server" Text="Edit Topik" class="btn btn-danger" OnClientClick="saveVariable(event, 'edit')" /></td>
                                    <td><asp:Button ID="hapusTopik" runat="server" Text="Hapus Topik" class="btn btn-danger" OnClientClick="saveVariable(event, 'hapus')" /></td>
                                </tr>
                <%--PostBackUrl="~/Main/Pengajar/matpel/delete.aspx?id=<%= con.reader.getString(0) %>"--%> 
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
                location.href = `<%= url %>Main/Pengajar/Latihan/index.aspx?topik=${value}`;
            }
            else if (type === "edit") {
                location.href = `<%= url %>Main/Pengajar/Topik/update.aspx?topik=${value}`;
            }
            else if (type === "hapus") {
                location.href = `<%= url %>Main/Pengajar/delete.aspx?id=${value}&tipe=topik`;
            }
        }
    </script>
</asp:Content>