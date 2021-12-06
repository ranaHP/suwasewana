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
    <link href="<c:url value="/public/css/user/_dashboard_clinic_manage.css"/>" rel="stylesheet"/>

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
    <script src="<c:url value="/public/js/navbar.js"/>"></script>
    <script src="<c:url value="/public/js/loginLogout.js"/>"></script>
    <script src="<c:url value="/public/js/citizen/userViewclinics.js"></c:url> "></script>

    <title>Complain</title>
</head>
<body onload="view()">
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
                        <script> let navs =  new Navbar(); navs.showHeaderNavItems("navbar"); </script>
                    </ul>
                </div>
                <div class="login-register-container">
                    <div class="language">
                        <span> සිංහල </span>
                        <img src="<c:url value="/public/images/sri-lanka.png "/>" alt="sri lanakan flag" width="100%">
                    </div>
                    <script>
                        let loginRegsiter = new LoginLogout(); loginRegsiter.showLoginLogoutItems("login-register-container")
                    </script>
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
                    Clinic Programs
                    <div class="dashboard-sub-title">
                        SUWASEWANA/CLINICS
                    </div>
                </div>

                <div class="dashboard-container">
                    <div class="dashboard-page-sub-title">
                        Clinic Programs
                    </div>

                    <div class="clinic-card-list">
                        <div class="clinic-card-container">
                            <div class="clinic-card">
                                <div class="title">
                                    Covid19 Awareness Session
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
                                            <img src="<c:url value="/public/images/icons/map-pin.svg"/>" width="15px" />
                                            Location : Eluketiya Manduni's home
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />
                                            Conduct : Dr Akila Lulakshi
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />
                                            Max participant limit : 1000
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />
                                            MOH Area :Akuressa
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />
                                            Target participant :Dr Akila Lulakshi
                                        </li>
                                    </ul>
                                </div>
                                <!-- <div class="row">
                                    <div class="special-note">
                                        Special note: <div id="special-note">
                                            There are no speacific messages
                                        </div>
                                    </div>
                                </div> -->
                                <div class="footer">
                                    <div class="current-registered-count">
                                        <img src="<c:url value="/public/images/icons/users.svg"/>" width="18px" />
                                        120,22
                                    </div>
                                    <div class="register-btn">
                                        Registered
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="dashboard-container">
                    <div class="dashboard-page-sub-title">
                        Upcomming Clinic Programs
                    </div>
                    <div class="search-container">
                        <div class="form-group">
                            <input id="diseases" type="text" list="alldiseases" name="moh" autocomplete="off" placeholder="search by dieases">
                            <datalist id="alldiseases">
                                <option value="Covid19" label="Covid19"  > </option>
                            </datalist>
                        </div>
                        <button class="search-btn" > Search</button>
                    </div>
                    <div class="clinic-card-list" id="clinic-card-list">
