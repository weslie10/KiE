Public Class certificate
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        signature.InnerText = Session("nama")
    End Sub

End Class