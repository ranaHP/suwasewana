<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create clinics</title>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_c-dashboard-createClinics.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_db-header.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_live-card.css"/> "/>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="<c:url value="/public/js/inputValidation.js"/>"></script>
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
        <div class="dashboard-name">Clinic/Dashboard/ClinicList</div>
    </div>
    <!-- content divide to left and right -->
    <div class="content" id="content">
        <div class="left">
            <div class="create-clinics-title">Create Clinic Session</div>
            <div class="form-container">
                <!-- form container -->
                <div class="form">
                    <form id="loginForm" onsubmit="return checkclinicregistration(event)">
                        <div class="form-inputs">
                            <div class="left-inputs">
                                <div class="inputs">
                                    <label> Disease</label>
                                    <input type="text" value="corona" required autocomplete="off" name=" disease" id="disease" onkeyup="card()"/>
                                </div>
                                <div class="inputs">
                                    <label> Target participants</label>
                                    <input type="text" value="For covid patients" required autocomplete="off" name="clinic-title" id="clinic-title" onkeyup="card()"/>
                                </div>
                                <div class="inputs">
                                    <label> Location</label>
                                    <input type="text"  value="at moh" required autocomplete="off" name=" location" id="location" onkeyup="card()"/>
                                </div>
                                <div class="inputs">
                                    <label>Target MOH</label>
                                    <input type="text" value="galle" required autocomplete="off" name="target-MOH" id="target-MOH" onkeyup="card()"/>
                                </div>
                                <div class="inputs">
                                    <label> Data & Time</label>
                                    <input type="text"  value="4" required autocomplete="off" name="date-time" id="date-time" onkeyup="card()"/>
                                </div>
                                <div class="inputs">
                                    <label>Duration (hours)</label>
                                    <input type="text"value="6" required autocomplete="off" name="duration" id="duration" onkeyup="card()"/>
                                </div>
                            </div>
                            <div class="right-inputs">
                                <div class="inputs">
                                    <label> Max Patient</label>
                                    <input type="number" value="5" required autocomplete="off" name="max-patient" id="max-patient" onkeyup="card()"/>
                                </div>
                                <div class="inputs">
                                    <label> Conduct</label>
                                    <input type="text" value="doctor" required autocomplete="off" name="conduct" id="conduct" onkeyup="card()"/>
                                </div>
                                <div class="inputs">
                                    <label>Description</label>
                                    <input type="text" value="on or before 4" id="description" required autocomplete="off" name="description" onkeyup="card()"/>
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
            <div class="card-container" id="card-container">
                <div class="live-card-title">Live Clinic Card</div>
                <div class="live-card-border">
                    <div class="live-card" id="live-card"></div>
                </div>
            </div>
        </div>
    </div>
    <%--    </div>--%>
</div>
<script>
    feather.replace()
</script>
<script src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
<script defer>
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    function checkclinicregistration(data) {
        let reqData =
            {
                disease:data.target.elements.disease.value,
                title:document.getElementById("clinic-title").value,
                location:data.target.elements.location.value,
                MOH:document.getElementById("target-MOH").value,
                datetime: document.getElementById("date-time").value,
                duration: data.target.elements.duration.value,
                maxpatient:document.getElementById("max-patient").value,
                conduct: data.target.elements.conduct.value,
                description: data.target.elements.description.value,
            };
        console.log(reqData)
        $.post("/test_war_exploded/create-clinic-controller/create",
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
    function card()
    {
        <%--        var name=document.getElementById("disease").value;--%>
        <%--        var date=document.getElementById("date-time").value;--%>
        <%--        var des=document.getElementById("description").value;--%>
        <%--        var location=document.getElementById("location").value;--%>
        <%--        var conduct=document.getElementById("conduct").value;--%>
        <%--        var max=document.getElementById("max-patient").value;--%>
        <%--        var MOH=document.getElementById("target-MOH").value;--%>
        <%--        console.log(name)--%>
        <%--        let clinic = document.getElementById('live-card')--%>
        <%--        clinic.innerHTML =`--%>
        <%--                    <div class="clinic-title"  id="clinic-title">${name} Awareness Session</div>--%>
        <%--                    <div class="clinic-date">${date}</div>--%>
        <%--                    <div class="clinic-description">${des}</div>--%>
        <%--                    <div class="clinic-details">--%>
        <%--                        <div class="location" id="item1"><span><span class="locationimg"><object data="../icons/map-pin.svg" width="8" height="8"> </object></span>${location}</span> home</div>--%>
        <%--                        <div class="conduct"  id="item2"><span><span><object data="../icons/user.svg" width="8" height="8"> </object></span>Conduct :</span> ${conduct}</div>--%>
        <%--                        <div class="max-limit"  id="item3"><span><span><object data="../icons/user-check.svg" width="8" height="8"> </object></span>Max participant limit :</span>${max}</div>--%>
        <%--                        <div class="moh-area"  id="4"><span><span><object data="../icons/map-pin.svg" width="8" height="8"> </object></span>MOH Area :</span>${MOH}</div>--%>
        <%--                    </div>--%>
        <%--                    <div class="down-box">--%>
        <%--                        <div class="current-participant-count">--%>
        <%--                            <div class="current-participant-img"><object data="../icons/users.svg" width="18" height="18"> </object></div>--%>
        <%--                            <div class="count-participants">120, 221</div>--%>
        <%--                        </div>--%>
        <%--                        <div class="buttons">--%>
        <%--                            <div class="delete-button">Delete</div>--%>
        <%--                            <div class="edit-button">Edit</div>--%>
        <%--                        </div>--%>
        <%--                    </div>--%>
        <%--    <h>{%=name%} kk<h>--%>
        <%--`--%>
        console.log("live card");
    }
</script>
</body>
</html>