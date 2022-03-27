// let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

// let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
class View_RPHI_announcement{
    announcementArray=[
        {
            announcement_id:"",
            title:"",
            description:"",
            banner:"",
            target_moh:"",
            posted_date:"",
            phi_officer:"",
            expire_date:""
        }
    ];

    container;

    constructor(container) {
        this.container = document.getElementById(container);
    }
    setData(data) {
        if(!data) return;
        this. announcementArray = data;
        console.log(data);
        this. announcementArray.map((item) => {

            let expday = new Date(item.expire_date)
            let current_day=new Date();
            console.log(expday)
            console.log(current_day)

            if(current_day<=expday) {
                this.container.innerHTML += `

                              <div class="latest-announstment-cards-container" style="font-family: Segoe UI">
                            <div class="latest-announstment-card">
                                <div class="image-container">
                                
                                <img src="${myUrl}/public/images/uploadimage/${item.banner}" width="100%" height="50%">

<!--                                    <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>-->
<!--                                    <div class="read-more-btn">-->
<!--                                        Read More-->
<!--                                    </div>-->
                                </div>
                                <div class="title" id="title" style="padding-left: 10px">
                                    ${item.title}
                                </div>
                                <div class="suwasaewana">
                                    SUWASEWANA.LK
                                </div>
                                <div class="posted-time" id="posted-time">
                                    ${item.expire_date}
                                </div>
                                <div class="desc">
                                    ${item.description}
                                </div>

                            </div>
                        </div>
            `
            }
            ;
            console.log("map")
        })
    }

}

function searchphidate(){
    let count=0
    const input = document.getElementById('diseasesSearch22').value;
    const cardContainor = document.getElementById('announcetment-list-card-container2');
    const card = cardContainor.getElementsByClassName('latest-announstment-cards-container')
    for(let i=0 ; i<card.length ;i++){
        let title = card[i].querySelector('#posted-time');
        // alert(title)

        if(title.innerHTML.indexOf(input) > -1){
            card[i].style.display=""
        }else{
            card[i].style.display="none"
        }
    }}


function searchphi() {
    let count = 0
    const input = document.getElementById('diseasesSearch21').value.toUpperCase();
    const cardContainor = document.getElementById('announcetment-list-card-container2');
    const card1 = cardContainor.getElementsByClassName('latest-announstment-cards-container')

    for (let i = 0; i < card1.length; i++) {
        let title = card1[i].querySelector('#title');

        if (title.innerHTML.toUpperCase().indexOf(input) > -1) {
            card1[i].style.display = ""
        } else {
            card1[i].style.display = "none"
        }
    }

}