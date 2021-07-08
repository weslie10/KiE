Public Class daftar
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

    Protected Sub btnDaftar_Click(sender As Object, e As EventArgs) Handles btnDaftar.Click
        Dim url As String = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath

        Dim id As String = random()
        Dim username As String = userTxt.Text
        Dim password As String = passTxt.Text
        Dim email As String = emailTxt.Text
        Dim nama As String = namaTxt.Text
        Dim no_hp As String = NoTxt.Text
        Dim lvl = level.SelectedValue

        Try
            con.connect()
            con.sqlcon.Open()
            con.sqlcommand.Connection = con.sqlcon
            con.sqlcommand.CommandText = "INSERT INTO tbl_user (id_user, username, nama_user, email, password, no_hp, level, status) " _
                & "VALUES('" & id & "','" & username & "','" & nama & "','" & email & "','" & password & "','" & no_hp & "','" & lvl & "',1)"
            con.reader = con.sqlcommand.ExecuteReader
            con.sqlcon.Close()

            Session("id_user") = id
            Session("nama") = nama
            Session("level") = lvl

            send("Anda berhasil mendaftar", url + "Main/" + level.SelectedValue + "/index.aspx")
        Catch ex As Exception
            send(Err.Description + "\n" + con.sqlcommand.CommandText, url + "Main/Login/daftar.aspx")
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