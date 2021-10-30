// data=[{
//     Head:"Liam",
//     District:"Matara",
//     MOHName:"ahangama",
//     Mobile:"0779876665"
// },
//     {
//         Head:"Charlotte",
//         District:"Colombo",
//         MOHName:"Ahangama",
//         Mobile:"0779876665"
//     },
//     {
//         Head:"Noah",
//         District:"Nuwara",
//         MOHName:"Habaraduwa",
//         Mobile:"0779876665"
//     },
//     {
//         Head:"Olivia",
//         District:"Kegalle",
//         MOHName:"Habaraduwa",
//         Mobile:"0779876665"
//     },
//     {
//         Head:"Emma",
//         District:"Jaffna",
//         MOHName:"Galle",
//         Mobile:"0779876665"
//     },
//     {
//         Head:"Ava",
//         District:"Matara",
//         MOHName:"Karandugoda",
//         Mobile:"0779876665"
//     },
// ]
// // var body = document.getElementsByTagName("body")[0];
// var body=document.getElementById("mainContent")
// var tbl = document.createElement("table");
// tbl.classList.add("table")
// var tblBody = document.createElement("tbody");
// headers=["MOH name","District","Head","Mobile","update"]
// var row = document.createElement("tr");
// headers.map((item=>{
//     row.classList.add("thead")
//     var cell = document.createElement("th");
//     var cellText = document.createTextNode(item);
//     cell.appendChild(cellText);
//     row.appendChild(cell);
//     tblBody.appendChild(row);
// }))
// data.map((item)=>{
//     tblBody.innerHTML+=`
//     <tr>
//                 <td data-label="MOHName">${item.MOHName}</td>
//                 <td data-label="Didtrict">${item.District}</td>
//                 <td data-label="Head">${item.Head}</td>
//                 <td data-label="Mobile">${item.Mobile}</td>
//                 <td class="update" data-label="update"><button>Update</button></td>
//     </tr>
//     `
//     tbl.appendChild(tblBody);
//     body.appendChild(tbl);
// })
// function check(){
//     tblBody.innerHTML=''
//     headers=["MOH name","District","Head","Mobile","update"]
//     var row = document.createElement("tr");
//     headers.map((item=>{
//         row.classList.add("thead")
//         var cell = document.createElement("th");
//         var cellText = document.createTextNode(item);
//         cell.appendChild(cellText);
//         row.appendChild(cell);
//         tblBody.appendChild(row);
//     }))
//     var select = document.getElementById("select")
//     var select1 = document.getElementById("select1")
//     var value = select.options[select.selectedIndex].value;
//     var value1 = select1.options[select1.selectedIndex].value;
//
//     data.map((item)=>{
//             if(item.District==value||item.MOHName==value1){
//                 tblBody.innerHTML+=`
//     <tr>
//                 <td data-label="MOHName">${item.MOHName}</td>
//                 <td data-label="Didtrict">${item.District}</td>
//                 <td data-label="Head">${item.Head}</td>
//                 <td data-label="Mobile">${item.Mobile}</td>
//                 <td class="update" data-label="update"><button>Update</button></td>
//     </tr>
//     `
//
//                 tbl.appendChild(tblBody);
//                 body.appendChild(tbl);
//
//             }
//
//
//         }
//     )}


class MOHlist {
    // clinicListArray = [
    //     {
    //         clinicID:" ",
    //         disease:" ",
    //         title:" ",
    //         MOH:" ",
    //         conduct:" ",
    //         datetime:" ",
    //         description:" ",
    //         duration:" ",
    //         location:" ",
    //         maxpatient:" "
    //     }
    // ];


    container;

    constructor(container) {
        this.container = document.getElementById(container);
    }
    setData(data) {
        // if(!data) return;
        // this.clinicListArray = data;
        // console.log(data);
        // this.clinicListArray.map((item) => {
        //     this.container.innerHTML += `
        //        <div class="live-card">
        //             <div class="clinic-title"  id="clinic-title">${item.disease} Awareness clinic</div>
        //             <div class="clinic-date">${item.datetime}</div>
        //             <div class="clinic-description">${item.description}</div>
        //             <div class="clinic-details">
        //                 <div class="location" id="item1"><span><span class="locationimg"><object data="${Url}/public/images/icons/map-pin.svg" width="8" height="8"> </object></span> Location :</span> ${item.location}</div>
        //                 <div class="conduct"  id="item2"><span><span><object data="${Url}/public/images/icons/user.svg" width="8" height="8"> </object></span> Conduct :</span> ${item.conduct}</div>
        //                 <div class="max-limit"  id="item3"><span><span><object data="${Url}/public/images/icons/users.svg" width="8" height="8"> </object></span> Max participant limit :</span>${item.maxpatient}</div>
        //                 <div class="moh-area"  id="4"><span><span><object data="${Url}/public/images/icons/map-pin.svg" width="8" height="8"> </object> </span> MOH Area :</span>${item.MOH}</div>
        //                 <div class="target-participants"  id="item5"><span><span><object data="${Url}/public/images/icons/book-open.svg" width="8" height="8"> </object></span> Target participant :</span> ${item.title}</div>
        //             </div>
        //             <div class="down-box">
        //                 <div class="current-participant-count">
        //                     <div class="current-participant-img"><object data="${Url}/public/images/icons/users.svg" width="15" height="15"> </object></div>
        //                     <div class="count-participants">120, 221</div>
        //                 </div>
        //                 <div class="buttons">
        //
        //                     <div onclick="popup.showDeleteClinicAlertMessage(${item.clinicID})" class="delete-button">Delete</div>
        //                     <div class="edit-button" onclick="window.location='http://localhost:8093/test_war_exploded/s/create-clinic';">Edit</div>
        //
        //                 </div>
        //             </div>
        //       </div>
        //     `
        //     ;
        //     console.log("map")
        // })
        alert("came")
    }



//

}