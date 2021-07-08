<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="latihan.aspx.vb" Inherits="Project.latihan" MasterPageFile="~/KiE.Master" Title="Knowledge is Everything" %>
<asp:Content ContentPlaceHolderID="content" runat="server">
    <div class="main-container">
        <!--#include file="../Template/sidebar.aspx"-->
        <div class="content">
            <!--#include file="../Template/session.aspx"-->
            <h1>Latihan</h1>
            <fieldset class="list-latihan" <%= If(Session("level") = "Pengajar", "disabled", "") %>>
            <%
                Dim no As Integer = 1
                Dim id = Request.QueryString("id")
                Try
                    con.connect()
                    con.sqlcon.Open()
                    con.sqlcommand.Connection = con.sqlcon
                    con.sqlcommand.CommandText = "SELECT * FROM tbl_latihan where fk_topik = '" & id & "'"
                    con.reader = con.sqlcommand.ExecuteReader
                    If (con.reader.HasRows) Then
                        While con.reader.Read()
                            If (no > 1) Then %>
                                <hr />
                            <% End If
            %>
                            <div class="latihan" id="no<%= no %>">  
                                <h2><%= no %>.</h2>
                                <div class="latihan-content">
                                    <h2 class="judul"><%= con.reader.GetString(3) %></h2>
                                    <input type="hidden" value="<%= con.reader.GetString(4) %>" />
                                    <textarea id="ans" runat="server" class="form-control"></textarea>
                                </div>
                            </div>
            <%
                        no += 1
                    End While%>
                    <asp:Button id = "submit" runat="server" OnClientClick="submitLatihan(event);" Text="Submit" CssClass="btn btn-primary my-15" />
            <%  Else  %>
                    <h1>Belum ada latihan tersedia saat ini</h1>
            <%  End If
                Catch ex As Exception
                    Response.Write("<script>" + Err.Description + "\n" + con.sqlcommand.CommandText + "</script>")
                End Try
            %>
            </fieldset>
        </div>
    </div>
    <script>
        const submitLatihan = (e) => {
            e.preventDefault()
            const list = document.querySelectorAll('.latihan-content')
            const totalQ = parseInt(list.length)
            let correct = 0, idx = 0;
            for (let i = 0; i < totalQ; i++) {
                if (list[i].children[1].value === list[i].children[2].value) {
                    correct++;
                }
                if (list[i].children[2].value != "") {
                    idx++;
                }
            }
            if (idx == totalQ) {
                sessionStorage.setItem("score", `${correct}/${totalQ}`);
                const url = window.location.protocol + "//" + window.location.host + "/"
                window.location.href = `${url}Main/Murid/certificate.aspx`
            }
            else {
                alert("tolong diisi semua latihannya");
            }
        }
    </script>
</asp:Content>