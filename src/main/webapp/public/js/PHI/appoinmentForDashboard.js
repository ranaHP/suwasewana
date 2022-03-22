class Appointment {

    Appointmentarray={};


    container;



    constructor(container) {
        this.container = document.getElementById(container);
    }




    // set data for PHI #######################################################################################3
    setDataForPHI(data){
        if (!data) {
            // console.log("set data walinma empty")
            return;
        }

        // console.log("data come to js to set complain for phi")
        this.container.innerHTML = " ";
        this.Appointmentarray = data;
        this.showCardDataForPHI(this.Appointmentarray);
    }


    showCardDataForPHI(data) {
        let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
        let url = myUrl+"/public/";
        // console.log("constructor call url "+url);
        // console.log("data      "+data);
        if(data.length ==0 || !data){
            this.container.innerHTML = `No data found`
            return;
        }
        this.container.innerHTML = " ";

        data.map((item) => {

                this.container.innerHTML += `

                    <div class="appoinment-list" onclick="JumpToAppoinmnet()">
                        <div class="app-left">
                            <h3>${item.user.uname}</h3>
                            <span>${item.appointment.posted_date_time.split(" ")[0]}</span>
                        </div>
                        <div class="app-right">
                            <span>${item.appointment.aTitle}</span>
                            <div class="contactno">
                                <i data-feather="phone" class="phone-icon"></i>
                                <span >${item.user.uMobile}</span>
                            </div>
                        </div>
                    </div>
                `;

        })
    }


    setAllData(){
        this.setData(this.AppointmentArray);
    }
}