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
    <link href="<c:url value="/public/css/user/_dashboard_announcetment.css"/>" rel="stylesheet"/>

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
    <script src="<c:url value="/public/js/loginDetails.js"/>"></script>
    <%--    rphi announcement--%>
    <script src="<c:url value="/public/js/citizen/UserViewRPHIAnnouncement.js"/>"></script>
    <%--    clinic announcement--%>
    <script src="<c:url value="/public/js/citizen/UserViewClinicAnnouncement.js"/>"></script>

    <%--    Goverment announcement--%>
    <script src="<c:url value="/public/js/citizen/UserViewGovermentAnnouncement.js"/>"></script>

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
                        <script> let navs = new Navbar();
                        navs.showHeaderNavItems("navbar"); </script>
                    </ul>
                </div>
                <div class="login-register-container">
                    <div class="language">
                        <span> සිංහල </span>
                        <img src="<c:url value="/public/images/sri-lanka.png "/>" alt="sri lanakan flag" width="100%">
                    </div>
                    <script>
                        let loginRegsiter = new LoginLogout();
                        loginRegsiter.showLoginLogoutItems("login-register-container")
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
                    <script>
                        let loginDetails = new LoginDetails();
                        loginDetails.showLoginDetails("dashboard-profile-details")
                    </script>
                </div>
                <div class="dashboard-icon-set">

                    <div class="dash-tab">
                        <div class="dash-icon" onclick="dashboard()">

                            <img src="<c:url value="/public/images/icons/grid.svg"/>" width="20px" />
                            <!-- <object data="images/icons/grid.svg" width="20px" height="20px" style="color: brown;"> </object> -->
                        </div>
                        <div class="dash-title">
                            Dashboard
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="Diseases()">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Diseases
                        </div>
                    </div>
                    <div class="dash-tab" >
                        <div class="dash-icon" onclick="Announcement()">
                            <img src="<c:url value="/public/images/icons/volume-2.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Announcement
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="Clinic()">
                            <img src="<c:url value="/public/images/icons/layers.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Clinic
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="Complainss()">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Complain
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="Appoiment()">
                            <img src="<c:url value="/public/images/icons/calendar.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Appoiment
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="vaccine()">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
                        </div>

                        <div class="dash-title">
                            vaccine
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="vaccinetypesView()">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
                        </div>

                        <div class="dash-title">
                            vaccine types view
                        </div>
                    </div>

                </div>
            </div>
            <div class="right-dashboard">
                <div class="dashboard-page-title">
                    Announcement
                    <div class="dashboard-sub-title">
                        SUWASEWANA/CLINICS
                    </div>
                </div>
                <div class="dashboard-container" style="height: 80px;">
                    <div class="shortcuts-container">
                        <div class="dash-tab">

                            <div class="dash-title">
                                <a href="#dashboard-container1"  style="color: #2f3032e6; text-decoration: none">Government</a>
                            </div>
                        </div>
                        <div class="dash-tab">

                            <div class="dash-title">
                                <a href="#dashboard-container2"  style="color: #2f3032e6; text-decoration: none">PHI</a>
                            </div>
                        </div>
                        <div class="dash-tab">
                            <div class="dash-title">
                                <a href="#dashboard-container3" style="color: #2f3032e6; text-decoration: none">Clinic</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="dashboard-container" id="dashboard-container1" style="height: 800px;overflow-y: scroll;">
                    <div class="dashboard-page-sub-title">
                        Government Announcement
                    </div>


                <div class= "main-search-container" style="width: 100%;display: flex;justify-content: space-around">

                    <div class="search-container">
                        <div class="form-group">
                            <input id="diseasesSearch1" type="text" name="moh"
                                   autocomplete="off" placeholder="search by title" onkeyup="searchgoverment()">
<%--                            <datalist id="alldiseasesSearch">--%>
<%--                                <option value="Covid19" label="Covid19"></option>--%>
<%--                            </datalist>--%>
                        </div>
                        <button class="search-btn"> Search</button>
                    </div>

                    <div class="search-container">
                        <div class="form-group">
                            <input id="diseasesSearch2" type="date" name="moh"
                                   autocomplete="off" placeholder="search by date" >
                            <%--                            <datalist id="alldiseasesSearch">--%>
                            <%--                                <option value="Covid19" label="Covid19"></option>--%>
                            <%--                            </datalist>--%>
                        </div>
                        <button class="search-btn" onclick="searchgovermentdate()" > Search</button>
                    </div>
                </div>

                    <div class="announcetment-list-card-container" id="announcetment-list-card-container1">
