<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/public/css/partials/phiOfficer/dashBoard/_phi-dashboard-viewAppointments.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/> "/>

    <%--pop up styles--%>
    <link rel="stylesheet" href="<c:url value="/popup/common-popup.css"/> "/>
    <script src="<c:url value="/popup/Message.js"></c:url> "></script>
    <script src="https://unpkg.com/feather-icons"></script>

    <%--    side nav bar styles--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <title>Appointment</title>
    <script src="<c:url value="/public/js/PHIOfficer/phi_appointmnet.js"/>"></script>
    <link href="<c:url value="/public/css/user/_commen.css"/>" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

<c:import url="/view/admin/partials/PHIOfficerSideNavbar.jsp" />

<%--<div class="main-contents">--%>
<%--<div class="popup-container" id="PopupContainer"></div>--%>
<div id="mainContent" class="container">

    <div class="header">
        <div class="upper-title">SUWASEWANA </div>
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
                               maxlength="13" />
                        <div id="user-nic-error" class="form-field-error"></div>
                    </div>
                    <div class="form-group">
                        <label for="app-type">
                            Appointment Type
                        </label>
                        <input type="text" autofocus autocomplete="off" name="app-type" id="app-type" />
                        <div id="app-type-error" class="form-field-error"></div>
                    </div>
                    <div class="form-group">
                        <label for="app-status">
                            Appointment Status
                        </label>
                        <input type="text" autofocus autocomplete="off" name="app-type" id="app-status" />
                        <div id="app-status-error" class="form-field-error"></div>
                    </div>

                    <div class="form-group">
                        <label >
                            &nbsp;
                        </label>
                        <button class="search_Btn"> Search</button>
                        <div id="user-mobile-error" class="form-field-error"></div>
                    </div>
                </div>
            </div>
            <div class="admin-title">
                Current Appointment
            </div>
            <div id="appointmnet_card_container" >

            </div>
        </div>

        <div class="appointment-summary">
            <div class="admin-title">
                Summary of Appointment
            </div>
            <div class="officer-details-container">
                <div class="officer-details-summry-header">
                    <img src="Asset 1.png" alt="" srcset="" width="50px">
                    <div class="total-officers">
                        <div class="officer-total-count" id="total_appointment_header">
                            500
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
                            520
                        </div>
                    </div>
                    <div class="officer-summary-card">
                        <div class="officer-name">
                            Pending Appointment
                            <br>
                            <a href=""> manage</a>
                        </div>
                        <div class="officer-count" id="pendnig_appointment">
                            520
                        </div>
                    </div>
                    <div class="officer-summary-card">
                        <div class="officer-name">
                            completed Appointment
                            <br>
                            <a href=""> manage</a>
                        </div>
                        <div class="officer-count" id="completed_appointment">
                            1, 255
                        </div>
                    </div>
                </div>
                <div class="officer-details-summry-header"> </div>
                <div class="officer-summary-card-container" id="category_appointment_summary">

                    <!-- <div class="officer-summary-card">
                        <div class="officer-name">
                            Mahapola
                            <br>
                            <a href=""> manage</a>
                        </div>
                        <div class="officer-count">
                            851
                        </div>
                    </div>
                    <div class="officer-summary-card">
                        <div class="officer-name">
                            Mahapola
                            <br>
                            <a href=""> manage</a>
                        </div>
                        <div class="officer-count">
                            851
                        </div>
                    </div>
                    <div class="officer-summary-card">
                        <div class="officer-name">
                            Mahapola
                            <br>
                            <a href=""> manage</a>
                        </div>
                        <div class="officer-count">
                            851
                        </div>
                    </div> -->
                </div>

                <div class="officer-details-summry-header"> </div>


            </div>
        </div>
    </div>

</div>
</body>
<script defer>
    let appointmentObj = new Appointment();
    appointmentObj.setDate([1,2,3,4,5,6]);
    appointmentObj.makeAppointmnetCard();
    appointmentObj.getAppointmentCategorySummary();

    // appointmentObj.getDataFromApi();
</script>
</html>
