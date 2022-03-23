
let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
class clinicList {
    clinicListArray = [
        {
            Avail_seats:"",
            clinicID:" ",
            disease:" ",
            title:" ",
            MOH:" ",
            conduct:" ",
            date:" ",
            description:" ",
            duration:" ",
            location:" ",
            maxpatient:" ",
            Target:"",
            time:""
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
        let a=data.maxpatient
        let b=data.Avail_seats
        let c=a-b
        this.clinicListArray.map((item) => {
            this.container.innerHTML += `
               <div class="live-card">
                    <div class="clinic-title"  id="clinic-title">${item.disease} Awareness clinic</div>
                    <div class="clinic-date" id="date">${item.date}</div>
                    <div class="clinic-date" id="date">${item.time}</div>
                    <div class="clinic-description">${item.description}</div>
                    <div class="clinic-details">
                        <div class="clinicID" id="clinicID"><span><span class="locationimg"><object data="${Url}/public/images/icons/map-pin.svg" width="8" height="8"> </object></span> ID :</span> ${item.clinicID}</div>
                        <div class="location" id="location"><span><span class="locationimg"><object data="${Url}/public/images/icons/map-pin.svg" width="8" height="8"> </object></span> Location :</span> ${item.location}</div>
                        <div class="conduct"  id="conduct"><span><span><object data="${Url}/public/images/icons/user.svg" width="8" height="8"> </object></span> Conduct :</span> ${item.conduct}</div>
                        <div class="max-limit"  id="max-limit"><span><span><object data="${Url}/public/images/icons/users.svg" width="8" height="8"> </object></span> Max participant limit :</span>${item.maxpatient}</div>
                        <div class="duration"  id="duration"><span><span><object data="${Url}/public/images/icons/map-pin.svg" width="8" height="8"> </object> </span> Duration :</span>${item.duration}</div>
                        <div class="target-participants"  id="target-participants"><span><span><object data="${Url}/public/images/icons/book-open.svg" width="8" height="8"> </object></span> Target participant :</span> ${item.Target}</div>
                    </div>
                    <div class="down-box">
                        <div class="current-participant-count">
                            <div class="current-participant-img"><object data="${Url}/public/images/icons/users.svg" width="15" height="15"> </object></div>
                            <div class="count-participants">${item.Avail_seats}</div>
                        </div>
                        <div class="buttons">

                            <div onclick="popup.showDeleteClinicAlertMessage(${item.clinicID})" class="delete-button">Delete</div>
                            <div class="edit-button" onclick="select(${item.clinicID})">Edit</div>
                            <div class="delete-button" style="background-color: #1e8348" onclick="selectRe(${item.clinicID})">Reshedule</div>

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