<%--                        <div class="latest-announstment-cards-container">--%>
<%--                            <div class="latest-announstment-card">--%>
<%--                                <div class="image-container">--%>
<%--                                    <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>--%>
<%--                                    <div class="read-more-btn">--%>
<%--                                        Read More--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="title">--%>
<%--                                    ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට--%>
<%--                                </div>--%>
<%--                                <div class="suwasaewana">--%>
<%--                                    SUWASEWANA.LK--%>
<%--                                </div>--%>
<%--                                <div class="posted-time">--%>
<%--                                    15/21/2021--%>
<%--                                </div>--%>
<%--                                <div class="desc">--%>
<%--                                    නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්--%>
<%--                                    රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු--%>
<%--                                    අවස්ථාව ගැන ඔබ දැනුවත්ද?--%>
<%--                                </div>--%>

<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="latest-announstment-cards-container">--%>
<%--                            <div class="latest-announstment-card">--%>
<%--                                <div class="image-container">--%>
<%--                                    <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>--%>
<%--                                    <div class="read-more-btn">--%>
<%--                                        Read More--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="title">--%>
<%--                                    ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට--%>
<%--                                </div>--%>
<%--                                <div class="suwasaewana">--%>
<%--                                    SUWASEWANA.LK--%>
<%--                                </div>--%>
<%--                                <div class="posted-time">--%>
<%--                                    15/21/2021--%>
<%--                                </div>--%>
<%--                                <div class="desc">--%>
<%--                                    නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්--%>
<%--                                    රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු--%>
<%--                                    අවස්ථාව ගැන ඔබ දැනුවත්ද?--%>
<%--                                </div>--%>

<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="latest-announstment-cards-container">--%>
<%--                            <div class="latest-announstment-card">--%>
<%--                                <div class="image-container">--%>
<%--                                    <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>--%>
<%--                                    <div class="read-more-btn">--%>
<%--                                        Read More--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="title">--%>
<%--                                    ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට--%>
<%--                                </div>--%>
<%--                                <div class="suwasaewana">--%>
<%--                                    SUWASEWANA.LK--%>
<%--                                </div>--%>
<%--                                <div class="posted-time">--%>
<%--                                    15/21/2021--%>
<%--                                </div>--%>
<%--                                <div class="desc">--%>
<%--                                    නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්--%>
<%--                                    රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු--%>
<%--                                    අවස්ථාව ගැන ඔබ දැනුවත්ද?--%>
<%--                                </div>--%>

<%--                            </div>--%>
<%--                        </div>--%>


                    </div>
                </div>

                <div class="dashboard-container" id="dashboard-container2" style="height: 800px;overflow-y: scroll;">
                    <div class="dashboard-page-sub-title">
                        PHI Announcement
                    </div>

                <div class="main-search-container" style="width: 100%;display: flex;justify-content: space-around">
                    <div class="search-container">
                        <div class="form-group">
                            <input id="diseasesSearch21" onkeyup="searchphi()" type="text"  name="moh"
                                   autocomplete="off" placeholder="search by name"
                                   >
<%--                            <datalist id="alldiseasesSearch2">--%>
<%--                                <option value="Covid19" label="Covid19"></option>--%>
<%--                            </datalist>--%>
                        </div>
                        <button class="search-btn" > Search</button>
                    </div>

                    <div class="search-container">
                        <div class="form-group">
                            <input id="diseasesSearch22" type="date"  name="moh"
                                   autocomplete="off" placeholder="search by date"
                            >
<%--                            <datalist id="alldiseasesSearch2">--%>
<%--                                <option value="Covid19" label="Covid19"></option>--%>
<%--                            </datalist>--%>
                        </div>
                        <button class="search-btn" onclick="searchphidate()"> Search</button>
                    </div>

                </div>


                    <div class="announcetment-list-card-container" id="announcetment-list-card-container2">

<%--                        <div class="latest-announstment-cards-container">--%>
<%--                            <div class="latest-announstment-card">--%>
<%--                                <div class="image-container">--%>
<%--                                    <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>--%>
<%--                                    <div class="read-more-btn">--%>
<%--                                        Read More--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="title">--%>
<%--                                    ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට--%>
<%--                                </div>--%>
<%--                                <div class="suwasaewana">--%>
<%--                                    SUWASEWANA.LK--%>
<%--                                </div>--%>
<%--                                <div class="posted-time">--%>
<%--                                    15/21/2021--%>
<%--                                </div>--%>
<%--                                <div class="desc">--%>
<%--                                    නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්--%>
<%--                                    රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු--%>
<%--                                    අවස්ථාව ගැන ඔබ දැනුවත්ද?--%>
<%--                                </div>--%>

