Public Class update3
    Inherits System.Web.UI.Page
    Dim con As New Class_koneksi
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim tipe As String = Request.QueryString("tipe")
        Dim id As String = Request.QueryString("id")
        Try
            con.connect()
            con.sqlcon.Open()
            con.sqlcommand.Connection = con.sqlcon
            If (tipe = "user") Then
                con.sqlcommand.CommandText = "SELECT * from tbl_user where id_user = '" & id & "'"
                con.reader = con.sqlcommand.ExecuteReader
                If (con.reader.HasRows) Then
                    If con.reader.Read() Then
                        If userTxt.Text = "" Or namaTxt.Text = "" Or emailTxt.Text = "" Or passTxt.Text = "" Or NoTxt.Text = "" Or level.SelectedValue = "" Then
                            userTxt.Text = con.reader.GetString(1)
                            namaTxt.Text = con.reader.GetString(2)
                            emailTxt.Text = con.reader.GetString(3)
                            passTxt.Text = con.reader.GetString(4)
                            NoTxt.Text = con.reader.GetString(5)
                            level.SelectedValue = con.reader.GetString(6)
                        End If
                    End If
                End If

            ElseIf (tipe = "mapel") Then
                con.sqlcommand.CommandText = "SELECT * from tbl_mapel where id_mapel = '" & id & "'"
                con.reader = con.sqlcommand.ExecuteReader
                If (con.reader.HasRows) Then
                    If con.reader.Read() Then
                        If mapelTxt.Text = "" Then
                            mapelTxt.Text = con.reader.GetString(1)
                        End If
                    End If
                End If
            ElseIf (tipe = "topik") Then
                con.sqlcommand.CommandText = "SELECT * from tbl_topik where id_topik = '" & id & "'"
                con.reader = con.sqlcommand.ExecuteReader
                If (con.reader.HasRows) Then
                    If con.reader.Read() Then
                        If topikTxt.Text = "" Or isi1.Value = "" Then
                            topikTxt.Text = con.reader.GetString(1)
                        End If
                    End If
                End If

                con.sqlcon.Close()
                con.sqlcon.Open()
                con.sqlcommand.CommandText = "select * from tbl_mapel m join tbl_user u on u.id_user = m.fk_user and u.status = 1"
                con.reader = con.sqlcommand.ExecuteReader
                If (con.reader.HasRows) Then
                    While con.reader.Read()
                        Dim item As New ListItem(con.reader.GetString(1), con.reader.GetString(0))
                        If (id = con.reader.GetString(0)) Then
                            item.Selected = True
                        End If
                        mapel.Items.Add(item)
                    End While
                End If

            ElseIf (tipe = "latihan") Then
                con.sqlcommand.CommandText = "SELECT * from tbl_latihan where id_latihan = '" & id & "'"
                con.reader = con.sqlcommand.ExecuteReader
                If (con.reader.HasRows) Then
                    If con.reader.Read() Then
                        If jawabanTxt.Text = "" Or isi2.Value = "" Then
                            jawabanTxt.Text = con.reader.GetString(4)
                        End If
                    End If
                End If

                con.sqlcon.Close()
                con.sqlcon.Open()
                con.sqlcommand.CommandText = "select t.id_topik, t.topik, m.nama_mapel from tbl_topik t join tbl_mapel m on m.id_mapel = t.fk_mapel join tbl_user u on u.id_user = m.fk_user and u.status = 1"
                con.reader = con.sqlcommand.ExecuteReader
                If (con.reader.HasRows) Then
                    While con.reader.Read()
                        Dim item As New ListItem(con.reader.GetString(2) + " -> " + con.reader.GetString(1), con.reader.GetString(0))
                        If (id = con.reader.GetString(0)) Then
                            item.Selected = True
                        End If
                        topik.Items.Add(item)
                    End While
                End If
            End If

        Catch ex As Exception
            Response.Write("<script>alert(`" + Err.Description + "\n" + con.sqlcommand.CommandText + "`)</script>")
        End Try
    End Sub

    Function send(message As String, link As String)
        Response.Write(
            "<script language=""javascript"">
                alert(`" + message + "`);
                window.location='" + link + "';
            </script>")
    End Function

    Protected Sub update_Click(sender As Object, e As EventArgs)
        Dim url As String = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath
        Dim tipe As String = Request.QueryString("tipe")
        Dim id As String = Request.QueryString("id")
        Try
            con.connect()
            con.sqlcon.Open()
            con.sqlcommand.Connection = con.sqlcon
            If (tipe = "user") Then
                Dim user As String = userTxt.Text
                Dim nama As String = namaTxt.Text
                Dim email As String = emailTxt.Text
                Dim pass As String = passTxt.Text
                Dim no As String = NoTxt.Text
                Dim sbg As String = level.SelectedValue
                con.sqlcommand.CommandText = "UPDATE tbl_user SET " _
                                            & "username = '" & user & "', " _
                                            & "nama_user = '" & nama & "', " _
                                            & "email = '" & email & "', " _
                                            & "password = '" & pass & "', " _
                                            & "no_hp = '" & no & "', " _
                                            & "level = '" & sbg & "' " _
                                            & "WHERE id_user = '" & id & "'"
                con.reader = con.sqlcommand.ExecuteReader
                send("Berhasil mengedit user", url + "Main/Admin/table-" + tipe + ".aspx")

            ElseIf (tipe = "mapel") Then
                Dim nama As String = mapelTxt.Text
                con.sqlcommand.CommandText = "UPDATE tbl_mapel SET " _
                                            & "nama_mapel = '" & nama & "' " _
                                            & "WHERE id_mapel = '" & id & "'"
                con.reader = con.sqlcommand.ExecuteReader
                send("Berhasil mengedit mata pelajaran", url + "Main/Admin/table-" + tipe + ".aspx")

            ElseIf (tipe = "topik") Then
                Dim nama As String = topikTxt.Text
                Dim content As String = isi1.Value
                If (content = "") Then
                    send("tidak ada isi", url + "Main/Admin/update.aspx?tipe=" + tipe + "&id=" + id)
                End If
                content = content.Replace("'", "''")
                con.sqlcommand.CommandText = "UPDATE tbl_topik SET " _
                                            & "topik = '" & nama & "', " _
                                            & "isi_topik = '" & content & "'" _
                                            & "WHERE id_topik = '" & id & "'"
                con.reader = con.sqlcommand.ExecuteReader
                send("Berhasil mengedit topik", url + "Main/Admin/table-" + tipe + ".aspx")

            ElseIf (tipe = "latihan") Then
                Dim jawaban As String = jawabanTxt.Text
                Dim content As String = isi2.Value
                If (content = "") Then
                    send("tidak ada isi", url + "Main/Admin/update.aspx?tipe=" + tipe + "&id=" + id)
                End If
                content = content.Replace("'", "''")
                con.sqlcommand.CommandText = "UPDATE tbl_latihan SET " _
                                            & "soal = '" & content & "', " _
                                            & "jawaban = '" & jawaban & "' " _
                                            & "WHERE id_latihan = '" & id & "'"
                con.reader = con.sqlcommand.ExecuteReader
                send("Berhasil mengedit latihan", url + "Main/Admin/table-" + tipe + ".aspx")
            End If

        Catch ex As Exception
            send(Err.Description + "\n" + con.sqlcommand.CommandText, url + "Main/Admin/update.aspx?tipe=" + tipe + "&id=" + id)
        End Try
    End Sub
End Class