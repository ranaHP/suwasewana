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
    <script src="/public/js/ClinicalOfficer/viewClinics.js"></script>
</head>
<body onload="view()">
<c:import url="/view/admin/partials/ClinicalOfficerSideNavbar.jsp"/>
<div class="containor" id="mainContent">
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

    </div>
</div>
<script>
    feather.replace()
</script>

<script defer>
    function view(){
        let clinicList=[]
        $.post("/test_war_exploded/create-clinic-controller/view",
            // reqData,
            function(data,status){
               // clinicList=JSON.parse(data)
                alert(data)
                let option = document.createElement("div")
                option.classList.add("live-card")
                option.classList.add("live-card")
                option.innerHTML+=`
                       <h>view clinics</h>
                `
                // console.log(option)
                document.getElementById('card-containor').appendChild(option)
            }
        );
    }

    <%--diseases=["Dengue","Corona","Maleria","Barava","Covid","Eye disease","Maleria","Barava","Covid","Eye disease","Maleria"];--%>
    <%--diseases.map((name=>{--%>
    //     let option = document.createElement("div")
    //     option.classList.add("live-card")
    <%--    option.innerHTML+=`--%>
    //                 <div class="clinic-title"  id="clinic-title">Dengue Awareness Session</div>
    //                 <div class="clinic-date">2022/03/08</div>
    //                 <div class="clinic-description">he process of writing a job description requires
    //                     having a clear understanding of the job’s duties
    //                     and responsibilities. The job posting should also
    //                     include a concise picture of the skills required for
    //                     the position to attract qualified job candidates.
    //                     Organize the job</div>
    //                 <div class="clinic-details">
    //                     <div class="location" id="item1"><span><span class="locationimg"><object data="../icons/map-pin.svg" > </object></span>Location :</span> home</div>
    //                     <div class="conduct"  id="item2"><span><span><object data="../icons/user.svg" width="8" height="8"> </object></span>Conduct :</span> Dr Jorge</div>
    //                     <div class="max-limit"  id="item3"><span><span><object data="../icons/user-check.svg" width="8" height="8"> </object></span>Max participant limit :</span>1900</div>
    //                     <div class="moh-area"  id="4"><span><span><object data="../icons/map-pin.svg" width="8" height="8"> </object></span>MOH Area :</span></div>
    //                     <div class="target-participants"  id="item5"><span><span><object data="../icons/users.svg" width="8" height="8"> </object></span>Target participant :</span> covid patients</div>
    //                 </div>
    //                 <div class="down-box">
    //                     <div class="current-participant-count">
    //                         <div class="current-participant-img"><object data="../icons/users.svg" width="18" height="18"> </object></div>
    //                         <div class="count-participants">120, 221</div>
    //                     </div>
    //                     <div class="buttons">
    //                         <div class="delete-button">Delete</div>
    //                         <div class="edit-button">Edit</div>
    //                     </div>
    //                 </div>
    <%--        `--%>
    <%--    document.getElementById('card-containor').appendChild(option)--%>

    <%--}))--%>
    <%--console.log(document.getElementById('card-containor'))--%>
</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
