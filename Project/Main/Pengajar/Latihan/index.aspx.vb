Public Class index4
    Inherits System.Web.UI.Page

    Dim con As New Class_koneksi
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Request.QueryString("topik") IsNot Nothing) Then
            Session("id_topik") = Request.QueryString("topik")
        End If
        Session.Remove("id_mapel")
        Try
            con.connect()
            con.sqlcon.Open()
            con.sqlcommand.Connection = con.sqlcon
            con.sqlcommand.CommandText = "SELECT * from tbl_topik where id_topik = '" & Session("id_topik") & "'"
            con.reader = con.sqlcommand.ExecuteReader
            If (con.reader.HasRows) Then
                If con.reader.Read() Then
                    nama_topik.InnerText = con.reader.GetString(1)
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