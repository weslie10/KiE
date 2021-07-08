<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="update.aspx.vb" Inherits="Project.update2" MasterPageFile="~/KiE.Master" ValidateRequest="false" %>
<asp:Content ContentPlaceHolderID="content" runat="server">
    <div class="main-container">
        <!--#include file="../../../Template/sidebar.aspx"--> 
        <div class="content">
            <input type="hidden" id="isi" runat="server" />
            <form>
                <h1 style="text-align: center; margin-bottom: 10px;">
                    <asp:Label runat="server" Text="Edit Topik"></asp:Label>
                </h1>
                <hr />
                <div class="div50" style="font-size: 1.5em">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Nama Topik" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="topikTxt" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="topikTxt" ErrorMessage="Harus memasukkan nama topik" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" Text="Isi Topik" CssClass="form-label"></asp:Label>
        <%
            Try
                con.connect()
                con.sqlcon.Open()
                con.sqlcommand.Connection = con.sqlcon
                con.sqlcommand.CommandText = "SELECT * from tbl_topik where id_topik = '" & Request.QueryString("topik") & "'"
                con.reader = con.sqlcommand.ExecuteReader
                If (con.reader.HasRows) Then
                    If con.reader.Read() Then
        %>
                        <textarea id="editor1"><%= con.reader.GetString(3) %></textarea>
        <%
                    End If
                End If
            Catch ex As Exception
                Response.Write("<script>" + Err.Description + "\n" + con.sqlcommand.CommandText + "</script>")
            End Try
        %>
                        
                    </div>
                    <div class="form-group">
                        <asp:Button ID="editTopik" runat="server" Text="Edit Topik" OnClientClick="change(event);" OnClick="editTopik_Click" CssClass="btn btn-primary submit" />
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script src="../../../Assets/vendor/ckeditor5/ckeditor.js"></script>
    <script>
        let editor;
        ClassicEditor
            .create(document.querySelector( '#editor1' ))
            .then( newEditor  => {
                editor = newEditor;
            })
            .catch( error => {
                console.error(error);
            });

        const change = (e) => {
            const editorData = editor.getData();
            if (editorData != "") {
                document.getElementById('content_isi').value = editorData;
                console.log(editorData);
            }
            else {
                alert("Silahkan isi topiknya")
            }
        }
    </script>
</asp:Content>