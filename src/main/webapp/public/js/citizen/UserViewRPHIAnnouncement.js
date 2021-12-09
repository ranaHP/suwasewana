
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
    url = "http://localhost:8080/test_war_exploded/public/";
    constructor(container) {
        this.container = document.getElementById(container);
    }
    setData(data) {
        if(!data) return;
        this.announcementArray = data;
        this.container.innerHTML=" ";

        this.announcementArray.map((item) => {
            let expday = new Date(item.exp_date)
            let current_day=new Date();
            console.log(current_day)
            // console.log("today : "+current_day+" "+"exp_day : "+expday);
            if(current_day<=expday){
                console.log("bi");


                this.container.innerHTML += `

                              <div class="latest-announstment-cards-container">
                            <div class="latest-announstment-card">
                                <div class="image-container">
                                    <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>
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
                                <div class="posted-time">
                                    ${item.posted_date}
                                </div>
                                <div class="desc">
                                    ${item.description}
                                </div>

                            </div>
                        </div>
            `;}
        })

        // alert("hi")
    }




}