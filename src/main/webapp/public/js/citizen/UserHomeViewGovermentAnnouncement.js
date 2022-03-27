let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

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
        console.log("data js")
    }
    setData(data) {
        if(!data) return;
        this. gannouncementArray = data;
        console.log(data);
        this. gannouncementArray.map((item) => {


            let expday = new Date(item.expire_date)
            let current_day=new Date();
            console.log(expday)
            console.log(current_day)

            if(current_day<=expday) {
                this.container.innerHTML += `

                    <div class="latest-announstment-cards-container" style="font-family: Segoe UI">
                        <div class="latest-announstment-card">
                            <div class="image-container">
                                <img src="${myUrl}/public/images/uploadimage/${item.banner}" width="100%" height="60%">
<!--                                <div class="read-more-btn">-->
<!--                                    Read More-->
<!--                                </div>-->
                            </div>
                            <div class="header" style="padding-left: 10px">
                                ${item.title}
                            </div>
                            <div class="suwasaewana">
                                SUWASEWANA.LK
                            </div>
                            <div class="posted-time">
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



