// let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
class registeredclinicList {

    clinicListArray = [
        {
            title:" ",
            disease:"",
            location:" ",
            MOH:" ",
            datetime:" ",
            // duration:" ",
            maxpatient:" ",
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
        this.clinicListArray.map((item) => {
            this.container.innerHTML += `

                     <div class="clinic-card-container">
                            <div class="clinic-card">
                                <div class="title">
                                    ${item.disease} Awareness Session
                                    <p> ${item.datetime}</p>
                                </div>
                                <div class="desc">
                                    ${item.description}
                                </div>
                                <div class="properties">
                                    <ul>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/map-pin.svg"/>" width="15px" />
                                            Location : ${item.location}
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />
                                            Conduct : ${item.conduct}
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />
                                            Max participant limit : ${item.maxpatient}
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />
                                            MOH Area :${item.MOH}
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />
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
                                        <img src="<c:url value="/public/images/icons/users.svg"/>" width="18px" />
                                        120,22
                                    </div>
                                    <div class="register-btn">
                                        Registered
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