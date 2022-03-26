<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Suwasewana</title>

    <script src="<c:url value="/public/js/PHI/complainForDashboard.js"/>"></script>
    <script src="<c:url value="/public/js/PHI/appoinmentForDashboard.js "/>"></script>
    <link rel="stylesheet" href="<c:url value="/public/css/PHI/PHI_Dashboard.css"/>">
    <link rel="stylesheet" href="<c:url value="/public/css/popup/popup.css "/>">
    <link rel="stylesheet" href="<c:url value="/public/css/calander/calander.css "/>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



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


    <%--    for popup style--%>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/public/css/popup/Appintmentpopup.css"/>" rel="stylesheet"/>
    <%--    for popup script--%>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
    <script src="<c:url value="/public/js/Calander/CalanderScript.js"/>"></script>
</head>

<body id="mainContent">
<c:import url="/view/admin/partials/PHIOfficerSideNavbar.jsp" />
<%--    <div class="main-container">--%>
<div class="mypopup" id="popup" style="display: none;"></div>
<div class="header">
    <div class="upper-title">SUWASEWANA</div>
    <div class="dashboard-name">PHI/Dashboard/Home</div>
</div>

<div class="body-content">
    <div class="top-summary">
        <div class="summary-card">
            <div class="card" onclick="JumpToAppoinmnet();">
                <div class="card-content">
                    <div class="card-icon">
                        <img  src="<c:url value="/public/images/PHI_Dashboard/time-clock-circle.svg "/>" srcset="">
                    </div>
                    <div class="card-details">
<%--                        <h5 id="appoinment-count">200</h5>--%>
                        <h5 id="appoinment-count" style="margin-left: 20px; margin-top: 10px"></h5>
                        <div class="precentage" style="display: none">
<%--                            <div class="p-lable" id="appoinment-precentage"><label >2.345%</label></div>--%>
<%--                            <div class="arrow" style="display: none" id="app-complain-arrow-up"><i data-feather="arrow-up" ></i></div>--%>
<%--                            <div class="arrow" style="display: none" id="app-complain-arrow-down"><i data-feather="arrow-down"></i></div>--%>
                        </div>
                    </div>
                </div>
                <label>Appoinment</label>
            </div>
            <div class="card" onclick="JumpToComplain()">
                <div class="card-content">
                    <div class="card-icon">
                        <img src="<c:url value="/public/images/PHI_Dashboard/help-question-message.svg "/>" alt="" srcset="">
                    </div>
                    <div class="card-details">
<%--                        <h5 id="pending-complain">200</h5>--%>
                        <h5 id="pending-complain" style="margin-left: 20px; margin-top: 10px"></h5>
                        <div class="precentage" style="display: none">
<%--                            <div class="p-lable" id="complain-precentage"><label >2.345%</label></div>--%>
<%--                            <div class="arrow" style="display: none" id="complain-arrow-up"><i data-feather="arrow-up" ></i></div>--%>
<%--                            <div class="arrow" style="display: none" id="complain-arrow-down"><i data-feather="arrow-down"></i></div>--%>
                        </div>
                    </div>
                </div>
                <label>Complaints </label>
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
            <div class="card">
<%--                <div class="card-content">--%>
                    <div class="clock" >
                        <div class="wrapper">
                            <div class="time__wrapper ">
                                <span class="text__color" id="time"></span>
                                <span class="text__color" id="sec"></span>
                                <span class="text__color" id="med"> </span>
                            </div>

                            <span class="text__color" id="full__date">
                            </span>
                        </div>
<%--                    </div>--%>
                </div>
            </div>
        </div>
    </div>
<%--    <hr class="seperateline">--%>
    <div class="chart-map">
        <div class="Chart-side">
            <div class="chart-container" style="padding: 25px">
                <label  class="topic">Rapidly spreading disease - week</label>
                <div class="D-chart-container">
                    <div class="d-chart-header">
                        <div class="d-chart-header-parts">
                            <label >Patient count</label>
                            <h3 id="PatientCount">1200</h3>
                        </div>
                        <div class="d-chart-header-parts">
                            <label >Disease</label>
                            <h3 id="MostspreadDiseas">Corona</h3>
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
<%--            <span>view more(34)</span>--%>
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
        <div class="Appoinment" style="margin-top: 20px">
            <label class="topic">New Appoinments</label>
            <div class="appinment-container" id="apponmentList">

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


            </div>
            <div class="viewmore">
<%--                <span>view more(34)</span>--%>
            </div>
        </div>
    </div>
</div>
<%--    </div>--%>
<script>
    feather.replace({width: '0.8em', height: '1.1em'})
