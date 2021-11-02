let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
class viewAnnouncements{
    announcementArray=[
        {
            title:"",
            description:"",
            banner:"",
            vaccine_id:"",
            max_sheet:"",
            location:"",
            target_people:"",
            datetime:"",
            duration:"",
            age_limit:"",
            target_moh:"",
            vaccine_clinic_id:""
        }

    ];
    container;

    constructor(container) {
        this.container = document.getElementById(container);
    }
    setData(data) {
        if(!data) return;
        this.announcementArray = data;
        console.log(data);
        this.announcementArray.map((item) => {
            this.container.innerHTML += `
              <div class="announcement">
                      <div class="left">
    <div class="announcement-title" id="title">${item.title} <span>For</span> ${item.target_people} </div>
    <div class="announce-description">${item.description}
    </div>

    <div class="announce-details">
        <div class="detail"><p><object data="${myUrl}/public/images/icons/map-pin.svg" width="8" height="8"> </object> Location</p> <span>  ${item.location}       </span></div>
        <div class="detail"><p><object data="${myUrl}/public/images/icons/calendar.svg" width="8" height="8"> </object> Date Time</p> <span> ${item.datetime}</span></div>
        <div class="detail"><p><object data="${myUrl}/public/images/icons/clock.svg" width="8" height="8"> </object>vaccine</p> <span>${item.vaccine_id}</span></div>
        <div class="detail"><p><object data="${myUrl}/public/images/icons/bell.svg" width="8" height="8"> </object> Duration</p> <span> ${item.duration}      </span>  </div>
        <div class="detail"><p><object data="${myUrl}/public/images/icons/award.svg" width="8" height="8"> </object> Age limit</p> <span>${item.age_limit}    </span></div>
<!--        <div class="detail"><p><object data="${myUrl}/public/images/icons/award.svg" width="8" height="8"> </object> Target people</p> <span>${item.target_people}    </span></div>-->
        <div class="detail"><p><object data="${myUrl}/public/images/icons/check-circle.svg" width="8" height="8"> </object> Max limit</p> <span>${item.max_sheet}   </span></div>
    </div>
</div>
<div class="right">
    <div class="image">
        <img src="${myUrl}/public/images/disease-banner.png" width="80%">
    </div>
    <div class="button-section">
        <div class="delete">
            <button onclick="popup.showDeleteAnnouncementAlertMessage(${item.vaccine_clinic_id})" >Delete</button>
        </div>
        <div class="Edit">
            <button>Edit</button>
        </div>
    </div>
</div>
             </div>
            `
            ;
            console.log("map")
            console.log(item.vaccine_clinic_id)
        })
    }
}



function search() {
    let count = 0
    const input = document.getElementById('filter').value.toUpperCase();
    const cardContainor = document.getElementById('announcements-container');
    const card1 = cardContainor.getElementsByClassName('announcement')

    for (let i = 0; i < card1.length; i++) {
        let title = card1[i].querySelector('#title');

        if (title.innerHTML.toUpperCase().indexOf(input) > -1) {
            card1[i].style.display = ""
        } else {
            card1[i].style.display = "none"
        }
    }

}

