
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Suwasewana</title>
    <script src="<c:url value="/public/js/popup.js"></c:url> "></script>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/c-dashboard.css "/>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"
            integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <%--    for side navbar style--%>
    <script src="<c:url value="/public/js/ClinicalOfficer/dashboard_clinic_summary.js"/>"></script>
    <script src="<c:url value="/public/js/ClinicalOfficer/dashboard_Vclinic_summary.js"/>"></script>
    <script src="<c:url value="/public/js/ClinicalOfficer/dashboard_clinic_disease_summary.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <script src="<c:url value="/public/js/Calander/CalanderScript.js"/>"></script>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/public/css/calander/calander.css "/>">
    <link rel="stylesheet" href="<c:url value="/public/css/popup/popup.css "/>">

</head>
<body id="mainContent">
<c:import url="/view/admin/partials/ClinicalOfficerSideNavbar.jsp"/>
<div class="header">
    <div class="upper-title">SUWASEWANA </div>
    <div class="dashboard-name">Clinic/Dashboard/Home</div>
</div>

<div  class="c-db-container ">
    <div class="c-container-left">
        <div class="upcomin-clinic">
            <h4>This month normal Clinics</h4>

            <div class="clinic-list" id="clinic-list">

            </div>
            <h4>This month vaccine Clinics</h4>
            <div class="clinic-list" id="clinic-list1">

            </div>


        </div>
        <div class="growth-calander">
            <div class="charts">
                <div class="chart" id="chart1">
                    <h4>Clinic growth</h4>
                    <div class="g-chart" style="width: 100%;">
                        <canvas id="myChart" height="50" width="100" style="margin-left: 20px"></canvas>
                    </div>
                </div>
                <div class="chart" id="chart2">
                    <h4>Patient growth</h4>
                    <div class="g-chart" style="width: 100%">
                        <canvas id="myChart2" height="50" width="100" style="margin-left: 20px"></canvas>
                    </div>
                </div>
            </div>
            <div class="calander">
                <h4>Calander</h4>
                <div class="calander-body">
                    <div class="calender-container" id="calender" ></div>
                    <div class="mypopup" id="popup" style="display: none;position: fixed; top: 0; left: 0;"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="c-container-right">
        <h4>All Scheduled Clinic Summary</h4>
        <div class="c-right-container">
            <div class="noclinic">
                <div class="ncimg">
                    <img src="<c:url value="/public/images/svg/login/image1.svg "/>" alt="" srcset=""
                         width=100% height=100%>
                </div>
                <div class="nc-amount">
                    <span class="nc-count" id="vc-count">0</span><br>
                    <span>No. of vaccine clinics</span>
                </div>
            </div>

            <div class="noclinic">
                <div class="ncimg">
                    <img src="<c:url value="/public/images/svg/login/image1.svg "/>" alt="" srcset=""
                         width=100% height=100%>
                </div>
                <div class="nc-amount">
                    <span class="nc-count" id="nc-count">0</span><br>
                    <span>No. of normal clinics</span>
                </div>
            </div>
            <div class="pendingclinc">
                <div class="pctitle">No of clinics according to diseases</div>

                <div class="diseases" id="diseases">
                </div>
            </div>
        </div>
    </div>
