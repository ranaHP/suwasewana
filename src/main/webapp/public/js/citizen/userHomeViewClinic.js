let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
class clinicList {

    clinicListArray = [
        {
            ncs_id:"",
            title:" ",
            disease:"",
            location:" ",
            MOH:" ",
            datetime:" ",
            time:" ",
            // duration:" ",
            maxpatient:" ",
            Avail_seats:" ",
            Target:"",
            conduct:" ",
            description:" "


        }
    ];

    container;

    constructor(container) {
        this.container = document.getElementById(container);
    }
    setData(data) {
        if(!data) return;
        this.clinicListArray = data;
        console.log("set data");
        console.log(data);

        // console.log("today : "+current_day+" "+"exp_day : "+expday);

        this.clinicListArray.map((item) => {
            let expday = new Date(item.datetime)
            let current_day=new Date();
            console.log(current_day)
            let a = document.getElementById("register-btn");
            if(current_day<=expday){
                this.container.innerHTML += `

                                <div class="clinic-card-container">
                    <div class="clinic-card">
                        <div class="header">
                             ${item.disease} Awareness Session
                            <p>  ${item.datetime}</p>
                        </div>
                        <div class="desc">
                        ${item.description}
                        </div>
                        <div class="properties">
                            <ul>
                                <li>
                                    <object data="${Url}/public/images/icons/map-pin.svg" width="15px"> </object>
                                    Location :  ${item.location}
                                </li>
                                           
                                <li>
                                    <object data="${Url}/public/images/icons/users.svg" width="15px"> </object>
                                    Available seats :  ${item.Avail_seats}
                                </li>
                                <li>
                                    <object data="${Url}/public/images/icons/list.svg" width="15px"> </object>
                                    Conduct :  ${item.conduct}
                                </li>
                                <li>
                                     <object data="${Url}/public/images/icons/list.svg" width="15px"> </object>
                                    Max participant limit :  ${item.maxpatient}
                                </li>
                                <li>
                                     <object data="${Url}/public/images/icons/list.svg" width="15px"> </object>
                                    MOH Area : ${item.MOH}
                                </li>
                                <li>
                                     <object data="${Url}/public/images/icons/list.svg" width="15px"> </object>
                                    Target participant : ${item.Target}
                                </li>
                            </ul>
                        </div>
                        <div class="footer">
                            <div class="current-registered-count">
                                 <object data="${Url}/public/images/icons/users.svg" width="15px"> </object>
                                120,22
                            </div>
                            <div class="register-btn" onclick="checkAvailbale(`+item.ncs_id+`,`+item.maxpatient+`,`+item.Avail_seats+`)">
                                Register
                            </div>
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