
let url = "http://localhost:5000/api/";


//Url
function colorChanger(color = "close") {
    fetch(url + color, {
        method: 'post'
    });
}


// Led Button
document.querySelector("#Green").addEventListener("click", function () {
    colorChanger('green');
});

document.querySelector("#Red").addEventListener("click", function () {
    colorChanger('red');
});

document.querySelector("#Blue").addEventListener("click", function () {
    colorChanger('blue');
});

document.querySelector("#Close").addEventListener("click", function () {
    colorChanger();
});

document.querySelector("#SocketOpen").addEventListener("click", function () {
    colorChanger('socketOpen');
});

document.querySelector("#SocketClose").addEventListener("click", function () {
    colorChanger('socketClose');
});





const teamcityTable = document.querySelector("#tbl");

const teamcityTableGet = async (buildResult) => {
    return await fetch(url + "BuildLog", {
        method: 'get'
    })
        .then(response => response.json())
        .then(teamcity => {


            teamcity.forEach(_teamcity => {
                if (_teamcity.build_result == buildResult) {

                    let tr = document.createElement("tr");
                    let id = document.createElement("td");
                    let triggered = document.createElement("td");
                    let name = document.createElement("td");
                    let event = document.createElement("td");
                    let result = document.createElement("td");
                    let date= document.createElement("td");

                    id.textContent = _teamcity.id;
                    triggered.textContent = _teamcity.triggered_by;
                    name.textContent = _teamcity.build_name;
                    event.textContent = _teamcity.build_event;
                    result.textContent = _teamcity.build_result;
                    date.textContent = _teamcity.build_start_time;

                    tr.appendChild(id);
                    tr.appendChild(triggered);
                    tr.appendChild(name);
                    tr.appendChild(event);
                    tr.appendChild(result);
                    tr.appendChild(date);
                    teamcityTable.appendChild(tr);

                    // Table coloring
                    if (buildResult == "running")
                        tr.style.backgroundColor = "#87CEFA";

                    else if (buildResult == "failure")
                        tr.style.backgroundColor = "#ff3b1f";

                    else if (buildResult == "success")
                        tr.style.backgroundColor = "#2b961f";
                }
            });
            document.getElementById("output").innerHTML;
            return true;
        });

}

const teamcityTableAllGet = async () => {
    return await fetch(url + "BuildLog", {
        method: 'get'
    })
        .then(response => response.json())
        .then(teamcity => {
            teamcity.forEach(_teamcity => {
                let tr = document.createElement("tr");
                let id = document.createElement("td");
                let triggered = document.createElement("td");
                let name = document.createElement("td");
                let event = document.createElement("td");
                let result = document.createElement("td");
                let date=document.createElement("td");

                id.textContent = _teamcity.id;
                triggered.textContent = _teamcity.triggered_by;
                name.textContent = _teamcity.build_name;
                event.textContent = _teamcity.build_event;
                result.textContent = _teamcity.build_result;
                date.textContent= _teamcity.build_start_time;

                tr.appendChild(id);
                tr.appendChild(triggered);
                tr.appendChild(name);
                tr.appendChild(event);
                tr.appendChild(result);
                tr.appendChild(date);
                teamcityTable.appendChild(tr);

                // Table coloring
                if (result.textContent == "running")
                    tr.style.backgroundColor = "#87CEFA";

                else if (result.textContent == "failure")
                    tr.style.backgroundColor = "#ff3b1f";

                else if (result.textContent == "success")
                    tr.style.backgroundColor = "#2b961f";
            });
            document.getElementById("output").innerHTML;
            return true;
        });
}

//Table Button

var tableValue;
document.querySelector("#AllData").addEventListener("click", function () {
    TableSection('allData');
    tableValue="allData";
});

document.querySelector("#SequentialData").addEventListener("click", function () {
    TableSection('sequentialData');
    tableValue="sequentialData";
});

document.querySelector("#Running").addEventListener("click", function () {
    TableSection('running');
    tableValue="running";
});

document.querySelector("#Failure").addEventListener("click", function () {
    TableSection('failure');
    tableValue="failure";
});

document.querySelector("#Success").addEventListener("click", function () {
    TableSection('success');
    tableValue="success";
});



let t_header = ` <tr class="t-header">
<th>Build Id</th>
<th>Triggered</th>
<th>Project Name</th>
<th>Event</th>
<th>Resualt</th>
<th>Date</th>
</tr>`;
function TableSection(tblSection) {
    if (tblSection == "running") {
        teamcityTable.innerHTML = t_header;
        teamcityTableGet("running");
    }
    else if (tblSection == "failure") {
        teamcityTable.innerHTML = t_header;
        teamcityTableGet("failure");
    }
    else if (tblSection == "success") {
        teamcityTable.innerHTML = t_header;
        teamcityTableGet("success");
    }
    else if (tblSection == "allData") {
        teamcityTable.innerHTML = t_header;
        teamcityTableAllGet();
    }
    
    else if (tblSection == "sequentialData") {
        teamcityTable.innerHTML = t_header;
        teamcityTableGet("running");
        teamcityTableGet("failure");
        teamcityTableGet("success");
    }

}

teamcityTableAllGet();
tableValue="allData";
/*
teamcityTableGet("running");
teamcityTableGet("failure");
teamcityTableGet("success");*/

//tablo scroll degeri öğrenme
var outputScroll = document.querySelector("#output");
var scrollSize;
var tempScrollSize;
function TableScroll()
{
    scrollSize=outputScroll.scrollTop;
}



const refreshTable= async ()=>{ 
    
    if (tableValue == "running") {
        tempScrollSize=scrollSize;
        teamcityTable.innerHTML = t_header;
        await teamcityTableGet("running");
        console.log(tempScrollSize);
        outputScroll.scrollTop=tempScrollSize;
    }
    else if (tableValue == "failure") {
        tempScrollSize=scrollSize;
        teamcityTable.innerHTML = t_header;
        await teamcityTableGet("failure");
        console.log(tempScrollSize);
        outputScroll.scrollTop=tempScrollSize;
    }
    else if (tableValue == "success") {
        tempScrollSize=scrollSize;
        teamcityTable.innerHTML = t_header;
        await teamcityTableGet("success");
        console.log(tempScrollSize);
        outputScroll.scrollTop=tempScrollSize;
    }
    else if (tableValue == "allData") {
        tempScrollSize=scrollSize;
        teamcityTable.innerHTML = t_header;
        await teamcityTableAllGet();
        console.log(tempScrollSize);
        outputScroll.scrollTop=tempScrollSize;
    }
    
    else if (tableValue == "sequentialData") {
        tempScrollSize=scrollSize;
        teamcityTable.innerHTML = t_header;
        await teamcityTableGet("running");
        await teamcityTableGet("failure");
        await teamcityTableGet("success");
        console.log(tempScrollSize);
        outputScroll.scrollTop=tempScrollSize;
    }

}


setInterval(refreshTable, 5000);  



    //teamcity.build_result



        // let addedRows = document.querySelectorAll('tr');

        // for (let i = 0; i < addedRows.length; i++) {
        //     const node = addedRows[i];
        //     if(node.classList.indexOf('t-header') == -1){
        //         tbl.removeChild(node);
        //     }
        // }


