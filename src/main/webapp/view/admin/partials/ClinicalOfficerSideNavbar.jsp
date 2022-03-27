<%--
  Created by IntelliJ IDEA.
  User: hansana
  Date: 9/26/2021
  Time: 9:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<html>--%>
<%--<head>--%>
<%--    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>--%>
<%--    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--</head>--%>
<%--<body>--%>
<div class="sidebar close ">
    <div class="close-btn">
        x
    </div>
    <div class="logo-details">
        <!-- <i class='bx bxl-c-plus-plus'></i> -->
        <img src="<c:url value="/public/images/logo/logo.png"/>"   class="logoImage" alt="logo"/>
        <span class="logo_name">Suwasewana</span>
    </div>
    <ul class="nav-links">
        <li>
            <a href="#">
                <i class='bx bx-grid-alt'></i>
                <span class="link_name">Dashboard</span>
            </a>
            <ul class="sub-menu blank">
<%--                <li><a class="link_name" href="#">Home</a></li>--%>
                <li><a href="/test_war_exploded/s/clinic-dashboard">Home</a></li>
            </ul>
        </li>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-book-alt'></i>
                    <span class="link_name">Create Clinic</span>
                </a>
                <i class='bx bxs-chevron-down arrow'></i>
            </div>
            <ul class="sub-menu">
<%--                <li><a class="link_name" href="#">List Clinic</a></li>--%>
                <li><a href="/test_war_exploded/s/vaccine_clinics">Create vaccine clinics </a></li>
                <li><a href="/test_war_exploded/s/create-clinic">Create normal Clinic </a></li>
            </ul>
        </li>


        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-compass'></i>
                    <span class="link_name">View clinics</span>
                </a>
                <i class='bx bxs-chevron-down arrow'></i>
            </div>
            <ul class="sub-menu">
                <li><a href="/test_war_exploded/s/view-clinics">View Normal Clinic </a></li>
                <li><a href="/test_war_exploded/s/view_vaccine_clinics">View Vaccine clinics </a></li>

            </ul>
        </li>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-book-alt'></i>
                    <span class="link_name">Create Announcements</span>
                </a>
                <i class='bx bxs-chevron-down arrow'></i>
            </div>
            <ul class="sub-menu">
                <li><a href="/test_war_exploded/s/select-announcements">Create Normal clinic Announcement </a></li>
                <%--                <li><a href="/test_war_exploded/s/vaccine_announcements">Create Vaccine clinic Announcement </a></li>--%>
            </ul>
        </li>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-compass'></i>
                    <span class="link_name">view Announcement</span>
                </a>
                <i class='bx bxs-chevron-down arrow'></i>
            </div>
            <ul class="sub-menu">
<%--                <li><a href="/test_war_exploded/s/view_vaccine_announcements">View Vaccine clinic Announcement </a></li>--%>
                <li><a href="/test_war_exploded/s/viewClinic-announcements">View Normal clinic Announcement </a></li>

            </ul>
        </li>


        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-plus-medical'></i>
                    <span class="link_name">Add vaccine</span>
                </a>
                <i class='bx bxs-chevron-down arrow'></i>
            </div>
            <ul class="sub-menu">
                <%--                <li><a href="/test_war_exploded/s/view_vaccine_announcements">View Vaccine clinic Announcement </a></li>--%>
                <li><a href="/test_war_exploded/s/Add-vaccine">Add vaccine</a></li>

            </ul>
        </li>

        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-plug'></i>
                    <span class="link_name">Edit vaccine types</span>
                </a>
                <i class='bx bxs-chevron-down arrow'></i>
            </div>
            <ul class="sub-menu">
                <%--                <li><a href="/test_war_exploded/s/view_vaccine_announcements">View Vaccine clinic Announcement </a></li>--%>
                <li><a href="/test_war_exploded/s/editvaccineType">Edit vaccine</a></li>

            </ul>
        </li>


        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bxs-bell-plus'></i>
                    <span class="link_name">Vaccinated citizen</span>
                </a>
                <i class='bx bxs-chevron-down arrow'></i>
            </div>
            <ul class="sub-menu">
                <%--                <li><a href="/test_war_exploded/s/view_vaccine_announcements">View Vaccine clinic Announcement </a></li>--%>
                <li><a href="/test_war_exploded/s/vaccinated-users-view">Vaccinated citizen</a></li>

            </ul>
        </li>



<%--        <li>--%>
<%--            <div class="iocn-link">--%>
<%--                <a href="#">--%>
<%--                    <i class='bx bxs-bar-chart-alt-2'></i>--%>
<%--                    <span class="link_name">Reports</span>--%>
<%--                </a>--%>
<%--                <i class='bx bxs-chevron-down arrow'></i>--%>
<%--            </div>--%>
<%--            <ul class="sub-menu">--%>
<%--                <li><a href="/test_war_exploded/s/viewDisease-reports"> Diseases Reports </a></li>--%>
<%--                <li><a href="/test_war_exploded/s/viewClinic-reports"> Clinics Reports</a></li>--%>
<%--            </ul>--%>
<%--        </li>--%>
        <li>
            <div class="profile-details">
                <div class="profile-content">
                    <img src="<c:url value="/public/images/avatar.png"/>" src="image/profile.jpg" alt="profileImg">
                </div>
                <div class="name-job">
                    <div class="profile_name">Hansana</div>
                    <div class="job">Clinical Officer</div>
                </div>
                <i class='bx bx-log-out'></i>
            </div>
        </li>
    </ul>
</div>
<%--<script src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>--%>
<%--</body>--%>
<%--</html>--%>
