Public Class update2
    Inherits System.Web.UI.Page
    Dim con As New Class_koneksi
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            con.connect()
            con.sqlcon.Open()
            con.sqlcommand.Connection = con.sqlcon
            con.sqlcommand.CommandText = "SELECT * from tbl_topik where id_topik = '" & Request.QueryString("topik") & "'"
            con.reader = con.sqlcommand.ExecuteReader
            If (con.reader.HasRows) Then
                If con.reader.Read() Then
                    If topikTxt.Text = "" Or isi.Value = "" Then
                        topikTxt.Text = con.reader.GetString(1)
                    End If
                End If
            End If
        Catch ex As Exception
            Response.Write("<script>" + Err.Description + "\n" + con.sqlcommand.CommandText + "</script>")
        End Try
    End Sub

    Protected Sub editTopik_Click(sender As Object, e As EventArgs)
        Dim url As String = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath

        Dim id As String = Request.QueryString("topik")
        Dim nama As String = topikTxt.Text
        Dim content As String = isi.Value
        If (content = "") Then
            send("tidak ada isi", url + "Main/Pengajar/Topik/update.aspx")
        End If

        Try
            con.connect()
            con.sqlcon.Open()
            con.sqlcommand.Connection = con.sqlcon
            con.sqlcommand.CommandText = "UPDATE tbl_topik SET " _
                & "topik = '" & nama & "', " _
                & "isi_topik = '" & content & "'" _
                & "WHERE id_topik = '" & id & "'"
            con.reader = con.sqlcommand.ExecuteReader
            con.sqlcon.Close()
            send("Berhasil mengedit topik", url + "Main/Pengajar/Topik/index.aspx")
        Catch ex As Exception
            send(Err.Description + "\n" + con.sqlcommand.CommandText, url + "Main/Pengajar/Topik/update.aspx?topik=" + id)
        End Try
    End Sub

    Function send(message As String, link As String)
        Response.Write(
            "<script language=""javascript"">
                alert(`" + message + "`);
                window.location='" + link + "';
            </script>")
    End Function

End Class