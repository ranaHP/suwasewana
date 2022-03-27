<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Suwasewana</title>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_c-dashboard-createClinics.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/_db-header.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_live-card.css"/> "/>
    <script src="<c:url value="/public/js/Admin/InputValidation.js "/>"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="<c:url value="/public/js/ClinicalOfficer/createClinic.js"/>"></script>
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
            <div class="create-clinics-title">Create Clinic Session</div>
            <div class="form-container">
                <!-- form container -->
                <div class="form">
                    <form id="loginForm" onsubmit="return Checkvalidation()" >
                        <div class="form-inputs">
                            <div class="left-inputs">
                                <div class="inputs">
                                    <label> Clinic Title</label>
                                    <input type="text" required autocomplete="off" name="clinic-title" id="clinic-title" value="Covid awareness clinic" />
                                </div>
                                <div class="inputs">
                                    <label >Disease</label> <br>
                                    <input autocomplete="off" class="SelectColordiv" id="DArea" type="text" style="outline: none;" list="AllDArea" name="AllDArea"
                                           onclick="document.getElementById('DArea').value='';"
                                           onblur="validation.SearchSelect(
                                    document.getElementById('DArea').value,
                                    'LDArea'
                                );"
                                    >
                                    <datalist id="AllDArea">
                                    </datalist>
                                    <br>
                                    <span class="error" id="LDArea" style="margin-left: 5px" ></span>
                                </div>
                                <div class="inputs">
                                    <label> Location</label>
                                    <input type="text"  required autocomplete="off" name=" location" id="location" value="At moh"/>
                                </div>

                                <div class="inputs">
                                    <label> Date</label>
                                    <input type="Date"  required autocomplete="off" name="date" id="date"/>
                                </div>
                                <div class="inputs">
                                    <label> Time</label>
                                    <input type="time" required autocomplete="off" name="time" id="time"/>
                                </div>
                                <div class="inputs">
                                    <label>Duration (hours)</label>
                                    <input type="text" required autocomplete="off" name="duration" id="duration" value="5 hours"/>
                                </div>
                            </div>
                            <div class="right-inputs">
                                <div class="inputs">
                                    <label >MOH Area</label> <br>
                                    <input autocomplete="off" class="SelectColordiv" id="MArea" type="text" style="outline: none;" list="AllMArea" name="AllMArea"
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
                                    <label> Max Patient</label>
                                    <input type="number" required autocomplete="off" name="max-patient" id="max-patient" value="50"/>
                                </div>
                                <div class="inputs">
                                    <label>Target participants </label>
                                    <input type="text" required autocomplete="off" name="patient" id="patient" value="FOr public"/>
                                </div>
                                <div class="inputs">
                                    <label> Conduct</label>
                                    <input type="text" required autocomplete="off" name="conduct" id="conduct" value="by dr. dias" />
                                </div>
                                <div class="inputs">
                                    <label>Description</label>
                                    <textarea type="text"  id="description" required autocomplete="off" name="description">Every one should come before 8a.m. to the main hall of the moh</textarea>
                                </div>


                                </div>
                            </div>
                            <!-- create clinic button -->
                            <div class="create-button">
                                <button >Create Clinic</button>

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
<script>
    feather.replace()
</script>

<script src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
<script defer>
    let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    let validation = new FormInputValidation();
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    function Checkvalidation(){
        let MOH=checkMOHid()
        if(MOH!=0){
            checkclinicregistration(event)
        }
        else {
            validation.setErrorMessageForField("Enter valid Area", 'LMArea', 0);
            document.getElementsByClassName('LMArea').value="Enter valid Area";
        }
        return false;
    }
    function checkclinicregistration(data) {
        let reqData =
            {
                disease:disease(),
                title:document.getElementById("clinic-title").value,
                location:data.target.elements.location.value,
                MOH:checkMOHid(),
                date: document.getElementById("date").value,
                time:document.getElementById("time").value,
                duration: data.target.elements.duration.value,
                maxpatient:document.getElementById("max-patient").value,
                Target: data.target.elements.patient.value,
                conduct: data.target.elements.conduct.value,
                description: data.target.elements.description.value,
            };
        console.log(reqData)
        console.log("dataaaa")
        $.post(myUrl+"/create-clinic-controller/create",
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
    function disease(){
        var MTypeObj = document.getElementById('DArea');
        var datalist = document.getElementById(MTypeObj.getAttribute("list"));
        if(datalist.options.namedItem(MTypeObj.value)){

            return (datalist.options.namedItem(MTypeObj.value).id);
        }
        else {
            return  0;
        }
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

    let dDetails=[];
    $.post(myUrl+"/disease-controller/disease",
        function (data, status) {
            console.log(data);
            let rs= JSON.parse(data);
            this.dDetails=rs;
            // console.log(data);

            let DNames=document.getElementById("AllDArea");
            DNames.innerHTML="";
            rs.map((element,index) => {
                // console.log("moh"+element.MName)
                DNames.innerHTML+= '<option  id="'+element.name+'"  name="'+element.name+'" value="' + element.name +  '" option="' + element.name +  '" ></option>'
            })
        }
    );

    // function updateclinics(){
    //     // alert("update")
    //     let reqData =
    //         {
    //             clinicID:document.getElementById("clinicID").value,
    //             disease:document.getElementById("disease").value,
    //             title:document.getElementById("clinic-title").value,
    //             location:document.getElementById("location").value,
    //             targetMOH:document.getElementById("target-MOH").value,
    //             datetime:document.getElementById("date-time").value,
    //             duration:document.getElementById("duration").value,
    //             maxpatient:document.getElementById("max-patient").value,
    //             patient:document.getElementById("patient").value,
    //             conduct:document.getElementById("conduct").value,
    //             description:document.getElementById("description").value,
    //         };
    //     console.log(reqData)
    //     $.post("/test_war_exploded/create-clinic-controller/updateclinic",
    //         reqData,
    //         function (data,status){
    //             // alert("wrong")
    //              alert(data)
    //         });
    //
    //     return false;
    // }
    //
    // function view(){
    //     let clinicList=[]
    //     let reqData =
    //         {
    //             clinicID: document.getElementById("clinicID").value,
    //         };
    //     console.log(reqData);
    //     $.post("/test_war_exploded/create-clinic-controller/select",
    //         reqData,
    //         function(data,status){
    //             alert(data)
    //             clinicList=JSON.parse(data)
    //             selectClinic.setData(clinicList);
    //
    //         }
    //     );
    //     return false;
    // }


</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>"></script>

</body>
</html>