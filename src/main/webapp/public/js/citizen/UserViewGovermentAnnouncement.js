// let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

// let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
class View_goverment_announcement{
    gannouncementArray=[
        {
            announcement_id:"",
            title:"",
            description:"",
            banner:"",
            expire_date:"",

        }
    ];

    container;

    constructor(container) {
        this.container = document.getElementById(container);
        // console.log("data js")
    }
    setData(data) {
        if(!data) return;
        this.gannouncementArray = data;
        console.log(data);
        this.gannouncementArray.map((item) => {

            let expday = new Date(item.expire_date);
            let current_day= new Date();

            console.log(current_day)
            console.log(expday)
            if(current_day<=expday) {
                this.container.innerHTML += `

                      <div class="latest-announstment-cards-container">
                            <div class="latest-announstment-card">
                                <div class="image-container">
                                
                                <img src="${myUrl}/public/images/uploadimage/${item.banner}" width="80%" height="50%">

<!--                                    <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>-->
<!--                                    <div class="read-more-btn">-->
<!--                                        Read More-->
<!--                                    </div>-->
                                </div>
                                <div class="title" id="moh">
                                    ${item.title}
                                </div>
                                <div class="suwasaewana">
                                    SUWASEWANA.LK
                                </div>
                                <div class="posted-time" id="date">
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

function searchgoverment(){
    let count=0
    const input = document.getElementById('diseasesSearch1').value.toUpperCase();
    const cardContainor = document.getElementById('announcetment-list-card-container1');
    const card = cardContainor.getElementsByClassName('latest-announstment-cards-container')
    for(let i=0 ; i<card.length ;i++){
        let title = card[i].querySelector('#moh');

        if(title.innerHTML.toUpperCase().indexOf(input) > -1){
            card[i].style.display=""
        }else{
            card[i].style.display="none"
        }
    }
}

function searchgovermentdate(){
    let count=0
    const input = document.getElementById('diseasesSearch2').value;
    const cardContainor = document.getElementById('announcetment-list-card-container1');
    const card = cardContainor.getElementsByClassName('latest-announstment-cards-container')
    for(let i=0 ; i<card.length ;i++){
        let title = card[i].querySelector('#date');
        // alert(title)

        if(title.innerHTML.indexOf(input) > -1){
            card[i].style.display=""
        }else{
            card[i].style.display="none"
        }
    }}