Public Class create3
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
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim tipe As String = Request.QueryString("tipe")
        Dim url As String = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath
        Try
            con.connect()
            con.sqlcon.Open()
            con.sqlcommand.Connection = con.sqlcon
            If tipe = "topik" Then
                con.sqlcommand.CommandText = "select * from tbl_mapel m join tbl_user u on u.id_user = m.fk_user and u.status = 1"
                con.reader = con.sqlcommand.ExecuteReader
                If (con.reader.HasRows) Then
                    While con.reader.Read()
                        Dim item As New ListItem(con.reader.GetString(1), con.reader.GetString(0))
                        mapel.Items.Add(item)
                    End While
                End If

            ElseIf tipe = "latihan" Then
                con.sqlcommand.CommandText = "select t.id_topik, t.topik, m.nama_mapel from tbl_topik t join tbl_mapel m on m.id_mapel = t.fk_mapel join tbl_user u on u.id_user = m.fk_user and u.status = 1"
                con.reader = con.sqlcommand.ExecuteReader
                If (con.reader.HasRows) Then
                    While con.reader.Read()
                        Dim item As New ListItem(con.reader.GetString(2) + " -> " + con.reader.GetString(1), con.reader.GetString(0))
                        topik.Items.Add(item)
                    End While
                End If
            End If

            con.sqlcon.Close()
        Catch ex As Exception
            send(Err.Description + "\n" + con.sqlcommand.CommandText, url + "Main/Admin/table-" + tipe + ".aspx")
        End Try
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim tipe As String = Request.QueryString("tipe")
        Dim id As String = random()
        Dim url As String = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath
        Try
            con.connect()
            con.sqlcon.Open()
            con.sqlcommand.Connection = con.sqlcon
            If tipe = "mapel" Then
                Dim nama As String = mapelTxt.Text
                con.sqlcommand.CommandText = "INSERT INTO tbl_mapel (id_mapel, nama_mapel, fk_user) " _
                                            & "VALUES('" & id & "','" & nama & "','" & Session("id_user") & "')"
                con.reader = con.sqlcommand.ExecuteReader
                con.sqlcon.Close()
                send("Berhasil menambahkan mata pelajaran", url + "Main/Admin/table-" + tipe + ".aspx")
            ElseIf tipe = "topik" Then
                Dim nama As String = topikTxt.Text
                Dim content As String = isi1.Value
                If (content = "") Then
                    send("tidak ada isi", url + "Main/Admin/update.aspx?tipe=" + tipe + "&id=" + id)
                End If
                content = content.Replace("'", "''")
                Dim id_mapel As String = mapel.SelectedValue
                con.sqlcommand.CommandText = "INSERT INTO tbl_topik (id_topik, topik, fk_mapel, isi_topik) " _
                                            & "VALUES('" & id & "','" & nama & "','" & id_mapel & "','" & content & "')"
                con.reader = con.sqlcommand.ExecuteReader
                con.sqlcon.Close()
                send("Berhasil menambahkan topik", url + "Main/Admin/table-" + tipe + ".aspx")
            ElseIf tipe = "latihan" Then
                Dim jawaban As String = jawabanTxt.Text
                Dim content As String = isi2.Value
                If (content = "") Then
                    send("tidak ada isi", url + "Main/Admin/update.aspx?tipe=" + tipe + "&id=" + id)
                End If
                content = content.Replace("'", "''")
                Dim id_topik As String = topik.SelectedValue
                Dim type = "text"


                con.sqlcommand.CommandText = "INSERT INTO tbl_latihan (id_latihan, fk_topik, tipe_soal, soal, jawaban) " _
                                            & "VALUES('" & id & "','" & id_topik & "','" & type & "','" & content & "','" & jawaban & "')"
                con.reader = con.sqlcommand.ExecuteReader
                con.sqlcon.Close()
                send("Berhasil menambahkan latihan", url + "Main/Admin/table-" + tipe + ".aspx")
            End If
        Catch ex As Exception
            send(Err.Description + "\n" + con.sqlcommand.CommandText, url + "Main/Admin/create.aspx?tipe=" + tipe)
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