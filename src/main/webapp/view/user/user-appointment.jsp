<%--
  Created by IntelliJ IDEA.
  User: hansana
  Date: 10/14/2021
  Time: 7:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="<c:url value="/public/js/inputValidation.js"/>"></script>
    <title> User Home Suwasewana </title>
    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/>"/>

    <!-- for style sheet link  -->
    <link href="<c:url value="/public/css/user/_dashboard-appointment.css"/>" rel="stylesheet"/>
    <!-- for commen style  sheet link  -->
    <link href="<c:url value="/public/css/user/_commen.css"/>" rel="stylesheet"/>

    <!-- for feather icon -->
    <script src="https://unpkg.com/feather-icons"></script>

    <!-- location js -->
    <script src="<c:url value="/public/js/locationSelectGenarator.js"/>"></script>

    <!-- moh list  -->
    <script src="<c:url value="/public/js/MOHSelectGenarator.js"/>"></script>

    <%--    for popup style--%>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <%--    for popup script--%>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
    <script src="<c:url value="/public/js/appointment.js"/>"></script>

    <title>Registration - Suwasewana</title>
</head>
<body>
<!-- main container -->
<div class="container"
     style="display: flex;flex-direction: column; justify-content: space-between;min-height: 100vh;">
    <!-- hero banner -->
    <section class="hero-banner-main-header-container">
        <div class="mypopup" id="popup" style="display: none;"></div>
        <!-- for header -->
        <div class="user-main-header-container">
            <div class="main-header">
                <div class="logo">
                    <img src="<c:url value="/public/images/logo.png "/>" alt="logo" width="100%"/>
                </div>
                <div class="navbar-container">
                    <ul class="navbar">
                        <li class="nav-item"> Home</li>
                        <li class="nav-item"> Diseases</li>
                        <li class="nav-item"> Announcement</li>
                        <li class="nav-item"> Clinik</li>
                        <li class="nav-item"> Appointment</li>
                        <li class="nav-item special-nav"> Request Ambulance</li>
                    </ul>
                </div>
                <div class="login-register-container">
                    <div class="language">
                        <span> සිංහල </span>
                        <img src="<c:url value="/public/images/sri-lanka.png "/>" alt="sri lanakan flag" width="100%">

                    </div>
                    <div class="register-btn">
                        Register
                    </div>
                    <div class="login-btn">
                        Login
                    </div>
                </div>
            </div>
        </div>
        <!-- register form -->
    </section>
    <!-- this for latest announcements -->

    <section>
        <div class="dashboard-container">
            <div class="left-dashboard">
                <div class="dashboard-profile-details">
                    <img src="<c:url value="/public/images/avatar.png"/>" width="90px"/>
                    <div class="profile-name">
                        Hansana Ranaweera
                    </div>
                    <div class="profile-location">
                        Akuressa
                    </div>
                    <div class="moh-area">
                        Matara MOH
                    </div>
                </div>
                <div class="dashboard-icon-set">

                    <div class="dash-tab">
                        <div class="dash-icon">
                            <img src="<c:url value="/public/images/icons/grid.svg"/>" width="20px"/>
                            <!-- <object data="images/icons/grid.svg" width="20px" height="20px" style="color: brown;"> </object> -->
                        </div>
                        <div class="dash-title">
                            Dashboard
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px"/>
                        </div>
                        <div class="dash-title">
                            Diseases
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon">
                            <img src="<c:url value="/public/images/icons/volume-2.svg"/>" width="20px"/>
                        </div>
                        <div class="dash-title">
                            Announcement
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon">
                            <img src="<c:url value="/public/images/icons/layers.svg"/>" width="20px"/>
                        </div>
                        <div class="dash-title">
                            Clinic
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px"/>
                        </div>
                        <div class="dash-title">
                            Complain
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon">
                            <img src="<c:url value="/public/images/icons/calendar.svg"/>" width="20px"/>
                        </div>
                        <div class="dash-title">
                            Appoiment
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon">
                            <img src="<c:url value="/public/images/icons/edit.svg"/>" width="20px"/>
                        </div>
                        <div class="dash-title">
                            Edite Profile
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px"/>
                        </div>

                        <div class="dash-title">
                            Patient
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px"/>
                        </div>
                        <div class="dash-title">
                            Support
                        </div>
                    </div>

                </div>
            </div>
            <div class="right-dashboard">
                <div class="dashboard-page-title">
                    Appointments
                    <div class="dashboard-sub-title">
                        SUWASEWANA/appointmentS
                    </div>
                </div>

                <div class="dashboard-container">
                    <div class="dashboard-page-sub-title">
                        Appointments Status
                    </div>
                    <form class="previous-form">
                        <div class="form-group">
                            <label for="aTitleSearch">
                                Appointment Title
                            </label>
                            <input type="text" name="aTitleSearch" id="aTitleSearch" autocomplete="off"/>

                        </div>

                        <div class="form-group">
                            <label for="appointmentTypeSearch">
                                Appointment Type
                            </label>
                            <input id="appointmentTypeSearch" type="text" list="allappointmentTypeSearch"
                                   name="appointmentTypeSearch" autocomplete="off">
                            <datalist id="allappointmentTypeSearch">
                                <option value="Mahapola" option=" Mahapola"></option>
                            </datalist>
                        </div>
                        <div class="form-group">
                            <label for="phiSearch">
                                Your Area's PHI Name
                            </label>
                            <input id="phiSearch" type="text" list="allphiSearch" name="phiSearch" autocomplete="off">
                            <datalist id="allphiSearch">
                                <option value="Hansana" option="Hansana"></option>
                            </datalist>
                        </div>

                        <div class="form-group d-flex-a-i-end">
                            <label>
                                &nbsp;
                            </label>
                            <button class="submitBtn "> Search Appointment</button>
                        </div>
                    </form>
                    <div class="row previous-appointment-list" id="previous-appointment-list">

                    </div>
                </div>

                <div class="dashboard-container">
                    <div class="dashboard-page-sub-title">
                        Make a appointments
                    </div>
                    <div class="make-appointment-form">
                        <form onsubmit="return makeAppointment();">
                            <div class="row">
                                <div class="form-group">
                                    <label for="aTitle">
                                        Appointment Title
                                    </label>
                                    <input type="text" name="name" id="aTitle" autocomplete="off"
                                           value="Maduni baba hanbaernna"/>

                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <label for="appointmentType">
                                        Appointment Type
                                    </label>
                                    <input id="appointmentType" type="text" list="allappointmentType"
                                           name="appointmentType" autocomplete="off" value="lamaya">
                                    <datalist id="allappointmentType">
                                        <option value="Mahapola" option=" Mahapola"></option>
                                    </datalist>
                                </div>
                                <div class="form-group">
                                    <label for="phi">
                                        Your Area's PHI Name
                                    </label>
                                    <input id="phi" type="text" list="allphi" name="phi" autocomplete="off"
                                           value="akila">
                                    <datalist id="allphi">
                                        <option value="Hansana" option="Hansana"></option>
                                    </datalist>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="reason">
                                        Reason of Appointment
                                    </label>
                                    <textarea rows="4" cols="50" type="text" placeholder="reason" name="reason"
                                              id="reason"> Manduni lanaya </textarea>
                                </div>

                            </div>
                            <div class="row">
                                <div class="form-group d-flex-a-i-end">
                                    <button class="submitBtn "> Make Appointment</button>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="main-footer">
        <div class="first-row">
            <img src="<c:url value="/public/images/logo.png "/>" alt="logo" width="45px"/>
            <div class="navbar-container">
                <ul class="navbar">
                    <li class="nav-item"> Home</li>
                    <li class="nav-item"> Diseases</li>
                    <li class="nav-item"> Announcement</li>
                    <li class="nav-item"> Clinik</li>
                    <li class="nav-item"> Appointment</li>
                    <li class="nav-item special-nav"> Request Ambulance</li>
                </ul>
            </div>
        </div>
        <div class="second-row">
            © 2021 SUWASEWANA.LK | All Right Reserved
        </div>
    </div>