<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="latest-announstment-cards-container">--%>
<%--                            <div class="latest-announstment-card">--%>
<%--                                <div class="image-container">--%>
<%--                                    <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>--%>
<%--                                    <div class="read-more-btn">--%>
<%--                                        Read More--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="title">--%>
<%--                                    ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට--%>
<%--                                </div>--%>
<%--                                <div class="suwasaewana">--%>
<%--                                    SUWASEWANA.LK--%>
<%--                                </div>--%>
<%--                                <div class="posted-time">--%>
<%--                                    15/21/2021--%>
<%--                                </div>--%>
<%--                                <div class="desc">--%>
<%--                                    නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්--%>
<%--                                    රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු--%>
<%--                                    අවස්ථාව ගැන ඔබ දැනුවත්ද?--%>
<%--                                </div>--%>

<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="latest-announstment-cards-container">--%>
<%--                            <div class="latest-announstment-card">--%>
<%--                                <div class="image-container">--%>
<%--                                    <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>--%>
<%--                                    <div class="read-more-btn">--%>
<%--                                        Read More--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="title">--%>
<%--                                    ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට--%>
<%--                                </div>--%>
<%--                                <div class="suwasaewana">--%>
<%--                                    SUWASEWANA.LK--%>
<%--                                </div>--%>
<%--                                <div class="posted-time">--%>
<%--                                    15/21/2021--%>
<%--                                </div>--%>
<%--                                <div class="desc">--%>
<%--                                    නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්--%>
<%--                                    රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු--%>
<%--                                    අවස්ථාව ගැන ඔබ දැනුවත්ද?--%>
<%--                                </div>--%>

<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="latest-announstment-cards-container">--%>
<%--                            <div class="latest-announstment-card">--%>
<%--                                <div class="image-container">--%>
<%--                                    <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>--%>
<%--                                    <div class="read-more-btn">--%>
<%--                                        Read More--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="title">--%>
<%--                                    ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට--%>
<%--                                </div>--%>
<%--                                <div class="suwasaewana">--%>
<%--                                    SUWASEWANA.LK--%>
<%--                                </div>--%>
<%--                                <div class="posted-time">--%>
<%--                                    15/21/2021--%>
<%--                                </div>--%>
<%--                                <div class="desc">--%>
<%--                                    නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්--%>
<%--                                    රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු--%>
<%--                                    අවස්ථාව ගැන ඔබ දැනුවත්ද?--%>
<%--                                </div>--%>

<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                </div>
                <div class="dashboard-container" id="dashboard-container3" style="height: 800px;overflow-y: scroll;">
                    <div class="dashboard-page-sub-title">
                        Clinic Announcement
                    </div>

                <div class="main-search-container" style="width: 100%;display: flex;justify-content: space-around">
                    <div class="search-container">
                        <div class="form-group">
                            <input id="diseases1" type="date"  name="moh" autocomplete="off"
                                   placeholder="search by date">
<%--                            <datalist id="alldiseases">--%>
<%--                                <option value="Covid19" label="Covid19"></option>--%>
<%--                            </datalist>--%>
                        </div>
                        <button class="search-btn" onclick="searchclinicdate()"> Search</button>
                    </div>

                    <div class="search-container">
                        <div class="form-group">
                            <input id="diseases2" type="text" onkeyup="searchclinic()"  name="moh" autocomplete="off"
                                   placeholder="search by name">
                            <%--                            <datalist id="alldiseases">--%>
                            <%--                                <option value="Covid19" label="Covid19"></option>--%>
                            <%--                            </datalist>--%>
                        </div>
                        <button class="search-btn" > Search</button>
                    </div>

                </div>


                    <div class="announcetment-list-card-container" id="announcetment-list-card-container">

<%--                        <div class="latest-announstment-cards-container">--%>
<%--                            <div class="latest-announstment-card">--%>
<%--                                <div class="image-container">--%>
<%--                                    <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>--%>
<%--                                    <div class="read-more-btn">--%>
<%--                                        Read More--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="title">--%>
<%--                                    ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට--%>
<%--                                </div>--%>
<%--                                <div class="suwasaewana">--%>
<%--                                    SUWASEWANA.LK--%>
<%--                                </div>--%>
<%--                                <div class="posted-time">--%>
<%--                                    15/21/2021--%>
<%--                                </div>--%>
<%--                                <div class="desc">--%>
<%--                                    නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්--%>
<%--                                    රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු--%>
<%--                                    අවස්ථාව ගැන ඔබ දැනුවත්ද?--%>
<%--                                </div>--%>

<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="latest-announstment-cards-container">--%>
<%--                            <div class="latest-announstment-card">--%>
<%--                                <div class="image-container">--%>
<%--                                    <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>--%>
<%--                                    <div class="read-more-btn">--%>
<%--                                        Read More--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="title">--%>
<%--                                    ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට--%>
<%--                                </div>--%>
<%--                                <div class="suwasaewana">--%>
<%--                                    SUWASEWANA.LK--%>
<%--                                </div>--%>
<%--                                <div class="posted-time">--%>
<%--                                    15/21/2021--%>
<%--                                </div>--%>
<%--                                <div class="desc">--%>
<%--                                    නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්--%>
<%--                                    රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු--%>
<%--                                    අවස්ථාව ගැන ඔබ දැනුවත්ද?--%>
<%--                                </div>--%>

