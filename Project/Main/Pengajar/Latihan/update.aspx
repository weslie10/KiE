<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="update.aspx.vb" Inherits="Project.update1" MasterPageFile="~/KiE.Master" ValidateRequest="false" %>
<asp:Content runat="server" ContentPlaceHolderID="content">
    <div class="main-container">
        <!--#include file="../../../Template/sidebar.aspx"--> 
        <div class="content">
            <input type="hidden" id="isi" runat="server" />
            <form>
                <h1 style="text-align: center; margin-bottom: 10px;">
                    <asp:Label runat="server" Text="Edit Latihan"></asp:Label>
                </h1>
                <hr />
                <div class="div50" style="font-size: 1.5em">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Soal" CssClass="form-label"></asp:Label>
        <%
            Try
                con.connect()
                con.sqlcon.Open()
                con.sqlcommand.Connection = con.sqlcon
                con.sqlcommand.CommandText = "SELECT * from tbl_latihan where id_latihan = '" & Request.QueryString("latihan") & "'"
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
                        <asp:Label runat="server" Text="Jawaban" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="jawabanTxt" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="jawabanTxt" ErrorMessage="Harus memasukkan jawaban" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:Button ID="editLatihan" runat="server" OnClientClick="change(event);" OnClick="editLatihan_Click" Text="Buat Latihan" CssClass="btn btn-primary submit" />
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