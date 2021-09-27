<%--
  Created by IntelliJ IDEA.
  User: Akila
  Date: 9/23/2021
  Time: 12:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet"
          href="<c:url value="../../../../public/css/partials/clinicalOfficer/dashBoard/c-dashboard.css "/>">
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"
            integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <%--    for side navbar style--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
<c:import url="/view/admin/partials/ClinicalOfficerSideNavbar.jsp"/>" />

<div id="mainContent" class="c-db-container ">
    <div class="c-container-left">
        <div class="upcomin-clinic">
            <h4>Up-Coming Clinic</h4>

            <div class="clinic-list">

                <i class="icon" data-feather="arrow-left"></i>
                <div class="clinic-card">
                    <div class="card-left">
                        <h5>Covid 19 Awareness Session</h5>
                        <div class="date">2020/08/28</div>
                        <div class="amount">56</div>
                        <div class="nop">No of patients</div>
                        <button class="reschdulebtn">Reschdule</button>
                    </div>
                    <div class="card-right">
                        <img src="<c:url value="../../../../public/images/svg/login/image1.svg "/>" alt="" srcset=""
                             width=100% height=100%>
                    </div>
                </div>
                <div class="clinic-card">
                    <div class="card-left">
                        <h5>Covid 19 Awareness Session</h5>
                        <div class="date">2020/08/28</div>
                        <div class="amount">56</div>
                        <div class="nop">No of patients</div>
                        <button class="reschdulebtn">Reschdule</button>
                    </div>
                    <div class="card-right">
                        <img src="<c:url value="../../../../public/images/svg/login/image1.svg "/>" alt="" srcset=""
                             width=100% height=100%>
                    </div>
                </div>
                <i class="icon" data-feather="arrow-right"></i>
            </div>


        </div>
        <div class="growth-calander">
            <div class="charts">
                <div class="chart" id="chart1">
                    <h4>Patient growth</h4>
                    <div class="g-chart">
                        <canvas id="myChart" height="160" width="550"></canvas>
                    </div>
                </div>
                <div class="chart" id="chart2">
                    <h4>Clinic growth</h4>
                    <div class="g-chart">
                        <canvas id="myChart2" height="160" width="550"></canvas>
                    </div>
                </div>
            </div>
            <div class="calander">
                <h2>Calander</h2>
                <div class="calander-body">
                    body
                </div>
            </div>
        </div>
    </div>
    <div class="c-container-right">
        <h4>Summary Clinic Programmes</h4>
        <div class="c-right-container">
            <div class="noclinic">
                <div class="ncimg">
                    <img src="<c:url value="../../../../public/images/svg/login/image1.svg "/>" alt="" srcset=""
                         width=100% height=100%>
                </div>
                <div class="nc-amount">
                    <span class="nc-count">18000</span><br>
                    <span>No. of clinics</span>
                </div>
            </div>
            <div class="pendingclinc">
                <div class="pctitle">No of clinics</div>

                <div class="diseases">
                    <div class="diseas">
                        <div class="disleft">
                            <h2>Corona</h2>
                            <p>2021/02/03</p>
                        </div>
                        <div class="disright">
                            34
                        </div>
                    </div>

                    <div class="diseas">
                        <div class="disleft">
                            <h2>Corona</h2>
                            <p>2021/02/03</p>
                        </div>
                        <div class="disright">
                            34
                        </div>
                    </div>

                    <div class="diseas">
                        <div class="disleft">
                            <h2>Corona</h2>
                            <p>2021/02/03</p>
                        </div>
                        <div class="disright">
                            34
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value="../../../../public/js/ClinicalOfficer/Dashboard.js"/>"></script>
<script>
    let mycard = new card("")
</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>"></script>

</body>
</html>