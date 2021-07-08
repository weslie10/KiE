<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="update.aspx.vb" Inherits="Project.update3" MasterPageFile="~/Main/Admin/Admin.Master" ValidateRequest="false" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%
    Dim tipe As String = Request.QueryString("tipe")
    Dim id As String = Request.QueryString("id")
    Dim con As New Class_koneksi
%>
<div class="row">
    <% If (tipe = "user") Then %>
    <div class="col-md-12">
        <div class="card bg-white p-4">
            <h1 style="text-align: center; margin-bottom: 10px;">
                <asp:Label runat="server" Text="Update User"></asp:Label>
            </h1>
            <hr />
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Username" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="userTxt" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="userTxt" ErrorMessage="Harus memasukkan username" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" Text="Nama Lengkap" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="namaTxt" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="namaTxt" ErrorMessage="Harus memasukkan nama lengkap" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" Text="Email" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="emailTxt" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="emailTxt" ErrorMessage="Harus memasukkan email" Display="Dynamic" />
                        <asp:RegularExpressionValidator class="RegularExpressionValidator" runat="server" ControlToValidate="emailTxt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Masukkan email yang valid" Display="Dynamic" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Nomor Handphone" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="NoTxt" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="NoTxt" ErrorMessage="Harus memasukkan nomor hp" Display="Dynamic" />
                        <asp:RegularExpressionValidator class="RegularExpressionValidator" runat="server" ControlToValidate="NoTxt" ValidationExpression="^\d+$" ErrorMessage="Harus angka semua" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" Text="Password" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="passTxt" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="passTxt" ErrorMessage="Harus memasukkan password" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" Text="Level" CssClass="form-label"></asp:Label>
                        <asp:DropDownList ID="level" runat="server" CssClass="form-control">
                            <asp:ListItem>Murid</asp:ListItem>
                            <asp:ListItem>Pengajar</asp:ListItem>
                            <asp:ListItem>Admin</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="level" ErrorMessage="Harus memilih level" Display="Dynamic" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group">
                        <asp:Button ID="Button3" runat="server" Text="Update" OnClientClick="change(1);" OnClick="update_Click" CssClass="btn btn-primary submit" />
                    </div>
                </div>
            </div>
        </div>
    </div>   
    

    <% ElseIf (tipe = "mapel") Then %>
    <div class="col-md-6">
        <div class="card bg-white p-4">
            <form>
                <h1 style="text-align: center; margin-bottom: 10px;">
                    <asp:Label runat="server" Text="Update Mata Pelajaran"></asp:Label>
                </h1>
                <hr />
                <div class="div50" style="font-size: 1.5em">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Mata Pelajaran" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="mapelTxt" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="mapelTxt" ErrorMessage="Harus memasukkan nama mata pelajaran" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:Button ID="update" runat="server" Text="Update" OnClick="update_Click" CssClass="btn btn-primary" />
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
                <h1 style="text-align: center; margin-bottom: 10px;">
                    <asp:Label runat="server" Text="Edit Topik"></asp:Label>
                </h1>
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
        <%
                Try
                    con.connect()
                    con.sqlcon.Open()
                    con.sqlcommand.Connection = con.sqlcon
                    con.sqlcommand.CommandText = "SELECT * from tbl_topik where id_topik = '" & id & "'"
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
                        <asp:Button ID="Button1" runat="server" Text="Update" OnClientClick="change(1);" OnClick="update_Click" CssClass="btn btn-primary submit" />
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
                <h1 style="text-align: center; margin-bottom: 10px;">
                    <asp:Label runat="server" Text="Edit Latihan"></asp:Label>
                </h1>
                <hr />
                <div class="div50" style="font-size: 1.5em">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Topik" CssClass="form-label"></asp:Label>
                        <asp:DropDownList ID="topik" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator class="RequiredFieldValidator" runat="server" ControlToValidate="topik" ErrorMessage="Harus memilih topik" Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" Text="Soal" CssClass="form-label"></asp:Label>
        <%
                Try
                    con.connect()
                    con.sqlcon.Open()
                    con.sqlcommand.Connection = con.sqlcon
                    con.sqlcommand.CommandText = "SELECT * from tbl_latihan where id_latihan = '" & id & "'"
                    con.reader = con.sqlcommand.ExecuteReader
                    If (con.reader.HasRows) Then
                        If con.reader.Read() Then
        %>
                        <textarea id="editor2"><%= con.reader.GetString(3) %></textarea>
                        
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
                        <asp:Button ID="Button2" runat="server" Text="Update" OnClientClick="change(2);" OnClick="update_Click" CssClass="btn btn-primary submit" />
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
