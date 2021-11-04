class Appointment {
    AppointmentArray = [
        {
            aTitle: " ",
            appointmentId: " ",
            appointmentType: " ",
            location: " ",
            phi: " ",
            posted_data: " ",
            reason: " ",
            round: " ",
            special_notice: " ",
            status: " ",
            time_slot1: " ",
            time_slot2: " ",
            user: " "
        }
    ];

    container;
    url = "http://localhost:8093/test_war_exploded/public/";

    constructor(container) {
        // this.AppointmentArray = JSON.parse(data);
        // this.AppointmentArray = data;
        // console.log(this.AppointmentArray);
        this.container = document.getElementById(container);
    }
    setData(data){
        if (!data) return;
        this.container.innerHTML = " ";
        this.AppointmentArray = data;
        this.showCardData(this.AppointmentArray);
    }
    showCardData(data) {
        if (!data) return;
        this.container.innerHTML = " ";
         data.map((item) => {
            this.container.innerHTML += `
            <div class="appointment-card-container">
                                <div class="appointment-card">
                                    <div class="atitle" >
                                        ${item.aTitle}
                                        <p style="font-size: .6em">Posted : ${item.posted_date_time}</p>
                                       
                                    </div>
                                    <div class="desc">
                                        ${item.aReason}
                                    </div>
                                    <div class="properties">    
                                        <ul>
                                            <li>
                                                <img src="${this.url}images/icons/map-pin.svg" width="22px" />
                                                Location : ${item.location === "" ? "Pending..." : item.alocation}
                                            </li>
                                            <li>
                                                <img src="${this.url}images/icons/list.svg" width="22px" />
                                                Time Slot 1 :  ${item.time_slot_1 === "" ? "Pending..." : item.time_slot_1 + " - " + item.time_slot_1_end.split(" ")[1]}
                                            </li>
                                            <li>
                                                <img src="${this.url}images/icons/list.svg" width="22px" />
                                                Time Slot 2 :  ${item.time_slot_2 === "" ? "Pending..." : item.time_slot_2  + " - " +  item.time_slot_2_end.split(" ")[1]}
                                            </li>
                                            <li>
                                                <img src="${this.url}images/icons/list.svg" width="22px" />
                                                Special Notice:  ${item.phi_message === "" ? "Pending..." : item.phi_message}
                                            </li>
                                          
                                        </ul>
                                    </div>
                                    <div class="footer">
                                        <div class="current-registered-count">
                                            <img src="${this.url}images/icons/user.svg" width="25px" />
                                            Mr  ${item.aPhi}
                                        </div>
                                        <div class="pending-btn">
                                            status : <span> ${item.status}</span>
                                        </div>
                                    </div>
                                    <div class="footer d-flex-j-c-flex-end"> 
                                        ${ (item.status == "pending_citizen_action") ? `<div style="margin-left: 10px" class="accept-btn bg-success" onclick="popup.approveTime('${item.app_id}');">
                                            Accept
                                        </div>
                                        <div style="margin-left: 10px" class="accept-btn bg-primary" onclick="popup.showDeleteAlertMessage('${item.app_id}');">
                                            Request Again
                                        </div>
                                        ` : "" }
                                        <div style="margin-left: 10px" class="accept-btn bg-danger" onclick="popup.showDeleteAlertMessage('${item.app_id}');">
                                            Cancel
                                        </div>
                                    </div>
                                     <p style="font-size: .8em;font-family: 'Nunito', sans-serif;color: rgba(0,0,0,0.84);text-align: center">Ref no : ${item.app_id}</p>
                                </div>
                            </div>
            `;
        })
    }

    setSearch(data){
        console.log(data.phiSearch ,data.appointmentTypeSearch)
        let filteredData = this.AppointmentArray.filter((item, index) => {
            // console.log(item)
            console.log(item.appointmentType + "  - " + data.appointmentTypeSearch);
            console.log(item.appointmentType.includes(data.appointmentTypeSearch))
            return item.appointmentType.includes(data.appointmentTypeSearch);
        });
        console.log(filteredData)
        this.showCardData(filteredData);
    }

    setAllData(){
        this.setData(this.AppointmentArray);
    }
}