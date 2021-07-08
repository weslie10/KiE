<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="table-topik.aspx.vb" Inherits="Project.table_topik" MasterPageFile="~/Main/Admin/Admin.Master" Title="Tabel Topik" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Tabel Topik</h1>
    </div>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <a href="create.aspx?tipe=topik" class="btn mb-4 btn-sm btn-primary">
                <i class="fas fa-fw fa-plus-circle"></i>
                Tambah Topik
            </a>
            <div class="table-responsive">
                <table class="table table-bordered dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama Pelajaran</th>
                            <th>Topik</th>
                            <th>Isi Topik</th>
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
                                con.sqlcommand.CommandText = "SELECT m.nama_mapel, t.* from tbl_topik t join tbl_mapel m on t.fk_mapel = m.id_mapel"
                                con.reader = con.sqlcommand.ExecuteReader
                                If (con.reader.HasRows) Then
                                    While con.reader.Read()
                        %>
                                        <tr>
                                            <td><%= i %></td>
                                            <td><%= con.reader.GetString(0) %></td>
                                            <td><%= con.reader.GetString(2) %></td>
                                            <td><%= con.reader.GetString(4) %></td>
                                            <td>
                                                <a href="<%= url %>Main/Admin/update.aspx?tipe=topik&id=<%= con.reader.GetString(1) %>" class="btn btn-sm btn-warning">
                                                    <i class="fas fa-fw fa-edit"></i> Ubah Data
                                                </a>
                                                <a  href="#" class="btn btn-sm btn-outline-danger" onclick="$
                                                    confirm('Apakah Anda ingin menghapus data ini?') === true 
                                                        ? window.location.href= '<%= url %>Main/Admin/delete.aspx?tipe=topik&id=<%= con.reader.GetString(1) %>'
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