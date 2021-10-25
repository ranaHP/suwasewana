<%--
  Created by IntelliJ IDEA.
  User: Akila
  Date: 10/23/2021
  Time: 6:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Suwasewana</title>


    <link rel="stylesheet" href="<c:url value="/public/css/PHI/PHI_Dashboard.css"/>">
    <link rel="stylesheet" href="<c:url value="/public/css/popup/popup.css "/>">
    <link rel="stylesheet" href="<c:url value="/public/css/calander/calander.css "/>">

    <script src="<c:url value="/public/js/Calander/CalanderScript.js"/>"></script>
    <script src="<c:url value="/public/js/popup.js "/>"></script>

    <script src="https://unpkg.com/feather-icons"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"
            integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>

    <script src="https://unpkg.com/feather-icons"></script>
    <link href="https://api.mapbox.com/mapbox-gl-js/v2.4.1/mapbox-gl.css" rel="stylesheet">
    <script src="https://api.mapbox.com/mapbox-gl-js/v2.4.1/mapbox-gl.js"></script>
    <script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.min.js"></script>
    <link rel="stylesheet"
          href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.css"
          type="text/css">

    <%--    side nav bar styles--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

</head>

<body id="mainContent">
<c:import url="/view/admin/partials/PHIOfficerSideNavbar.jsp" />
<%--    <div class="main-container">--%>
        <div class="header">
            <div class="upper-title">SUWASEWANA</div>
            <div class="dashboard-name">PHI/Dashboard/Home</div>
        </div>

        <div class="body-content">
            <div class="top-summary">
                <div class="summary-card">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-icon">
                                <img  src="<c:url value="/public/images/PHI_Dashboard/time-clock-circle.svg "/>" srcset="">
                            </div>
                            <div class="card-details">
                                <h5>200</h5>
                                <div class="precentage">
                                    <div class="p-lable"><label >2.345%</label></div>
                                    <div class="arrow"><i data-feather="arrow-up"></i></div>
                                </div>
                            </div>
                        </div>
                        <label>Appoinment</label>
                    </div>
                    <div class="card">
                        <div class="card-content">
                            <div class="card-icon">
                                <img src="<c:url value="/public/images/PHI_Dashboard/help-question-message.svg "/>" alt="" srcset="">
                            </div>
                            <div class="card-details">
                                <h5>200</h5>
                                <div class="precentage">
                                    <div class="p-lable"><label >2.345%</label></div>
                                    <div class="arrow"><i data-feather="arrow-up"></i></div>
                                </div>
                            </div>
                        </div>
                        <label>Complaints </label>
                    </div>
                    <div class="card">
                        <div class="card-content">
                            <div class="card-icon">
                                <img src="<c:url value="/public/images/PHI_Dashboard/cursor-hand.svg "/>" alt="" srcset="">
                            </div>
                            <div class="card-details">
                                <h5>200</h5>
                                <div class="precentage">
                                    <div class="p-lable"><label >2.345%</label></div>
                                    <div class="arrow"><i data-feather="arrow-up"></i></div>
                                </div>
                            </div>
                        </div>
                        <label>Register Requests</label>
                    </div>
                    <div class="card">
                        <div class="card-content">
                            <div class="card-icon">
                                <img src="<c:url value="/public/images/PHI_Dashboard/share-mega-phone.svg "/>" alt="" srcset="">
                            </div>
                            <div class="card-details">
                                <h5>200</h5>
                                <div class="precentage">
                                    <div class="p-lable"><label >2.345%</label></div>
                                    <div class="arrow"><i data-feather="arrow-up"></i></div>
                                </div>
                            </div>
                        </div>
                        <label>RPHI Announcement</label>
                    </div>
                </div>
            </div>
            <div class="chart-map">
                <div class="Chart-side">
                    <div class="chart-container">
                        <label  class="topic">Rapidly spreading disease - week</label>
                        <div class="D-chart-container">
                            <div class="d-chart-header">
                                <div class="d-chart-header-parts">
                                    <label >Patient count</label>
                                    <h3>1200</h3>
                                </div>
                                <div class="d-chart-header-parts">
                                    <label >Disease</label>
                                    <h3>Corona</h3>
                                </div>
                            </div>
                            <div class="d-chart">
                                <canvas id="myChart" height="50" width="100"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="complain-dis-chart">
                        <label class="topic"> complain</label>
                        <div class="co-chart-container">
                            <div class="c-chart">
                                <span>Environmental issues</span>
                                <canvas id="myChart2" height="70" width="100"></canvas>
                            </div>
                            <div class="c-chart">
                                <span>Environmental issues</span>
                                <canvas id="myChart3" height="70" width="100"></canvas>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="map-container">
                    <label class="topic">MOH Area</label>
                    <div class="map">
                        <div id="map"></div>
                    </div>
                </div>
            </div>
            <div class="calander-complain">
                <div class="complains">
                    <label class="topic">New Complains</label>
                    <div class="complain-body">
                        <div class="complain">
                            <div class="color-circle">
                                <div class="circle"></div>
                            </div>
                            <div class="content">
                                <span>keeping an ear open to feedback can help to curb issues of quality and save an establishment from early death</span>
                                <label > today</label>
                            </div>
                        </div>
                        <div class="complain">
                            <div class="color-circle">
                                <div class="circle"></div>
                            </div>
                            <div class="content">
                                <span>keeping an ear open to feedback can help to curb issues of quality and save an establishment from early death</span>
                                <label > today</label>
                            </div>
                        </div>
                        <div class="complain">
                            <div class="color-circle">
                                <div class="circle"></div>
                            </div>
                            <div class="content">
                                <span>keeping an ear open to feedback can help to curb issues of quality and save an establishment from early death</span>
                                <label > today</label>
                            </div>
                        </div>
                        <div class="complain">
                            <div class="color-circle">
                                <div class="circle"></div>
                            </div>
                            <div class="content">
                                <span>keeping an ear open to feedback can help to curb issues of quality and save an establishment from early death</span>
                                <label > today</label>
                            </div>
                        </div>
                        <div class="complain">
                            <div class="color-circle">
                                <div class="circle"></div>
                            </div>
                            <div class="content">
                                <span>keeping an ear open to feedback can help to curb issues of quality and save an establishment from early death</span>
                                <label > today</label>
                            </div>
                        </div>
                        <div class="complain">
                            <div class="color-circle">
                                <div class="circle"></div>
                            </div>
                            <div class="content">
                                <span>keeping an ear open to feedback can help to curb issues of quality and save an establishment from early death</span>
                                <label > today</label>
                            </div>
                        </div>
                        <div class="complain">
                            <div class="color-circle">
                                <div class="circle"></div>
                            </div>
                            <div class="content">
                                <span>keeping an ear open to feedback can help to curb issues of quality and save an establishment from early death</span>
                                <label > today</label>
                            </div>
                        </div>
                        <div class="complain">
                            <div class="color-circle"></div>
                            <div class="content">
                                <span>keeping an ear open to feedback can help to curb issues of quality and save an establishment from early death</span>
                                <label > today</label>
                            </div>
                        </div>
                        <div class="complain">
                            <div class="color-circle"></div>
                            <div class="content">
                                <span>keeping an ear open to feedback can help to curb issues of quality and save an establishment from early death</span>
                                <label > today</label>
                            </div>
                        </div>
                        <div class="complain">
                            <div class="color-circle"></div>
                            <div class="content">
                                <span>keeping an ear open to feedback can help to curb issues of quality and save an establishment from early death</span>
                                <label > today</label>
                            </div>
                        </div>
                    </div>
                    <div class="viewmore">
                        <span>view more(34)</span>
                    </div>
                </div>
                <div class="complain-type">
                    <div class="type-container">
                        <label class="topic">Complain distribution</label>
                        <div class="types">
                            <div class="type-chart">
                                <div class="donat-chart">
                                    <canvas id="donat-chart" height="100" width="100"></canvas>
                                </div>

                            </div>
                            <div class="diff-types">
                                <ul>
                                    <li id="i1">Animal issue</li>
                                    <li id="i2">Environment issue</li>
                                    <li id="i3">Animal issue</li>
                                    <li id="i4">Environment issue</li>
                                    <li id="i5">Animal issue</li>
                                    <li id="i6">Environment issue</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="complain-svg">
