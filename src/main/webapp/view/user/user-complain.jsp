<%--
  Created by IntelliJ IDEA.
  User: hansana
  Date: 10/15/2021
  Time: 3:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="<c:url value="/public/js/inputValidation.js"/>"></script>

    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/>"/>

    <!-- for style sheet link  -->
    <link href="<c:url value="/public/css/user/_dashboard_complain.css"/>" rel="stylesheet"/>

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
    <title>Complain</title>
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
                    Complaints
                    <div class="dashboard-sub-title">
                        SUWASEWANA/COMPLAINT
                    </div>
                </div>

                <div class="dashboard-container">
                    <div class="dashboard-page-sub-title">
                        Complaints History
                    </div>
                    <form class="previous-form">
                        <div class="form-group">
                            <label for="cTitleSearch">
                                Complaint Title
                            </label>
                            <input type="text" name="name" id="cTitleSearch" autocomplete="off" />

                        </div>

                        <div class="form-group">
                            <label for="allComplaintsTypeSearch">
                                Complaints Type
                            </label>
                            <input id="ComplaintsTypeSearch" type="text" list="allComplaintsTypeSearch"
                                   name="ComplaintsTypeSearch" autocomplete="off">
                            <datalist id="allComplaintsTypeSearch">
                                <option value="Mahapola" option=" Mahapola"></option>
                            </datalist>
                        </div>

                        <div class="form-group d-flex-a-i-end">
                            <label>
                                &nbsp;
                            </label>
                            <button class="submitBtn " > Search Complaint</button>
                        </div>
                    </form>
                    <div class="row previous-complaint-list">
                        <div class="complaint-card-container">
                            <div class="complaint-card">
                                <div class="title">
                                    Complaints about health services
                                    <p> 2021/01/10</p>
                                </div>

                                <div class="properties">
                                    <ul>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/map-pin.svg"/>" width="22px" />
                                            Location : pending ...
                                        </li>
                                    </ul>
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
                                            Status : pending ...
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/map-pin.svg"/>" width="22px" />
                                            proofs :
                                        </li>
                                    </ul>
                                </div>
                                <div class="row">
                                    <div class="proofs-images d-flex-j-c-space-b">
                                        <img src="<c:url value="/public/images/animal-complaint.jpg"/>" alt="" srcset="" width="30%">
                                        <img src="<c:url value="/public/images/animal-complaint.jpg"/>" alt="" srcset="" width="30%">
                                        <img src="<c:url value="/public/images/animal-complaint.jpg"/>" alt="" srcset="" width="30%">
                                    </div>
                                </div>
                                <div class="footer">
                                    <div class="current-registered-count">
                                        <img src="<c:url value="/public/images/icons/user.svg"/>" width="25px" />
                                        Mr Akila Disanayake
                                    </div>
                                </div>
                                <div class="footer d-flex-j-c-flex-end">

                                    <div class="accept-btn bg-danger">
                                        Cancel
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="complaint-card-container">
                            <div class="complaint-card">
                                <div class="title">
                                    Complaints about health services
                                    <p> 2021/01/10</p>
                                </div>

                                <div class="properties">
                                    <ul>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/map-pin.svg"/>" width="22px" />
                                            Location : pending ...
                                        </li>
                                    </ul>
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
                                            Status : pending ...
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/map-pin.svg"/>" width="22px" />
                                            proofs :
                                        </li>
                                    </ul>
                                </div>
                                <div class="row">
                                    <div class="proofs-images d-flex-j-c-space-b">
                                        <img src="<c:url value="/public/images/animal-complaint.jpg"/>" alt="" srcset="" width="30%">
                                        <img src="<c:url value="/public/images/animal-complaint.jpg"/>" alt="" srcset="" width="30%">
                                        <img src="<c:url value="/public/images/animal-complaint.jpg"/>" alt="" srcset="" width="30%">
                                    </div>
                                </div>
                                <div class="footer">
                                    <div class="current-registered-count">
                                        <img src="<c:url value="/public/images/icons/user.svg"/>" width="25px" />
                                        Mr Akila Disanayake
                                    </div>
                                </div>
                                <div class="footer d-flex-j-c-flex-end">

                                    <div class="accept-btn bg-danger">
                                        Cancel
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="complaint-card-container">
                            <div class="complaint-card">
                                <div class="title">
                                    Complaints about health services
                                    <p> 2021/01/10</p>
                                </div>

                                <div class="properties">
                                    <ul>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/map-pin.svg"/>" width="22px" />
                                            Location : pending ...
                                        </li>
                                    </ul>
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
                                            Status : pending ...
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/map-pin.svg"/>" width="22px" />
                                            proofs :
                                        </li>
                                    </ul>
                                </div>
                                <div class="row">
                                    <div class="proofs-images d-flex-j-c-space-b">
                                        <img src="<c:url value="/public/images/animal-complaint.jpg"/>" alt="" srcset="" width="30%">
                                        <img src="<c:url value="/public/images/animal-complaint.jpg"/>" alt="" srcset="" width="30%">
                                        <img src="<c:url value="/public/images/animal-complaint.jpg"/>" alt="" srcset="" width="30%">
                                    </div>
                                </div>
                                <div class="footer">
                                    <div class="current-registered-count">
                                        <img src="<c:url value="/public/images/icons/user.svg"/>" width="25px" />
                                        Mr Akila Disanayake
                                    </div>
                                </div>
                                <div class="footer d-flex-j-c-flex-end">

                                    <div class="accept-btn bg-danger">
                                        Cancel
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="dashboard-container">
                    <div class="dashboard-page-sub-title">
                        Make a Complaints
                    </div>
                    <div class="make-complaint-form">
                        <form>
                            <div class="row">
                                <div class="form-group">
                                    <label for="cTitle">
                                        complaint Title
                                    </label>
                                    <input type="text" name="name" id="cTitle" autocomplete="off" />

                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="complaintType">
                                        complaint Type
                                    </label>
                                    <input id="complaintType" type="text" list="allcomplaintType"
                                           name="complaintType" autocomplete="off">
                                    <datalist id="allcomplaintType">
                                        <option value="Mahapola" option=" Mahapola"></option>
                                    </datalist>
                                </div>
                                <div class="form-group">
                                    <label for="uDetailsType">
                                        User Details Type
                                    </label>
                                    <input id="uDetailsType" type="text" list="alluDetailsType" name="alluDetailsType" autocomplete="off">
                                    <datalist id="alluDetailsType">
                                        <option value="With Details" option="With Details"></option>
                                        <option value="Anonymous" option="Anonymous"></option>
                                    </datalist>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="phi">
                                        Your Area's PHI Name
                                    </label>
                                    <input id="phi" type="text" list="allphi" name="phi" autocomplete="off">
                                    <datalist id="allphi">
                                        <option value="Hansana" option="Hansana"></option>
                                    </datalist>
                                </div>
                                <div class="form-group">

                                </div>

                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="reason">
                                        Description
                                    </label>
                                    <textarea rows="4" cols="50" type="text" placeholder="deascription"
                                              name="reason" id="reason"></textarea>
                                </div>

                            </div>
                            <div class="row ">
                                <div class="image-upload-card-list-container">
                                    <div class="image-upload-card-container">
                                        <div class="image-upload-card">
                                            <img id="proof1" width="100%" />
                                            <input type="file" accept="image/*" name="image" id="proof1input"
                                                   onchange="loadFile(event , 'proof1')" style="display: none;">
                                            <label for="proof1input" style="cursor: pointer;">Upload Image</label>
                                        </div>
                                    </div>
                                    <div class="image-upload-card-container">
                                        <div class="image-upload-card">
                                            <img id="proof2" width="100%" />
                                            <input type="file" accept="image/*" name="image" id="proof2input"
                                                   onchange="loadFile(event, 'proof2')" style="display: none;">
                                            <label for="proof2input" style="cursor: pointer;">Upload Image</label>
                                        </div>
                                    </div>
                                    <div class="image-upload-card-container">
                                        <div class="image-upload-card">
                                            <img id="proof3" width="100%" />
                                            <input type="file" accept="image/*" name="image" id="proof3input"
                                                   onchange="loadFile(event, 'proof3')" style="display: none;">
                                            <label for="proof3input" style="cursor: pointer;">Upload Image</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group d-flex-a-i-end">
                                    <button class="submitBtn "> Make Complaint</button>
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
    var loadFile = function (event, imgContainerId) {
        var image = document.getElementById(imgContainerId);
        image.src = URL.createObjectURL(event.target.files[0]);
    };
</script>
<script>
    feather.replace({ width: "20px" })
</script>
</body>
</html>
