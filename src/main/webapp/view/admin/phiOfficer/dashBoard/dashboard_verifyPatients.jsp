<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/public/css/partials/phiOfficer/dashBoard/_phi-dashboard-verifyPatients.css"/> "/>

    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/> "/>
    <script src="https://unpkg.com/feather-icons"></script>
    <script defer src="<c:url value="/public/js/PHIOfficer/verifyPatients.js"/> "></script>

    <title>Suwasewana</title>
    <%--    side nav bar styles--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
  <c:import url="/view/admin/partials/PHIOfficerSideNavbar.jsp" />
    <div class="container" id="mainContent">
    <div class="header">
        <div class="upper-title">SUWASEWANA </div>
        <div class="dashboard-name">PHI/Dashboard/verify Patients</div>
    </div>
    <div class="search-section">
        <input class="f-4" id="filter" onkeyup="search()" placeholder="Search by name"/>
        <input class="f-4" id="filter1" onkeyup="search()" placeholder="Search by ID"/>
        <input class="f-4" id="filter2" onkeyup="search()" placeholder="Search by Disease"/>
    </div>
    <div class="request-container" id="request-container">

        </div>
    </div>
</div>

<script>
    feather.replace(({width:"10px",height:"10px"}))
</script>
  <script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