</div>
<script defer>
    let calender = new Calender("calender");
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    // calender.reangeSelect(2021, 9, 10, 6, 8);



    view();
    viewV()
    viewd()
    let today = new Date();
    let clinicList4 = new clinicListd("diseases");
    function viewd(){
        let clinicListArray=[]
        $.post("/test_war_exploded/create-clinic-controller/viewdisease",
            // reqData,
            function(data,status){
                console.log(data)
                clinicListArray=JSON.parse(data)
                chart(clinicListArray,today)
                clinicList4.setData(clinicListArray);
            }
        );
    }
    let clinicList2 = new clinicList("clinic-list");
    function view(){
        let clinicListArray=[]
        $.post("/test_war_exploded/create-clinic-controller/view",
            // reqData,
            function(data,status){
            console.log(data)
                clinicListArray=JSON.parse(data)
                clinicList2.setData(clinicListArray);
                console.log(clinicListArray.length)
                document.getElementById("nc-count").innerHTML=clinicListArray.length;
            }
        );
    }
    let clinicList3 = new clinicListv("clinic-list1");
    function viewV(){
        let clinicListArray1=[]
        $.post("/test_war_exploded/create-clinic-controller/VaccineClinicsView",
            // reqData,
            function(data,status){
                clinicListArray1=JSON.parse(data)
                clinicList3.setData(clinicListArray1);
                document.getElementById("vc-count").innerHTML=clinicListArray1.length;

            }
        );
    }

    function select(id){
        // let selectClinic = new selectClinics("form");
        let clinicList=[]
        let reqData =
            {
                clinicID: id,
            };
        console.log(reqData);
        $.post("/test_war_exploded/create-clinic-controller/select",
            reqData,
            function(data,status){
                // alert(data)
                console.log(data)
                clinicList=JSON.parse(data)
                // selectClinic.setData(clinicList);
                popup.showClinicEditMessage(data)

            }
        );
        return false;
    }
    function selectv(id){
        // let selectClinic = new selectClinics("form");
        let clinicList=[]
        let reqData =
            {
                clinicID: id,
            };
        console.log(reqData);
        $.post("/test_war_exploded/create-clinic-controller/select-V-Clinics",
            reqData,
            function(data,status){
                // alert(data)
                console.log(data)
                // alert(data)
                clinicList=JSON.parse(data)
                // selectClinic.setData(clinicList);
                popup.showVaccineClinicEditMessage(data)

            }
        );
        return false;
    }


    function updatevclinics(data){
        alert("update")
        let id=data;
        let age=document.getElementById("target_age_limit").value;
        let patient=document.getElementById("target_people").value;
        let maxpatient = document.getElementById("max_patient").value;
        let duration=document.getElementById("duration").value;
        let datetime= document.getElementById("start_date_time").value;
        let clinictitle=document.getElementById("tittle").value;
        let description=document.getElementById("description").value;
        let dose=document.getElementById("dose_count").value;
        let location=document.getElementById("location").value;
        // console.log(a)
        // // alert("update")
        let reqData =
            {
                clinicID:id,
                age:age,
                title:clinictitle,
                location:location,
                // targetMOH:document.getElementById("target-MOH").value,
                datetime:datetime,
                duration:duration,
                maxpatient:maxpatient,
                patient:patient,
                dose:dose,
                description:description
            };
        console.log(reqData)
        alert(reqData)
        $.post("/test_war_exploded/create-clinic-controller/updatevclinic",
            reqData,
            function (data,status){
                // alert("wrong")
                alert(data)
            });

        return false;
    }


    function updateclinics(data){
        // alert("update")
        // let id=data;
        let a=document.getElementById("disease").value;
        let patient=document.getElementById("patient").value;
        let maxpatient = document.getElementById("max-patient").value;
        let duration=document.getElementById("duration").value;
        let datetime= document.getElementById("date-time").value;
        let clinictitle=document.getElementById("clinic-title").value;
        let description=document.getElementById("description").value;
        let conduct=document.getElementById("conduct").value;
        let location=document.getElementById("location").value;
        console.log(a)
        // // alert("update")
        let reqData =
            {
                clinicID:data,
                disease:a,
                title:clinictitle,
                location:location,
                // targetMOH:document.getElementById("target-MOH").value,
                datetime:datetime,
                duration:duration,
                maxpatient:maxpatient,
                patient:patient,
                conduct:conduct,
                description:description
            };
        console.log(reqData)
        $.post("/test_war_exploded/create-clinic-controller/updateclinic",
            reqData,
            function (data,status){
                // alert("wrong")
                alert(data)
            });

        return false;
    }
</script>
<script src="<c:url value="/public/js/ClinicalOfficer/Dashboard.js"/>"></script>
<script>
    let mycard = new card("")
</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>"></script>

</body>
</html>
