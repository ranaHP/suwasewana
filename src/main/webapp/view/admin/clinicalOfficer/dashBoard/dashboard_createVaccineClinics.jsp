<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Suwasewana</title>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_c-dashboard-createClinics.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/_db-header.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
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
                    <form id="loginForm" onsubmit="return checkclinicregistration(event)" >
                        <div class="form-inputs">
                            <div class="left-inputs">
                                <div class="inputs">
                                    <label> Clinic Title</label>
                                    <input type="text" required autocomplete="off" name="clinic-title" id="clinic-title" />
                                </div>
                                <div class="inputs">
                                    <label> Dose count</label>
                                    <input type="number" required autocomplete="off" name=" Dose-count" id="Dose-count" />
                                </div>
                                <div class="inputs">
                                    <label> Location</label>
                                    <input type="text"  required autocomplete="off" name=" location" id="location"/>
                                </div>
                                <div class="inputs">
                                    <div class="multirow_right" id="addcityDiv">
                                        <label >MOH Area</label> <br>
                                        <input class="SelectColordiv" id="MArea" type="text" style="outline: none;" list="AllMArea" autocomplete="off" name="AllMArea"
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
                                </div>
                                <div class="inputs">
                                    <label> Data & Time</label>
                                    <input type="text"  required autocomplete="off" name="date-time" id="date-time"/>
                                </div>
                                <div class="inputs">
                                    <label>Duration (hours)</label>
                                    <input type="text" required autocomplete="off" name="duration" id="duration"/>
                                </div>
                            </div>
                            <div class="right-inputs">
                                <div class="inputs">
                                    <label> Max Patient</label>
                                    <input type="number" required autocomplete="off" name="max-patient" id="max-patient"/>
                                </div>
                                <div class="inputs">
                                    <label>Target participants </label>
                                    <input type="text" required autocomplete="off" name="patient" id="patient"/>
                                </div>
                                <div class="inputs">
                                    <label> Age limit</label>
                                    <input type="text" required autocomplete="off" name="Age-limit" id="Age-limit" />
                                </div>
                                <div class="inputs">
                                    <label>Description</label>
                                    <textarea type="text"  id="description" required autocomplete="off" name="description"></textarea>
                                </div>


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
<script>
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
    var loadFile = function (event, imgContainerId) {
        var image = document.getElementById(imgContainerId);
        image.src = URL.createObjectURL(event.target.files[0]);
    };
</script>

<script defer>
    let mohDetails=[];
    $.post("/test_war_exploded/user-complain-controller/moh",
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