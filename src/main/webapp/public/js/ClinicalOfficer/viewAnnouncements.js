let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
class viewAnnouncements{
    announcementArray=[
        {
            a_id:"",
            title:"",
            maxpatient:"",
            location:"",
            duration:"",
            image:" ",
            disease:"",
            description:"",
            datetime:"",
            conduct:"",
            clinicID:"",
            cNic:"",
            Target:"",
            MOH:""
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
    <div class="announcement-title" id="title">${item.title} clinic ${item.Target} </div>
    <div class="announce-description">${item.description}
    </div>

    <div class="announce-details">
        <div class="detail"><p><object data="${myUrl}/public/images/icons/map-pin.svg" width="8" height="8"> </object> Location</p> <span>  ${item.location}       </span></div>
        <div class="detail"><p><object data="${myUrl}/public/images/icons/calendar.svg" width="8" height="8"> </object> Date Time</p> <span> ${item.datetime}</span></div>
        <div class="detail"><p><object data="${myUrl}/public/images/icons/clock.svg" width="8" height="8"> </object> disease</p> <span>${item.disease}</span></div>
        <div class="detail"><p><object data="${myUrl}/public/images/icons/bell.svg" width="8" height="8"> </object> Duration</p> <span> ${item.duration}      </span>  </div>
        <div class="detail"><p><object data="${myUrl}/public/images/icons/award.svg" width="8" height="8"> </object> Conducted by</p> <span>${item.conduct}    </span></div>
        <div class="detail"><p><object data="${myUrl}/public/images/icons/check-circle.svg" width="8" height="8"> </object> Max limit</p> <span>${item.maxpatient}   </span></div>
    </div>
</div>
<div class="right">
    <div class="image">
        <img src="${myUrl}/public/images/uploadimage/${item.image}" width="80px" height="80px" />
    </div>
    <div class="button-section">
        <div class="delete">
            <button onclick="popup.showDeleteAnnouncementAlertMessage(${item.clinicID})" >Delete</button>
        </div>
        <div class="Edit">
<!--            <button>Edit</button>-->
        </div>
    </div>
</div>
             </div>
            `
            ;
            console.log("map")
            console.log(item.clinicID)
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

