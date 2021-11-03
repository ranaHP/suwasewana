// alert("hi")

let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
class clinicList {
    clinicListArray = [
        {
            vcs_id:" ",
            tittle:" ",
            start_date_time:" ",
            duration:" ",
            description:" ",
            max_patient:" ",
            target_moh:" ",
            target_people:" ",
            target_age_limit:" ",
            v_id:" ",
            location:"",
            dose_count:""
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
                    <div class="clinic-title"  id="clinic-title">${item.tittle}</div>
                    <div class="clinic-date" id="date">${item.start_date_time}</div>
                    <div class="clinic-date" id="date">Clinic ID: ${item.vcs_id}</div>
                    <div class="clinic-description">${item.description}</div>
                    <div class="clinic-details">
                        <div class="location" id="item1"><span><span class="locationimg"><object data="${Url}/public/images/icons/map-pin.svg" width="8" height="8"> </object></span> Location :</span> ${item.location}</div>
                        <div class="dose"  id="item2"><span><span><object data="${Url}/public/images/icons/user.svg" width="8" height="8"> </object></span> Dose count :</span> ${item.dose_count}</div>
                        <div class="max-limit"  id="item3"><span><span><object data="${Url}/public/images/icons/users.svg" width="8" height="8"> </object></span> Max participant limit :</span>${item.max_patient}</div>
                        <div class="moh-area"  id="moh-area"><span><span><object data="${Url}/public/images/icons/map-pin.svg" width="8" height="8"> </object> </span> MOH Area :</span>takeMOH(${item.target_moh})</div>
                        <div class="target-participants"  id="item5"><span><span><object data="${Url}/public/images/icons/book-open.svg" width="8" height="8"> </object></span> Target participant :</span> ${item.target_people}</div>
                        <div class="age"  id="4"><span><span><object data="${Url}/public/images/icons/map-pin.svg" width="8" height="8"> </object> </span> Age limit :</span>${item.target_age_limit}</div>
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

function searchD(){
    let count=0
    const input = document.getElementById('clinicID').value;
    const cardContainor = document.getElementById('card-containor');
    const card = cardContainor.getElementsByClassName('live-card')
    for(let i=0 ; i<card.length ;i++){
        let title = card[i].querySelector('#date');
        // alert(title)

        if(title.innerHTML.indexOf(input) > -1){
            card[i].style.display=""
        }else{
            card[i].style.display="none"
        }
    }
}