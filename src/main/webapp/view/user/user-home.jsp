
<%--
  Created by IntelliJ IDEA.
  User: Akila
  Date: 9/22/2021
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="<c:url value="/public/js/inputValidation.js"/>"></script>
    <title> User Home Suwasewana </title>

    <!-- for style sheet link  -->
    <link href="<c:url value="/public/css/user/_user-home.css"/>" rel="stylesheet"/>
    <!-- for commen style  sheet link  -->
    <link href="<c:url value="/public/css/user/_commen.css"/>" rel="stylesheet"/>

    <%--    for popup style--%>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>

    <!-- for feather icon -->
    <script src="https://unpkg.com/feather-icons"></script>

    <!-- for latest announcement -->
    <script src="<c:url value="/public/js/latest-announcetment%20copy.js "/>" defer></script>

    <!-- for jquery -->
    <script src="<c:url value="/public/js/disease-details.js"/>"></script>
    <script src="<c:url value="/public/js/navbar.js"/>"></script>
    <script src="<c:url value="/public/js/loginLogout.js"/>"></script>
    <script src="<c:url value="/public/js/citizen/userHomeViewClinic.js"/>"></script>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
    <script src="<c:url value="/public/js/citizen/UserHomeViewGovermentAnnouncement.js"/>"></script>
    <script src="<c:url value="/public/js/citizen/UserHomeDisease.js"/>"></script>

