<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_c-dashboard-clinicReports.css"/> "/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js" integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <title>Title</title>
    <%--    for side navbar style--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>

<body onload="charts()">

<div class="containor">
    <!-- suwasewana header -->
    <div class="header">
        <div class="upper-title">SUWASEWANA </div>
        <div class="dashboard-name">Clinic/Dashboard/Clinic reports</div>
    </div>
    <!--report containor  -->
    <div class="report-containor">
        <div class="month-select">
            <div class="from-to-month-select">
                <span>From</span>
                <select name="" id="select1">
                    <option value="1">select the month</option>
                </select>
                <span>To</span>
                <select name="" id="select2">
                    <option value="1">select the month</option>
                </select>
            </div>
        </div>
        <div class="reports">
            <!-- clinic expansion chart -->
            <div class="report1">
                <div class="clinic-expansion-chart">
                    <div class="chart-title">
                        <p class="f-1">Clinic expansion on diseases</p>
                    </div>
                    <div class="chart">
                        <canvas id="myChart" class="mychart" width="400" height="400"></canvas>
                    </div>
                </div>
                <div class="chart-summary">
                    <div class="most">
                        <p class="f-title">Most conducted clinic</p>
                        <p class="f-sub">Corona</p>
                        <p class="f-num">89</p>
                    </div>
                    <div class="least">
                        <p class="f-title">Least conducted clinic</p>
                        <p class="f-sub">Dengue</p>
                        <p class="f-num">34</p>
                    </div>
                </div>

            </div>
            <!-- clinic registering expansion chart -->
            <div class="report2">
                <div class="clinic-registering-expansion-chart">
                    <div class="chart-title">
                        <p class="f-1">Registering presentage for clinics</p>
                    </div>
                    <div class="chart">
                        <canvas id="myChart1"class="mychart" width="400" height="400"></canvas>
                    </div>
                </div>
                <div class="chart-summary">
                    <div class="most">
                        <p class="f-title">Most interacted clinic</p>
                        <p class="f-sub">Corona</p>
                        <p class="f-num">89</p>
                    </div>
                    <div class="least">
                        <p class="f-title">Least interacted clinic</p>
                        <p class="f-sub">Corona</p>
                        <p class="f-num">8</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- </div> -->
</div>

<script>
    // select report category
    // reports=["Clinic Reports","Disease Reports"];
    // reports.map(name=>{
    //     let option= document.createElement('option')
    //     option.value=name
    //     option.innerText=name
    //     document.getElementById('select').appendChild(option)
    // })

    // select month
    months=["Jan","Feb","March","April","May","June","July","Aug","Sep","Oct","Nov","Dec"];
    months.map(name=>{
        let option= document.createElement('option')
        option.value=name
        option.innerText=name
        document.getElementById('select1').appendChild(option)

    })

    months=["Jan","Feb","March","April","May","June","July","Aug","Sep","Oct","Nov","Dec"];
    months.map(name=>{
        let option= document.createElement('option')
        option.value=name
        option.innerText=name
        document.getElementById('select2').appendChild(option)

    })

    //charts
    var ctx = document.getElementById('myChart');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Corona', 'Dengue', 'Maleria', 'Chicken gunya', 'Thiroxine', 'Corona', 'Dengue', 'Maleria', 'Chicken gunya', 'Thiroxine', 'Fever','Eye diseases'],
            datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3,12, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });


    var ctx = document.getElementById('myChart1');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Corona', 'Dengue', 'Maleria', 'Chicken gunya', 'Thiroxine', 'Corona', 'Dengue', 'Maleria', 'Chicken gunya', 'Thiroxine', 'Fever','Eye diseases'],
            datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3,12, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

</script>

</body>
</html>
