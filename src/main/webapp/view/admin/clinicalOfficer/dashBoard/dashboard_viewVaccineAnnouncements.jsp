<%--
  Created by IntelliJ IDEA.
  User: UCSC
  Date: 10/20/2021
  Time: 2:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Suwasewana</title>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_c-dashboard-viewAnnouncements.css"/> "/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="<c:url value="/public/js/ClinicalOfficer/viewVaccineAnnouncements.js"></c:url> "></script>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
</head>
<body id="mainContent">
<c:import url="/view/admin/partials/ClinicalOfficerSideNavbar.jsp"/>
<div class="mypopup" id="popup" style="display: none;"></div>
<div class="container" >
    <!-- suwasewana header -->
    <div class="header">
        <div class="upper-title">SUWASEWANA </div>
        <div class="dashboard-name">Clinical officer/Dashboard/View announcements</div>
    </div>
    <div class="search-section">
        <div class="searchbar">
            <input type="text" id ="filter" required autocomplete="false" name="clinic-title" onkeyup="search()"/>
            <button>Search</button>
        </div>
    </div>
    <div class="announcements-container" id="announcements-container">

    </div>
</div>
<script>
    feather.replace(({width:"8px",height:"8px"}))
</script>
<script defer>
    let viewAnnouncementslist = new viewAnnouncements("announcements-container");
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    view();
    function view(){
        let announcementsArray=[]
        $.post("/test_war_exploded/clinicAnnouncementController/viewVAnnouncements",
        //     // reqData,
            function(data,status){
                announcementsArray=JSON.parse(data)
                viewAnnouncementslist.setData(announcementsArray);
                // viewAnnouncementslist.setData(announcementsArray);
                console.log(data)

            }
        );

    }

    function deleteCheckInputVsUserInput(appointmentId){
        let userInput = document.getElementById("delete_input").value;
        if(userInput === "Delete"){
            document.getElementById("deleteAuthErrorMessage").style.display = "none";
            deleteAnnouncement(appointmentId);
            // alert("okay")
        }else{
            document.getElementById("deleteAuthErrorMessage").style.display = "block";
        }
    }

    function deleteAnnouncement(clinicID){
        // console.log("deleteclinicfunction")
        $.post("/test_war_exploded/clinicAnnouncementController/deleteVA",
            {
                clinicID: clinicID
            },
            function (data, status) {
            alert(data)
                if (data.includes("success")) {
                    popup. showAnnouncementDeleteSuccessMessage({
                        status: 'success',
                        message: 'Announcement Successfully Deleted!'
                    });
                } else {
                    popup. showAnnouncementDeleteSuccessMessage({
                        status: 'fail',
                        message: 'Announcement delete Fails !',
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