<%--                        <div class="clinic-card-container" id="clinic-card-container">--%>
<%--                        </div>--%>
<%--                        <div class="clinic-card-container">--%>
<%--                            <div class="clinic-card">--%>
<%--                                <div class="title">--%>
<%--                                    Covid19 Awareness Session--%>
<%--                                    <p> 2021/01/10</p>--%>
<%--                                </div>--%>
<%--                                <div class="desc">--%>
<%--                                    he process of writing a job description requires--%>
<%--                                    having a clear understanding of the job’s duties--%>
<%--                                    and responsibilities. The job posting should also--%>
<%--                                    include a concise picture of the skills required--%>
<%--                                    Organize the job--%>
<%--                                </div>--%>
<%--                                <div class="properties">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/map-pin.svg"/>" width="15px" />--%>
<%--                                            Location : Eluketiya Manduni's home--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            Conduct : Dr Akila Lulakshi--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            Max participant limit : 1000--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            MOH Area :Akuressa--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            Target participant :Dr Akila Lulakshi--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                                <div class="footer">--%>
<%--                                    <div class="current-registered-count">--%>
<%--                                        <img src="<c:url value="/public/images/icons/users.svg"/>" width="18px" />--%>
<%--                                        120,22--%>
<%--                                    </div>--%>
<%--                                    <div class="register-btn">--%>
<%--                                        Register--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="clinic-card-container">--%>
<%--                            <div class="clinic-card">--%>
<%--                                <div class="title">--%>
<%--                                    Covid19 Awareness Session--%>
<%--                                    <p> 2021/01/10</p>--%>
<%--                                </div>--%>
<%--                                <div class="desc">--%>
<%--                                    he process of writing a job description requires--%>
<%--                                    having a clear understanding of the job’s duties--%>
<%--                                    and responsibilities. The job posting should also--%>
<%--                                    include a concise picture of the skills required--%>
<%--                                    Organize the job--%>
<%--                                </div>--%>
<%--                                <div class="properties">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/map-pin.svg"/>" width="15px" />--%>
<%--                                            Location : Eluketiya Manduni's home--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            Conduct : Dr Akila Lulakshi--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            Max participant limit : 1000--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            MOH Area :Akuressa--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            Target participant :Dr Akila Lulakshi--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                                <div class="footer">--%>
<%--                                    <div class="current-registered-count">--%>
<%--                                        <img src="<c:url value="/public/images/icons/users.svg"/>" width="18px" />--%>
<%--                                        120,22--%>
<%--                                    </div>--%>
<%--                                    <div class="register-btn">--%>
<%--                                        Register--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="clinic-card-container">--%>
<%--                            <div class="clinic-card">--%>
<%--                                <div class="title">--%>
<%--                                    Covid19 Awareness Session--%>
<%--                                    <p> 2021/01/10</p>--%>
<%--                                </div>--%>
<%--                                <div class="desc">--%>
<%--                                    he process of writing a job description requires--%>
<%--                                    having a clear understanding of the job’s duties--%>
<%--                                    and responsibilities. The job posting should also--%>
<%--                                    include a concise picture of the skills required--%>
<%--                                    Organize the job--%>
<%--                                </div>--%>
<%--                                <div class="properties">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/map-pin.svg"/>" width="15px" />--%>
<%--                                            Location : Eluketiya Manduni's home--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            Conduct : Dr Akila Lulakshi--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            Max participant limit : 1000--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            MOH Area :Akuressa--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            Target participant :Dr Akila Lulakshi--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                                <div class="footer">--%>
<%--                                    <div class="current-registered-count">--%>
<%--                                        <img src="<c:url value="/public/images/icons/users.svg"/>" width="18px" />--%>
<%--                                        120,22--%>
<%--                                    </div>--%>
<%--                                    <div class="register-btn">--%>
<%--                                        Register--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="clinic-card-container">--%>
<%--                            <div class="clinic-card">--%>
<%--                                <div class="title">--%>
<%--                                    Covid19 Awareness Session--%>
<%--                                    <p> 2021/01/10</p>--%>
<%--                                </div>--%>
<%--                                <div class="desc">--%>
<%--                                    he process of writing a job description requires--%>
<%--                                    having a clear understanding of the job’s duties--%>
<%--                                    and responsibilities. The job posting should also--%>
<%--                                    include a concise picture of the skills required--%>
<%--                                    Organize the job--%>
<%--                                </div>--%>
<%--                                <div class="properties">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/map-pin.svg"/>" width="15px" />--%>
<%--                                            Location : Eluketiya Manduni's home--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            Conduct : Dr Akila Lulakshi--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            Max participant limit : 1000--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            MOH Area :Akuressa--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            Target participant :Dr Akila Lulakshi--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                                <div class="footer">--%>
<%--                                    <div class="current-registered-count">--%>
<%--                                        <img src="<c:url value="/public/images/icons/users.svg"/>" width="18px" />--%>
<%--                                        120,22--%>
<%--                                    </div>--%>
<%--                                    <div class="register-btn">--%>
<%--                                        Register--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="clinic-card-container">--%>
<%--                            <div class="clinic-card">--%>
<%--                                <div class="title">--%>
<%--                                    Covid19 Awareness Session--%>
<%--                                    <p> 2021/01/10</p>--%>
<%--                                </div>--%>
<%--                                <div class="desc">--%>
<%--                                    he process of writing a job description requires--%>
<%--                                    having a clear understanding of the job’s duties--%>
<%--                                    and responsibilities. The job posting should also--%>
<%--                                    include a concise picture of the skills required--%>
<%--                                    Organize the job--%>
<%--                                </div>--%>
<%--                                <div class="properties">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/map-pin.svg"/>" width="15px" />--%>
<%--                                            Location : Eluketiya Manduni's home--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            Conduct : Dr Akila Lulakshi--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            Max participant limit : 1000--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            MOH Area :Akuressa--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />--%>
<%--                                            Target participant :Dr Akila Lulakshi--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                                <div class="footer">--%>
<%--                                    <div class="current-registered-count">--%>
<%--                                        <img src="<c:url value="/public/images/icons/users.svg"/>" width="18px" />--%>
<%--                                        120,22--%>
<%--                                    </div>--%>
<%--                                    <div class="register-btn">--%>
<%--                                        Register--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="main-footer">
        <div class="first-row">
            <img src="<c:url value="/public/images/logo.png "/>" alt="logo" width="45px"/>

            <div class="navbar-container">
                <ul class="navbar navbar1">
                    <script> let navs1 =  new Navbar(); navs.showHeaderNavItems("navbar1"); </script>
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


    let clinicList1 = new clinicList("clinic-card-list");
    // let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    view();
    function view(){
        let clinicListArray=[]
        console.log("before")
        $.post("/test_war_exploded/user-view-clinic-controller/view",
            // reqData,
            function(data,status){
                clinicListArray=JSON.parse(data)
                // console.log(clinicListArray)
                clinicList1.setData(clinicListArray);

            }
        );
        console.log("after")
    }
</script>
<script>
    feather.replace({ width: "20px" })
</script>
</body>
</html>
