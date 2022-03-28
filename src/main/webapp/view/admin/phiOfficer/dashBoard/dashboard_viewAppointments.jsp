<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <link rel="stylesheet"
          href="<c:url value="/public/css/partials/phiOfficer/dashBoard/_phi-dashboard-viewAppointments.css"/> "/>
    <script src="<c:url value="/public/js/PHIOfficer/phi_appointmnet.js"/>"></script>
    <script src="<c:url value="/public/js/inputValidation.js"/>"></script>
    <script src="<c:url value="/public/js/PHI/PHI_Appoinment_PopUp.js"/>"></script>

    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/> "/>
    <%--pop up styles--%>
    <script src="https://unpkg.com/feather-icons"></script>
    <%--    side nav bar styles--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link href="<c:url value="/public/css/user/_commen.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/public/css/popup/Appintmentpopup.css"/>" rel="stylesheet"/>
    <title>Appointments</title>

</head>
<body>

<c:import url="/view/admin/partials/PHIOfficerSideNavbar.jsp"/>
<div class="mypopup" id="popup" style="display: none;"></div>
<div id="mainContent" class="container">

    <div class="header">
        <div class="upper-title">SUWASEWANA</div>
        <div class="dashboard-name">PHI/Dashboard/View Appointments</div>
    </div>
    <!-- Search appointments section -->
    <!-- appintments content -->
    <div class="appointments-container">

        <div class="appointment-view">
            <div class="filter_appointment">
                <div class="row">
                    <div class="form-group" style="padding: 0;">
                        <label for="user-nic">
                            User NIC
                        </label>
                        <input type="text" autofocus autocomplete="off" name="user-nic" id="user-nic"
                               maxlength="13" onkeyup="appointmentObj.searchAppointment()"
                        />
                        <div id="user-nic-error" class="form-field-error"></div>
                    </div>
                    <div class="form-group">
                        <label for="app-type">
                            Appointment Type
                        </label>
                        <input type="text" autofocus autocomplete="off" name="app-type" id="app-type"
                               list="app_type_datalist"
                               onclick="document.getElementById('app-type').value = ''"
                               onkeyup="appointmentObj.searchAppointment()"/>
                        <datalist id="app_type_datalist">
                            <option value="No Data Found" option="No Data Found"></option>
                        </datalist>
                        <div id="app-type-error" class="form-field-error"></div>
                    </div>
                    <div class="form-group">
                        <label for="app-status">
                            Appointment Status
                        </label>
                        <input type="text" autofocus autocomplete="off" name="app-type" id="app-status"
                               list="app_status_datalist"
                               onkeyup="appointmentObj.searchAppointment()"
                               onclick="document.getElementById('app-status').value = ''"
                        />
                        <datalist id="app_status_datalist">
                            <option value="All" option="all"></option>
                            <option value="Pending" option="pending"></option>
                            <option value="Completed" option="completed"></option>
                        </datalist>
                        <div id="app-status-error" class="form-field-error"></div>
                    </div>

<%--                   s--%>
                </div>
            </div>
            <div class="admin-title">
                Current Appointment (Result : <span id="resultCount">0</span>)
            </div>
            <div id="appointmnet_card_container">

            </div>
        </div>

        <div class="appointment-summary">
            <div class="admin-title">
                Summary of Appointment
            </div>
            <div class="officer-details-container">
                <div class="officer-details-summry-header">
                    <img src="<c:url value="/public/images/PHI_Dashboard/appointmnet_banner.png"/> " alt="" srcset=""
                         width="50px">
                    <div class="total-officers">
                        <div class="officer-total-count" id="total_appointment_header">
                            0
                        </div>
                        Total No of Appointment
                    </div>
                </div>
                <div class="officer-summary-card-container">
                    <div class="officer-summary-card">
                        <div class="officer-name">
                            Today Appointment
                            <br>
                            <a href=""> manage</a>
                        </div>
                        <div class="officer-count" id="today_appointment">
                            0
                        </div>
                    </div>
                    <div class="officer-summary-card">
                        <div class="officer-name">
                            Pending Appointment
                            <br>
                            <a href=""> manage</a>
                        </div>
                        <div class="officer-count" id="pendnig_appointment">
                            0
                        </div>
                    </div>
                    <div class="officer-summary-card">
                        <div class="officer-name">
                            completed Appointment
                            <br>
                            <a href=""> manage</a>
                        </div>
                        <div class="officer-count" id="completed_appointment">
                            0
                        </div>
                    </div>
                </div>
                <div class="officer-details-summry-header"></div>
                <div class="officer-summary-card-container" id="category_appointment_summary">
                </div>
                <div class="officer-details-summry-header"></div>
            </div>
        </div>
    </div>
