Public Class index5
    Inherits System.Web.UI.Page

    Dim con As New Class_koneksi
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Request.QueryString("mapel") IsNot Nothing) Then
            Session("id_mapel") = Request.QueryString("mapel")
        End If

        Try
            con.connect()
            con.sqlcon.Open()
            con.sqlcommand.Connection = con.sqlcon
            con.sqlcommand.CommandText = "SELECT * from tbl_mapel where id_mapel = '" & Session("id_mapel") & "'"
            con.reader = con.sqlcommand.ExecuteReader
            If (con.reader.HasRows) Then
                If con.reader.Read() Then
                    nama_mapel.InnerText = con.reader.GetString(1)
                End If
            End If
        Catch ex As Exception
            Response.Write("<script>" + Err.Description + "\n" + con.sqlcommand.CommandText + "</script>")
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