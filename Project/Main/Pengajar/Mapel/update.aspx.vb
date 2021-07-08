Public Class update
    Inherits System.Web.UI.Page
    Dim con As New Class_koneksi
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
    Protected Sub updateMapel_Click(sender As Object, e As EventArgs)
        Dim url As String = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath

        Dim id As String = Request.QueryString("mapel")
        Dim nama As String = mapelTxt.Text

        Try
            con.connect()
            con.sqlcon.Open()
            con.sqlcommand.Connection = con.sqlcon
            con.sqlcommand.CommandText = "UPDATE tbl_mapel SET " _
                & "nama_mapel = '" & nama & "' " _
                & "WHERE id_mapel = '" & id & "'"
            con.reader = con.sqlcommand.ExecuteReader
            con.sqlcon.Close()
            send("berhasil mengedit mata pelajaran", url + "main/pengajar/mapel/index.aspx")
        Catch ex As Exception
            send(Err.Description + "\n" + con.sqlcommand.CommandText, url + "Main/Pengajar/Mapel/update.aspx?mapel=" + id)
        End Try
    End Sub

    Function send(message As String, link As String)
        Response.Write(
            "<script language=""javascript"">
                alert(`" + message + "`);
                window.location='" + link + "';
            </script>")
    End Function

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            con.connect()
            con.sqlcon.Open()
            con.sqlcommand.Connection = con.sqlcon
            con.sqlcommand.CommandText = "SELECT * from tbl_mapel where id_mapel = '" & Request.QueryString("mapel") & "'"
            con.reader = con.sqlcommand.ExecuteReader
            If (con.reader.HasRows) Then
                If con.reader.Read() Then
                    If mapelTxt.Text = "" Then
                        mapelTxt.Text = con.reader.GetString(1)
                    End If
                End If
            End If
        Catch ex As Exception
            Response.Write("<script>" + Err.Description + "\n" + con.sqlcommand.CommandText + "</script>")
        End Try
    End Sub
End Class