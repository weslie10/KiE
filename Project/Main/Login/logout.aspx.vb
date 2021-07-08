Public Class logout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Write("<script>sessionStorage.clear()</script>")
        Session.Clear()
        Dim url As String = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath
        Response.Redirect(url + "Main/Login/login.aspx")
    End Sub

End Class