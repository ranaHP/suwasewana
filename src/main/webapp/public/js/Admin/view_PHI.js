
districts=["Galle","Matara","Colombo","Hambanthota","Nuwara","Kegalle","Nuwara Eliya","Jaffna"];
districts.map(name=>{
    let option= document.createElement('option')
    option.value=name
    option.innerText=name
    document.getElementById('select').appendChild(option)
})

areas=["Ahangama","Eluketiya","Habaraduwa","Unawatuna","Galle","Hikkaduwa"];
areas.map(name=>{
    let option= document.createElement('option')
    option.value=name
    option.innerText=name
    document.getElementById('select1').appendChild(option)
})

data=[{
    name:"Liam",
    ID:1,
    District:"Matara",
    Area:"ahangama",
    Mobile:"0779876665"
},
    {
        name:"Charlotte",
        ID:2,
        District:"Colombo",
        Area:"ahangama",
        Mobile:"0779876665"
    },
    {
        name:"Noah",
        ID:3,
        District:"Nuwara",
        Area:"ahangama",
        Mobile:"0779876665"
    },
    {
        name:"Olivia",
        ID:4,
        District:"Kegalle",
        Area:"Habaraduwa",
        Mobile:"0779876665"
    },
    {
        name:"Emma",
        ID:5,
        District:"Jaffna",
        Area:"ahangama",
        Mobile:"0779876665"
    },
    {
        name:"Ava",
        ID:6,
        District:"Matara",
        Area:"ahangama",
        Mobile:"0779876665"
    },
]
// var body = document.getElementsByTagName("body")[0];
    var body=document.getElementById("mainContent")
    var tbl = document.createElement("table");
    tbl.classList.add("table")
    var tblBody = document.createElement("tbody");
    headers=["name","ID","District","Area","Mobile","update","ReNew","Block"]
    var row = document.createElement("tr");
    headers.map((item=>{
        row.classList.add("thead")
        var cell = document.createElement("th");
        var cellText = document.createTextNode(item);
        cell.appendChild(cellText);
        row.appendChild(cell);
        tblBody.appendChild(row);
    }))
    data.map((item)=>{
        tblBody.innerHTML+=`
            <tr>
                        <td data-label="Name">${item.name}</td>
                        <td data-label="Id">${item.ID}</td>
                        <td data-label="Didtrict">${item.District}</td>
                        <td data-label="Area">${item.Area}</td>
                        <td data-label="Mobile">${item.Mobile}</td>
                        <td class="update" data-label="update"><button>Update</button></td>
                        <td class="Block"  data-label="ReNew"><button>Re New MAC</button></td>
                        <td class="Block"  data-label="Block"><button>Block</button></td>
            </tr>
            `
        tbl.appendChild(tblBody);
        body.appendChild(tbl);
    })
function check(){
    tblBody.innerHTML=''
    headers=["name","ID","District","Area","Mobile","update","ReNew","Block"]
    var row = document.createElement("tr");
    headers.map((item=>{
        row.classList.add("thead")
        var cell = document.createElement("th");
        var cellText = document.createTextNode(item);
        cell.appendChild(cellText);
        row.appendChild(cell);
        tblBody.appendChild(row);
    }))
    var select = document.getElementById("select")
    var select1 = document.getElementById("select1")
    var value = select.options[select.selectedIndex].value;
    var value1 = select1.options[select1.selectedIndex].value;

    data.map((item)=>{
            if(item.District==value||item.Area==value1){
                tblBody.innerHTML+=`
        <tr>
                    <td data-label="Name">${item.name}</td>
                    <td data-label="Id">${item.ID}</td>
                    <td data-label="Didtrict">${item.District}</td>
                    <td data-label="Area">${item.Area}</td>
                    <td data-label="Mobile">${item.Mobile}</td>
                    <td class="update" data-label="update"><button>Update</button></td>
                    <td class="Block"  data-label="ReNew"><button>Re New MAC</button></td>
                    <td class="Block"  data-label="Block"><button>Block</button></td>
        </tr>
        `

                tbl.appendChild(tblBody);
                body.appendChild(tbl);

            }
        }
    )}