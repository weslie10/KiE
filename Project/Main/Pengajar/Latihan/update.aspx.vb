Public Class update1
    Inherits System.Web.UI.Page
    Dim con As New Class_koneksi
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            con.connect()
            con.sqlcon.Open()
            con.sqlcommand.Connection = con.sqlcon
            con.sqlcommand.CommandText = "SELECT * from tbl_latihan where id_latihan = '" & Request.QueryString("latihan") & "'"
            con.reader = con.sqlcommand.ExecuteReader
            If (con.reader.HasRows) Then
                If con.reader.Read() Then
                    If jawabanTxt.Text = "" Or isi.Value = "" Then
                        jawabanTxt.Text = con.reader.GetString(4)
                    End If
                End If
            End If
        Catch ex As Exception
            Response.Write("<script>alert(`" + Err.Description + "\n" + con.sqlcommand.CommandText + "`)</script>")
        End Try
    End Sub
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

    Protected Sub editLatihan_Click(sender As Object, e As EventArgs)
        Dim url As String = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath

        Dim id As String = Request.QueryString("latihan")
        Dim jawaban As String = jawabanTxt.Text
        Dim content As String = isi.Value
        Dim tipe = "text"
        If (content = "") Then
            send("tidak ada isi", url + "Main/Pengajar/Latihan/update.aspx")
        End If
        Try
            con.connect()
            con.sqlcon.Open()
            con.sqlcommand.Connection = con.sqlcon
            con.sqlcommand.CommandText = "UPDATE tbl_latihan SET " _
                & "soal = '" & content & "', " _
                & "jawaban = '" & jawaban & "' " _
                & "WHERE id_latihan = '" & id & "'"
            con.reader = con.sqlcommand.ExecuteReader
            con.sqlcon.Close()
            send("Berhasil mengupdate latihan", url + "Main/Pengajar/Latihan/index.aspx")
        Catch ex As Exception
            send(Err.Description + "\n" + con.sqlcommand.CommandText, url + "Main/Pengajar/Latihan/update.aspx?latihan=" + id)
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