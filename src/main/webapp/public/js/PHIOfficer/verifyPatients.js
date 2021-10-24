requests=[{
    name:"Akila anjana dissanayaka",
    reason:"Request for register Corona",
    location:" Galgamuwa",
    mobile:"0713805000",
    age:"23 years",
    date:"09/18/2021"
},
    {
        name:"Ava anjana dissanayaka",
        reason:"Request for register Corona",
        location:" Galgamuwa",
        mobile:"0713805000",
        age:"23 years",
        date:"09/18/2021"
    },
    {
        name:"Mar anjana dissanayaka",
        reason:"Request for register Corona",
        location:" Galgamuwa",
        mobile:"0713805000",
        age:"23 years",
        date:"09/18/2021"
    },
    {
        name:"Gorge anjana dissanayaka",
        reason:"Request for register Corona",
        location:" Galgamuwa",
        mobile:"0713805000",
        age:"23 years",
        date:"09/18/2021"
    },
    {
        name:"Gor anjana dissanayaka",
        reason:"Request for register Corona",
        location:" Galgamuwa",
        mobile:"0713805000",
        age:"23 years",
        date:"09/18/2021"
    },
]

let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
let container=document.getElementById("request-container")
// let url=""
requests.map((item=>{
    let request = document.createElement("div")
    request.classList.add("request-card")
    request.innerHTML=`
    <div class="details">
    <div class="name f-black"  id="name">
        ${item.name}
    </div>
    <div class="reason f-2">
         ${item.reason}
    </div>
</div>
<div class="right">
     <div class="information">
       <div class="up">
           <div class="location f-4"><object data="${Url}/public/images/icons/map-pin.svg" width="8" height="8"> </object> ${item.location}</div>
           <div class="mobile f-4"><object data="${Url}/public/images/icons/phone.svg" width="8" height="8"> </object> ${item.mobile}</div>
       </div>
       <div class="down">
           <div class="age f-4"><object data="${Url}/public/images/icons/bar-chart-2.svg" width="8" height="8"> </object> ${item.age}</div>
           <div class="date f-4"><object data="${Url}/public/images/icons/calendar.svg" width="8" height="8"> </object> ${item.date}</div>
       </div>
</div>
<div class="buttons">
         <div class="up-buttons">
             <button class="accept-b">Accept</button>
             <button class="reject-b">Reject</button>
         </div>
         <div class="down-buttons">
             <button class="view-b" onclick="popup.showPopup()">View patient</button>
         </div>
</div>
</div>
    `
    container.appendChild(request)
}))




function search(){
    let count=0
    const input = document.getElementById('filter').value.toUpperCase();
    const cardContainor = document.getElementById('request-container');
    const card = cardContainor.getElementsByClassName('request-card')

    for(let i=0 ; i<card.length ;i++){
        let title = card[i].querySelector('#name');

        if(title.innerHTML.toUpperCase().indexOf(input) > -1){
            card[i].style.display=""
        }else{
            card[i].style.display="none"
        }
    }
}