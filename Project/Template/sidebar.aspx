<% 
    Dim fileName = System.IO.Path.GetFileName(Request.Url.AbsolutePath)
    Dim file = {"mapel.aspx", "topik.aspx", "latihan.aspx"}
    Dim cek As Boolean = False
    For Each item As String In file
        If fileName = item Then
            cek = True
            Exit For
        End If
    Next
%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body onload="<%= If(cek, "loadSidebar()", "removeSession()") %>">
    <div class="sidebar">
        <h1>Mata Pelajaran</h1>
        <ul class="list-pelajaran">
        <%
            Dim url As String = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath
        %>
        <%
            Dim con As New Class_koneksi
            Try
                con.connect()
                con.sqlcon.Open()
                con.sqlcommand.Connection = con.sqlcon
                con.sqlcommand.CommandText = "SELECT m.* FROM tbl_mapel m join tbl_user u on u.id_user = m.fk_user and u.status = 1"
                con.reader = con.sqlcommand.ExecuteReader
                If (con.reader.HasRows) Then
                    While con.reader.Read()
        %>
                        <a href="<%= url %>Main/mapel.aspx?id=<%= con.reader.GetString(0) %>" onclick="mapel(event);"><%= con.reader.GetString(1) %></a>
        <%
                    End While
                End If
            Catch ex As Exception
                Response.Write("<script>" + Err.Description + "\n" + con.sqlcommand.CommandText + "</script>")
            End Try
        %>
        </ul>
    </div>
</body>
</html>
