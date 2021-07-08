<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="table-user.aspx.vb" Inherits="Project.table_user" MasterPageFile="~/Main/Admin/Admin.Master" Title="Tabel User" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Tabel User</h1>
    </div>
    
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Username</th>
                            <th>Nama Lengkap</th>
                            <th>Email</th>
                            <th>No Hp</th>
                            <th>Level</th>
                            <th>Status</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Dim i As Integer = 1
                            Dim con As New Class_koneksi
                            Dim url As String = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath
                            Try
                                con.connect()
                                con.sqlcon.Open()
                                con.sqlcommand.Connection = con.sqlcon
                                con.sqlcommand.CommandText = "SELECT * FROM tbl_user"
                                con.reader = con.sqlcommand.ExecuteReader
                                If (con.reader.HasRows) Then
                                    While con.reader.Read()
                        %>
                                        <tr>
                                            <td><%= i %></td>
                                            <td><%= con.reader.GetString(1) %></td>
                                            <td><%= con.reader.GetString(2) %></td>
                                            <td><%= con.reader.GetString(3) %></td>
                                            <td><%= con.reader.GetString(5) %></td>
                                            <td><%= con.reader.GetString(6) %></td>
                                            <td><%= con.reader.GetInt32(7) %></td>
                                            <td>
                                                <a href="<%= url %>Main/Admin/update.aspx?tipe=user&id=<%= con.reader.GetString(0) %>" class="btn btn-sm btn-warning">
                                                    <i class="fas fa-fw fa-edit"></i> Ubah Data
                                                </a>
                                                <a  href="#" class="btn btn-sm btn-outline-danger" onclick="$
                                                    confirm('Apakah Anda ingin menghapus data ini?') === true 
                                                        ? window.location.href= '<%= url %>Main/Admin/delete.aspx?tipe=user&id=<%= con.reader.GetString(0) %>'
                                                        : console.log(false)
                                                ">
                                                    <i class="fas fa-fw fa-trash"></i> Hapus Data
                                                </a>
                                            </td>
                                        </tr>
                        <%
                                        i += 1
                                    End While
                                End If
                            Catch ex As Exception
                                Response.Write("<script>alert(`" + Err.Description + "\n" + con.sqlcommand.CommandText + "`)</script>")
                            End Try
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>