class Appointment {
    AppointmentArray = [];
    container;
    url = "http://localhost:8093/test_war_exploded/public/";
    constructor(container) {
        // this.AppointmentArray = JSON.parse(data);
        // this.AppointmentArray = data;
        // console.log(this.AppointmentArray);
        this.container = document.getElementById(container);
    }

    setData(data) {
        if(!data) return;
        this.AppointmentArray = data;
        console.log(data);
        this.AppointmentArray.map((item) => {
            this.container.innerHTML += `
            <div class="appointment-card-container">
                                <div class="appointment-card">
                                    <div class="title">
                                        ${item.aTitle}
                                        <p> ${item.posted_data}</p>
                                    </div>
                                    <div class="desc">
                                        ${item.reason}
                                    </div>
                                    <div class="properties">    
                                        <ul>
                                            <li>
                                                <img src="${this.url}images/icons/map-pin.svg" width="22px" />
                                                Location : ${item.time_slot1}
                                            </li>
                                            <li>
                                                <img src="${this.url}images/icons/list.svg" width="22px" />
                                                Time Slot 1 :  ${item.time_slot1}
                                            </li>
                                            <li>
                                                <img src="${this.url}images/icons/list.svg" width="22px" />
                                                Time Slot 2 :  ${item.time_slot2}
                                            </li>
                                            <li>
                                                <img src="${this.url}images/icons/list.svg" width="22px" />
                                                Special Notice: No
                                            </li>
                                          
                                        </ul>
                                    </div>
                                    <div class="footer">
                                        <div class="current-registered-count">
                                            <img src="${this.url}images/icons/user.svg" width="25px" />
                                            Mr Akila Disanayake
                                        </div>
                                        <div class="pending-btn">
                                            status : <span>Pending...</span>
                                        </div>
                                    </div>
                                    <div class="footer d-flex-j-c-flex-end"> 
                                        
                                        <div class="accept-btn bg-danger">
                                            Cancel
                                        </div>
                                    </div>
                                </div>
                            </div>
            `;
        })
    }

}