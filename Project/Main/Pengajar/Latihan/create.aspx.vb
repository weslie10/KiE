Public Class create1
    Inherits System.Web.UI.Page
    Function random() As String
        Dim s As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
        Dim r As New Random
        Dim sb As New StringBuilder
        For i As Integer = 1 To 15
            Dim idx As Integer = r.Next(0, 61)
            sb.Append(s.Substring(idx, 1))
        Next
        Return sb.ToString()
    End Function

    Protected Sub buatLatihan_Click(sender As Object, e As EventArgs)
        Dim con As New Class_koneksi
        Dim url As String = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath

        Dim id As String = random()
        Dim jawaban As String = jawabanTxt.Text
        Dim content As String = isi.Value
        Dim tipe = "text"
        If (content = "") Then
            send("tidak ada isi", url + "Main/Pengajar/Latihan/create.aspx")
        End If
        Try
            con.connect()
            con.sqlcon.Open()
            con.sqlcommand.Connection = con.sqlcon
            con.sqlcommand.CommandText = "INSERT INTO tbl_latihan (id_latihan, fk_topik, tipe_soal, soal, jawaban) " _
                & "VALUES('" & id & "','" & Session("id_topik") & "','" & tipe & "','" & content & "','" & jawaban & "')"
            con.reader = con.sqlcommand.ExecuteReader
            con.sqlcon.Close()
            send("Berhasil menambahkan latihan", url + "Main/Pengajar/Latihan/index.aspx")
        Catch ex As Exception
            send(Err.Description + "\n" + con.sqlcommand.CommandText, url + "Main/Pengajar/Latihan/create.aspx")
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