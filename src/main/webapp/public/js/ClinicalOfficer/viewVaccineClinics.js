// alert("hi")

let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
class clinicList {
    clinicListArray = [
        {
            clinicID:" ",
            disease:" ",
            title:" ",
            MOH:" ",
            conduct:" ",
            datetime:" ",
            description:" ",
            duration:" ",
            location:" ",
            maxpatient:" "
        }
    ];


    container;

    constructor(container) {
        this.container = document.getElementById(container);
    }
    setData(data) {
        if(!data) return;
        this.clinicListArray = data;
        console.log(data);
        this.clinicListArray.map((item) => {
            this.container.innerHTML += `
               <div class="live-card">
                    <div class="clinic-title"  id="clinic-title">${item.disease} Awareness clinic</div>
                    <div class="clinic-date">${item.datetime}</div>
                    <div class="clinic-description">${item.description}</div>
                    <div class="clinic-details">
                        <div class="location" id="item1"><span><span class="locationimg"><object data="${Url}/public/images/icons/map-pin.svg" width="8" height="8"> </object></span> Location :</span> ${item.location}</div>
                        <div class="conduct"  id="item2"><span><span><object data="${Url}/public/images/icons/user.svg" width="8" height="8"> </object></span> Conduct :</span> ${item.conduct}</div>
                        <div class="max-limit"  id="item3"><span><span><object data="${Url}/public/images/icons/users.svg" width="8" height="8"> </object></span> Max participant limit :</span>${item.maxpatient}</div>
                        <div class="moh-area"  id="4"><span><span><object data="${Url}/public/images/icons/map-pin.svg" width="8" height="8"> </object> </span> MOH Area :</span>${item.MOH}</div>
                        <div class="target-participants"  id="item5"><span><span><object data="${Url}/public/images/icons/book-open.svg" width="8" height="8"> </object></span> Target participant :</span> ${item.title}</div>
                    </div>
                    <div class="down-box">
                        <div class="current-participant-count">
                            <div class="current-participant-img"><object data="${Url}/public/images/icons/users.svg" width="15" height="15"> </object></div>
                            <div class="count-participants">120, 221</div>
                        </div>
                        <div class="buttons">

                            <div onclick="popup.showDeleteClinicAlertMessage(${item.clinicID})" class="delete-button">Delete</div>
                            <div class="edit-button" onclick="window.location='http://localhost:8093/test_war_exploded/s/create-clinic';">Edit</div>

                        </div>
                    </div>
              </div>
            `
            ;
            console.log("map")
        })
    }
}


//
function search(){
    let count=0
    const input = document.getElementById('filter').value.toUpperCase();
    const cardContainor = document.getElementById('card-containor');
    const card = cardContainor.getElementsByClassName('live-card')
    for(let i=0 ; i<card.length ;i++){
        let title = card[i].querySelector('#clinic-title');

        if(title.innerHTML.toUpperCase().indexOf(input) > -1){
            card[i].style.display=""
        }else{
            card[i].style.display="none"
        }
    }
}