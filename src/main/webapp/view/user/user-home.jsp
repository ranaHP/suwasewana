<%--
  Created by IntelliJ IDEA.
  User: hansana
  Date: 9/27/2021
  Time: 8:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Suwasewana</title>

<%--    style for user home--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/user/user-home.css"/>"/>


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
                    <img src="<c:url value="/public/images/logo/logo.png"/>" alt="logo" width="100%" >
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
                        <img src="<c:url value="/public/images/backgroundImages/sri-lanka.png"/>" alt="sri lanakan flag" width="100%">
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
                <img src="<c:url value="/public/images/backgroundImages/userHeroBannerImage1.png"/>" alt="banner1" width="100%">
            </div>
        </div>
    </section>
    <!-- this for latest announcements -->
    <section>
        <div class="section-title">
            <div class="title">
                Latest Announcement
            </div>
            <div class="title-sub">
                suwasewana.lk
            </div>
        </div>

    </section>
</div>
<script>
    feather.replace()
</script>
</body>
</html>
