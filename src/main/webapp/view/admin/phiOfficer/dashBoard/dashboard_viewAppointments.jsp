<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/public/css/partials/phiOfficer/dashBoard/_phi-dashboard-viewAppointments.css"/> "/>

    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/_db-header.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/> "/>
    <script src="https://unpkg.com/feather-icons"></script>

<%--    side nav bar styles--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <title>suwasewana</title>
</head>
<body>

<c:import url="/view/admin/partials/PHIOfficerSideNavbar.jsp" />
<%--<div class="main-contents">--%>
    <div id="mainContent" class="container">
        <div class="header">
            <div class="upper-title">SUWASEWANA </div>
            <div class="dashboard-name">PHI/Dashboard/View announcements</div>
        </div>
        <!-- Search appointments section -->
        <div class="search-section">
            <input class="f-4" placeholder="Search by name"/>
        </div>

        <!-- appintments content -->
        <div class="appointments-container">

            <div class="appointment">
                <!-- appointment sender's details -->
                <div class="sender">
                    <div class="sender-information">
                        <div class="information">
                            <p class="f-2">Akila Anjana Dissanayaka</p>
                            <p class="f-3">Type - Scholarship </p>
                            <p class="f-3">Talk About People's Bank staff vaccination </p>
                        </div>
                        <div class="reject-button">
                            <button class="f-4">Reject Appointment </button>
                        </div>
                    </div>
                    <div class="sender-details">
                        <div class="sender-location f-4"><i data-feather="map-pin"></i>  Galgamuwa</div>
                        <div class="sender-mobile f-4"><i data-feather="phone"></i>  0713805000</div>
                        <div class="send-date f-4"><i data-feather="calendar"></i>  9/18/2021</div>
                    </div>
                </div>
                <!-- the date selection section by phi -->
                <div class="date-details">
                    <!-- first date select -->
                   <div class="up">
                       <p style="text-align: center" class="f-2">Available Time Slots</p>
                       <div class="first">
                           <div class="first-date">
                               <div class="dateF"><input type="text" placeholder="Date"></input></div>
                           </div>
                           <div class="first-time-slots">
                               <input placeholder="Time">
                           </div>
                       </div>
                       <!-- second date select-->
                       <div class="second">
                           <div class="second-date">
                               <%--                            <span>Second time</span>--%>
                               <div class="dateS"><input type="text" placeholder="Date"></input></div>
                           </div>
                           <div class="second-time-slots">
                               <input placeholder="Time">
                           </div>
                       </div>
                   </div>
                    <div class="send-button-note">
                        <textarea></textarea>
                        <button class="f-3">Send</button>

                    </div>
                </div>
            </div>
        </div>
<%--    </div>--%>

    <script>
        feather.replace({width: "10px",height:"10px"})
    </script>
    <script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</div>
</body>
</html>