</head>
<body>
<div class="mypopup" id="popup" style="display: none;"></div>
<!-- main container -->
<div class="container">
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
        <!-- hero banner -->
        <%--        <form method="post" onsubmit="return imageUpload();" enctype="multipart/form-data">--%>
        <%--            <input type="file" name="file" id="imageasd"/>--%>
        <%--            <input type="file" name="file" id="imageasd1"/>--%>
        <%--            <input type="file" name="file" id="imageasd2"/>--%>
        <%--            <input type="submit" value="Upload"/>--%>
        <%--        </form>--%>

        <div class="hero-banner">
            <div class="left-col">
                <div class="first-row">
                    <div class="location">
                        <i data-feather="map-pin"></i>
                        Sri lanka
                    </div>
                    <div class="text">
                        ඔබ වටා පැතිර යන <br> රෝග ගැන ඔබ දන්නවාද ?
                    </div>
                    <div class="view-more-btn">
                        <button class="readmore-btn">
                            වැඩිදුර කියවන්න
                        </button>
                    </div>
                    <div class="slide-show-points">
                        <i data-feather="circle"></i>
                        <i data-feather="circle"></i>
                        <i data-feather="circle"></i>
                        <i data-feather="circle"></i>

                    </div>
                </div>
                <div class="second-row">

                    <div class="announcement-container"></div>
                    <div class="right-icon">
                    </div>
                </div>

            </div>
            <div class="right-col">
                <div class="circle"></div>
                <img src="<c:url value="/public/images/banner2.png "/>" alt="banner1" width="100%">
            </div>
        </div>
    </section>
    <!-- this for latest announcements -->
    <section>
        <div class="section-title">
            <div class="header">
                සෞඛ්‍ය නිවේදනය
            </div>
            <div class="title-sub">
                අද දිනයේ කොවිඩ් සඳහා එන්නත්කරණ කටයුතු සිදු කෙරෙන ස්ථාන 212ක්
            </div>
        </div>
        <div class="latest-announstment-container">
            <img src="<c:url value="/public/images/icons/arrow-left-circle.svg "/>" class="latest-announstment-arrow"
                 width="25px"/>
            <div class="announcetment-list-card-container" id="announcetment-list-card-container">
                <%--                <div class="latest-announstment-cards-container">--%>
                <%--                    <div class="latest-announstment-card">--%>
                <%--                        <div class="image-container">--%>
                <%--                            <img src="images//announcetment_banner.png" width="100%"/>--%>
                <%--                            <div class="read-more-btn">--%>
                <%--                                Read More--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="header">--%>
                <%--                            ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට--%>
                <%--                        </div>--%>
                <%--                        <div class="suwasaewana">--%>
                <%--                            SUWASEWANA.LK--%>
                <%--                        </div>--%>
                <%--                        <div class="posted-time">--%>
                <%--                            15/21/2021--%>
                <%--                        </div>--%>
                <%--                        <div class="desc">--%>
                <%--                            නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්--%>
                <%--                            රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු--%>
                <%--                            අවස්ථාව ගැන ඔබ දැනුවත්ද?--%>
                <%--                        </div>--%>

                <%--                    </div>--%>
                <%--                </div>--%>
                <%--                <div class="latest-announstment-cards-container">--%>
                <%--                    <div class="latest-announstment-card">--%>
                <%--                        <div class="image-container">--%>
                <%--                            <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>--%>
                <%--                            <div class="read-more-btn">--%>
                <%--                                Read More--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="header">--%>
                <%--                            ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට--%>
                <%--                        </div>--%>
                <%--                        <div class="suwasaewana">--%>
                <%--                            SUWASEWANA.LK--%>
                <%--                        </div>--%>
                <%--                        <div class="posted-time">--%>
                <%--                            15/21/2021--%>
                <%--                        </div>--%>
                <%--                        <div class="desc">--%>
                <%--                            නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්--%>
                <%--                            රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු--%>
                <%--                            අවස්ථාව ගැන ඔබ දැනුවත්ද?--%>
                <%--                        </div>--%>

                <%--                    </div>--%>
                <%--                </div>--%>
                <%--                <div class="latest-announstment-cards-container">--%>
                <%--                    <div class="latest-announstment-card">--%>
                <%--                        <div class="image-container">--%>
                <%--                            <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>--%>
                <%--                            <div class="read-more-btn">--%>
                <%--                                Read More--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="header">--%>
                <%--                            ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට--%>
                <%--                        </div>--%>
                <%--                        <div class="suwasaewana">--%>
                <%--                            SUWASEWANA.LK--%>
                <%--                        </div>--%>
                <%--                        <div class="posted-time">--%>
                <%--                            15/21/2021--%>
                <%--                        </div>--%>
                <%--                        <div class="desc">--%>
                <%--                            නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්--%>
                <%--                            රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු--%>
                <%--                            අවස්ථාව ගැන ඔබ දැනුවත්ද?--%>
                <%--                        </div>--%>

                <%--                    </div>--%>
                <%--                </div>--%>
                <%--                <div class="latest-announstment-cards-container">--%>
                <%--                    <div class="latest-announstment-card">--%>
                <%--                        <div class="image-container">--%>
                <%--                            <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>--%>
                <%--                            <div class="read-more-btn">--%>
                <%--                                Read More--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="header">--%>
                <%--                            ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට--%>
                <%--                        </div>--%>
                <%--                        <div class="suwasaewana">--%>
                <%--                            SUWASEWANA.LK--%>
                <%--                        </div>--%>
                <%--                        <div class="posted-time">--%>
                <%--                            15/21/2021--%>
                <%--                        </div>--%>
                <%--                        <div class="desc">--%>
                <%--                            නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්--%>
                <%--                            රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු--%>
                <%--                            අවස්ථාව ගැන ඔබ දැනුවත්ද?--%>
                <%--                        </div>--%>

                <%--                    </div>--%>
                <%--                </div>--%>
                <%--                <div class="latest-announstment-cards-container">--%>
                <%--                    <div class="latest-announstment-card">--%>
                <%--                        <div class="image-container">--%>
                <%--                            <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>--%>
                <%--                            <div class="read-more-btn">--%>
                <%--                                Read More--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="header">--%>
                <%--                            ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට--%>
                <%--                        </div>--%>
                <%--                        <div class="suwasaewana">--%>
                <%--                            SUWASEWANA.LK--%>
                <%--                        </div>--%>
                <%--                        <div class="posted-time">--%>
                <%--                            15/21/2021--%>
                <%--                        </div>--%>
                <%--                        <div class="desc">--%>
                <%--                            නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්--%>
                <%--                            රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු--%>
                <%--                            අවස්ථාව ගැන ඔබ දැනුවත්ද?--%>
                <%--                        </div>--%>

                <%--                    </div>--%>
                <%--                </div>--%>
                <%--                <div class="latest-announstment-cards-container">--%>
                <%--                    <div class="latest-announstment-card">--%>
                <%--                        <div class="image-container">--%>
                <%--                            <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>--%>
                <%--                            <div class="read-more-btn">--%>
                <%--                                Read More--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="header">--%>
                <%--                            ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට--%>
                <%--                        </div>--%>
                <%--                        <div class="suwasaewana">--%>
                <%--                            SUWASEWANA.LK--%>
                <%--                        </div>--%>
                <%--                        <div class="posted-time">--%>
                <%--                            15/21/2021--%>
                <%--                        </div>--%>
                <%--                        <div class="desc">--%>
                <%--                            නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්--%>
                <%--                            රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු--%>
                <%--                            අවස්ථාව ගැන ඔබ දැනුවත්ද?--%>
                <%--                        </div>--%>

                <%--                    </div>--%>
                <%--                </div>--%>
                <%--                <div class="latest-announstment-cards-container">--%>
                <%--                    <div class="latest-announstment-card">--%>
                <%--                        <div class="image-container">--%>
                <%--                            <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>--%>
                <%--                            <div class="read-more-btn">--%>
                <%--                                Read More--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="header">--%>
                <%--                            ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට--%>
                <%--                        </div>--%>
                <%--                        <div class="suwasaewana">--%>
                <%--                            SUWASEWANA.LK--%>
                <%--                        </div>--%>
                <%--                        <div class="posted-time">--%>
                <%--                            15/21/2021--%>
                <%--                        </div>--%>
                <%--                        <div class="desc">--%>
                <%--                            නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්--%>
                <%--                            රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු--%>
                <%--                            අවස්ථාව ගැන ඔබ දැනුවත්ද?--%>
                <%--                        </div>--%>

                <%--                    </div>--%>
                <%--                </div>--%>
                <%--                <div class="latest-announstment-cards-container">--%>
                <%--                    <div class="latest-announstment-card">--%>
                <%--                        <div class="image-container">--%>
                <%--                            <img src="<c:url value="/public/images/announcetment_banner.png"/>" width="100%"/>--%>
                <%--                            <div class="read-more-btn">--%>
                <%--                                Read More--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="header">--%>
                <%--                            ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට--%>
                <%--                        </div>--%>
                <%--                        <div class="suwasaewana">--%>
                <%--                            SUWASEWANA.LK--%>
                <%--                        </div>--%>
                <%--                        <div class="posted-time">--%>
                <%--                            15/21/2021--%>
                <%--                        </div>--%>
                <%--                        <div class="desc">--%>
                <%--                            නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්--%>
                <%--                            රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු--%>
                <%--                            අවස්ථාව ගැන ඔබ දැනුවත්ද?--%>
                <%--                        </div>--%>

                <%--                    </div>--%>
                <%--                </div>--%>
            </div>
            <img src="<c:url value="/public/images/icons/arrow-right-circle.svg"/>" width="25px"
                 class="latest-announstment-arrow"/>
        </div>
    </section>

    <section>
        <div class="section-title">
            <div class="header">
                රෝග පිළිබඳ තොරතුරු
            </div>
            <div class="title-sub">
                අද දිනයේ කොවිඩ් සඳහා එන්නත්කරණ කටයුතු සිදු කෙරෙන ස්ථාන 212ක්
            </div>
        </div>
        <div class="diseases-details-container">
            <div class="diseases-list-container" id="diseases-list-container">

            </div>
        </div>
    </section>

    <section>
        <div class="section-title">
            <div class="header">
                ඉදිරියට එන සායනික වැඩසටහන්
            </div>
            <div class="title-sub">
                අද දිනයේ කොවිඩ් සඳහා එන්නත්කරණ කටයුතු සිදු කෙරෙන ස්ථාන 212ක්
            </div>
        </div>
        <div class="upcoming-clinic">
            <div class="left-col" id="left-col">
