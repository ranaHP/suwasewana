announcement=[{
    title:"Dengue awareness session",
    description:"Awareness clinic for educate prevention method when you affected with Dengue.Awareness clinic for educate prevention method when you affected with Dengue",
    Target:"Dengue patients",
    Location:"Town hall",
    Date:"2020.03.05",
    Time:"7.00 A.M.",
    Duration:"5 hours",
    Conductedby:"Dr.jorge",
    Maxlimit:16,
},
    {
        title:"Maleria awareness session",
        description:"Awareness clinic for educate prevention method when you affected with Dengue.Awareness clinic for educate prevention method when you affected with Dengue",
        Target:"Maleria patients",
        Location:"Town hall",
        Date:"2020.03.05",
        Time:"7.00 A.M.",
        Duration:"5 hours",
        Conductedby:"Dr.jorge",
        Maxlimit:16,
    },
    {
        title:"Corona awareness session",
        description:"Awareness clinic for educate prevention method when you affected with Dengue.Awareness clinic for educate prevention method when you affected with Dengue",
        Target:"Corona patients",
        Location:"Town hall",
        Date:"2020.03.05",
        Time:"7.00 A.M.",
        Duration:"5 hours",
        Conductedby:"Dr.jorge",
        Maxlimit:16,
    },
    {
        title:"Thiroxine awareness session",
        description:"Awareness clinic for educate prevention method when you affected with Dengue.Awareness clinic for educate prevention method when you affected with Dengue",
        Target:"Thiroxine patients",
        Location:"Town hall",
        Date:"2020.03.05",
        Time:"7.00 A.M.",
        Duration:"5 hours",
        Conductedby:"Dr.jorge",
        Maxlimit:16,
    }
]

let container= document.getElementById('announcements-container')

announcement.map((item=>{
        let announcements = document.createElement("div")
        announcements.classList.add("announcement")
        announcements.innerHTML=`
    <div class="left">
    <div class="announcement-title" id="title">${item.title} <span>For</span> ${item.Target} </div>
    <div class="announce-description">Awareness clinic for educate prevention method when you affected with Dengue.Awareness clinic for educate prevention method when you affected with Dengue
    </div>
    <div class="announce-details">
        <div class="detail"><p><object data="../icons/map-pin.svg" width="8" height="8"> </object> Location</p> <span>  ${item.Location}       </span></div>
        <div class="detail"><p><object data="../icons/calendar.svg" width="8" height="8"> </object> Date</p> <span> ${item.Date}</span></div>
        <div class="detail"><p><object data="../icons/clock.svg" width="8" height="8"> </object> Time</p> <span>${item.Time}</span></div>
        <div class="detail"><p><object data="../icons/bell.svg" width="8" height="8"> </object> Duration</p> <span> ${item.Duration}      </span>  </div>
        <div class="detail"><p><object data="../icons/award.svg" width="8" height="8"> </object> Conducted by</p> <span>${item.Conductedby}    </span></div>
        <div class="detail"><p><object data="../icons/check-circle.svg" width="8" height="8"> </object> Max limit</p> <span>${item.Maxlimit}   </span></div>
    </div>
</div>
<div class="right">
    <div class="image">
        <img src="image1.png" width="80%">
    </div>
    <div class="button-section">
        <div class="delete">
            <button>Delete</button>
        </div>
        <div class="Edit">
            <button>Edit</button>
        </div>
    </div>
</div>
    `
        container.appendChild(announcements)
        console.log("gg")
    }
))



function search(){
    let count=0
    const input = document.getElementById('filter').value.toUpperCase();
    const cardContainor = document.getElementById('announcements-container');
    const card1 = cardContainor.getElementsByClassName('announcement')

    for(let i=0 ; i<card1.length ;i++){
        let title = card1[i].querySelector('#title');

        if(title.innerHTML.toUpperCase().indexOf(input) > -1){
            card1[i].style.display=""
        }
        else{
            card1[i].style.display="none"
        }
    }

}

