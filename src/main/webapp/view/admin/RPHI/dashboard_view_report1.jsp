<%--
  Created by IntelliJ IDEA.
  User: Chathuranga
  Date: 10/23/2021
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Suwasewana</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/public/css/partials/phiOfficer/dashBoard/_phi_dashboard-view_report.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/> "/>
    <script src="https://unpkg.com/feather-icons"></script>
    <script defer src="<c:url value="/public/js/PHIOfficer/view_report.js"/> "></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js" integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <%--    side-nav-bar--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<body onload="charts()" id="mainContent">
<c:import url="/view/admin/partials/RPHIOfficerSideNavbar.jsp" />
<!-- suwasewana header -->
<div class="header">
    <div class="upper-title">SUWASEWANA </div>
    <div class="dashboard-name">PHI/Dashboard/Complain reports</div>
</div>
<div class="container">
    <div class="content">
        <div class="select-date"></div>
        <!-- progress show -->
        <div class="progress-boxes">
            <div class="card">
                <div class="card-content">
                    <div class="icon">
                        <i data-feather="message-square"  class="icon1"></i>
                    </div>
                    <div class="count">
                        <p class="f-2"  style="font-size: 1.2em";>200</p>
                        <p class="f-4"  style="color: #FA8231;">3.78% <i data-feather="arrow-down"></i></p>
                    </div>
                </div>
                <label>New </label>
            </div>

            <div class="card">
                <div class="card-content">
                    <div class="icon">
                        <i data-feather="clock"  class="icon1"></i>
                    </div>
                    <div class="count">
                        <p class="f-2"  style="font-size: 1.2em";>200</p>
                        <p class="f-4"  style="color: #FA8231;">3.78% <i data-feather="arrow-down"></i></p>
                    </div>
                </div>
                <label>IN progress </label>
            </div>

            <div class="card">
                <div class="card-content">
                    <div class="icon">
                        <i data-feather="send"  class="icon1"></i>
                    </div>
                    <div class="count">
                        <p class="f-2" style="font-size: 1.2em;">200</p>
                        <p class="f-4"  style="color: #FA8231;">3.78% <i data-feather="arrow-down"></i></p>
                    </div>
                </div>
                <label>Messages </label>
            </div>
        </div>
        <!-- show complain distribution -->
        <div class="complain-distribution f-3">
            <div class="complain-chart">
                <canvas id="myChart10" class="mychart" width="250" height="250"></canvas>
            </div>
            <div class="complain-des" id="complain-des">

                <div ><p id="com-type1"><i data-feather="alert-octagon" style="color: rgb(230, 19, 149)"></i> </p><p class="f-2">10%<i data-feather="arrow-up"></i></p></div>
                <div><p id="com-type2"><i data-feather="alert-octagon"  style="color: rgb(223, 245, 28)"></i> </p><p class="f-2">10%<i data-feather="arrow-up"></i></p></div>
                <div><p id="com-type3"><i data-feather="alert-octagon"  style="color: rgb(23, 27, 241)"></i></p><p class="f-2">10%<i data-feather="arrow-down"></i></p></div>
                <div><p id="com-type4"><i data-feather="alert-octagon"  style="color: rgb(22, 212, 38)"></i></p><p class="f-2">10%<i data-feather="arrow-up"></i></p></div>
                <div><p id="com-type5"><i data-feather="alert-octagon"  style="color: rgb(196, 9, 253)"></i></p><p class="f-2">10%<i data-feather="arrow-down"></i></p></div>
                <div><p id="com-type6"><i data-feather="alert-octagon"  style="color: rgb(43, 109, 5)"></i> </p><p class="f-2">10%<i data-feather="arrow-up"></i></p></div>

            </div>
        </div>
        <!-- show overall process -->
        <div class="overall">
            <div class="f-2">Overall progress</div>
            <div class="c-charts">
                <div class="c-chart f-3">
                    <canvas id="myChart" class="mychart" width="250" height="250"></canvas>
                    <div>No action <span  class="f1-green"> 43%</span></div>
                </div>
                <div class="c-chart f-3">
                    <canvas id="myChart1" class="mychart" width="250" height="250"></canvas>
                    <div>In progress<span  class="f1-green"> 43%</span></div>
                </div>
                <div class="c-chart f-3">
                    <canvas id="myChart2" class="mychart" width="250" height="250"></canvas>
                    <div>Finish <span  class="f1-green"> 43%</span></div>
                </div>
            </div>
        </div>
        <!-- complaint variations -->
        <div class="complain-variations">
            <p class="f-2">Variation of complaints</p>
            <div class="variations">
                <div class="line gray">
                    <div class="var-chart">
                        <div class="chart">
                            <canvas id="myChart3" class="mychart" width="300" height="300"></canvas>
                        </div>
                        <div>Environmental issues</div>
                    </div>
                    <div class="var-chart">
                        <div class="chart">
                            <canvas id="myChart4" class="mychart" width="300" height="300"></canvas>
                        </div>
                        <div>Animal issues</div>
                    </div>
                </div>
                <div class="line gray">
                    <div class="var-chart">
                        <div class="chart">
                            <canvas id="myChart5" class="mychart" width="300" height="300"></canvas>
                        </div>
                        <div>Water related issues</div>
                    </div>
                    <div class="var-chart">
                        <div class="chart">
                            <canvas id="myChart6" class="mychart" width="300" height="300"></canvas>
                        </div>
                        <div>Unhealthy foods related issues</div>
                    </div>
                </div>
                <div class="line gray">
                    <div class="var-chart">
                        <div class="chart">
                            <canvas id="myChart7" class="mychart" width="300" height="300"></canvas>
                        </div>
                        <div>Land issues </div>
                    </div>
                    <div class="var-chart">
                        <div class="chart">
                            <canvas id="myChart8" class="mychart" width="300" height="300"></canvas>
                        </div>
                        <div>Other</div>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <!-- add complaint type -->
        <div class="add-com-type f-3">
            <div class="left">
                <p>Add complain type</p>
                <div class="add">
                    <input></input>
                    <button class="f-4">add</button>
                </div>
            </div>
            <div class="right">
                <p class="f-4">Types</p>
                <div class="types">
                    <p> <i data-feather="check-square"  style="color: rgb(22, 212, 38)"></i>  Environmental Issues</p>
                    <p> <i data-feather="check-square"  style="color: rgb(22, 212, 38)"></i>  Animal Issues</p>
                    <p> <i data-feather="check-square"  style="color: rgb(22, 212, 38)"></i>  Animal Issues</p>
                    <p> <i data-feather="check-square"  style="color: rgb(22, 212, 38)"></i>  Water Related Issues</p>
                    <p> <i data-feather="check-square"  style="color: rgb(22, 212, 38)"></i>  Unhealthy Foods Related</p>
                    <p> <i data-feather="check-square"  style="color: rgb(22, 212, 38)"></i>  Land Issues</p>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    feather.replace(({width:"12px",height:"12px"}))


    complaints=["Land Issues","Unhealthy Foods Related","Water Related Issues","Animal Issues","Environmental Issues","others"];
    let j=1
    complaints.map(name=>{
        let type= document.createElement('p')
        type.innerText=name
        document.getElementById('com-type'+j).appendChild(type)
        // console.log('com-type'+i)
        j++
    })
</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
