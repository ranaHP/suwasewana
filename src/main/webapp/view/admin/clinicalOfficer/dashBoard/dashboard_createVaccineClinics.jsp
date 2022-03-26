<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Suwasewana</title>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_c-dashboard-createClinics1.css"/>">
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/_db-header.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <script src="<c:url value="/public/js/Admin/InputValidation.js "/>"></script>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_live-card.css"/> "/>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="<c:url value="/public/js/ClinicalOfficer/createVaccineClinic.js"/>"></script>
    <%--    popup js--%>
    <script src="<c:url value="/public/js/popup.js"></c:url> "></script>

    <%--    for side navbar style--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
</head>
<body>
<c:import url="/view/admin/partials/ClinicalOfficerSideNavbar.jsp"/>
<div class="mypopup" id="popup" style="display: none;"></div>
<%--<!-- container without side nav bar -->--%>
<div id="mainContent" class="container ">

    <%--    <div class="main-content">--%>
    <!-- suwasewana title -->
    <div class="header">
        <div class="upper-title">SUWASEWANA </div>
        <div class="dashboard-name">Clinic/Dashboard/Create clinics</div>
    </div>
    <!-- content divide to left and right -->
    <div class="content" id="content">
        <div class="left">
            <div class="create-clinics-title">Vaccine Clinic Session</div>
            <div class="form-container">
                <!-- form container -->
                <div class="form">
                    <form id="loginForm" onsubmit="return checkvalidation()" >
                        <div class="form-inputs">
                            <div class="left-inputs">
                                <div class="inputs">
                                    <label> Clinic Title</label>
                                    <input type="text" required autocomplete="off" name="clinic-title" id="clinic-title" value="for covid vaccination" />
                                </div>
                                <div class="inputs">
                                    <label> Location</label>
                                    <input type="text"  required autocomplete="off" name=" location" id="location" value="at moh"/>
                                </div>
                                <div class="inputs">
                                    <label >MOH Area</label> <br>
                                    <input class="SelectColordiv" id="MArea" type="text" style="outline: none;" list="AllMArea" name="AllMArea"
                                           onclick="document.getElementById('MArea').value='';"
                                           onblur="validation.SearchSelect(
                                    document.getElementById('MArea').value,
                                    'LMArea'
                                );"
                                    >
                                    <datalist id="AllMArea">
                                    </datalist>
                                    <br>
                                    <span class="error" id="LMArea" style="margin-left: 5px" ></span>
                                </div>
                                <div class="inputs">
                                    <label> Data & Time</label>
                                    <input type="datetime-local"  required autocomplete="off" name="date-time" id="date-time" value="09/09/2021"/>
                                </div>
                                <div class="inputs">
                                    <label>Duration (hours)</label>
                                    <input type="text" required autocomplete="off" name="duration" id="duration" value="4 hours"/>
                                </div>
                            </div>
                            <div class="right-inputs">
                                <div class="inputs">
                                    <label> Max Patient</label>
                                    <input type="number" required autocomplete="off" name="max-patient" id="max-patient" value="40"/>
                                </div>
<%--                                <div class="inputs">--%>
<%--                                    <label>Target participants </label>--%>
<%--                                    <input type="text" required autocomplete="off" name="patient" id="patient" value="for public"/>--%>
<%--                                </div>--%>
                                <div class="inputs">
                                    <label> Dose count</label>
                                    <input type="number" required autocomplete="off" name=" Dose-count" id="Dose-count" value="4"/>
                                </div>
                                <div class="inputs">
                                    <label >Vaccine name</label> <br>
                                    <input autocomplete="off" style="padding: 5px;" list="AllVaccineslist" name="AllVaccineslist" type="text" id="Search_V_input" placeholder="Search by vaccine name"
                                           onclick="document.getElementById('Search_V_input').value='';  ";
                                    >
                                    <datalist id="AllVaccineslist">

                                    </datalist>
                                    <br>
                                    <span class="error" id="vaccine" style="margin-left: 5px" ></span>
                                </div>
                                <div class="inputs">
                                    <label> Age limit</label>
                                    <input type="number" required autocomplete="off" name="Age-limit" id="LAge-limit" value="89"/>
                                </div>
                                <div class="inputs">
                                    <label> Age limit</label>
                                    <input type="number" required autocomplete="off" name="Age-limit" id="UAge-limit" value="100"/>
                                </div>
