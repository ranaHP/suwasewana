<%--
  Created by IntelliJ IDEA.
  User: Chathuranga
  Date: 10/23/2021
  Time: 10:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/public/css/partials/phiOfficer/dashBoard/view_RPHI_announcement.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/> "/>
    <script src="https://unpkg.com/feather-icons"></script>
    <script defer src="<c:url value="/public/js/PHIOfficer/view_RPHI_announcement.js"/> "></script>

<%--    side-nav-bar--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<div class="container">
    <!-- suwasewana header -->
    <div class="header">
        <div class="upper-title">SUWASEWANA </div>
        <div class="dashboard-name">PHI/Dashboard/View announcements</div>
    </div>
    <!-- page title -->
    <div class="main-title">RPHI Announcement</div>
    <!-- announcements container -->
    <div class="announcements-container" id="announcements-container">

    </div>
</div>
</div>
</body>
</html>
