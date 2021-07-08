const mapel = (e) => {
    const url = new URL(e.target.href);
    const id = url.searchParams.get("id");
    sessionStorage.setItem('id_mapel',id);
    sessionStorage.setItem('nama_mapel',e.target.innerText);
    sessionStorage.removeItem('id_topik');
    sessionStorage.removeItem('nama_topik');
    loadSidebar();
}
const topik = (e) => {
    const url = new URL(e.target.parentNode.href);
    const id = url.searchParams.get("id");
    sessionStorage.setItem('id_topik', id);
    sessionStorage.setItem('nama_topik', e.target.innerText);
    loadSidebar();
}
const loadSidebar = () => {
    const url = window.location.protocol + "//" + window.location.host + "/"
    const list = document.getElementsByClassName('list-pelajaran')[0].children;
    let idx = 0;
    for (let i = 0; i < list.length; i++) {
        list[0].classList.remove('active')
        if (list[i].innerText === sessionStorage.getItem("nama_mapel")) {
            idx = i;
            break;
        }
    }
    list[idx].classList.toggle('active')

    if (sessionStorage.getItem('id_mapel')) {
        document.getElementById("mapel").innerHTML = `<a href="${url}Main/mapel.aspx?id=${sessionStorage.getItem('id_mapel')}" onclick="mapel(event);">${sessionStorage.getItem("nama_mapel")}</a>` + " > ";
    }
    if (sessionStorage.getItem('id_topik')) {
        document.getElementById("topik").innerHTML = `<a href="${url}Main/topik.aspx?id=${sessionStorage.getItem('id_topik')}" onclick="topik(event);">${sessionStorage.getItem("nama_topik")}</a>`;
    }
}

const removeSession = () => {
    sessionStorage.clear()
}