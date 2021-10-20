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
<%--            <div class="upper-title">SUWASEWANA </div>--%>
<%--            <div class="dashboard-name">PHI/Dashboard/View announcements</div>--%>
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
                            <p class="f-4">Type - Scholarship </p>
                            <p class="f-4">Talk About People's Bank staff vaccination </p>
                        </div>
                        <div class="reject-button">
                            <button class="f-4">Reject Appointment </button>
                        </div>
                    </div>
                    <div class="sender-details">
                        <div class="sender-location f-4"><i class="icon" data-feather="map-pin"></i>Galgamuwa</div>
                        <div class="sender-mobile f-4"><i class="icon" data-feather="phone"></i>0713805000</div>
                        <div class="send-date f-4"><i class="icon" data-feather="calendar"></i>9/18/2021</div>
                    </div>
                </div>
                <!-- the date selection section by phi -->
                <div class="date-details">
                    <!-- first date select -->
                    <div class="first">
                        <div class="first-time-slots">
                            <div class="time1">
                                <input type="checkbox" id="time1" name="time1" value="time1">
                                <label for="time1"> 8.00 am -10.00</label><br>
                            </div>
                            <div class="time2">
                                <input type="checkbox" id="time2" name="time2" value="time2">
                                <label for="time2"> 8.00 am -10.00 </label><br>
                            </div>
                            <div class="time3">
                                <input type="checkbox" id="time3" name="time3" value="time3">
                                <label for="time3"> 8.00 am -10.00 </label><br>
                            </div>
                            <div class="time4">
                                <input type="checkbox" id="time4" name="time4" value="time4">
                                <label for="time4"> 8.00 am -10.00</label><br>
                            </div>
                        </div>
                        <div class="first-date">
                            <div class="dateF"><input type="date"></input></div>
                        </div>
                    </div>
                    <!-- second date select-->
                    <div class="second">
                        <div class="second-time-slots">
                            <div class="time1">
                                <input type="checkbox" id="times1" name="time1" value="time1">
                                <label for="time1"> 8.00 am -10.00 </label><br>
                            </div>
                            <div class="time2">
                                <input type="checkbox" id="times2" name="time2" value="time2">
                                <label for="time2"> 8.00 am -10.00 </label><br>
                            </div>
                            <div class="time3">
                                <input type="checkbox" id="times3" name="time3" value="time3">
                                <label for="time3"> 8.00 am -10.00 </label><br>
                            </div>
                            <div class="time4">
                                <input type="checkbox" id="times4" name="time4" value="time4">
                                <label for="time4"> 8.00 am -10.00 </label><br>
                            </div>
                        </div>
                        <div class="second-date">
                            <div class="dateS"><input type="date"></input></div>
                            <div class="send-button">
                                <button class="f-3">Send</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="appointment">
                <!-- appointment sender's details -->
                <div class="sender">
                    <div class="sender-information">
                        <div class="information">
                            <p class="f-2">Akila Anjana Dissanayaka</p>
                            <p class="f-4">Type - Scholarship </p>
                            <p class="f-4">Talk About People's Bank staff vaccination </p>
                        </div>
                        <div class="reject-button">
                            <button class="f-4">Reject Appointment </button>
                        </div>
                    </div>
                    <div class="sender-details">
                        <div class="sender-location f-4"><i class="icon" data-feather="map-pin"></i>Galgamuwa</div>
                        <div class="sender-mobile f-4"><i class="icon" data-feather="phone"></i>0713805000</div>
                        <div class="send-date f-4"><i class="icon" data-feather="calendar"></i>9/18/2021</div>
                    </div>
                </div>
                <!-- the date selection section by phi -->
                <div class="date-details">
                    <!-- first date select -->
                    <div class="first">
                        <div class="first-time-slots">
                            <div class="time1">
                                <input type="checkbox" id="time21" name="time1" value="time1">
                                <label for="time1"> 8.00 am -10.00 </label><br>
                            </div>
                            <div class="time2">
                                <input type="checkbox" id="time22" name="time2" value="time2">
                                <label for="time2"> 8.00 am -10.00 </label><br>
                            </div>
                            <div class="time3">
                                <input type="checkbox" id="time23" name="time3" value="time3">
                                <label for="time3"> 8.00 am -10.00 </label><br>
                            </div>
                            <div class="time4">
                                <input type="checkbox" id="time24" name="time4" value="time4">
                                <label for="time4"> 8.00 am -10.00 </label><br>
                            </div>
                        </div>
                        <div class="first-date">
                            <div class="dateF"><input type="date"></input></div>
                        </div>
                    </div>
                    <!-- second date select-->
                    <div class="second">
                        <div class="second-time-slots">
                            <div class="time1">
                                <input type="checkbox" id="times21" name="time1" value="time1">
                                <label for="time1"> 8.00 am -10.00 </label><br>
                            </div>
                            <div class="time2">
                                <input type="checkbox" id="times22" name="time2" value="time2">
                                <label for="time2"> 8.00 am -10.00</label><br>
                            </div>
                            <div class="time3">
                                <input type="checkbox" id="times23" name="time3" value="time3">
                                <label for="time3"> 8.00 am -10.00 </label><br>
                            </div>
                            <div class="time4">
                                <input type="checkbox" id="times24" name="time4" value="time4">
                                <label for="time4"> 8.00 am -10.00 </label><br>
                            </div>
                        </div>
                        <div class="second-date">
                            <div class="dateS"><input type="date"></input></div>
                            <div class="send-button">
                                <button class="f-3">Send</button>
                            </div>
                        </div>
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
