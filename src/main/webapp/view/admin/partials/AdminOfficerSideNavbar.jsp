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
<div class="sidebar close" style="z-index: 800">
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
                <li><a href="/test_war_exploded/s/admin-dashboard">Home</a></li>
            </ul>
        </li>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-clipboard'></i>
                    <span class="link_name">PHI/RPHI</span>
                </a>
                <i class='bx bxs-chevron-down arrow'></i>
            </div>
            <ul class="sub-menu">
<%--                <li><a class="link_name" href="#">List</a></li>--%>
                <li><a href="/test_war_exploded/s/register_PHI">Register PHI/RPHI</a></li>
                <li><a href="/test_war_exploded/s/view_PHI">List PHI/RPHI</a></li>
            </ul>
        </li>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-folder-plus'></i>
                    <span class="link_name">Clinical officers</span>
                </a>
                <i class='bx bxs-chevron-down arrow'></i>
            </div>
            <ul class="sub-menu">
<%--                <li><a class="link_name" href="#">List</a></li>--%>
                <li><a href="/test_war_exploded/s/register_C-officer">Register Clinical officers</a></li>
                <li><a href="/test_war_exploded/s/view_ClinicalOfficers">List Clinical officers</a></li>
            </ul>
        </li>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bxs-home'></i>
                    <span class="link_name">MOH</span>
                </a>
                <i class='bx bxs-chevron-down arrow'></i>
            </div>
            <ul class="sub-menu">
<%--                <li><a class="link_name" href="#">List</a></li>--%>
                <li><a href="/test_war_exploded/s/register_MOH">Register MOH</a></li>
                <li><a href="/test_war_exploded/s/view_MOH">List MOH Areas</a></li>
            </ul>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-line-chart'></i>
                <span class="link_name">Chart</span>
            </a>
            <ul class="sub-menu blank">
                <li><a class="link_name" href="#">Chart</a></li>
            </ul>
        </li>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-plug'></i>
                    <span class="link_name">Announcements</span>
                </a>
                <i class='bx bxs-chevron-down arrow'></i>
            </div>
            <ul class="sub-menu">
                <li><a class="link_name" href="/test_war_exploded/s/public_announcements">Create</a></li>
                <li><a class="link_name" href="/test_war_exploded/s/public_announcements_list">List</a></li>

            </ul>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-compass'></i>
                <span class="link_name">Update cases</span>
            </a>
            <ul class="sub-menu blank">
                <li><a class="link_name" href="#">Update case details</a></li>
            </ul>
        </li>
        <li>
<%--            <a href="#">--%>
<%--                <i class='bx bx-history'></i>--%>
<%--                <span class="link_name">History</span>--%>
<%--            </a>--%>
<%--            <ul class="sub-menu blank">--%>
<%--                <li><a class="link_name" href="#">History</a></li>--%>
<%--            </ul>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <a href="#">--%>
<%--                <i class='bx bx-cog'></i>--%>
<%--                <span class="link_name">Setting</span>--%>
<%--            </a>--%>
<%--            <ul class="sub-menu blank">--%>
<%--                <li><a class="link_name" href="#">Setting</a></li>--%>
<%--            </ul>--%>
<%--        </li>--%>
<%--        <li>--%>
            <div class="profile-details">
                <div class="profile-content">
                    <img src="<c:url value="/public/images/avatar.png"/>" src="image/profile.jpg" alt="profileImg">
                </div>
                <div class="name-job">
                    <div class="profile_name">Hansana</div>
                    <div class="job">PHI</div>
                </div>
                <i class='bx bx-log-out'></i>
            </div>
        </li>
    </ul>
</div>
<%--<script src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>--%>
<%--</body>--%>
<%--</html>--%>