<%--<button onclick="popup.showAppointmentSuccessMessage({--%>
<%--                        status: 'success',--%>
<%--                        message: 'Appointment Successfully Requested!'--%>
<%--                    });"> asdasdasdasd</button>--%>
</div>
</body>

<script>
    feather.replace({width: "10px", height: "10px"})
</script>


<script src="<c:url value="/public/js/common/side-navbar.js"/>"></script>
<script >
    let popup = new PHIAppointmnetPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    let validation = new FormInputValidation();

</script>
<script defer>
    let appointmentObj = new PHIAppointment();
    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

    init();

    function init() {
        const xhttp1 = new XMLHttpRequest();
        xhttp1.onload = function () {
            let result = JSON.parse([this.response]);
            appointmentObj.setDataAppointmentType(result);
            // appointmentObj.getAppointmentCategorySummary();
            document.getElementById("app_type_datalist").innerHTML = "<option option='All' value='All' name='All'>";
            result.map((aType) => {
                document.getElementById("app_type_datalist").innerHTML += "<option option='" + aType.typeNumber + "' value='" + aType.typeName + "' name='" + aType.typeName + "'>";
            })
        }
        xhttp1.open("GET", myUrl+"/PHIAppointmentServlet/appointment_type", true);
        xhttp1.send();
        const xhttp2 = new XMLHttpRequest();
        xhttp2.onload = function () {
            let result = JSON.parse([this.response]);
            console.log(this.response);
            appointmentObj.setData(result);
            // appointmentObj.makeAppointmnetCard(result);

        }
        xhttp2.open("GET", myUrl+"/PHIAppointmentServlet/appointment_for_phi", true);
        xhttp2.send();
    }

    function giveTimeSlot(app_id , round){

        let reqData = {
            status: "pending_citizen_action",
            phi_message: document.getElementById('app-sn').value,
            time_slot_2: document.getElementById('ts2sd').value.split("T")[0] + " " + document.getElementById('ts2sd').value.split("T")[1]+":00",
            time_slot_1: document.getElementById('ts1sd1').value.split("T")[0] + " " +document.getElementById('ts1sd1').value.split("T")[1]+":00",
            time_slot_2_end: document.getElementById('ts2sd').value.split("T")[0] + " " + document.getElementById('ts2ed').value+":00",
            time_slot_1_end: document.getElementById('ts1sd1').value.split("T")[0] + " " +document.getElementById('ts1et2').value+":00",
            alocation: document.getElementById('app-location').value,
            app_id: app_id
        }
        console.log(reqData)
        $.post(myUrl+"/PHIAppointmentServlet/giveTimeForAppointment",
            reqData,
            function (data, status) {
                let result = JSON.parse(data)
                console.log(result.status)
                if (data.includes("success")) {
                    popup.hidePopup();
                } else {
                    popup.appointmentActionFail({data: result.data});
                    // popup.hidePopup();
                    // alert('asd')
                    // setTimeout(()=>{
                    //     alert("aaresd")
                    //     document.getElementById("app-rr-error").innerText = ""
                    //     popup.appointmentActionFail({});
                    // },500)

                }

            }
        );
    }


    function rejectAppointmentWithReason(data ){
        console.log(data)
        console.log(document.getElementById("app-rr").value)
        let reqData = {
            status: "rejected",
            app_id: data.id,
            phi_message:document.getElementById("app-rr").value
        }
        console.log(reqData)
        $.post(myUrl+"/PHIAppointmentServlet/rejectAppointment",
            reqData,
            function (data, status) {
                let result = JSON.parse(data)
                console.log(result.status)
                if (data.includes("success")) {
                    popup.hidePopup();
                } else {
                    popup.appointmentActionFail({data: result.data});

                }

            }
        );
    }
</script>
</html>