<%--                <img src="<c:url value="/public/images/icons/arrow-left-circle.svg"/>" class="clinic-arrow" width="25px"/>--%>
                <%--                <div class="clinic-card-container">--%>
                <%--                    <div class="clinic-card">--%>
                <%--                        <div class="header">--%>
                <%--                            Covid19 Awareness Session--%>
                <%--                            <p> 2021/01/10</p>--%>
                <%--                        </div>--%>
                <%--                        <div class="desc">--%>
                <%--                            he process of writing a job description requires--%>
                <%--                            having a clear understanding of the job’s duties--%>
                <%--                            and responsibilities. The job posting should also--%>
                <%--                            include a concise picture of the skills required--%>
                <%--                            Organize the job--%>
                <%--                        </div>--%>
                <%--                        <div class="properties">--%>
                <%--                            <ul>--%>
                <%--                                <li>--%>
                <%--                                    <img src="images/icons/map-pin.svg" width="15px"/>--%>
                <%--                                    Location : Eluketiya Manduni's home--%>
                <%--                                </li>--%>
                <%--                                <li>--%>
                <%--                                    <img src="images/icons/list.svg" width="15px"/>--%>
                <%--                                    Conduct : Dr Akila Lulakshi--%>
                <%--                                </li>--%>
                <%--                                <li>--%>
                <%--                                    <img src="images/icons/list.svg" width="15px"/>--%>
                <%--                                    Max participant limit : 1000--%>
                <%--                                </li>--%>
                <%--                                <li>--%>
                <%--                                    <img src="images/icons/list.svg" width="15px"/>--%>
                <%--                                    MOH Area :Akuressa--%>
                <%--                                </li>--%>
                <%--                                <li>--%>
                <%--                                    <img src="images/icons/list.svg" width="15px"/>--%>
                <%--                                    Target participant :Dr Akila Lulakshi--%>
                <%--                                </li>--%>
                <%--                            </ul>--%>
                <%--                        </div>--%>
                <%--                        <div class="footer">--%>
                <%--                            <div class="current-registered-count">--%>
                <%--                                <img src="images/icons/users.svg" width="18px"/>--%>
                <%--                                120,22--%>
                <%--                            </div>--%>
                <%--                            <div class="register-btn">--%>
                <%--                                Register--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>


                <%--                <div class="clinic-card-container">--%>
                <%--                    <div class="clinic-card">--%>
                <%--                        <div class="header">--%>
                <%--                            Covid19 Awareness Session--%>
                <%--                            <p> 2021/01/10</p>--%>
                <%--                        </div>--%>
                <%--                        <div class="desc">--%>
                <%--                            he process of writing a job description requires--%>
                <%--                            having a clear understanding of the job’s duties--%>
                <%--                            and responsibilities. The job posting should also--%>
                <%--                            include a concise picture of the skills required--%>
                <%--                            Organize the job--%>
                <%--                        </div>--%>
                <%--                        <div class="properties">--%>
                <%--                            <ul>--%>
                <%--                                <li>--%>
                <%--                                    <img src="images/icons/map-pin.svg" width="15px"/>--%>
                <%--                                    Location : Eluketiya Manduni's home--%>
                <%--                                </li>--%>
                <%--                                <li>--%>
                <%--                                    <img src="images/icons/list.svg" width="15px"/>--%>
                <%--                                    Conduct : Dr Akila Lulakshi--%>
                <%--                                </li>--%>
                <%--                                <li>--%>
                <%--                                    <img src="images/icons/list.svg" width="15px"/>--%>
                <%--                                    Max participant limit : 1000--%>
                <%--                                </li>--%>
                <%--                                <li>--%>
                <%--                                    <img src="images/icons/list.svg" width="15px"/>--%>
                <%--                                    MOH Area :Akuressa--%>
                <%--                                </li>--%>
                <%--                                <li>--%>
                <%--                                    <img src="images/icons/list.svg" width="15px"/>--%>
                <%--                                    Target participant :Dr Akila Lulakshi--%>
                <%--                                </li>--%>
                <%--                            </ul>--%>
                <%--                        </div>--%>
                <%--                        <div class="footer">--%>
                <%--                            <div class="current-registered-count">--%>
                <%--                                <img src="images/icons/users.svg" width="18px"/>--%>
                <%--                                120,22--%>
                <%--                            </div>--%>
                <%--                            <div class="register-btn">--%>
                <%--                                Register--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