</div>
<script defer>
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    let appointment = new Appointment("previous-appointment-list");
    getAllAppointment()

    function getAllAppointment() {
        let appointmentCardList = [];
        $.post("/test_war_exploded/user-appointment-controller/view",
            {
                aType: "",
                aTitle: "",

            },
            function (data, status) {
                appointmentCardList = JSON.parse(data);
                appointment.setData(appointmentCardList);

                // if (appointmentCardList.length === 0) {
                //     document.getElementById("previous-appointment-list").innerHTML = " no data found";
                //     return;
                // }
                <%--document.getElementById("previous-appointment-list").innerHTML = appointmentCardList.map((data) => {--%>
                <%--    return `<h1> ${appointmentCardList[i].aTitle} </h1>`--%>
                <%--}).join(' ')--%>

                // for (let i = 0; i < appointmentCardList.length; i++) {
                //     console.log(appointmentCardList[i])
                //     let myAppointment = document.getElementById("previous-appointment-list");
                //     myAppointment.innerHTML += `<h1> appointmentCardList[i].aTitle </h1>`
                // }

                <%--appointmentCardList.map((item) => {--%>
                <%--    &lt;%&ndash;let title = item.aTitle&ndash;%&gt;--%>
                <%--    &lt;%&ndash;console.log(item.aTitle)&ndash;%&gt;--%>

                <%--    &lt;%&ndash;document.getElementById("previous-appointment-list").innerText =  "<h1> ${item.aTitle} </h1>"&ndash;%&gt;--%>

                <%--    &lt;%&ndash;    <div class="appointment-card-container">&ndash;%&gt;--%>
                <%--    &lt;%&ndash;        <div class="appointment-card">&ndash;%&gt;--%>
                <%--    &lt;%&ndash;            <div class="title">&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                ${item.aTitle}&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                <p> 2021/01/10</p>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;            </div>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;            <div class="desc">&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                he process of writing a job description requires&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                having a clear understanding of the job’s duties&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                and responsibilities. The job posting should also&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                include a concise picture of the skills required&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                Organize the job&ndash;%&gt;--%>
                <%--    &lt;%&ndash;            </div>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;            <div class="properties">&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                <ul>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                    <li>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                        <img src="<c:url value="/public/images/icons/map-pin.svg"/>" width="22px" />&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                        Location : pending ...&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                    </li>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                    <li>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                        <img src="<c:url value="/public/images/icons/list.svg"/>" width="22px" />&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                        Time Slot 1 : pending ...&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                    </li>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                    <li>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                        <img src="<c:url value="/public/images/icons/list.svg"/>" width="22px" />&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                        Time Slot 2 : pending ...&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                    </li>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                    <li>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                        <img src="<c:url value="/public/images/icons/list.svg"/>" width="22px" />&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                        Special Notice: No&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                    </li>&ndash;%&gt;--%>

                <%--    &lt;%&ndash;                </ul>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;            </div>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;            <div class="footer">&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                <div class="current-registered-count">&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                    <img src="<c:url value="/public/images/icons/user.svg"/>" width="25px" />&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                    Mr ${item.phi}&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                </div>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                <div class="pending-btn">&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                    status : <span>Pending...</span>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                </div>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;            </div>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;            <div class="footer d-flex-j-c-flex-end">&ndash;%&gt;--%>

                <%--    &lt;%&ndash;                <div class="accept-btn bg-danger">&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                    Cancel&ndash;%&gt;--%>
                <%--    &lt;%&ndash;                </div>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;            </div>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;        </div>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;    </div>&ndash;%&gt;--%>
                <%--    &lt;%&ndash;`&ndash;%&gt;--%>
                <%--})--%>
            }
        );
    }

    function makeAppointment() {
        let reqData =
            {
                aTitle: document.getElementById("aTitle").value,
                aType: document.getElementById("appointmentType").value,
                aPhi: document.getElementById("phi").value,
                aReason: document.getElementById("reason").value,
            };
        console.log(reqData);

        $.post("/test_war_exploded/user-appointment-controller/create",
            reqData,
            function (data, status) {
                console.log(data.includes("success"))
                if (data.includes("success")) {
                    popup.showAppointmentSuccessMessage({
                        status: 'success',
                        message: 'Appointment Successfully Requested!'
                    });
                } else {
                    popup.showAppointmentSuccessMessage({
                        status: 'fail',
                        message: 'Appointment Request Fails !',
                        data: data
                    });
                }
            }
        );
        return false;
    }
</script>
</body>
</html>
