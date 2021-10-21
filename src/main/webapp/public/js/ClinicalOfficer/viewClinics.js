// <script type="text/javascript" src="../popup.js"></script>
// var ss = required("../popup.js");
// var tt =  new ss.SuwasewanaPopup("container")
class clinicList {
    clinicListArray = [];
    container;
    url = "http://localhost:8080/test_war_exploded/public/";
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
                        <div class="location" id="item1"><span><span class="locationimg"><img src="${this.url}/images/icons/map-pin.svg" width="9px" /></span> Location :</span> ${item.location}</div>
                        <div class="conduct"  id="item2"><span><span><img src="${this.url}/images/icons/user.svg" width="9px" /></span> Conduct :</span> ${item.conduct}</div>
                        <div class="max-limit"  id="item3"><span><span><img src="${this.url}/images/icons/users.svg" width="9px" /></span> Max participant limit :</span>${item.maxpatient}</div>
                        <div class="moh-area"  id="4"><span><span><img src="${this.url}/images/icons/map-pin.svg" width="9px" /></span> MOH Area :</span>${item.MOH}</div>
                        <div class="target-participants"  id="item5"><span><span><img src="${this.url}/images/icons/book-open.svg" width="9px" /></span> Target participant :</span> ${item.title}</div>
                    </div>
                    <div class="down-box">
                        <div class="current-participant-count">
                            <div class="current-participant-img"><img src="${this.url}/images/icons/users.svg" width="17px" /></div>
                            <div class="count-participants">120, 221</div>
                        </div>
                        <div class="buttons">
                            <div class="delete-button">Delete</div>
                            <div class="edit-button">Edit</div>
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