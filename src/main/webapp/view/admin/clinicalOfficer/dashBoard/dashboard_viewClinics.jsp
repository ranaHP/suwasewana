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
    <script src="<c:url value="/public/js/ClinicalOfficer/viewClinics.js"></c:url> "></script>
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
    <div class="cardselect">
        <div class="searchbar">
            <input type="text" id ="filter" required autocomplete="off" name="clinic-title" onkeyup="search()" />
            <button>Search</button>
        </div>
<%--        <div class="results">--%>
<%--            <div class="value" id="value"></div>--%>
<%--            <div class="Results">: Results <i data-feather="layers" width="15px" height="12px"></i></div>--%>
<%--        </div>--%>
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
        $.post("/test_war_exploded/create-clinic-controller/view",
            // reqData,
            function(data,status){
                clinicListArray=JSON.parse(data)
                clinicList1.setData(clinicListArray);

            }
        );
    }
    function deleteCheckInputVsUserInput(appointmentId){
        let userInput = document.getElementById("delete_input").value;
        if(userInput === "Delete"){
            document.getElementById("deleteAuthErrorMessage").style.display = "none";
            deleteClinics(appointmentId);
            // alert("okay")
        }else{
            document.getElementById("deleteAuthErrorMessage").style.display = "block";
        }
    }

    function deleteClinics(clinicID){
        // console.log("deleteclinicfunction")
        $.post("/test_war_exploded/create-clinic-controller/delete",
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

</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
