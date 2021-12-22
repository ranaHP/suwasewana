let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
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
            exp_date:""
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
            this.container.innerHTML += `

                              <div class="latest-announstment-cards-container">
                            <div class="latest-announstment-card">
                                <div class="image-container">
                                
                                <img src="${myUrl}/public/images/nature.jpg" width="80%" height="50%">

<!--                                    <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>-->
                                    <div class="read-more-btn">
                                        Read More
                                    </div>
                                </div>
                                <div class="title">
                                    ${item.title}
                                </div>
                                <div class="suwasaewana">
                                    SUWASEWANA.LK
                                </div>
                                <div class="posted-time" id="posted-time">
                                    ${item.posted_date}
                                </div>
                                <div class="desc">
                                    ${item.description}
                                </div>

                            </div>
                        </div>
            `
            ;
            console.log("map")
        })
    }

}

function searchD(){
    let count=0
    const input = document.getElementById('diseasesSearch2').value;
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