<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="latest-announstment-cards-container">--%>
<%--                            <div class="latest-announstment-card">--%>
<%--                                <div class="image-container">--%>
<%--                                    <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>--%>
<%--                                    <div class="read-more-btn">--%>
<%--                                        Read More--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="title">--%>
<%--                                    ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට--%>
<%--                                </div>--%>
<%--                                <div class="suwasaewana">--%>
<%--                                    SUWASEWANA.LK--%>
<%--                                </div>--%>
<%--                                <div class="posted-time">--%>
<%--                                    15/21/2021--%>
<%--                                </div>--%>
<%--                                <div class="desc">--%>
<%--                                    නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්--%>
<%--                                    රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු--%>
<%--                                    අවස්ථාව ගැන ඔබ දැනුවත්ද?--%>
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
                    <script> let navs1 = new Navbar();
                    navs.showHeaderNavItems("navbar1"); </script>
                </ul>
            </div>
        </div>
        <div class="second-row">
            © 2021 SUWASEWANA.LK | All Right Reserved
        </div>
    </div>
</div>
<script defer>
    let locationgenarator = new LocationSelectGenarate("allprovince", "alldistrict", "allcity");
    // document.getElementById('province').addEventListener('input', function (evt) {
    //     locationgenarator.provinceSelect(this.value)
    // });
    let moh = new MOHSelectGenarate('allmoh');
    mapInit();

    function mapInit() {
        mapboxgl.accessToken = 'pk.eyJ1IjoiaGFuc2FuYTg3NiIsImEiOiJja3UwMWtrb3ExNjd2Mm9xaDh2MjdjM2FoIn0.6rDLn-mL41GbBUIW3B8MIA';
        const map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/streets-v11',
            center: [80.4771, 6.0994334],
            zoom: 8
        });

        map.addControl(
            new MapboxGeocoder({
                accessToken: mapboxgl.accessToken,
                mapboxgl: mapboxgl
            })
        );

        const marker = new mapboxgl.Marker({
            draggable: true
        })
            .setLngLat([80.4771, 6.0994334])
            .addTo(map);

        function onDragEnd() {
            const lngLat = marker.getLngLat();
            coordinates.style.display = 'block';
            coordinates.innerHTML = `Longitude: ${lngLat.lng}<br />Latitude: ${lngLat.lat}`;
        }

        marker.on('dragend', onDragEnd);
    }
</script>
<script defer>


    announcement()
    function announcement(){
        let selectA = new View_RPHI_announcement("announcetment-list-card-container2");

        let announcementArray=[]

        // console.log(reqData)
        $.post("/test_war_exploded/user-announcement-controller/createMA",
            // reqData,
            function(data1,status){
                // alert(data1)
                announcementArray=JSON.parse(data1)
                // console.log(clinicListArray)
                selectA.setData(announcementArray);

            }
        );
    }




    clinicannouncement()
    function clinicannouncement(){
        let clinic = new View_clinic_announcement("announcetment-list-card-container");

        let announcementArray=[]

        // console.log(reqData)
        $.post("/test_war_exploded/user-announcement-controller/clinic",
            // reqData,
            function(data1,status){
                // alert(data1)
                announcementArray=JSON.parse(data1)

                console.log("clinic announcement array")
                console.log(announcementArray)
                console.log("============================================")

                clinic.setData(announcementArray);

            }
        );
    }




</script>






<script defer>
    govermentannouncemenet()
    function govermentannouncemenet(){
        let goverment = new View_goverment_announcement("announcetment-list-card-container1");

        let gannouncementArray=[]

        // console.log(reqData)
        $.post("/test_war_exploded/user-goverment-announcement/view",
            // reqData,
            function(data,status){
                // alert(data1)
                gannouncementArray=JSON.parse(data)
                // console.log(clinicListArray)
                goverment.setData(gannouncementArray);

            }
        );
    }

    function dashboard(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/");
    }

    function Diseases(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"diseases");
    }

    function Announcement(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"announcement");
    }

    function Clinic(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"clinic");
    }

    function Complainss(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"complain");
    }

    function Appoiment(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"appointment");
    }
    function vaccine(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"Register-for-vaccine");
    }

    function Edit(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/");
    }
    function vaccinetypesView(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"ViewVaccinesForUser");
    }

</script>
<script>
    feather.replace({width: "20px"})
</script>
</body>
</html>