<%--                <img src="<c:url value="/public/images/icons/arrow-right-circle.svg"/>" width="25px" class="clinic-arrow"/>--%>

            </div>
            <div class="right-col">
                <img src="<c:url value="/public/images/clinic-banner-home.png"/>" alt=" clinic banner" width="100"/>
            </div>
        </div>
    </section>
    <div class="main-footer">
        <div class="first-row">
            <img src="<c:url value="/public/images/logo.png "/>" width="45px"/>
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
    function imageUpload() {

        let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
        let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
        var loadFile = function (event, imgContainerId) {
            var image = document.getElementById(imgContainerId);
            image.src = URL.createObjectURL(event.target.files[0]);
        };

        var fd = new FormData();

        let imageNames = [];
        if ($('#imageasd')[0].files[0]) {
            fd.append('file', $('#imageasd')[0].files[0]);
            let name = new Date().toString().split(" ");
            let uniqName = (name[2] + name[3] + name[4] + name[5]).replaceAll(":", "").replaceAll("+", "") +
                Math.floor(10000 + Math.random() * 10000) + "." +
                $('#imageasd')[0].files[0].name.split(".")[$('#imageasd')[0].files[0].name.split(".").length - 1];
            imageNames.push(uniqName);

        }
        if ($('#imageasd1')[0].files[0]) {
            console.log($('#imageasd1')[0].files[0].size)
            fd.append('file1', $('#imageasd1')[0].files[0]);
            let name = new Date().toString().split(" ");
            let uniqName = (name[2] + name[3] + name[4] + name[5]).replaceAll(":", "").replaceAll("+", "") +
                Math.floor(20000 + Math.random() * 10000) + "." +
                $('#imageasd')[0].files[0].name.split(".")[$('#imageasd')[0].files[0].name.split(".").length - 1];
            imageNames.push(uniqName);

        }
        if ($('#imageasd2')[0].files[0]) {
            console.log($('#imageasd2')[0].files[0].size)
            fd.append('file2', $('#imageasd2')[0].files[0]);
            let name = new Date().toString().split(" ");
            let uniqName = (name[2] + name[3] + name[4] +
                    name[5]).replaceAll(":", "").replaceAll("+", "") + Math.floor(15000 + Math.random() * 10000) + "." +
                $('#imageasd')[0].files[0].name.split(".")[$('#imageasd')[0].files[0].name.split(".").length - 1];
            imageNames.push(uniqName);

        }
        imageNames.map((item, index) => {
            fd.append('ImageName' + (index + 1), item);
        })


        // console.log(imageNames)

        $.ajax({
            url: '/test_war_exploded/fileuploadservlet',
            type: 'post',
            data: fd,
            contentType: false,
            processData: false,
            success: function (response) {
                if (response != 0) {
                    console.log("successfully image uploadedss")
                } else {
                    console.log('file not uploaded');
                }
            },
        });
        return false;
    }
