Public Class create
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

    Protected Sub buatMapel_Click(sender As Object, e As EventArgs) Handles buatMapel.Click
        Dim con As New Class_koneksi
        Dim url As String = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath

        Dim id As String = random()
        Dim nama As String = mapelTxt.Text

        Try
            con.connect()
            con.sqlcon.Open()
            con.sqlcommand.Connection = con.sqlcon
            con.sqlcommand.CommandText = "INSERT INTO tbl_mapel (id_mapel, nama_mapel, fk_user) " _
                & "VALUES('" & id & "','" & nama & "','" & Session("id_user") & "')"
            con.reader = con.sqlcommand.ExecuteReader
            con.sqlcon.Close()
            send("Berhsil menambahkan mata pelajaran", url + "Main/Pengajar/Mapel/index.aspx")
        Catch ex As Exception
            send(Err.Description + "\n" + con.sqlcommand.CommandText, url + "Main/Pengajar/Mapel/create.aspx")
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