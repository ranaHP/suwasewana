// let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

// let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
class View_clinic_announcement{
    announcementArray=[
        {
            banner:"",
            date:"",
            descrition:"",
            moh_id:"",
            tittle:"",

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


            let expday = new Date(item.date)
            let current_day=new Date();
            console.log(expday)
            console.log("============================================")
            console.log(current_day)
            console.log("============================================")

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
                                    ${item.tittle}
                                </div>
                                <div class="suwasaewana">
                                    SUWASEWANA.LK
                                </div>
                                <div class="posted-time" id="date">
                                    ${item.date}
                                </div>
                                <div class="desc">
                                    ${item.descrition}
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

function searchclinicdate(){
    let count=0
    const input = document.getElementById('diseases1').value;
    const cardContainor = document.getElementById('announcetment-list-card-container');
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


function searchclinic() {
    let count = 0
    const input = document.getElementById('diseases2').value.toUpperCase();
    const cardContainor = document.getElementById('announcetment-list-card-container');
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