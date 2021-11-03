class PHIAppointment{
    appointmentList = [];
    appointmentTypeList = [];
    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    conatiner ;

    constructor(){
    }

    setData(data){
        this.appointmentList = data;
    }
    setDataAppointmentType(data){
        this.appointmentTypeList = data;
    }
    makeAppointmnetCard()
    {
        let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

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
                        <button class="app-submitBtn btn-danger "> Give Time Solt</button>
                        <button class="app-submitBtn btn-success"> Reject</button>
                        <button class="app-submitBtn btn-primary"> Postpone</button>
                    </div>
                    </div>
            </div>`
        } )
        this.getAppointmentCategorySummary()
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