</script>
<script defer >
    function currentTime() {
        var date = new Date();
        var day = date.getDay();
        var hour = date.getHours();
        var min = date.getMinutes();
        var sec = date.getSeconds();
        var month = date.getMonth();
        var curr_date = date.getDate();
        var year = date.getFullYear();
        var month_name = [
            "January",
            "February",
            "March",
            "April",
            "May",
            "June",
            "July",
            "August",
            "September",
            "October",
            "November",
            "December"
        ];

        var midday = "AM";
        midday = hour >= 12 ? "PM" : "AM";
        hour = hour == 0 ? 12 : hour > 12 ? hour - 12 : hour;
        hour = updateTime(hour);
        min = updateTime(min);
        sec = updateTime(sec);
        curr_date = updateTime(curr_date);
        // console.log("hour "+hour)
        // console.log("min "+min)
        // console.log("sec "+sec)
        // console.log("curr_date "+curr_date)
        let x=hour+":"+min
        document.querySelector("#time").innerHTML = x;

        // console.log("{hour}:{min} "+x)

        document.querySelector("#sec").innerHTML = sec;
        document.querySelector("#med").innerHTML = midday;
        document.querySelector(
            "#full__date"
        ).innerHTML = month_name[month]+" "+curr_date+" "+year;
    }
    function updateTime(k) {
        if (k < 10) {
            return "0" + k;
        } else {
            return k;
        }
    }
    setInterval(currentTime, 1000);
</script>

<script defer>
    let calender = new Calender("calender",'phiEvents');
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message","", "calenderEvent");
    // calender.reangeSelect(2021, 9, 10, 6, 8);
