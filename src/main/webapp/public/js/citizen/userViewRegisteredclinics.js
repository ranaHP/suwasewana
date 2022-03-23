// let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
class registeredclinicList {

    clinicListArray = [
        {
            UNic:"",
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
        this.container.innerHTML = " ";
        this.clinicListArray.map((item) => {
            this.container.innerHTML += `

                     <div class="clinic-card-container">
                            <div class="clinic-card">
                                <div class="title">
                                    ${item.disease} Awareness Session
                                    <p> ${item.datetime}</p>
                                    <p> ${item.time}</p>
                                </div>
                                <div class="desc">
                                    ${item.description}
                                </div>
                                <div class="properties">
                                    <ul>
                                        <li>
                                           
                                            <object data="${Url}/public/images/icons/book-open.svg" width="8" height="8"> </object>
              
                                            Location : ${item.location}
                                        </li>
                                       
                                        <li>
                                           <object data="${Url}/public/images/icons/book-open.svg" width="8" height="8"> </object>
                                            Conduct : ${item.conduct}
                                        </li>
                                        <li>
                                            <object data="${Url}/public/images/icons/book-open.svg" width="8" height="8"> </object>
                                            Max participant limit : ${item.maxpatient}
                                        </li>
                                        <li>
                                            <object data="${Url}/public/images/icons/book-open.svg" width="8" height="8"> </object>
                                            Disease :${item.disease}
                                        </li>
                                        <li>
                                            <object data="${Url}/public/images/icons/book-open.svg" width="8" height="8"> </object>
                                            Target participant :${item.Target}
                                        </li>
                                    </ul>
                                </div>
                                <!-- <div class="row">
                                    <div class="special-note">
                                        Special note: <div id="special-note">
                                            There are no speacific messages
                                        </div>
                                    </div>
                                </div> -->
                                <div class="footer">
                                    <div class="current-registered-count">
                                      
                                    </div>
                                    <div class="register-btn" style="background-color: #EB3B5AFF" onclick="cancel(`+item.UNic+`,+`+item.MOH+`)">
                                        Cancel
                                    </div>
                                </div>
                            </div>
                        </div>
            `
            ;
            console.log("map")
        })
    }

}