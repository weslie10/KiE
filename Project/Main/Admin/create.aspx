<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="create.aspx.vb" Inherits="Project.create3" MasterPageFile="~/Main/Admin/Admin.Master" ValidateRequest="false" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%
    Dim tipe As String = Request.QueryString("tipe")
%>
<div class="row">
    <% If (tipe = "mapel") Then %>
    <div class="col-md-6">
        <div class="card bg-white p-4">
            <form>
                <h4 style="text-align: center; margin-bottom: 10px;" >
                    <asp:Label runat="server" Text="Buat Mata Pelajaran"></asp:Label>
                </h4>
                <hr />
                <div Class="div50" style="font-size: 1.5em">
                    <div Class="form-group">
                        <asp:Label runat = "server" Text="Mata Pelajaran" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID = "mapelTxt" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator Class="RequiredFieldValidator" runat="server" ControlToValidate="mapelTxt" ErrorMessage="Harus memasukkan nama mata pelajaran" Display="Dynamic" />
                    </div>
                    <div Class="form-group">
                        <asp:Button ID="Button1" runat="server" Text="Buat Mata Pelajaran" OnClick="Button1_Click" CssClass="btn btn-primary" />
                    </div>
                </div>
            </form>
        </div>
    </div>
    <% ElseIf (tipe = "topik") Then %>
    <div class="col-md-12">
        <div class="card bg-white p-4">
            <input type="hidden" id="isi1" runat="server" />
            <form>
                <h4 style="text-align: center; margin-bottom: 10px;">
                    <asp:Label runat="server" Text="Buat Topik"></asp:Label>
                </h4>
                <hr />
                <div class="div50" style="font-size: 1.5em">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Mata Pelajaran" CssClass="form-label"></asp:Label>
                        <asp:DropDownList ID="mapel" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="mapel" ErrorMessage="Harus memilih mata pelajaran" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" Text="Nama Topik" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="topikTxt" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="topikTxt" ErrorMessage="Harus memasukkan nama topik" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" Text="Isi Topik" CssClass="form-label"></asp:Label>
                        <textarea id="editor1"></textarea>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="Button2" runat="server" Text="Buat Topik" OnClientClick="change(1);" OnClick="Button1_Click" CssClass="btn btn-primary submit" />
                    </div>
                </div>
            </form>
        </div>
    </div>
    <% ElseIf (tipe = "latihan") Then %>
    <div class="col-md-12">
        <div class="card bg-white p-4">
            <input type="hidden" id="isi2" runat="server" />
            <form>
                <h4 style="text-align: center; margin-bottom: 10px;">
                    <asp:Label runat="server" Text="Buat Latihan"></asp:Label>
                </h4>
                <hr />
                <div class="div50" style="font-size: 1.5em">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Topik" CssClass="form-label"></asp:Label>
                        <asp:DropDownList ID="topik" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="topik" ErrorMessage="Harus memilih topik" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" Text="Soal" CssClass="form-label"></asp:Label>
                        <textarea id="editor2"></textarea>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" Text="Jawaban" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="jawabanTxt" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="jawabanTxt" ErrorMessage="Harus memasukkan jawaban" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:Button ID="Button3" runat="server" Text="Buat Latihan" OnClientClick="change(2);" OnClick="Button1_Click" CssClass="btn btn-primary submit" />
                    </div>
                </div>
            </form>
        </div>
    </div>
    <% End If %>
</div>
<script src="../../Assets/vendor/ckeditor5/ckeditor.js"></script>
<script>
    var editor = new Array(2).fill(null)
    for (let i = 1; i <= 2; i++) {
        if (document.querySelector(`#editor${i}`)) {
            console.log(i, document.querySelector(`#editor${i}`))
            ClassicEditor
                .create(document.querySelector( `#editor${i}` ))
                .then( newEditor  => {
                    editor[i] = newEditor;
                })
                .catch( error => {
                    console.error(error);
                });
        }
    }

    const change = (no) => {
        const editorData = editor[no].getData();
        if (editorData != "") {
            document.getElementById(`ContentPlaceHolder1_isi${no}`).value = editorData;
            console.log(editorData);
        }
        else {
            alert("Silahkan isi topiknya")
        }
    }
</script>
</asp:Content>