</script>

<script defer>
    let clinicList1 = new clinicList("left-col");
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    clinic();
    function clinic(){
        let clinicListArray=[]
        $.post("/test_war_exploded/user-view-home-controller/clinic",
            // reqData,
            function(data,status){
                clinicListArray=JSON.parse(data)
                // console.log(clinicListArray)
                clinicList1.setData(clinicListArray);

            }
        );
        console.log("after")
    }


    function checkAvailbale(clinic_id,max_sheet,Avail_seats){
        Avail_seats=Avail_seats
        max_sheet=max_sheet
        clinic_id = clinic_id;
        if(Avail_seats==0){
            popup.showUserClinicRegisterSuccessMessage({
                status: 'fail',
                message: 'limit exceed !',

            });
        }
        else {
            RegisterForclinic(clinic_id,max_sheet,Avail_seats)
        }

    }


    function RegisterForclinic(clinic_id,max_sheet,Avail_seats){

        let x=new Date();
        let year =x.getFullYear();
        let month =x.getMonth()+1;
        let day =x.getDate();


        max_sheet=max_sheet
        clinic_id = clinic_id
        Avail_seats = Avail_seats;
        let date=year+"-"+month+"-"+day;
        console.log(clinic_id)
        console.log(max_sheet)
        Avail_seats= --Avail_seats;
        console.log(Avail_seats)
        console.log(max_sheet)
        let reqData =
            {
                Date:date,
                clinic_id: clinic_id,
                Avail_seats:Avail_seats

            };

        $.post("/test_war_exploded/user-view-clinic-controller/register",
            reqData,
            function (data, status) {

                if (data.includes("success")) {

                    popup.showUserClinicRegisterSuccessMessage({
                        status: 'success',
                        message: 'Successfully Registerd!',

                    });
                    updateAvailableseats(clinic_id,Avail_seats)

                } else {
                    console.log("unsuccesssss")
                    popup.showUserClinicRegisterSuccessMessage({
                        status: 'fail',
                        message: 'Complain Send Fail !',

                    });
                }
            }
        );
    }

    function updateAvailableseats(clinic_id,Avail_seats){
        avalabel_seats=Avail_seats;
        clinic_id=clinic_id

        let reqData =
            {
                avalabel_seats:avalabel_seats,
                clinic_id: clinic_id

            };
        console.log("right")
        console.log(avalabel_seats)
        console.log(reqData);
        $.post("/test_war_exploded/create-clinic-controller/updateAvailSheats",
            reqData,
            function (data, status) {
                if (data.includes("success")) {
                    console.log("successsss")
                    // popup.showUserClinicRegisterSuccessMessage({
                    //     status: 'success',
                    //     message: 'Successfully Registerd!',
                    //
                    // });
                    // view()
                } else {
                    console.log("unsuccesssssv")
                    // popup.showUserClinicRegisterSuccessMessage({
                    //     status: 'fail',
                    //     message: 'Complain Send Fail !',
                    //
                    // });
                }
            }
        );
    }



</script>

<script defer>
    govermentannouncemenet()
    function govermentannouncemenet(){
        let goverment = new View_goverment_announcement("announcetment-list-card-container");

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




</script>

<script defer>
    getAllDisease();

    let diseases= new view_home_disease_details("diseases-list-container");

    function getAllDisease(){

        let diseasearray = [];

        $.post("/test_war_exploded/user-disease-controller/view",

            function (data, status) {
                diseasearray = JSON.parse(data);
                console.log("disease")
                console.log(diseasearray)
                console.log("diseasessss")

                diseases.setData(diseasearray);

            }
        );
    }
</script>

<script>
    feather.replace({width: "16px"})
</script>
</body>
</html>