<%--                        <img src="../../../images/svg/login/6583.jpg" alt="" srcset="">--%>
                    </div>
                </div>
                <div class="calander">
                    <div class="calanderbody">

                        <div class="calender-container" id="calender"></div>
                        <div class="mypopup" id="popup" style="display: none;position: fixed; top: 0; left: 0;"></div>

                    </div>
                </div>
            </div>
            <div class="todoList-apponment">
                <div class="todo-list">
                    <label class="topic">Today Evets</label>
                    <div class="todo-container ">

                        <div class="TodoListItem Complin">
                            <div class="Tapp-left">
                                <label>Need to go Weerasinghe hardware to inform about new rules(Thekka wood
                                    complain)</label>
                                <br>
                                <div>
                                    <span class="Tdate" style="margin-top: 100px;">10/13/2021</span>
                                </div>

                            </div>
                            <div class="Tapp-right">
                                <div class="todo_from">
                                    <span>From - You</span>
                                </div>

                                <div class="contact_no">
                                    <button class="todoDone">Done</button>
                                </div>
                            </div>

                        </div>

                        <div class="TodoListItem Complin">
                            <div class="Tapp-left">
                                <label>Need to go Weerasinghe hardware to inform about new rules(Thekka wood
                                    complain)</label>
                                <br>
                                <div>
                                    <span class="Tdate" style="margin-top: 100px;">10/13/2021</span>
                                </div>

                            </div>
                            <div class="Tapp-right">
                                <div class="todo_from">
                                    <span>From - You</span>
                                </div>

                                <div class="contact_no">
                                    <button class="todoDone">Done</button>
                                </div>
                            </div>

                        </div>
                        <div class="TodoListItem Complin">
                            <div class="Tapp-left">
                                <label>Need to go Weerasinghe hardware to inform about new rules(Thekka wood
                                    complain)</label>
                                <br>
                                <div>
                                    <span class="Tdate" style="margin-top: 100px;">10/13/2021</span>
                                </div>

                            </div>
                            <div class="Tapp-right">
                                <div class="todo_from">
                                    <span>From - You</span>
                                </div>

                                <div class="contact_no">
                                    <button class="todoDone">Done</button>
                                </div>
                            </div>

                        </div>
                        <div class="TodoListItem Complin">
                            <div class="Tapp-left">
                                <label>Need to go Weerasinghe hardware to inform about new rules(Thekka wood
                                    complain)</label>
                                <br>
                                <div>
                                    <span class="Tdate" style="margin-top: 100px;">10/13/2021</span>
                                </div>

                            </div>
                            <div class="Tapp-right">
                                <div class="todo_from">
                                    <span>From - You</span>
                                </div>

                                <div class="contact_no">
                                    <button class="todoDone">Done</button>
                                </div>
                            </div>

                        </div>
                        <div class="TodoListItem Complin">
                            <div class="Tapp-left">
                                <label>Need to go Weerasinghe hardware to inform about new rules(Thekka wood
                                    complain)</label>
                                <br>
                                <div>
                                    <span class="Tdate" style="margin-top: 100px;">10/13/2021</span>
                                </div>

                            </div>
                            <div class="Tapp-right">
                                <div class="todo_from">
                                    <span>From - You</span>
                                </div>

                                <div class="contact_no">
                                    <button class="todoDone">Done</button>
                                </div>
                            </div>

                        </div>
                        <div class="TodoListItem Complin">
                            <div class="Tapp-left">
                                <label>Need to go Weerasinghe hardware to inform about new rules(Thekka wood
                                    complain)</label>
                                <br>
                                <div>
                                    <span class="Tdate" style="margin-top: 100px;">10/13/2021</span>
                                </div>

                            </div>
                            <div class="Tapp-right">
                                <div class="todo_from">
                                    <span>From - You</span>
                                </div>

                                <div class="contact_no">
                                    <button class="todoDone">Done</button>
                                </div>
                            </div>

                        </div>
                        <div class="TodoListItem Complin">
                            <div class="Tapp-left">
                                <label>Need to go Weerasinghe hardware to inform about new rules(Thekka wood
                                    complain)</label>
                                <br>
                                <div>
                                    <span class="Tdate" style="margin-top: 100px;">10/13/2021</span>
                                </div>

                            </div>
                            <div class="Tapp-right">
                                <div class="todo_from">
                                    <span>From - You</span>
                                </div>

                                <div class="contact_no">
                                    <button class="todoDone">Done</button>
                                </div>
                            </div>

                        </div>
                        <div class="TodoListItem Complin">
                            <div class="Tapp-left">
                                <label>Need to go Weerasinghe hardware to inform about new rules(Thekka wood
                                    complain)</label>
                                <br>
                                <div>
                                    <span class="Tdate" style="margin-top: 100px;">10/13/2021</span>
                                </div>

                            </div>
                            <div class="Tapp-right">
                                <div class="todo_from">
                                    <span>From - You</span>
                                </div>

                                <div class="contact_no">
                                    <button class="todoDone">Done</button>
                                </div>
                            </div>

                        </div>


                    </div>
                </div>
                <div class="Appoinment">
                    <label class="topic">New Appoinments</label>
                    <div class="appinment-container">

                        <div class="appoinment-list">
                            <div class="app-left">
                                <h3>Akila anajan</h3>
                                <span>today</span>
                            </div>
                            <div class="app-right">
                                <span>To Take in</span>
                                <div class="contactno">
                                    <i data-feather="phone" class="phone-icon"></i>
                                    <span >0713805000</span>
                                </div>
                            </div>
                        </div>
                        <div class="appoinment-list">
                            <div class="app-left">
                                <h3>Akila anajan</h3>
                                <span>today</span>
                            </div>
                            <div class="app-right">
                                <span>asdas fasfas fasf sfa</span>
                                <div class="contactno">
                                    <i data-feather="phone" class="phone-icon"></i>
                                    <span >0713805000</span>
                                </div>
                            </div>
                        </div>
                        <div class="appoinment-list">
                            <div class="app-left">
                                <h3>Akila anajan</h3>
                                <span>today</span>
                            </div>
                            <div class="app-right">
                                <span>asdas fasfas fasf sfa</span>
                                <div class="contactno">
                                    <i data-feather="phone" class="phone-icon"></i>
                                    <span >0713805000</span>
                                </div>
                            </div>
                        </div>
                        <div class="appoinment-list">
                            <div class="app-left">
                                <h3>Akila anajan</h3>
                                <span>today</span>
                            </div>
                            <div class="app-right">
                                <span>asdas fasfas fasf sfa</span>
                                <div class="contactno">
                                    <i data-feather="phone" class="phone-icon"></i>
                                    <span >0713805000</span>
                                </div>
                            </div>
                        </div>
                        <div class="appoinment-list">
                            <div class="app-left">
                                <h3>Akila anajan</h3>
                                <span>today</span>
                            </div>
                            <div class="app-right">
                                <span>asdas fasfas fasf sfa</span>
                                <div class="contactno">
                                    <i data-feather="phone" class="phone-icon"></i>
                                    <span >0713805000</span>
                                </div>
                            </div>
                        </div>
                        <div class="appoinment-list">
                            <div class="app-left">
                                <h3>Akila anajan</h3>
                                <span>today</span>
                            </div>
                            <div class="app-right">
                                <span>asdas fasfas fasf sfa</span>
                                <div class="contactno">
                                    <i data-feather="phone" class="phone-icon"></i>
                                    <span >0713805000</span>
                                </div>
                            </div>
                        </div>
                        <div class="appoinment-list">
                            <div class="app-left">
                                <h3>Akila anajan</h3>
                                <span>today</span>
                            </div>
                            <div class="app-right">
                                <span>asdas fasfas fasf sfa</span>
                                <div class="contactno">
                                    <i data-feather="phone" class="phone-icon"></i>
                                    <span >0713805000</span>
                                </div>
                            </div>
                        </div>
                        <div class="appoinment-list">
                            <div class="app-left">
                                <h3>Akila anajan</h3>
                                <span>today</span>
                            </div>
                            <div class="app-right">
                                <span>asdas fasfas fasf sfa</span>
                                <div class="contactno">
                                    <i data-feather="phone" class="phone-icon"></i>
                                    <span >0713805000</span>
                                </div>
                            </div>
                        </div>
                        <div class="appoinment-list">
                            <div class="app-left">
                                <h3>Akila anajan</h3>
                                <span>today</span>
                            </div>
                            <div class="app-right">
                                <span>asdas fasfas fasf sfa</span>
                                <div class="contactno">
                                    <i data-feather="phone" class="phone-icon"></i>
                                    <span >0713805000</span>
                                </div>
                            </div>
                        </div>
                        <div class="appoinment-list">
                            <div class="app-left">
                                <h3>Akila anajan</h3>
                                <span>today</span>
                            </div>
                            <div class="app-right">
                                <span>asdas fasfas fasf sfa</span>
                                <div class="contactno">
                                    <i data-feather="phone" class="phone-icon"></i>
                                    <span >0713805000</span>
                                </div>
                            </div>
                        </div>
                        <div class="appoinment-list">
                            <div class="app-left">
                                <h3>Akila anajan</h3>
                                <span>today</span>
                            </div>
                            <div class="app-right">
                                <span>asdas fasfas fasf sfa</span>
                                <div class="contactno">
                                    <i data-feather="phone" class="phone-icon"></i>
                                    <span >0713805000</span>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="viewmore">
                        <span>view more(34)</span>
                    </div>
                </div>
            </div>
        </div>
