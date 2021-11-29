<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Suwasewana</title>

    <script src="<c:url value="/public/js/PHI/complainForDashboard.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/public/css/PHI/PHI_Dashboard.css"/>">
    <link rel="stylesheet" href="<c:url value="/public/css/popup/popup.css "/>">
    <link rel="stylesheet" href="<c:url value="/public/css/calander/calander.css "/>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <script src="<c:url value="/public/js/Calander/CalanderScript.js"/>"></script>
    <script src="<c:url value="/public/js/popup.js "/>"></script>
    <script src="<c:url value="/public/js/PHIOfficer/todolistForDashboard.js"/>"></script>

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
                        <h5 id="appoinment-count">200</h5>
                        <div class="precentage">
                            <div class="p-lable" id="appoinment-precentage"><label >2.345%</label></div>
                            <div class="arrow" style="display: none" id="app-complain-arrow-up"><i data-feather="arrow-up" ></i></div>
                            <div class="arrow" style="display: none" id="app-complain-arrow-down"><i data-feather="arrow-down"></i></div>
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
                        <h5 id="pending-complain">200</h5>
                        <div class="precentage">
                            <div class="p-lable" id="complain-precentage"><label >2.345%</label></div>
                            <div class="arrow" style="display: none" id="complain-arrow-up"><i data-feather="arrow-up" ></i></div>
                            <div class="arrow" style="display: none" id="complain-arrow-down"><i data-feather="arrow-down"></i></div>
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
                        <h5 id="announcemtPre" style="margin-left: 20px; margin-top: 10px"></h5>
                        <div class="precentage">
<%--                            <div class="p-lable"><label >2.345%</label></div>--%>
<%--                            <div class="arrow"><i data-feather="arrow-up"></i></div>--%>
                        </div>
                    </div>
                </div>
                <label>RPHI Announcement</label>
            </div>
        </div>
    </div>
    <div class="chart-map">
        <div class="Chart-side">
            <div class="chart-container" style="padding: 25px">
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
            <%--                    <div class="complain-dis-chart">--%>
            <%--                        <label class="topic"> complain</label>--%>
            <%--                        <div class="co-chart-container">--%>
            <%--                            <div class="c-chart">--%>
            <%--                                <span>Environmental issues</span>--%>
            <%--                                <canvas id="myChart2" height="70" width="100"></canvas>--%>
            <%--                            </div>--%>
            <%--                            <div class="c-chart">--%>
            <%--&lt;%&ndash;                                <span>Environmental issues</span>&ndash;%&gt;--%>
            <%--&lt;%&ndash;                                <canvas id="myChart3" height="70" width="100"></canvas>&ndash;%&gt;--%>
            <%--                            </div>--%>
            <%--                        </div>--%>

            <%--                    </div>--%>
        </div>
        <div class="map-container" style="padding: 20px">
            <label class="topic">MOH Area</label>
            <div class="map">
                <div id="map"></div>
            </div>
        </div>
    </div>
    <div class="calander-complain" style="padding: 10px">

        <div class="complain-type">
            <div class="type-container">
                <label class="topic">Complain distribution</label>
                <div class="types">

                    <div class="type-chart">
                        <div class="donat-chart">
                            <canvas id="donat-chart" height="200" width="200"></canvas>
                        </div>

                    </div>
                    <div class="diff-types">
                        <ul>
                            <li id="i1">Animal issue</li>
                            <li id="i2">Environment issue</li>
                            <li id="i3">Unhealthy food issues</li>
                            <li id="i4">Land issue</li>
                            <li id="i5">Noise issue</li>
                            <li id="i6">Other</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="complain-svg">
                <%--                        <img src="../../../images/svg/login/6583.jpg" alt="" srcset="">--%>
            </div>
        </div>
        <div class="calander" style="padding: 20px">
            <div class="calanderbody">

                <div class="calender-container" id="calender"></div>
                <div class="mypopup" id="popup" style="display: none;position: fixed; top: 0; left: 0;"></div>

            </div>
        </div>
    </div>

    <%--            complaints--%>

    <div class="complains" style="padding: 20px">
        <label class="topic">New Complains</label>
        <div class="complain-body" id="previous_complain_list">
            <div class="complain">
                <div class="color-circle">
                    <div class="circle"></div>
                </div>
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
    <div class="todoList-apponment" style="padding: 20px">
        <div class="todo-list">
            <label class="topic">Today Evets</label>
            <div class="todo-container " id="task_list">

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
        <div class="Appoinment" style="padding: 20px">
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
    // calender.reangeSelect(2021, 9, 10, 6, 8);
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





