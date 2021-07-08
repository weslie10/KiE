<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="Project.index4" MasterPageFile="~/KiE.Master" Title="List Latihan" %>
<asp:Content ContentPlaceHolderID="content" runat="server">
    <div class="main-container">
        <!--#include file="../../../Template/sidebar.aspx"-->
        <div class="content">
            <h1>Latihan dari <span id="nama_topik" runat="server"></span></h1>
            <asp:Button runat="server" class="btn btn-primary my-15" PostBackUrl="~/Main/Pengajar/Latihan/create.aspx" Text="Tambah Latihan" />
            <table class="table">
                <tr>
                    <th>No</th>
                    <th>Soal</th>
                    <th>Jawaban</th>
                    <th colspan="3">Aksi</th>
                </tr>
                <% 
                    Dim i As Integer = 1
                    Try
                        con.connect()
                        con.sqlcon.Open()
                        con.sqlcommand.Connection = con.sqlcon
                        con.sqlcommand.CommandText = "SELECT * FROM tbl_latihan WHERE fk_topik = '" + Session("id_topik") + "'"
                        con.reader = con.sqlcommand.ExecuteReader
                        If (con.reader.HasRows) Then
                            While con.reader.Read()
                %>
                                <tr>
                                    <td style="display: none"><%= con.reader.GetString(0) %></td>
                                    <td><%= i %></td>
                                    <td><%= con.reader.GetString(3) %></td>
                                    <td><%= con.reader.GetString(4) %></td>
                                    <td><asp:Button ID="Button2" runat="server" Text="Edit Latihan" OnClientClick="saveVariable(event, 'edit')" class="btn btn-danger" /></td>
                                    <td><asp:Button ID="hapusLatihan" runat="server" Text="Hapus Latihan" class="btn btn-danger" OnClientClick="saveVariable(event, 'hapus')" /></td>
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

            if (type === "edit") {
                location.href = `<%= url %>Main/Pengajar/Latihan/update.aspx?latihan=${value}`;
            }
            else if (type === "hapus") {
                location.href = `<%= url %>Main/Pengajar/delete.aspx?id=${value}&tipe=latihan`;
            }
        }
    </script>
</asp:Content>