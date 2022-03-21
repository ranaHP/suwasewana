<%--
  Created by IntelliJ IDEA.
  User: Chathuranga
  Date: 10/23/2021
  Time: 12:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Suwasewana</title>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_c-dashboard_view_diseaseReport.css"/> "/>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="<c:url value="/public/js/ClinicalOfficer/dashboard_view_diseaseReport.js"/>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js" integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>



<%--    for side navbar style--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

</head>
<body onload="charts()" id="mainContent">
<c:import url="/view/admin/partials/ClinicalOfficerSideNavbar.jsp"/>
<!-- <div class="containor"> -->
<div class="header">
    <div class="upper-title">SUWASEWANA </div>
    <div class="dashboard-name">PHI/Dashboard/View Disease reports</div>
</div>
<div class="content">
    <div class="title">
        Diseases Spread Report
    </div>
    <div class="summary-disease">
        <div class="summary-chart">
            <p style="text-align: center;" class="f-1">Last month disease expansion</p>
            <canvas id="myChart" class="myChart" width="400" height="400"></canvas>
        </div>
        <div class="summary-description-container">
            <div class="summary-description">
                <div class="summary-description-title">
                    <p class="f-1">Most expanded disease1</p>
                </div>
                <div class="summary-description-details">
                    <p class="f-1">Dengue</p>
                    <p class="f-2">34%</p>

                </div>
            </div>
            <div class="summary-description">
                <div class="summary-description-title">
                    <p class="f-1">Most expanded disease2</p>
                </div>
                <div class="summary-description-details">
                    <p class="f-1">Dengue</p>
                    <p class="f-2">34%</p>

                </div>
            </div>
            <div class="summary-description">
                <div class="summary-description-title">
                    <p class="f-1">Most expanded disease3</p>
                </div>
                <div class="summary-description-details">
                    <p class="f-1">Dengue</p>
                    <p class="f-2">34%</p>

                </div>
            </div>
        </div>
    </div>
<div class="title">
    Select Diseases for Get Report
</div>
    <div class="scroll">
        <div class="icon"> <i data-feather="chevron-left"></i></div>
        <div class="disease-list">
            <div class="disease-name">Corona</div>
            <div class="disease-name">Dengue</div>
            <div class="disease-name">Maleria</div>
            <div class="disease-name">Thiroxine</div>
            <div class="disease-name">Maleria</div>
            <div class="disease-name">Dengue</div>
            <div class="disease-name">Corona</div>
            <div class="disease-name">Thiroxine</div>
            <div class="disease-name">Dengue</div>
            <div class="disease-name">Corona</div>
            <div class="disease-name">Maleria</div>
            <div class="disease-name">Thiroxine</div>
        </div>
        <div class="icon"> <i data-feather="chevron-right"></i></div>
    </div>

    <div class="selected-disease-description" style="padding: 10px">
        <div class="infected-details" >
<%--            <div class="inected-details-chart">--%>
<%--                <canvas id="myChart1" class="mychart1" width="400" height="400"></canvas>--%>
<%--            </div>--%>
            <div class="infected-chart-details">
                <p>Infected <span>  56</span></p>
                <p>Death <span>  5</span></p>
                <p>Recovers <span>  6</span></p>
            </div>
            <div class="infected-chart-details">
                <p>Infected <span>  56</span></p>
                <p>Death <span>  5</span></p>
                <p>Recovers <span>  6</span></p>
            </div>
        </div>
        <div class="infected-summary-charts" style="display: flex;flex-direction: column">
            <div class="row" style="width: 100%;display:flex;justify-content: space-evenly;">
                <div class="gender-expansion">
                    <div class="gender-expansion-title">
                        <p>Expansion according to gender</p>
                    </div>
                    <div class="gender-details-chart">
                        <canvas id="myChart1" class="mychart1" width="300" height="300"></canvas>
                    </div>
                </div>
                <div class="gender-expansion">
                    <div class="gender-expansion-title">
                        <p>Expansion according to gender</p>
                    </div>
                    <div class="gender-expansion-chart">
                        <canvas id="myChart2" class="myChart2" width="300" height="300"></canvas>
                    </div>
                </div>
                <div class="age-expansion">
                    <div class="age-expansion-title">
                        <p>Expansion according to age</p>
                    </div>
                    <div class="age-expansion-chart">
                        <canvas id="myChart3" class="myChart3" width="300" height="300"></canvas>
                    </div>
                </div>
            </div>
            <div class="death-rate">
                <div class="death-rate-detail f-1">
                    <p>Death rate</p>
                    <p>34%</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- </div> -->
<script>
    feather.replace(({width:"20px",height:"20px"}))

</script>
<script src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
