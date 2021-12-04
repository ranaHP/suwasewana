<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Suwasewana</title>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_c-dashboard-viewClinics.css"/> "/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="<c:url value="/public/js/ClinicalOfficer/viewVaccineClinics.js"></c:url> "></script>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>

</head>
<body>
<c:import url="/view/admin/partials/ClinicalOfficerSideNavbar.jsp"/>
<div class="containor container" id="mainContent">
    <div class="header">
        <div class="upper-title">SUWASEWANA </div>
        <div class="dashboard-name">Clinical officer/Dashboard/Clinic List</div>
    </div>
<%--     filter section --%>
    <div class="mypopup" id="popup" style="display: none;"></div>
    <div class="cardselect" style="padding:45px">
        <div class="searchbar">
            <input type="text" id ="filter" placeholder="Search clinic by name" required autocomplete="off" name="clinic-title" onkeyup="search()" />

        </div>
        <div class="searchbar">
            <input id="clinicID" placeholder="search by clinic date" list="AllMArea" name="AllMArea" autocomplete="off"

                   onclick="document.getElementById('clinicID').value='';"
            >
            <datalist id="AllMArea">
            </datalist>
            <br>
            <span class="error" id="LMArea" style="margin-left: 5px" ></span>
            <button onclick="searchD()">Search</button>
        </div>

    </div>
    <div class="card-containor" id="card-containor">
<%--          <div id="option" class="live-card"></div>--%>
    </div>
</div>
<script>
    feather.replace()
</script>
<script defer>
    let clinicList1 = new clinicList("card-containor");
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    view();
    function view(){
        let clinicListArray=[]
        $.post("/test_war_exploded/create-clinic-controller/VaccineClinicsView",
            // reqData,
            function(data,status){
                clinicListArray=JSON.parse(data)
                clinicList1.setData(clinicListArray);
                console.log(data)
            }
        );
    }
    function deleteCheckInputVsUserInput(appointmentId){
        let userInput = document.getElementById("delete_input").value;
        if(userInput === "Delete"){
            document.getElementById("deleteAuthErrorMessage").style.display = "none";
            deleteVClinics(appointmentId);
            // alert("okay")
        }else{
            document.getElementById("deleteAuthErrorMessage").style.display = "block";
        }
    }

    function deleteVClinics(clinicID){
        // console.log("deleteclinicfunction")
        $.post("/test_war_exploded/create-clinic-controller/deleteV",
            {
                clinicID: clinicID
            },
            function (data, status) {
                if (data.includes("success")) {
                    popup. showClinicDeleteSuccessMessage({
                        status: 'success',
                        message: 'Clinic Successfully Deleted!'
                    });
                } else {
                    popup. showClinicDeleteSuccessMessage({
                        status: 'fail',
                        message: 'Clinic delete Fails !',
                        data: data
                    });
                }
            }
        );
    }

    let mohDetails=[];
    $.post("/test_war_exploded/create-clinic-controller/VaccineClinicsView",
        function (data, status) {
            // console.log(data);
            let rs= JSON.parse(data);
            this.mohDetails=rs;
            console.log(data);

            let MNames=document.getElementById("AllMArea");
            MNames.innerHTML="";
            rs.map((element,index) => {
                // console.log("moh"+element.MName)
                MNames.innerHTML+= '<option  id="'+element.vcs_id+'"  name="'+element.vcs_id+'" value="'+element.start_date_time +  '" option="' +element.vcs_id +  '" ></option>'
            })
        }
    );


    function select(id){
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

</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
