
document.querySelector("#Yesil").addEventListener("click",getYesil)
document.querySelector("#Kirmizi").addEventListener("click",getKirmizi)
function getYesil(){
    fetch("http://192.168.1.125:8080/api/Yesil",{
        method:'post'
    })
}

function getKirmizi(){
    fetch("http://192.168.1.125:8080/api/kirmizi",{
        method:'post'
    })
}