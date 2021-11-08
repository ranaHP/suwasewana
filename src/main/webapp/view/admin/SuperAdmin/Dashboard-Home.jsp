<%--
  Created by IntelliJ IDEA.
  User: Chathuranga
  Date: 10/23/2021
  Time: 9:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Suwasewana</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/dashboard_home.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/Admincommen.css"/> "/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script defer src="<c:url value="/public/js/Admin/dashboard_home.js"></c:url> "></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js" integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link href="https://api.mapbox.com/mapbox-gl-js/v2.4.1/mapbox-gl.css" rel="stylesheet">
    <script src="https://api.mapbox.com/mapbox-gl-js/v2.4.1/mapbox-gl.js"></script>
</head>
<body onload="charts()" id="mainContent">
<c:import url="/view/admin/partials/AdminOfficerSideNavbar.jsp"/>
<div class="container">
    <!-- suwasewana header -->
    <div class="header">
        <div class="upper-title">SUWASEWANA </div>
        <div class="dashboard-name">Admin/Dashboard/Home</div>
    </div>
    <div class="main-content">
        <div class="first-row">
            <div class="left-container">
                <div class="admin-title">Latest Announcement</div>
                <div class="latest-announcement-container">
                    <div class="latest-announcement-image">
                        <img src="<c:url value="/public/images/announcetment_banner.png"/>" alt="" width="100%">
                    </div>
                    <div class="latest-announcement">
                        <h4>කොවිඩ් එන්නත් ගත් සහ නොගත් අය ගැන විශේෂ හෙළිදරව්වක්</h4>
                        <div class="posted-date">Posted on October 29, 2021</div>
                        <div class="desc">
                            කොවිඩ් මර්දන එන්නත් මාත්‍රා දෙකම ලබාගත් පුද්ගලයන්ගෙන් කොවිඩ් වෛරසය ඔවුන් සමඟ ජීවත් වන
                            අනෙක් පුද්ගලයන්ට සම්ප්‍රේෂණය කරන බව බ්‍රිතාන්‍ය විද්‍යාඥයින් පිරිසක් තහවුරු කර තිබෙනවා.
                        </div>
                        <div class="action">
                            <button class="bg-primary">Block</button>
                            <button class="bg-danger">view</button>
                        </div>
                    </div>
                </div>
                <div class="latest-announcement-container">
                    <div class="latest-announcement-image">
                        <img src="<c:url value="/public/images/announcetment_banner.png"/>" alt="" width="100%">
                    </div>
                    <div class="latest-announcement">
                        <h4>කොවිඩ් එන්නත් ගත් සහ නොගත් අය ගැන විශේෂ හෙළිදරව්වක්</h4>
                        <div class="posted-date">Posted on October 29, 2021</div>
                        <div class="desc">
                            කොවිඩ් මර්දන එන්නත් මාත්‍රා දෙකම ලබාගත් පුද්ගලයන්ගෙන් කොවිඩ් වෛරසය ඔවුන් සමඟ ජීවත් වන
                            අනෙක් පුද්ගලයන්ට සම්ප්‍රේෂණය කරන බව බ්‍රිතාන්‍ය විද්‍යාඥයින් පිරිසක් තහවුරු කර තිබෙනවා.
                        </div>
                        <div class="action">
                            <button class="bg-primary">Block</button>
                            <button class="bg-danger">view</button>
                        </div>
                    </div>
                </div>
                <div class="admin-title">
                    Temporary Officer
                </div>
                <div class="request-for-data">
                    <div class="request-for-data-card">
                        <div class="request-for-data-title">
                            6 Request
                        </div>
                        Officer Register Approvemet
                        <button class="bg-primary">Verify Data</button>
                    </div>
                    <div class="request-for-data-card">
                        <div class="request-for-data-title">
                            1 Request
                        </div>
                        Patient Count Approvement
                        <button class="bg-primary">Verify Data</button>
                    </div>
                    <div class="request-for-data-card">
                        <div class="request-for-data-title">
                            2 Request
                        </div>
                        MOH Data Approvement
                        <button class="bg-primary">Verify Data</button>
                    </div>
                </div>
            </div>
            <div class="right-container">
                <div class="admin-title">
                    Summary of Officers
                </div>
                <div class="officer-details-container">
                    <div class="officer-details-summry-header">
                        <img src="<c:url value="/public/images/Image 5.png"/>" alt="" srcset="" width="100%">
                        <div class="total-officers">
                            <div class="officer-total-count">
                                500
                            </div>
                            Total No of officers
                        </div>
                    </div>
                    <div class="officer-summary-card-container">
                        <div class="officer-summary-card">
                            <div class="officer-name">
                                Public Health Inspector
                                <br>
                                <a href=""> manage</a>
                            </div>
                            <div class="officer-count">
                                5,520
                            </div>
                        </div>
                        <div class="officer-summary-card">
                            <div class="officer-name">
                                Clinical officer
                                <br>
                                <a href=""> manage</a>
                            </div>
                            <div class="officer-count">
                                128, 255
                            </div>
                        </div>
                        <div class="officer-summary-card">
                            <div class="officer-name">
                                Temporary Officers
                                <br>
                                <a href=""> manage</a>
                            </div>
                            <div class="officer-count">
                                751
                            </div>
                        </div>


                    </div>
                    <div class="officer-details-summry-header"> </div>
                    <div class="officer-summary-card-container">
                        <div class="officer-summary-card">
                            <div class="officer-name">
                                MOH Branches
                                <br>
                                <a href=""> manage</a>
                            </div>
                            <div class="officer-count">
                                851
                            </div>
                        </div>
                    </div>

                    <div class="officer-details-summry-header"> </div>
                    <div class="officer-summary-card-container">
                        <div class="officer-summary-card">
                            <div class="officer-name">
                                Announcement
                                <br>
                                <a href=""> manage</a>
                            </div>
                            <div class="officer-count">
                                21
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
        <div class="second-row">
            <div class="left-container">
                <div class="admin-title">Disease Growth (All island)     </div>
                <canvas id="disease_growth" width="100" height="30"></canvas>
                <div class="admin-title">patient Growth (The most widespread disease : Covid19 )</div>
                <canvas id="patient_Growth" width="100" height="30"></canvas>
            </div>
            <div class="right-container">
                <div class="admin-title">
                    Current MOH
                </div>
                <div id="map"></div>
            </div>
        </div>

    </div>
</div>
</div>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>"></script>
</body>
</html>