<script>
    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    let complain= new Complain('previous_complain_list');
    getAllComplain();
    function getAllComplain() {
        let complainCardList = [];
        let typedatalist=[]
        $.post(myUrl+"/phi-complain-controller1/ViewComplainForPHI",
            {},
            function (data, status) {
                let complainList = JSON.parse(data);
                complainlist=complainList;


                // fill pending done in progress count
                let pendin=0;
                let done=0;
                let progress=0;
                let today = new Date();
                // console.log("Today : "+cday)
                let month= today.getMonth()+1;
                let premonth=month-1;
                let date= today.getDate();

                let preMonthComplain=0;
                let thisMonthCompalin=0;
                let pending=0;
                complainList.map((element) => {
                    // console.log("################################");
                    let cday = new Date(element.complainModel.Posted_Date.split(" ")[0])
                    let cmonth= cday.getMonth()+1;
                    let cdate= cday.getDate();

                    if(cmonth==month && cdate<=date){
                        // console.log("this is this month complain");
                        thisMonthCompalin++;
                    }
                    else if(cmonth==premonth && cdate<=date ){
                        // console.log("this is pre month complain");
                        preMonthComplain++;
                    }
                    else{
                        // console.log("dont care about this compalins")
                    }

                    if(element.complainModel.Status=="Pending"){
                        pending++
                    }


                })
                // console.log("thisMonthCompalin : "+thisMonthCompalin)
                // console.log("preMonthComplain : "+preMonthComplain)
                // console.log("pending : "+pending)
                let complainprecentage=((thisMonthCompalin-preMonthComplain)/preMonthComplain)*100;
                let ComPre=Math.abs(Math.round(complainprecentage));


                document.getElementById("pending-complain").innerText=pending;
                document.getElementById("complain-precentage").innerText=ComPre+"%";
                if(complainprecentage<0){
                    document.getElementById("complain-arrow-down").style.display="block";
                }
                else{
                    document.getElementById("complain-arrow-up").style.display="block";
                }

            }
        );

    }
    getAllAppoinment();
    let appoinmenlist=[];
    function getAllAppoinment() {
        $.post(myUrl+"/PHIAppointmentServlet/appointment_for_phi",
            {},
            function (data, status) {

                let AppoinmentList = JSON.parse(data);
                appoinmenlist=AppoinmentList;

                // fill pending done in progress count
                let pendin=0;
                let done=0;
                let progress=0;
                let today = new Date();
                // console.log("Today : "+cday)
                let month= today.getMonth()+1;
                let premonth=month-1;
                let date= today.getDate();

                let preMonthAppoinmen=0;
                let thisMonthAppoinmen=0;
                let pending=0;
                AppoinmentList.map((element) => {
                    // console.log("################################");
                    let cday = new Date(element.appointment.posted_date_time.split(" ")[0])
                    let cmonth= cday.getMonth()+1;
                    let cdate= cday.getDate();



                    if(cmonth==month && cdate<=date){
                        thisMonthAppoinmen++;
                    }
                    else if(cmonth==premonth && cdate<=date ){
                        preMonthAppoinmen++;
                    }
                    else{
                        // console.log("dont care about this compalins")
                    }

                    if(element.appointment.status=="pending"){
                        pending++
                    }



                })
                // console.log("AppthisMonthCompalin : "+thisMonthAppoinmen)
                // console.log("ApppreMonthComplain : "+preMonthAppoinmen)
                // console.log("pending : "+pending)
                let appprecentage=((thisMonthAppoinmen-preMonthAppoinmen)/preMonthAppoinmen)*100;
                let AppPre=Math.abs(Math.round(appprecentage));

                document.getElementById("appoinment-count").innerText=pending;
                document.getElementById("appoinment-precentage").innerText=AppPre+"%";
                if(appprecentage<0){
                    document.getElementById("app-complain-arrow-down").style.display="block";
                }
                else{
                    document.getElementById("app-complain-arrow-up").style.display="block";
                }

            }
        );

    }

    getAllAnnouncement();
    function getAllAnnouncement() {

        $.post(myUrl+"/createRPHI_Announcements/selectmohAnnouncemnt",
            {},
            function (data, status) {
                let newannouncemt=0;
                let AnnouncementList = JSON.parse(data);
                // console.log("AnnouncementList ")
                AnnouncementList.map((element) => {
                    // console.log("announcement_id: "+element.expire_date);
                    let expday = new Date(element.expire_date)
                    let current_day=new Date();
                    // console.log("today : "+current_day+" "+"exp_day : "+expday);
                    if(current_day<=expday){
                        newannouncemt++;
                    }

                })
                console.log("Announcemt count : "+newannouncemt);
                document.getElementById("announcemtPre").innerText=newannouncemt;
            }
        );

    }


    getAllComplinMOH();
    function getAllComplinMOH() {
        let Animal_issue=0;
        let Environment_issues=0;
        let Food_issues=0;
        let Land_issues=0;
        let Noise_issue=0;
        let other=0;
        $.post(myUrl+"/phi-complain-controller1/complain_for_moh",
            {},
            function (data, status) {
                let ComplainList = JSON.parse(data);
                ComplainList.map((element) => {
                    if(element.complainModel.CType=="100"){
                        Animal_issue++;
                    }
                    if(element.complainModel.CType=="101"){
                        Environment_issues++;
                    }
                    if(element.complainModel.CType=="102"){
                        Food_issues++;
                    }
                    if(element.complainModel.CType=="103"){
                        Land_issues++;
                    }
                    if(element.complainModel.CType=="104"){
                        Noise_issue++;
                    }
                    if(element.complainModel.CType=="105"){
                        other++;
                    }

                })
                // console.log("Animal_issue "+Animal_issue);
                // console.log("Environment_issues "+Environment_issues);
                // console.log("Food_issues "+Food_issues);
                // console.log("Land_issues "+Land_issues);
                // console.log("other "+other);

                complain_distribution_chart(Animal_issue,Environment_issues,Food_issues,Land_issues,Noise_issue,other);







            }
        );

    }