<%--    </div>--%>
    <script>
        feather.replace({width: '0.8em', height: '1.1em'})
    </script>

    <script defer>
        let calender = new Calender("calender");
        let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
        calender.reangeSelect(2021, 9, 10, 6, 8);

    </script>
    <script>

        mapboxgl.accessToken = 'pk.eyJ1IjoiaGFuc2FuYTg3NiIsImEiOiJja3UwMWtrb3ExNjd2Mm9xaDh2MjdjM2FoIn0.6rDLn-mL41GbBUIW3B8MIA';
        const map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/streets-v11',
            center: [80.4771, 6.0994334],
            zoom: 8
        });

        map.addControl(
            new MapboxGeocoder({
                accessToken: mapboxgl.accessToken,
                mapboxgl: mapboxgl
            })
        );

        const marker = new mapboxgl.Marker({
            draggable: true
        })
            .setLngLat([80.4771, 6.0994334])
            .addTo(map);

        function onDragEnd() {
            const lngLat = marker.getLngLat();
            coordinates.style.display = 'block';
            coordinates.innerHTML = `Longitude: ${lngLat.lng}<br />Latitude: ${lngLat.lat}`;
        }

        marker.on('dragend', onDragEnd);


    </script>
    <script src="<c:url value="/public/js/PHI/PHI_chart_Dashboard.js"/>"></script>
    <script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