</script>
<script>
    mapboxgl.accessToken = 'pk.eyJ1IjoiaGFuc2FuYTg3NiIsImEiOiJja3UwMWtrb3ExNjd2Mm9xaDh2MjdjM2FoIn0.6rDLn-mL41GbBUIW3B8MIA';
    const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v11',
        center: [80.2879, 7.9865],
        zoom: 7
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
        .setLngLat([80.2879, 7.9865])
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


    function JumpToComplain(){

        let url=myUrl+"/s/view-complaints"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"view-complaints");
    }
    function JumpToAppoinmnet(){

        let url=myUrl+"/s/view-appointments"
        console.log("Url "+url)
        location.href=(url)
    }
    function JumpToTasklist(){

        let url=myUrl+"/s/manage-toDO"
        console.log("Url "+url)
        location.href=(url)
    }



    choose();
    function choose(){
        let TodoListArray=[]
        $.post(myUrl+"/phi-Todo-controller/TakeTaskListcount",
            // reqData,
            function(data,status){
                TodoListArray=JSON.parse(data)
                TodoListArray.map(item=>{
                    let date=item.expire_date
                    // console.log("date")
                    // console.log(date)
                    let cday = new Date(item.expire_date)
                    let cmonth= cday.getMonth()+1;
                    let cyear=cday.getFullYear()
                    let cdata=cday.getDate()
                    let reqData={
                        date:date
                    };
                    event=[]
                    eventA=[]
                    $.post(myUrl+"/phi-Todo-controller/TaskforClander",
                        reqData,
                        function (data,status){
                            let EventArray =JSON.parse(data)
                            // console.log(EventArray)
                            // console.log("events")
                            event.push(EventArray)
                            let object2 = { year: cyear
                                , month: cmonth, date: cdata ,events: event[0]};
                            eventA.push(object2)
                            event=[]
                            calender.setTaskDataForCalander(eventA)
                            // console.log("event arrray")
                            // console.log(eventA)
                        });
                })
            }
        );
    }
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
                let complainprecentage=((thisMonthCompalin-preMonthComplain));
                let ComPre=Math.abs(Math.round(complainprecentage));


                document.getElementById("pending-complain").innerText=pending;
                // document.getElementById("complain-precentage").innerText=ComPre+"";
                if(complainprecentage<0){
                    // document.getElementById("complain-arrow-down").style.display="block";
                }
                else{
                    // document.getElementById("complain-arrow-up").style.display="block";
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
                let appprecentage=((thisMonthAppoinmen-preMonthAppoinmen));
                let AppPre=Math.abs(Math.round(appprecentage));

                document.getElementById("appoinment-count").innerText=pending;
                // document.getElementById("appoinment-precentage").innerText=AppPre+"";
                if(appprecentage<0){
                    // document.getElementById("app-complain-arrow-down").style.display="block";
                }
                else{
                    // document.getElementById("app-complain-arrow-up").style.display="block";
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

                    let current_day=new Date();
                    let tmonth= current_day.getMonth()+1;
                    let tyear=current_day.getFullYear();



                    let cday = new Date(element.posted_date.split(" ")[0])
                    let cmonth= cday.getMonth()+1;
                    let cyear=cday.getFullYear();



                    if(cmonth==tmonth && tyear==cyear){
                        newannouncemt++;
                    }


                })
                // console.log("Announcemt count : "+newannouncemt);
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
    function viewComplainDetail(title,ctype,pdate,message,user,mobile,uname){

        let data={
            title:title,
            ctype:ctype,
            pdate:pdate,
            message:message,
            user:user,
            mobile:mobile,
            uname:uname
        }
        popup.dashboardComplain(data);
    }




    // To get all disease count in this month
    Getmaxdiseasecount()
    function createFirstAndLastDay(d){
        var date = new Date(d), y = date.getFullYear(), m = date.getMonth();
        var firstDay = (new Date(y, m, 1));
        var lastDay = (new Date(y, m + 1, 0));
        let date1=y+"-"+(m+1)+"-"+firstDay.getDate();
        let date2=y+"-"+(m+1)+"-"+lastDay.getDate();
        // console.log(date1)
        // console.log(date2)
        return{
            "date1":date1,
            "date2":date2
        }
    }

    function TakePreviousMonth(myVariable){

        var makeDate = new Date(myVariable);
        makeDate = new Date(makeDate.setMonth(makeDate.getMonth() - 1));
        return makeDate;
    }
    function Getmaxdiseasecount() {
        var date = new Date(), y = date.getFullYear(), m = date.getMonth();
        var firstDay = (new Date(y, m, 1));
        var lastDay = (new Date(y, m + 1, 0));

        let date1=y+"-"+m+"-"+firstDay.getDate();
        let date2=y+"-"+m+"-"+lastDay.getDate();





        var CDate = new Date()

        i=5
        monthArray=[]
        monthArray.push(createFirstAndLastDay(CDate))
        while(i>0){
            CDate=TakePreviousMonth(CDate);
            monthArray.push(createFirstAndLastDay(CDate))
            i--;
        }
        // for(i=0;i<5;i++){
        //     console.log("xxx"+monthArray[i].date1)
        //     console.log("xxx"+monthArray[i].date2)
        // }


        let reqData={
            m1date1:monthArray[0].date1,
            m1date2:monthArray[0].date2,
            m2date1:monthArray[1].date1,
            m2date2:monthArray[1].date2,
            m3date1:monthArray[2].date1,
            m3date2:monthArray[2].date2,
            m4date1:monthArray[3].date1,
            m4date2:monthArray[3].date2,
            m5date1:monthArray[4].date1,
            m5date2:monthArray[4].date2,
            m6date1:monthArray[5].date1,
            m6date2:monthArray[5].date2,
        };
        console.log("zzzz "+(new Date(monthArray[1].date1)).getMonth())
        $.post(myUrl+"/disease-controller/Getmaxdiseasecount",
            reqData,
            function (data, status) {
                let ChartDetails = JSON.parse(data);
                console.log("ChartDetails "+data);
                console.log("ChartDetails "+ChartDetails.DiseaseName);
                console.log("ChartDetails "+ChartDetails.Count1);
                console.log("ChartDetails "+ChartDetails.Count2);
                document.getElementById("MostspreadDiseas").innerHTML=ChartDetails.DiseaseName;
                document.getElementById("PatientCount").innerHTML=ChartDetails.Date2

                var countArray=[ChartDetails.Count6,ChartDetails.Count5,ChartDetails.Count4,
                    ChartDetails.Count3,
                    ChartDetails.Count2,
                    ChartDetails.Count1
                ]
                var month_names_short= ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                ShortmonthArray=[]
                for(i=5;i>=0;i--){

                    x=(new Date(monthArray[i].date1)).getMonth()
                    ShortmonthArray[i]=(month_names_short[x])
                }
                ShortmonthArray.reverse();
                // for(i=0;i<=5;i++){
                //     console.log("month "+ ShortmonthArray[i]+ " - "+countArray[i])
                // }
                let LineChart = new PHILineChart(ShortmonthArray,countArray,'myChart');

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

    function CompleteTask(taskid){
        let reqdata={
            taskid:taskid
        }
        $.post(myUrl+"/phi-Todo-controller/Complete",
            reqdata,
            function (data, status) {
                getAlltask();
            }
        );
    }
    getAllAppointment();
    let appointment= new Appointment('apponmentList');
    function getAllAppointment() {
        let complainCardList = [];
        let typedatalist=[]
        $.post(myUrl+"/PHIAppointmentServlet/selectAppointmentForPHI",
            {},
            function (data, status) {
                let AppointmentList = JSON.parse(data);
                appointment.setDataForPHI(AppointmentList);
            }
        );
    }
</script>

</body>
</html>