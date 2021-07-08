Public Class login
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

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim url As String = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath
        Dim username As String = userTxt.Text
        Dim password As String = passTxt.Text
        Try
            con.connect()
            con.sqlcon.Open()
            con.sqlcommand.Connection = con.sqlcon
            con.sqlcommand.CommandText = "SELECT * FROM tbl_user WHERE username='" & username & "' and password='" & password & "' and status = 1"
            con.reader = con.sqlcommand.ExecuteReader
            If (con.reader.HasRows) Then
                If con.reader.Read() Then
                    Session("id_user") = con.reader.GetString(0)
                    Session("nama") = con.reader.GetString(2)
                    Session("level") = con.reader.GetString(6)
                    If (con.reader.GetString(6) = "Admin") Then
                        send("Anda berhasil login sebagai admin", url + "Main/" + con.reader.GetString(6) + "/table-user.aspx")
                    Else
                        send("Anda berhasil login", url + "Main/" + con.reader.GetString(6) + "/index.aspx")
                    End If
                Else
                    send("username atau password anda salah", url + "Main/Login/login.aspx")
                End If
            End If

            con.sqlcon.Close()
        Catch ex As Exception
            send(Err.Description + "\n" + con.sqlcommand.CommandText, url + "Main/Login/daftar.aspx")
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