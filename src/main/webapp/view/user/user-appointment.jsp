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

    <!-- map  -->
    <link href="https://api.mapbox.com/mapbox-gl-js/v2.4.1/mapbox-gl.css" rel="stylesheet">
    <script src="https://api.mapbox.com/mapbox-gl-js/v2.4.1/mapbox-gl.js"></script>
    <script
            src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.min.js"></script>
    <link rel="stylesheet"
          href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.css"
          type="text/css">

    <%--    for popup style--%>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <%--    for popup script--%>
    <script src="<c:url value="/public/js/popup.js"/>"></script>

    <title>Registration - Suwasewana</title>
</head>
<body>
<!-- main container -->
<div class="container"
     style="display: flex;flex-direction: column; justify-content: space-between;min-height: 100vh;">
    <!-- hero banner -->
    <section class="hero-banner-main-header-container">
        <!-- for header -->
        <div class="user-main-header-container">
            <div class="main-header">
                <div class="logo">
                    <img src="<c:url value="/public/images/logo.png "/>" alt="logo" width="100%"/>
                </div>
                <div class="navbar-container">
                    <ul class="navbar">
                        <li class="nav-item"> Home </li>
                        <li class="nav-item"> Diseases </li>
                        <li class="nav-item"> Announcement </li>
                        <li class="nav-item"> Clinik </li>
                        <li class="nav-item"> Appointment </li>
                        <li class="nav-item special-nav"> Request Ambulance </li>
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
                    <img src="<c:url value="/public/images/avatar.png"/>" width="90px" />
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
                            <img src="<c:url value="/public/images/icons/grid.svg"/>" width="20px" />
                            <!-- <object data="images/icons/grid.svg" width="20px" height="20px" style="color: brown;"> </object> -->
                        </div>
                        <div class="dash-title">
                            Dashboard
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Diseases
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon">
                            <img src="<c:url value="/public/images/icons/volume-2.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Announcement
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon">
                            <img src="<c:url value="/public/images/icons/layers.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Clinic
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Complain
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon">
                            <img src="<c:url value="/public/images/icons/calendar.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Appoiment
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon">
                            <img src="<c:url value="/public/images/icons/edit.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Edite Profile
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
                        </div>

                        <div class="dash-title">
                            Patient
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
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
                            <input type="text" name="aTitleSearch" id="aTitleSearch" autocomplete="off" />

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
                            <label >
                                &nbsp;
                            </label>
                            <button class="submitBtn " > Search Appointment</button>
                        </div>
                    </form>
                    <div class="row previous-appointment-list">
                        <div class="appointment-card-container">
                            <div class="appointment-card">
                                <div class="title">
                                    Mahapola Scholarship
                                    <p> 2021/01/10</p>
                                </div>
                                <div class="desc">
                                    he process of writing a job description requires
                                    having a clear understanding of the job’s duties
                                    and responsibilities. The job posting should also
                                    include a concise picture of the skills required
                                    Organize the job
                                </div>
                                <div class="properties">
                                    <ul>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/map-pin.svg"/>" width="22px" />
                                            Location : pending ...
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="22px" />
                                            Time Slot 1 : pending ...
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="22px" />
                                            Time Slot 2 : pending ...
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="22px" />
                                            Special Notice: No
                                        </li>

                                    </ul>
                                </div>
                                <div class="footer">
                                    <div class="current-registered-count">
                                        <img src="<c:url value="/public/images/icons/user.svg"/>" width="25px" />
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
                        <div class="appointment-card-container">
                            <div class="appointment-card">
                                <div class="title">
                                    Grade 5 Scholarship
                                    <p> 2021/01/10</p>
                                </div>
                                <div class="desc">
                                    he process of writing a job description requires
                                    having a clear understanding of the job’s duties
                                    and responsibilities. The job posting should also
                                    include a concise picture of the skills required
                                    Organize the job
                                </div>
                                <div class="properties">
                                    <ul>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/map-pin.svg"/>" width="22px" />
                                            Location : Akuressa MOH ...
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="22px" />
                                            Time Slot 1 : 2021/03/01 10:30pm - 11:30px
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="22px" />
                                            Time Slot 2 :2021/03/03 8:30pm - 9:30px
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="22px" />
                                            Special Notice: <span class="special-notices">
                                                    please call me before you come
                                                </span>
                                        </li>

                                    </ul>
                                </div>

                                <div class="footer">

                                    <div class="current-registered-count">
                                        <img src="<c:url value="/public/images/icons/user.svg"/>" width="25px" />
                                        Mr Akila Disanayake
                                    </div>
                                    <!-- <div class="pending-btn ">
                                        status : <span>select time slot...</span>
                                    </div> -->


                                </div>
                                <div class="footer" >
                                    <div class="accept-btn bg-success">
                                        Accept
                                    </div>
                                    <div class="accept-btn bg-primary">
                                        Request new Time
                                    </div>
                                    <div class="accept-btn bg-danger">
                                        Cancel
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="appointment-card-container">
                            <div class="appointment-card">
                                <div class="title">
                                    Grade 5 Scholarship
                                    <p> 2021/01/10</p>
                                </div>
                                <div class="desc">
                                    he process of writing a job description requires
                                    having a clear understanding of the job’s duties
                                    and responsibilities. The job posting should also
                                    include a concise picture of the skills required
                                    Organize the job
                                </div>
                                <div class="properties">
                                    <ul>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/map-pin.svg"/>" width="22px" />
                                            Location : Akuressa MOH ...
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="22px" />
                                            Time Slot : 2021/03/01 10:30pm - 11:30px
                                        </li>

                                        <li>
                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="22px" />
                                            Special Notice: <span class="special-notices">
                                                    please call me before you come
                                                </span>
                                        </li>

                                    </ul>
                                </div>

                                <div class="footer">

                                    <div class="current-registered-count">
                                        <img src="<c:url value="/public/images/icons/user.svg"/>" width="25px" />
                                        Mr Akila Disanayake
                                    </div>


                                </div>
                                <div class="footer " >

                                    <div class="accept-btn bg-primary">
                                        Request new Time
                                    </div>
                                    <div class="accept-btn bg-danger">
                                        Cancel
                                    </div>
                                </div>
                                <!-- <div class="row">
                                    <div class="form-group d-flex-j-c-cnter">
                                        <div class="accept-btn">
                                            Accept Time Solt
                                        </div>
                                    </div>
                                </div> -->
                            </div>
                        </div>
                    </div>
                </div>

                <div class="dashboard-container">
                    <div class="dashboard-page-sub-title">
                        Make a appointments
                    </div>
                    <div class="make-appointment-form">
                        <form>
                            <div class="row">
                                <div class="form-group">
                                    <label for="aTitle">
                                        Appointment Title
                                    </label>
                                    <input type="text" name="name" id="aTitle" autocomplete="off" />

                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <label for="appointmentType">
                                        Appointment Type
                                    </label>
                                    <input id="appointmentType" type="text" list="allappointmentType"
                                           name="appointmentType" autocomplete="off">
                                    <datalist id="allappointmentType">
                                        <option value="Mahapola" option=" Mahapola"></option>
                                    </datalist>
                                </div>
                                <div class="form-group">
                                    <label for="phi">
                                        Your Area's PHI Name
                                    </label>
                                    <input id="phi" type="text" list="allphi" name="phi" autocomplete="off">
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
                                              id="reason"></textarea>
                                </div>

                            </div>
                            <div class="row">
                                <div class="form-group d-flex-a-i-end">
                                    <button class="submitBtn " > Make Appointment</button>
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
                    <li class="nav-item"> Home </li>
                    <li class="nav-item"> Diseases </li>
                    <li class="nav-item"> Announcement </li>
                    <li class="nav-item"> Clinik </li>
                    <li class="nav-item"> Appointment </li>
                    <li class="nav-item special-nav"> Request Ambulance </li>
                </ul>
            </div>
        </div>
        <div class="second-row">
            © 2021 SUWASEWANA.LK | All Right Reserved
        </div>
    </div>
</div>
<script defer>

</script>
</body>
</html>
