class PHIAppointment{
    appointmentList = [];
    appointmentTypeList = [];
    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    conatiner ;

    constructor(){

    }

    setData(data){
        this.appointmentList = data;
        this.makeAppointmnetCard(data);
        this.getTodaysEvent();
    }
    setDataAppointmentType(data){
        this.appointmentTypeList = data;
        this.getAppointmentCategorySummary();
    }
    makeAppointmnetCard(data) {
        let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
        this.conatiner = document.getElementById("appointmnet_card_container");
        document.getElementById("resultCount").innerText = data.length;
        if(data.length ==0){
            this.conatiner.innerHTML += `<div class="appointmnet-card">
                <div class="app-header">
                    <div class="div">Suwasewana Message</div>
                    <div class="div">Posted Date on ` + new Date() + ` </div>
                </div>
                <div class="app-data-container">
                    <div class="app-left">
                        <div class="app-title">
                        No Data Found
                        </div>
                    </div>
                </div>
                <div class="action-center">
                    </div>
            </div>`
            return;
        }
        data.map( (app, index) => {
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
                            <img src="` + myUrl + "/public/images/PHI_Dashboard/avatar.png" + `" width="100px"/>
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
                        Status - ` + app.appointment.status + `
                    </div>
                    <div class="btn-set">
                        <button class="app-submitBtn btn-danger" onclick="popup.giveTimeSlot({ round: '` + app.appointment.round +  `',message: 'Give available time slot!' , title: '` + app.appointment.aTitle + `'});"> Give Time Solt</button>
                        <button class="app-submitBtn btn-success"  onclick="popup.rejectAppointment({ message: 'Reject Appointment' , title: '` + app.appointment.aTitle + `'});"> Reject</button>
                        <button class="app-submitBtn btn-primary"  onclick="popup.postPoneAppointment({ message: 'Postpone Appointment' , title: '` + app.appointment.aTitle +  `'});"> Postpone</button>
                    </div>
                    </div>
            </div>`
        } )
    }

    getSummaryCount(){
        let total = 0;
        let pending = 0;
        let completed = 0;
        setTimeout( () => {
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
        } ,200)


    }

    getTodaysEvent(){
        this.appointmentList.map( (app, index) => {
            if(app.appointment.status == "pending"){

            }
            let today = new Date();
            let today1 = new Date(app.appointment.posted_date_time);
           // console.log(app.appointment.posted_date_time.split(" ")[0] + " " + today.getFullYear() + "-" + today.getMonth()  + "-" +today.getDay()  )
            console.log("---------------------------------")
            console.log( today)
            console.log( today1)
            console.log( today1 < today)
            console.log("---------------------------------")
        })


    }
    getAppointmentCategorySummary(){
        this.appointmentTypeList.map( (category ,index) => {
            document.getElementById('category_appointment_summary').innerHTML += ` 
            <div class="officer-summary-card">
                <div class="officer-name">
                    ` + category.typeName + `
                    <br>
                    <a href=""> manage</a>
                </div>
                <div class="officer-count" id="id` + category.typeNumber +`" >
                    0 
                </div>
            </div>`;
        });
        this.getSummaryCount();
    }

    searchAppointment(){
        let nic = document.getElementById('user-nic').value;
        let type = document.getElementById('app-type').value;
        let status =document.getElementById('app-status').value;
        if(type === "All"){
            type = ""
        }
        if(status === "All"){
            status = ""
        }
        let filterdData = this.appointmentList.filter( (app) => {
            if(
                app.appointmentType.typeName.toLowerCase().includes(type.toLowerCase()) &&
                app.appointment.user_nic.toLowerCase().includes(nic.toLowerCase()) &&
                app.appointment.status.toLowerCase().includes(status.toLowerCase())
            ){
                return app;
            }
        });
        this.conatiner.innerHTML = "";
        this.makeAppointmnetCard(filterdData);

    }
}

// class PHIAppointment {
//     appointmentList = [];
//
//     conatiner;
//
//     constructor() {
//         this.getDataFromApi();
//     }
//
//
//     getAppointmentCategorySummary() {
//
//         let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
//         const xhttp = new XMLHttpRequest();
//         xhttp.onload = function () {
//             let result = JSON.parse([this.response]);
//             result.map((category, index) => {
//                 document.getElementById('category_appointment_summary').innerHTML += `
//                     <div class="officer-summary-card">
//                         <div class="officer-name">
//                             ` + category.typeName + `
//                             <br>
//                             <a href=""> manage</a>
//                         </div>
//                         <div class="officer-count" id="id` + category.typeNumber + `" >
//                             00
//                         </div>
//                     </div>`;
//             });
//             const xhttp = new XMLHttpRequest();
//             xhttp.onload = function () {
//                 let result = JSON.parse([this.response]);
//                 let total = 0;
//                 let pending = 0;
//                 let completed = 0;
//                 result.map((app, index) => {
//                     console.log("asdas1111");
//                     console.log(app);
//                     console.log("asdas1111");
//                     if (app.appointment.status === "pending") {
//                         pending++;
//                     } else if (app.appointment.status === "completed") {
//                         completed++;
//                     }
//                     total++;
//                     document.getElementById("id" + app.appointmentType.typeNumber).innerText = Number(document.getElementById("id" + app.appointmentType.typeNumber).innerText) + 1;
//
//                 })
//                 document.getElementById("today_appointment").innerHTML = total;
//                 document.getElementById("total_appointment_header").innerHTML = total;
//                 document.getElementById("pendnig_appointment").innerHTML = pending;
//                 document.getElementById("completed_appointment").innerHTML = completed;
//
//             }
//             xhttp.open("GET", "http://localhost:8093/test_war_exploded/PHIAppointmentServlet/appointment_for_phi", true);
//             xhttp.send();
//
//         }
//         xhttp.open("GET", "http://localhost:8093/test_war_exploded/PHIAppointmentServlet/appointment_type", true);
//         xhttp.send();
//     }
//
//     getDataFromApi() {
//         let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
//         const xhttp = new XMLHttpRequest();
//         xhttp.onload = function () {
//             let result = JSON.parse([this.response]);
//             this.appointmentList = result;
//             this.conatiner = document.getElementById("appointmnet_card_container");
//             result.map((app, index) => {
//                 this.conatiner.innerHTML += `<div class="appointmnet-card">
//                 <div class="app-header">
//                     <div class="div">Appointmnet Number ` + app.appointment.aType + `</div>
//                     <div class="div">Posted Date on ` + app.appointment.posted_date_time + ` </div>
//                 </div>
//                 <div class="app-data-container">
//                     <div class="app-left">
//                         <div class="app-title">
//                         ` + app.appointment.aTitle + `
//                         </div>
//                         <div class="app-type">
//                             Appointment Type ` + app.appointmentType.typeName + `
//                         </div>
//                         <div class="app-desc">
//                         ` + app.appointment.aReason + `
//                         </div>
//
//                     </div>
//                     <div class="app-right">
//                         <div class="app-item">
//                             <img src="` + myUrl + "/public/images/PHI_Dashboard/avatar.png" + `" width="100px"/>
//                         </div>
//                         <div class="app-item">
//                         ` + app.user.uname + `
//                         </div>
//                         <div class="app-item">
//                         ` + app.user.uMobile + `
//                         </div>
//                         <div class="app-item">
//                             <a href="">Citizen Information</a>
//                         </div>
//
//                     </div>
//
//                 </div>
//                 <div class="action-center">
//                     <div class="app-status">
//                         Status - ` + app.appointment.status + `
//                     </div>
//                     <div class="btn-set">
//                         <button class="app-submitBtn btn-danger "> Give Time Solt</button>
//                         <button class="app-submitBtn btn-success"> Reject</button>
//                         <button class="app-submitBtn btn-primary"> Postpone</button>
//                     </div>
//                     </div>
//             </div>`
//             })
//         }
//         xhttp.open("GET", "http://localhost:8093/test_war_exploded/PHIAppointmentServlet/appointment_for_phi", true);
//         xhttp.send();
//     }
//
//
//     asd(){
//         console.log("asdasd");
//         this.asd1();
//     }
//     asd1(){
//         console.log("asdasd")
//     }
// }