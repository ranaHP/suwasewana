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

    <!-- for feather icon -->
    <script src="https://unpkg.com/feather-icons"></script>

    <!-- for latest announcement -->
    <script src="<c:url value="/public/js/latest-announcetment%20copy.js "/>" defer></script>

    <!-- for jquery -->
    <script src="<c:url value="/public/js/disease-details.js"/>"></script>
</head>
<body>
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
        <!-- hero banner -->
<%--        <form method="post" action="http://localhost:8093/test_war_exploded/fileuploadservlet" enctype="multipart/form-data">--%>
<%--            <input type="file" name="file" />--%>
<%--            <input type="submit" value="Upload" />--%>
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
            <div class="title">
                සෞඛ්‍ය නිවේදනය
            </div>
            <div class="title-sub">
                අද දිනයේ කොවිඩ් සඳහා එන්නත්කරණ කටයුතු සිදු කෙරෙන ස්ථාන 212ක්
            </div>
        </div>
        <div class="latest-announstment-container">
            <img src="<c:url value="/public/images/icons/arrow-left-circle.svg "/>" class="latest-announstment-arrow" width="25px"/>
            <div class="announcetment-list-card-container" id="announcetment-list-card-container">
                <div class="latest-announstment-cards-container">
                    <div class="latest-announstment-card">
                        <div class="image-container">
                            <img src="images//announcetment_banner.png" width="100%"/>
                            <div class="read-more-btn">
                                Read More
                            </div>
                        </div>
                        <div class="title">
                            ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට
                        </div>
                        <div class="suwasaewana">
                            SUWASEWANA.LK
                        </div>
                        <div class="posted-time">
                            15/21/2021
                        </div>
                        <div class="desc">
                            නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්
                            රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු
                            අවස්ථාව ගැන ඔබ දැනුවත්ද?
                        </div>

                    </div>
                </div>
                <div class="latest-announstment-cards-container">
                    <div class="latest-announstment-card">
                        <div class="image-container">
                            <img src="images//announcetment_banner.png" width="100%"/>
                            <div class="read-more-btn">
                                Read More
                            </div>
                        </div>
                        <div class="title">
                            ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට
                        </div>
                        <div class="suwasaewana">
                            SUWASEWANA.LK
                        </div>
                        <div class="posted-time">
                            15/21/2021
                        </div>
                        <div class="desc">
                            නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්
                            රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු
                            අවස්ථාව ගැන ඔබ දැනුවත්ද?
                        </div>

                    </div>
                </div>
                <div class="latest-announstment-cards-container">
                    <div class="latest-announstment-card">
                        <div class="image-container">
                            <img src="images//announcetment_banner.png" width="100%"/>
                            <div class="read-more-btn">
                                Read More
                            </div>
                        </div>
                        <div class="title">
                            ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට
                        </div>
                        <div class="suwasaewana">
                            SUWASEWANA.LK
                        </div>
                        <div class="posted-time">
                            15/21/2021
                        </div>
                        <div class="desc">
                            නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්
                            රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු
                            අවස්ථාව ගැන ඔබ දැනුවත්ද?
                        </div>

                    </div>
                </div>
                <div class="latest-announstment-cards-container">
                    <div class="latest-announstment-card">
                        <div class="image-container">
                            <img src="images//announcetment_banner.png" width="100%"/>
                            <div class="read-more-btn">
                                Read More
                            </div>
                        </div>
                        <div class="title">
                            ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට
                        </div>
                        <div class="suwasaewana">
                            SUWASEWANA.LK
                        </div>
                        <div class="posted-time">
                            15/21/2021
                        </div>
                        <div class="desc">
                            නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්
                            රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු
                            අවස්ථාව ගැන ඔබ දැනුවත්ද?
                        </div>

                    </div>
                </div>
                <div class="latest-announstment-cards-container">
                    <div class="latest-announstment-card">
                        <div class="image-container">
                            <img src="images//announcetment_banner.png" width="100%"/>
                            <div class="read-more-btn">
                                Read More
                            </div>
                        </div>
                        <div class="title">
                            ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට
                        </div>
                        <div class="suwasaewana">
                            SUWASEWANA.LK
                        </div>
                        <div class="posted-time">
                            15/21/2021
                        </div>
                        <div class="desc">
                            නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්
                            රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු
                            අවස්ථාව ගැන ඔබ දැනුවත්ද?
                        </div>

                    </div>
                </div>
                <div class="latest-announstment-cards-container">
                    <div class="latest-announstment-card">
                        <div class="image-container">
                            <img src="images//announcetment_banner.png" width="100%"/>
                            <div class="read-more-btn">
                                Read More
                            </div>
                        </div>
                        <div class="title">
                            ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට
                        </div>
                        <div class="suwasaewana">
                            SUWASEWANA.LK
                        </div>
                        <div class="posted-time">
                            15/21/2021
                        </div>
                        <div class="desc">
                            නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්
                            රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු
                            අවස්ථාව ගැන ඔබ දැනුවත්ද?
                        </div>

                    </div>
                </div>
                <div class="latest-announstment-cards-container">
                    <div class="latest-announstment-card">
                        <div class="image-container">
                            <img src="images//announcetment_banner.png" width="100%"/>
                            <div class="read-more-btn">
                                Read More
                            </div>
                        </div>
                        <div class="title">
                            ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට
                        </div>
                        <div class="suwasaewana">
                            SUWASEWANA.LK
                        </div>
                        <div class="posted-time">
                            15/21/2021
                        </div>
                        <div class="desc">
                            නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්
                            රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු
                            අවස්ථාව ගැන ඔබ දැනුවත්ද?
                        </div>

                    </div>
                </div>
                <div class="latest-announstment-cards-container">
                    <div class="latest-announstment-card">
                        <div class="image-container">
                            <img src="images//announcetment_banner.png" width="100%"/>
                            <div class="read-more-btn">
                                Read More
                            </div>
                        </div>
                        <div class="title">
                            ස්පුට්නික් V එන්නත් මාත්‍රා තොගයක් අද අලුයම කටුනායකට
                        </div>
                        <div class="suwasaewana">
                            SUWASEWANA.LK
                        </div>
                        <div class="posted-time">
                            15/21/2021
                        </div>
                        <div class="desc">
                            නිවසේ සිට ප්‍රතිකාර ලබාගන්නා කොවිඩ්
                            රෝගියෙකු, වහාම රෝහල්ගත කළ යුතු
                            අවස්ථාව ගැන ඔබ දැනුවත්ද?
                        </div>

                    </div>
                </div>
            </div>
            <img src="<c:url value="/public/images/icons/arrow-right-circle.svg"/>" width="25px" class="latest-announstment-arrow"/>
        </div>
    </section>

    <section>
        <div class="section-title">
            <div class="title">
                රෝග පිළිබඳ තොරතුරු
            </div>
            <div class="title-sub">
                අද දිනයේ කොවිඩ් සඳහා එන්නත්කරණ කටයුතු සිදු කෙරෙන ස්ථාන 212ක්
            </div>
        </div>
        <div class="diseases-details-container">
            <div class="diseases-list-container" id="diseases-list-container">
                <div class="diseases-card-container">
                    <div class="diseases-card">
                        <div class="left-container">
                            <img src="images/disease-banner.png" width="100%">
                        </div>
                        <div class="right-container">
                            <div class="count-container">
                                <div class="count-card">
                                    <div class="title">
                                        102,250
                                    </div>
                                    <div class="desc">
                                        Active Cases
                                    </div>
                                </div>
                                <div class="count-card">
                                    <div class="title">
                                        102,250
                                    </div>
                                    <div class="desc">
                                        Death Cases
                                    </div>
                                </div>
                                <div class="count-card">
                                    <div class="title">
                                        102,250
                                    </div>
                                    <div class="desc">
                                        Total Cases
                                    </div>
                                </div>
                            </div>
                            <div class="main-title">
                                COVID-19
                            </div>
                            <div class="desc">
                                According to researchers in China, these were the most common symptoms among people who
                                had COVID-19
                                According to researchers in China, these were the most common symptoms among people who
                                had COVID-19

                            </div>
                            <div class="syntoms">
                                <ul>
                                    <li> Fever 99%</li>
                                    <li>Fatigue 70%</li>
                                    <li>Cough 59%</li>
                                    <br>
                                    <li>Lack of appetite 40%</li>
                                    <li>Body aches 35%</li>
                                    <li>Shortness of breath 31%</li>
                                    <li>Mucus/phlegm 27%</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="diseases-card-container">
                    <div class="diseases-card">
                        <div class="left-container">
                            <img src="images/disease-banner.png" width="100%">
                        </div>
                        <div class="right-container">
                            <div class="count-container">
                                <div class="count-card">
                                    <div class="title">
                                        102,250
                                    </div>
                                    <div class="desc">
                                        Active Cases
                                    </div>
                                </div>
                                <div class="count-card">
                                    <div class="title">
                                        102,250
                                    </div>
                                    <div class="desc">
                                        Death Cases
                                    </div>
                                </div>
                                <div class="count-card">
                                    <div class="title">
                                        102,250
                                    </div>
                                    <div class="desc">
                                        Total Cases
                                    </div>
                                </div>
                            </div>
                            <div class="main-title">
                                COVID-19
                            </div>
                            <div class="desc">
                                According to researchers in China, these were the most common symptoms among people who
                                had COVID-19
                                According to researchers in China, these were the most common symptoms among people who
                                had COVID-19

                            </div>
                            <div class="syntoms">
                                <ul>
                                    <li> Fever 99%</li>
                                    <li>Fatigue 70%</li>
                                    <li>Cough 59%</li>
                                    <br>
                                    <li>Lack of appetite 40%</li>
                                    <li>Body aches 35%</li>
                                    <li>Shortness of breath 31%</li>
                                    <li>Mucus/phlegm 27%</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="diseases-card-container">
                    <div class="diseases-card">
                        <div class="left-container">
                            <img src="images/disease-banner.png" width="100%">
                        </div>
                        <div class="right-container">
                            <div class="count-container">
                                <div class="count-card">
                                    <div class="title">
                                        102,250
                                    </div>
                                    <div class="desc">
                                        Active Cases
                                    </div>
                                </div>
                                <div class="count-card">
                                    <div class="title">
                                        102,250
                                    </div>
                                    <div class="desc">
                                        Death Cases
                                    </div>
                                </div>
                                <div class="count-card">
                                    <div class="title">
                                        102,250
                                    </div>
                                    <div class="desc">
                                        Total Cases
                                    </div>
                                </div>
                            </div>
                            <div class="main-title">
                                COVID-19
                            </div>
                            <div class="desc">
                                According to researchers in China, these were the most common symptoms among people who
                                had COVID-19
                                According to researchers in China, these were the most common symptoms among people who
                                had COVID-19

                            </div>
                            <div class="syntoms">
                                <ul>
                                    <li> Fever 99%</li>
                                    <li>Fatigue 70%</li>
                                    <li>Cough 59%</li>
                                    <br>
                                    <li>Lack of appetite 40%</li>
                                    <li>Body aches 35%</li>
                                    <li>Shortness of breath 31%</li>
                                    <li>Mucus/phlegm 27%</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="diseases-card-container">
                    <div class="diseases-card">
                        <div class="left-container">
                            <img src="images/disease-banner.png" width="100%">
                        </div>
                        <div class="right-container">
                            <div class="count-container">
                                <div class="count-card">
                                    <div class="title">
                                        102,250
                                    </div>
                                    <div class="desc">
                                        Active Cases
                                    </div>
                                </div>
                                <div class="count-card">
                                    <div class="title">
                                        102,250
                                    </div>
                                    <div class="desc">
                                        Death Cases
                                    </div>
                                </div>
                                <div class="count-card">
                                    <div class="title">
                                        102,250
                                    </div>
                                    <div class="desc">
                                        Total Cases
                                    </div>
                                </div>
                            </div>
                            <div class="main-title">
                                COVID-19
                            </div>
                            <div class="desc">
                                According to researchers in China, these were the most common symptoms among people who
                                had COVID-19
                                According to researchers in China, these were the most common symptoms among people who
                                had COVID-19

                            </div>
                            <div class="syntoms">
                                <ul>
                                    <li> Fever 99%</li>
                                    <li>Fatigue 70%</li>
                                    <li>Cough 59%</li>
                                    <br>
                                    <li>Lack of appetite 40%</li>
                                    <li>Body aches 35%</li>
                                    <li>Shortness of breath 31%</li>
                                    <li>Mucus/phlegm 27%</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="diseases-card-container">
                    <div class="diseases-card">
                        <div class="left-container">
                            <img src="images/disease-banner.png" width="100%">
                        </div>
                        <div class="right-container">
                            <div class="count-container">
                                <div class="count-card">
                                    <div class="title">
                                        102,250
                                    </div>
                                    <div class="desc">
                                        Active Cases
                                    </div>
                                </div>
                                <div class="count-card">
                                    <div class="title">
                                        102,250
                                    </div>
                                    <div class="desc">
                                        Death Cases
                                    </div>
                                </div>
                                <div class="count-card">
                                    <div class="title">
                                        102,250
                                    </div>
                                    <div class="desc">
                                        Total Cases
                                    </div>
                                </div>
                            </div>
                            <div class="main-title">
                                COVID-19
                            </div>
                            <div class="desc">
                                According to researchers in China, these were the most common symptoms among people who
                                had COVID-19
                                According to researchers in China, these were the most common symptoms among people who
                                had COVID-19

                            </div>
                            <div class="syntoms">
                                <ul>
                                    <li> Fever 99%</li>
                                    <li>Fatigue 70%</li>
                                    <li>Cough 59%</li>
                                    <br>
                                    <li>Lack of appetite 40%</li>
                                    <li>Body aches 35%</li>
                                    <li>Shortness of breath 31%</li>
                                    <li>Mucus/phlegm 27%</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section>
        <div class="section-title">
            <div class="title">
                ඉදිරියට එන සායනික වැඩසටහන්
            </div>
            <div class="title-sub">
                අද දිනයේ කොවිඩ් සඳහා එන්නත්කරණ කටයුතු සිදු කෙරෙන ස්ථාන 212ක්
            </div>
        </div>
        <div class="upcoming-clinic">
            <div class="left-col">
                <img src="images/icons/arrow-left-circle.svg" class="clinic-arrow" width="25px"/>
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
                                    <img src="images/icons/map-pin.svg" width="15px"/>
                                    Location : Eluketiya Manduni's home
                                </li>
                                <li>
                                    <img src="images/icons/list.svg" width="15px"/>
                                    Conduct : Dr Akila Lulakshi
                                </li>
                                <li>
                                    <img src="images/icons/list.svg" width="15px"/>
                                    Max participant limit : 1000
                                </li>
                                <li>
                                    <img src="images/icons/list.svg" width="15px"/>
                                    MOH Area :Akuressa
                                </li>
                                <li>
                                    <img src="images/icons/list.svg" width="15px"/>
                                    Target participant :Dr Akila Lulakshi
                                </li>
                            </ul>
                        </div>
                        <div class="footer">
                            <div class="current-registered-count">
                                <img src="images/icons/users.svg" width="18px"/>
                                120,22
                            </div>
                            <div class="register-btn">
                                Register
                            </div>
                        </div>
                    </div>
                </div>


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
                                    <img src="images/icons/map-pin.svg" width="15px"/>
                                    Location : Eluketiya Manduni's home
                                </li>
                                <li>
                                    <img src="images/icons/list.svg" width="15px"/>
                                    Conduct : Dr Akila Lulakshi
                                </li>
                                <li>
                                    <img src="images/icons/list.svg" width="15px"/>
                                    Max participant limit : 1000
                                </li>
                                <li>
                                    <img src="images/icons/list.svg" width="15px"/>
                                    MOH Area :Akuressa
                                </li>
                                <li>
                                    <img src="images/icons/list.svg" width="15px"/>
                                    Target participant :Dr Akila Lulakshi
                                </li>
                            </ul>
                        </div>
                        <div class="footer">
                            <div class="current-registered-count">
                                <img src="images/icons/users.svg" width="18px"/>
                                120,22
                            </div>
                            <div class="register-btn">
                                Register
                            </div>
                        </div>
                    </div>
                </div>
                <img src="images/icons/arrow-right-circle.svg" width="25px" class="clinic-arrow"/>

            </div>
            <div class="right-col">
                <img src="images/clinic-banner-home.png" alt=" clinic banner" width="100"/>
            </div>
        </div>
    </section>
    <div class="main-footer">
        <div class="first-row">
            <img src="images/logo.png" width="45px"/>
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
<script>
    feather.replace({width: "20px"})
</script>

<script defer>

</script>
<script>
    feather.replace({width: "16px"})
</script>
</body>
</html>