<%--                                <div class="inputs">--%>
<%--                                    <label>Description</label>--%>
<%--                                    <textarea type="text"  id="description" required autocomplete="off" name="description">every one should come at time</textarea>--%>
<%--                                </div>--%>

                            </div>
                        </div>
                        <!-- create clinic button -->
                        <div class="create-button">
                            <button>Create Clinic</button>

                        </div>


                    </form>
                </div>
            </div>

        </div>

        <!-- live card section -->
        <div class="right">
            <div class="card-container">
                <div class="live-card-title"><button class="live"  onclick="card()">Click here to see Clinic Card</button></div>
                <div class="live-card-border">
                    <div class="live-card" id="live-card">

                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</div>
</div>
</div>
<script defer>

    let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    let validation = new FormInputValidation();
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");

    feather.replace()

    function checkMOHid(){
        var MTypeObj = document.getElementById('MArea');
        var datalist = document.getElementById(MTypeObj.getAttribute("list"));
        if(datalist.options.namedItem(MTypeObj.value)){

            return (datalist.options.namedItem(MTypeObj.value).id);
        }
        else {
            return  0;
        }
    }

    function checkVaccineid(){
        var MTypeObj = document.getElementById('Search_V_input');
        var datalist = document.getElementById(MTypeObj.getAttribute("list"));
        if(datalist.options.namedItem(MTypeObj.value)){
            // alert(datalist.options.namedItem(MTypeObj.value).id)
            return (datalist.options.namedItem(MTypeObj.value).id);
        }
        else {
            return  0;
        }
    }
     function checkvalidation(){
         let mohid=checkMOHid();
         let vaccineid=checkVaccineid();
         if((mohid!=0)&&(vaccineid!=0)){
             // alert("okay")
             vaccineClinic()
         }else {
             // alert("wrong")
             if(mohid==0){
                 validation.setErrorMessageForField("Enter valid Area", 'LMArea', 0);
                 document.getElementsByClassName('LMArea').value="Enter valid Area";
             }
             if(vaccineid==0){
                 validation.setErrorMessageForField("Enter valid vaccine", 'vaccine', 0);
                 document.getElementsByClassName('vaccine').value="Enter valid Area";
             }


         }
         return false;
     }
     function vaccineClinic(){
        let timeslot=document.getElementById("date-time").value;
        console.log(timeslot)
         let timeN=timeslot.split("T")[1]
        let reqData = {
            clinictitle: document.getElementById("clinic-title").value,
            Dosecount: document.getElementById("Dose-count").value,
            location: document.getElementById("location").value,
            MArea:checkMOHid(),
            datetime: document.getElementById("date-time").value,
            duration: document.getElementById("duration").value,
            maxpatient: document.getElementById("max-patient").value,
            vaccine: checkVaccineid(),
            LAgelimit: document.getElementById("LAge-limit").value,
            UAgelimit: document.getElementById("UAge-limit").value,
            timeN:timeN
        };
         $.post(myUrl+"/create-clinic-controller/vaccineCLinic",
             reqData,
             function(data,status){
                 if(data.includes("sucsess")){
                     popup.showCreateClinicSuccessMessage({
                         status: 'success',
                         message: 'Successfully Created!'
                     })
                 } else{
                     popup.showCreateClinicSuccessMessage({
                         status: 'fail',
                         message: 'Failed to create !',
                         data: data
                     });
                 }
             }
         );
         return false;

     }

</script>

<script defer>


    let r;
    LoadVaccine();
    function LoadVaccine(){
        // alert("hi");
        $.post(myUrl+"/admin-register-controller/All_vaccine_details/",

            function (data, status) {
                r= JSON.parse(data);
                let vaccineType=document.getElementById("AllVaccineslist");
                vaccineType.innerHTML='';
                r.map((element) => {
                    vaccineType.innerHTML+= '<option  id="'+element.ID+'" name="'+element.Name+'" value="' + element.Name +  '" option="' + element.Name +  '"></option>'
                })
            }
        );
    }

    let mohDetails=[];
    $.post(myUrl+"/user-complain-controller/moh",
        function (data, status) {
            // console.log(data);
            let rs= JSON.parse(data);
            this.mohDetails=rs;
            // console.log(data);

            let MNames=document.getElementById("AllMArea");
            MNames.innerHTML="";
            rs.map((element,index) => {
                // console.log("moh"+element.MName)
                MNames.innerHTML+= '<option  id="'+element.MId+'"  name="'+element.MName+'" value="' + element.MName +  '" option="' + element.MName +  '" ></option>'
            })
        }
    );
</script>

<script src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>