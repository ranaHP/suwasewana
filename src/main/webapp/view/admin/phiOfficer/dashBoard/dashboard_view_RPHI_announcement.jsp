<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Suwasewana</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/public/css/partials/phiOfficer/dashBoard/view_RPHI_announcement.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/> "/>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="<c:url value="/public/js/PHIOfficer/view_RPHI_announcement.js"/> "></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <%--    side-nav-bar--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<body id="mainContent">
<c:import url="/view/admin/partials/PHIOfficerSideNavbar.jsp" />
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
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
<script defer>
    let selectA = new View_RPHI_announcement("announcements-container");

    let AListArray=[]

    // console.log(reqData)
    $.post("/test_war_exploded/createRPHI_Announcements/selectA",
        // reqData,
        function(data1,status){
            // alert(data1)
            AListArray=JSON.parse(data1)
            // console.log(clinicListArray)
            selectA.setData(AListArray);

        }
    );


</script>
</body>
</html>