
class healthannouncement {
    announcementListArray = [
        {
            title:" ",
            description:" ",
            banner:" "

        }
    ];


    container;

    constructor(container) {
        this.container = document.getElementById(container);
    }
    setData(data) {
        if(!data) return;
        this.announcementListArray = data;
        console.log(data);
        this.announcementListArray.map((item) => {
            this.container.innerHTML += `
                <div class="latest-announstment-cards-container">
                    <div class="latest-announstment-card">
                        <div class="image-container">
                            <img src="images//announcetment_banner.png" width="100%"/>
                            <div class="read-more-btn">
                                Read More
                            </div>
                        </div>
                        <div class="header">
                            ${item.title}
                        </div>
                        <div class="suwasaewana">
                            SUWASEWANA.LK
                        </div>
                        <div class="posted-time">
                            ${item.banner}
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