</script>
<%--chart for complain distribution--%>
<script>

    function complain_distribution_chart( type1, type2, type3, type4 ,type5,type6){
        var ctx = document.getElementById('donat-chart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                //  labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                datasets: [{
                    label: '',
                    data: [type1, type2, type3, type4, type5,type6],
                    backgroundColor: [
                        '#c0392b',
                        '#3498db',
                        '#f1c40f',
                        '#2ecc71',
                        '#8e44ad',
                        '#273c75'
                    ],
                    borderColor: [
                        '#ecf0f1'
                    ],
                    // borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    title: {
                        display: true,
                        // text: 'Chart.js Doughnut Chart'
                    }
                }
            },
        });
    }
</script>

<script>
    getAllComplain();
    function getAllComplain() {
        let complainCardList = [];
        let typedatalist=[]
        $.post(myUrl+"/phi-complain-controller1/ViewComplainForPHI",
            {},
            function (data, status) {
                let complainList = JSON.parse(data);

                complain.setDataForPHI(complainList);



            }
        );

    }




    getAlltask();
    let tasklist= new TaskList('task_list');
    function getAlltask() {
        let complainCardList = [];
        let typedatalist=[]
        $.post(myUrl+"/phi-Todo-controller/TakeTaskList",
            {},
            function (data, status) {
                let TodayTaskList = JSON.parse(data);

                tasklist.setDataForPHI(TodayTaskList);



            }
        );

    }
</script>

</body>
</html>