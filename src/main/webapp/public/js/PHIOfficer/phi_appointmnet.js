class Appointment{
    appointmentList = [];
    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    conatiner ;
    constructor(){

    }

    getDataFromApi(){
        // $.post("http://localhost:8093/test_war_exploded/user-appointment-controller/view",
        // {
        //     aType: "",
        //     aTitle: "",
        // },
        // function (data, status) {
        //     appointmentCardList = JSON.parse(data);
        //     console.log(appointmentCardList)
        //     document.getElementById("previous-appointment-list").innerHTML = " ";
        //     appointment.setData(appointmentCardList);

        // }
        // );


    }
    setDate(data){
        this.appointmentList = JSON.parse('[{"appointment":{"aTitle":"To get a sign for Mahapola Schoolarship","aType":"100","aPhi":"980703223V","aReason":"I was selected to the University of Colombo School of computing.I was selected to the University of Colombo School of computing.I was selected to the University of Colombo School of computing.I was selected to the University of Colombo School of computing.","app_id":"1","posted_date_time":"2021-11-02 19:51:00","round":"0","location":"","time_slot_1":"2021-11-02 15:03:29","time_slot_2":"2021-11-02 15:03:29","phi_message":"","status":"pending","user_nic":"980703223V"},"appointmentType":{"typeNumber":"100","typeName":"Mahapola Scholarship"},"user":{"uMobile":"0412283111","uname":"Hansana ranaweera","uPassword":"deb058ddc1029e214f4ac76ff25df3c4","uNic":"980703223V","uProvince":"106","uDistrict":"112","uCity":"341","location":"","login_status":"4","suspended_time":"2021-11-01 12:32:58","street_no":"NO 54","address_line1":"Matara Road","zip_code":"81400"}},{"appointment":{"aTitle":"To get a sign for Grade 5 Schoolarship","aType":"100","aPhi":"980703223V","aReason":"I was selected to the University of Colombo School of computing.I was selected to the University of Colombo School of computing.I was selected to the University of Colombo School of computing.I was selected to the University of Colombo School of computing.","app_id":"2","posted_date_time":"2021-11-02 19:51:48","round":"0","location":"","time_slot_1":"2021-11-02 15:03:29","time_slot_2":"2021-11-02 15:03:29","phi_message":"","status":"pending","user_nic":"980703223V"},"appointmentType":{"typeNumber":"100","typeName":"Mahapola Scholarship"},"user":{"uMobile":"0412283111","uname":"Hansana ranaweera","uPassword":"deb058ddc1029e214f4ac76ff25df3c4","uNic":"980703223V","uProvince":"106","uDistrict":"112","uCity":"341","location":"","login_status":"4","suspended_time":"2021-11-01 12:32:58","street_no":"NO 54","address_line1":"Matara Road","zip_code":"81400"}}]');
    }

    makeAppointmnetCard(){
        this.conatiner = document.getElementById("appointmnet_card_container");
        this.appointmentList.map( (app, index) => {
            console.log(app);
            this.conatiner.innerHTML += `<div class="appointmnet-card">
                <div class="app-header">
                    <div class="div">Appointmnet Number ` + app.appointment.aType + `</div>
                    <div class="div">Posted Date on ` + app.appointment.posted_date_time + ` </div>
                </div>
                <div class="app-data-container">
                    <div class="app-left">
                        <div class="app-title">
                        ` + app.appointment.aTitle + `
                        </div>
                        <div class="app-type">
                            Appointment Type ` + app.appointmentType.typeName + `
                        </div>
                        <div class="app-desc">
                        ` + app.appointment.aReason + `
                        </div>
                    
                    </div>
                    <div class="app-right">
                        <div class="app-item">
                            <img src="avatar.png" width="100px"/>
                        </div>
                        <div class="app-item">
                        ` + app.user.uname + `
                        </div>
                        <div class="app-item">
                        ` + app.user.uMobile + `
                        </div>
                        <div class="app-item">
                            <a href="">Citizen Information</a>
                        </div>

                    </div>

                </div>
                <div class="action-center">
                    <div class="app-status">
                        Status - `+ app.appointment.status + `
                    </div>
                    <div class="btn-set">
                        <button class="app-submitBtn btn-danger "> Give Time Solt</button>
                        <button class="app-submitBtn btn-success"> Reject</button>
                        <button class="app-submitBtn btn-primary"> Postpone</button>
                    </div>
                    </div>
            </div>`
        } )
    }

    getSummaryCount(){
        let total = 0;
        let pending = 0;
        let completed = 0;
        this.appointmentList.map( (app, index) => {
            if(app.appointment.status == "pending"){
                pending++;
            }else if(app.appointment.status == "completed"){
                completed++;
            }
            total++;
            document.getElementById("id"+app.appointmentType.typeNumber).innerText = Number(document.getElementById("id"+app.appointmentType.typeNumber).innerText) +1  ;

        })
        document.getElementById("today_appointment").innerHTML = total;
        document.getElementById("total_appointment_header").innerHTML = total;
        document.getElementById("pendnig_appointment").innerHTML = pending;
        document.getElementById("completed_appointment").innerHTML = completed;

    }
    getAppointmentCategorySummary(){
        let data = JSON.parse('[{"typeNumber":"100","typeName":"Mahapola Scholarship"},{"typeNumber":"101","typeName":"Grade 5 Scholarship"},{"typeNumber":"102","typeName":"To Discuss Complaint"},{"typeNumber":"103","typeName":"Other"}]');
        data.map( (category ,index) => {

            document.getElementById('category_appointment_summary').innerHTML += ` 
            <div class="officer-summary-card">
                <div class="officer-name">
                    ` + category.typeName + `
                    <br>
                    <a href=""> manage</a>
                </div>
                <div class="officer-count" id="id` + category.typeNumber +`" >
                    00  
                </div>
            </div>`;
        });
        this.getSummaryCount();
    }
}