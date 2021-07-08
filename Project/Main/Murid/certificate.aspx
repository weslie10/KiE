<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="certificate.aspx.vb" Inherits="Project.certificate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sertifikat KiE</title>
    <link rel="stylesheet" type="text/css" href="../../Assets/css/index.css" />
</head>
<body>
    <div class="outer-cer">
        <div class="inner-cer">
            <h1>Congratulation!!!!</h1>
            <h3 class="my-15">Selamat anda telah menyelesaikan latihan ini dengan baik dan benar</h3>
            <h1 id="score">100</h1>
            <h3 id="signature" runat="server"></h3>
        </div>
    <a runat="server" onclick="goToTopik();" href="#" style="font-size: 2em;">Kembali ke topik</a>
    </div>
</body>
<script>
    document.getElementById('score').innerText = sessionStorage.getItem("score");
    const goToTopik = () => {
        const url = window.location.protocol + "//" + window.location.host + "/"
        window.location.href=`${url}Main/topik.aspx?id=${sessionStorage.getItem('id_topik')}`
    }
</script>
</html>
