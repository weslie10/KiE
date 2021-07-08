
Public Class delete
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim con As New Class_koneksi
        Dim id = Request.QueryString("id")
        Dim tipe = Request.QueryString("tipe")
        Dim url As String = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath
        Try
            con.connect()
            con.sqlcon.Open()
            con.sqlcommand.Connection = con.sqlcon
            If (tipe = "mapel") Then
                Dim data As New List(Of String)()

                con.sqlcommand.CommandText = "SELECT * from tbl_topik where fk_mapel = '" & id & "'"
                con.reader = con.sqlcommand.ExecuteReader
                If (con.reader.HasRows) Then
                    While con.reader.Read()
                        data.Add(con.reader.GetString(0))
                    End While
                End If

                con.sqlcon.Close()
                con.sqlcon.Open()
                For Each item In data
                    con.sqlcommand.CommandText = "DELETE from tbl_latihan where fk_topik = '" & item & "'"
                    con.reader = con.sqlcommand.ExecuteReader
                Next

                con.sqlcon.Close()
                con.sqlcon.Open()
                con.sqlcommand.CommandText = "DELETE from tbl_topik where fk_mapel = '" & id & "'"
                con.reader = con.sqlcommand.ExecuteReader
                con.sqlcon.Close()
                con.sqlcon.Open()
                con.sqlcommand.CommandText = "DELETE from tbl_mapel where id_mapel = '" & id & "'"
                con.reader = con.sqlcommand.ExecuteReader

            ElseIf (tipe = "topik") Then
                con.sqlcommand.CommandText = "DELETE from tbl_latihan where fk_topik = '" & id & "'"
                con.reader = con.sqlcommand.ExecuteReader
                con.sqlcon.Close()
                con.sqlcon.Open()
                con.sqlcommand.CommandText = "DELETE from tbl_topik where id_topik = '" & id & "'"
                con.reader = con.sqlcommand.ExecuteReader

            ElseIf (tipe = "latihan") Then
                con.sqlcommand.CommandText = "DELETE from tbl_latihan where id_latihan = '" & id & "'"
                con.reader = con.sqlcommand.ExecuteReader
            End If
            send("Anda Berhasil Menghapus " + tipe, url + "Main/Pengajar/" + tipe + "/index.aspx")
        Catch ex As Exception
            Response.Write("<script>alert(`" + Err.Description + "\n" + con.sqlcommand.CommandText + "`)</script>")
        End Try
    End Sub
    Function send(message As String, link As String)
        Response.Write(
            "<script language=""javascript"">
                alert('" + message + "');
                window.location='" + link + "';
            </script>")
    End Function
End Class