<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/public/css/partials/phiOfficer/dashBoard/_phi-dashboard-viewAppointments.css"/> "/></link>
    <link rel="stylesheet" href="<c:url value="/public/css/commonStyles.css"/> "/></link>
    <link rel="stylesheet" href="common-styles.css"></link>
    <script src="https://unpkg.com/feather-icons"></script>
    <title>Title</title>
</head>
<body>
<div class="container">
    <!-- Search appointments section -->
    <div class="search-section">
        <input class="f-4" placeholder="Search by name"></input>
    </div>

    <!-- appintments content -->
    <div class="appointments-container">

        <div class="appointment">
            <!-- appointment sender's details -->
            <div class="sender">
                <div class="sender-information">
                    <div class="information">
                        <p class="f-1">Akila Anjana Dissanayaka</p>
                        <p class="f-3">Type - Scholarship </p>
                        <p class="f-2">Talk About People's Bank staff vaccination </p>
                    </div>
                    <div class="reject-button">
                        <button class="f-4">Reject Appointment </button>
                    </div>
                </div>
                <div class="sender-details">
                    <div class="sender-location f-4"><i data-feather="map-pin"></i>Galgamuwa</div>
                    <div class="sender-mobile f-4"><i data-feather="phone"></i>0713805000</div>
                    <div class="send-date f-4"><i data-feather="calendar"></i>9/18/2021</div>
                </div>
            </div>
            <!-- the date selection section by phi -->
            <div class="date-details">
                <!-- first date select -->
                <div class="first">
                    <div class="first-time-slots">
                        <div class="time1">
                            <input type="checkbox" id="time1" name="time1" value="time1">
                            <label for="time1"> 8.00 am -10.00 am</label><br>
                        </div>
                        <div class="time2">
                            <input type="checkbox" id="time2" name="time2" value="time2">
                            <label for="time2"> 8.00 am -10.00 am</label><br>
                        </div>
                        <div class="time3">
                            <input type="checkbox" id="time3" name="time3" value="time3">
                            <label for="time3"> 8.00 am -10.00 am</label><br>
                        </div>
                        <div class="time4">
                            <input type="checkbox" id="time4" name="time4" value="time4">
                            <label for="time4"> 8.00 am -10.00 am</label><br>
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
                            <label for="time1"> 8.00 am -10.00 am</label><br>
                        </div>
                        <div class="time2">
                            <input type="checkbox" id="times2" name="time2" value="time2">
                            <label for="time2"> 8.00 am -10.00 am</label><br>
                        </div>
                        <div class="time3">
                            <input type="checkbox" id="times3" name="time3" value="time3">
                            <label for="time3"> 8.00 am -10.00 am</label><br>
                        </div>
                        <div class="time4">
                            <input type="checkbox" id="times4" name="time4" value="time4">
                            <label for="time4"> 8.00 am -10.00 am</label><br>
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
</div>

<script>
    feather.replace({width: "10px",height:"10px"})
</script>

</body>
</html>
