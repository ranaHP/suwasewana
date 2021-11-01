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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script defer src="<c:url value="/public/js/admin/dashboard_home.js"></c:url> "></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js" integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

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
        <!-- officer count -->
        <div class="officer-count">
            <div class="count-box">
                <div class="l"><img src="<c:url value="/public/images/icons/compass.svg"/>" width="35px" >

                </div>
                <div class="r">
                    <p class="registered">Registered PHI</p>
                    <p class="count">45</p>
                </div>
            </div>

            <div class="count-box">
                <div class="l"><img src="<c:url value="/public/images/icons/circle.svg"/>" ></div>
                <div class="r">
                    <p class="registered">Registered RPHI</p>
                    <p class="count">65</p>
                </div>
            </div>

            <div class="count-box">
                <div class="l"><img src="<c:url value="/public/images/icons/circle.svg "/>" ></div>
                <div class="r">
                    <p class="registered">Registered Clinical officers</p>
                    <p class="count">450</p>
                </div>
            </div>
        </div>

        <!-- total summary -->
        <div class="total-summary">
            <div class="search-section">
                <div class="select">
                    <select name="" id="select">
                        <option value="1">select disease</option>
                    </select>
                </div>
                <div class="select">
                    <select name="" id="select1">
                        <option value="1">select district</option>
                    </select>
                </div>
                <div class="select">
                    <select name="" id="select2">
                        <option value="1">select MOH</option>
                    </select>
                </div>
            </div>
            <!-- disease status charts -->
            <div class="charts-disease">
                <div class="chart">
                    <canvas id="myChart1" class="mychart" width="300" height="300"></canvas>
                    <div>Total deaths <span style="color: #028071;">47%</span></div>
                </div>
                <div class="chart">
                    <canvas id="myChart2" class="mychart" width="300" height="300"></canvas>
                    <div>Active cases <span  style="color: #028071;">47%</span></div>
                </div>
                <div class="chart">
                    <canvas id="myChart3" class="mychart" width="300" height="300"></canvas>
                    <div>Total Heals <span  style="color: #028071;">47%</span></div>
                </div>
            </div>
            <div class="charts-total-summary">
                <div class="chart1">
                    <canvas id="myChart4" class="mychart" width="300" height="300"></canvas>
                    <div>Total deaths</div>
                </div>
                <div class="chart1">
                    <canvas id="myChart5" class="mychart" width="300" height="300"></canvas>
                    <div>Total heals</div>
                </div>
            </div>
            <!-- update button -->
            <div class="update-button">
                <button>Update</button>
            </div>
        </div>
        <div class="down">
            <div class="left">
                <div class="select">
                    <select name="" id="select4">
                        <option value="1">Select disease</option>
                    </select>
                </div>
                <div class="chart2">
                    <canvas id="myChart6" class="mychart" width="200" height="200"></canvas>
                </div>
            </div>
            <div class="right">
                <div class="up-select">
                    <select name="" id="select3">
                        <option value="1">Select MOH</option>
                    </select>
                    <input placeholder="from" type="date"></input>
                    <input placeholder="to" type="date"></input>
                </div>
                <div class="table">
                    <table>
                        <thead>
                        <th>Disease</th>
                        <th>NO of clinics</th>
                        </thead>
                        <tbody>
                        <tr>
                            <td data-label="Disease">A</td>
                            <td data-label="NO of clinics">1</td>
                        </tr>
                        <tr>
                            <td data-label="Disease">B</td>
                            <td data-label="NO of clinics">1</td>
                        </tr>
                        <tr>
                            <td data-label="Disease">C</td>
                            <td data-label="NO of clinics">1</td>
                        </tr>

                        <tr>
                            <td data-label="Disease">D</td>
                            <td data-label="NO of clinics">2</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>

<script defer src="<c:url value="/public/js/common/side-navbar.js"/>"></script>
</body>
</html>
