data=[{
    Head:"Liam",
    District:"Matara",
    MOHName:"ahangama",
    Mobile:"0779876665"
},
    {
        Head:"Charlotte",
        District:"Colombo",
        MOHName:"Ahangama",
        Mobile:"0779876665"
    },
    {
        Head:"Noah",
        District:"Nuwara",
        MOHName:"Habaraduwa",
        Mobile:"0779876665"
    },
    {
        Head:"Olivia",
        District:"Kegalle",
        MOHName:"Habaraduwa",
        Mobile:"0779876665"
    },
    {
        Head:"Emma",
        District:"Jaffna",
        MOHName:"Galle",
        Mobile:"0779876665"
    },
    {
        Head:"Ava",
        District:"Matara",
        MOHName:"Karandugoda",
        Mobile:"0779876665"
    },
]
// var body = document.getElementsByTagName("body")[0];
var body=document.getElementById("mainContent")
var tbl = document.createElement("table");
tbl.classList.add("table")
var tblBody = document.createElement("tbody");
headers=["MOH name","District","Head","Mobile","update"]
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
                <td data-label="MOHName">${item.MOHName}</td>
                <td data-label="Didtrict">${item.District}</td>
                <td data-label="Head">${item.Head}</td>
                <td data-label="Mobile">${item.Mobile}</td>
                <td class="update" data-label="update"><button>Update</button></td>
    </tr>
    `
    tbl.appendChild(tblBody);
    body.appendChild(tbl);
})
function check(){
    tblBody.innerHTML=''
    headers=["MOH name","District","Head","Mobile","update"]
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
            if(item.District==value||item.MOHName==value1){
                tblBody.innerHTML+=`
    <tr>
                <td data-label="MOHName">${item.MOHName}</td>
                <td data-label="Didtrict">${item.District}</td>
                <td data-label="Head">${item.Head}</td>
                <td data-label="Mobile">${item.Mobile}</td>
                <td class="update" data-label="update"><button>Update</button></td>
    </tr>
    `

                tbl.appendChild(tblBody);
                body.appendChild(tbl);

            }


        }
    )}