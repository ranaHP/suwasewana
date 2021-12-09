// function card(){
//     alert("live card")
// }
let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
function card()
{
    var dose=document.getElementById("Dose-count").value;
    var title=document.getElementById("clinic-title").value;
    var date=document.getElementById("date-time").value;
    var location=document.getElementById("location").value;
    var UAge =document.getElementById("UAge-limit").value;
    var LAge =document.getElementById("LAge-limit").value;
    var max=document.getElementById("max-patient").value;
    var MOH=document.getElementById("MArea").value;
    var duration = document.getElementById("duration").value;
    console.log(dose)
    let clinic = document.getElementById('live-card')
    clinic.innerHTML=" "
    clinic.innerHTML =`
                            <div class="clinic-title"  id="clinic-title"> ${title} </div>
                            <div class="clinic-date">${date}</div>
                            <div class="clinic-details">
                                <div class="location" id="item1"><span><object data="${Url}/public/images/icons/map-pin.svg" width="8" height="8"> </object>Location : ${location}</div>
                                <div class="Age"  id="item2"><span><object data="${Url}/public/images/icons/user.svg" width="8" height="8"> </object>Age limit : ${UAge} to ${LAge}</div>
                                <div class="max-limit"  id="item3"><span><object data="${Url}/public/images/icons/user-check.svg" width="8" height="8"> </object>Max participant limit : ${max}</div>
       
                                <div class="dose"  id="item3"><span><object data="${Url}/public/images/icons/circle.svg" width="8" height="8"> </object>Dose number : ${dose}</div>
                                <div class="moh-area"  id="4"><span><object data="${Url}/public/images/icons/map-pin.svg" width="8" height="8"> </object>MOH Area : ${MOH}</div>
                                <div class="duration"  id="item3"><span><object data="${Url}/public/images/icons/clock.svg" width="8" height="8"> </object>Duration : ${duration}</div>
                            </div>
<!--                            <div class="down-box">-->
<!--                                <div class="current-participant-count">-->
<!--                                    <div class="current-participant-img"><object data="../icons/users.svg" width="18" height="18"> </object></div>-->
<!--                                    <div class="count-participants">120, 221</div>-->
<!--                                </div>-->
<!--                                <div class="buttons">-->
<!--                                    <div class="delete-button">Delete</div>-->
<!--                                    <div class="edit-button">Edit</div>-->
<!--                                </div>-->
<!--                            </div>-->
        `
    console.log("live card");
}