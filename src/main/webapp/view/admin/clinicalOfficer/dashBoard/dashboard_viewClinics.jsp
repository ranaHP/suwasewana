<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/view_PHI.css"/> "/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="<c:url value="/public/js/ClinicalOfficer/viewClinics.js"></c:url> "></script
<%--    <script src="<c:url value="/public/js/appointment.js"/>"></script>--%>
</head>
<body>
<c:import url="/view/admin/partials/ClinicalOfficerSideNavbar.jsp"/>
<div class="containor container" id="mainContent">
    <div class="header">
        <div class="upper-title">SUWASEWANA </div>
        <div class="dashboard-name">Clinic/Dashboard/ClnicList</div>
    </div>
<%--     filter section --%>
    <div class="cardselect">
        <div class="searchbar">
            <input type="text" id ="filter" required autocomplete="false" name="clinic-title" onkeyup="search()" />
            <button>Search</button>
        </div>
        <div class="results">
            <div class="value" id="value"></div>
            <div class="Results">: Results <i data-feather="layers" width="15px" height="12px"></i></div>
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
    view();
    function view(){
        // alert("view")
        let clinicListArray=[]
        $.post("/test_war_exploded/create-clinic-controller/view",
            // reqData,
            function(data,status){
                clinicListArray=JSON.parse(data)
                clinicList1.setData(clinicListArray);
                // alert(data)
            }
        );
    }
</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
