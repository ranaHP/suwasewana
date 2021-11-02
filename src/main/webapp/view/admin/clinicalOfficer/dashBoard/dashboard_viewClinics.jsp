<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Suwasewana</title>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_c-dashboard-viewClinics.css"/> "/>
<%--    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_c-dashboard-createClinics.css"/> "/>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="<c:url value="/public/js/ClinicalOfficer/viewClinics.js"></c:url> "></script>
    <script src="<c:url value="/public/js/Admin/InputValidation.js "/>"></script>
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
            <input type="text" id ="filter" placeholder="Search clinic by name" required autocomplete="off" name="clinic-title" onkeyup="search()" />
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
    let validation = new FormInputValidation();
    let clinicList1 = new clinicList("card-containor");

    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    view();
    function view(){

        let clinicListArray=[]
        $.post("/test_war_exploded/create-clinic-controller/view",
            // reqData,
            function(data,status){
                clinicListArray=JSON.parse(data)
                // console.log(clinicListArray)
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

    function updateclinics(){
        // alert("update")
        let reqData =
            {
                clinicID:document.getElementById("clinicID").value,
                disease:document.getElementById("disease").value,
                title:document.getElementById("clinic-title").value,
                location:document.getElementById("location").value,
                targetMOH:document.getElementById("target-MOH").value,
                datetime:document.getElementById("date-time").value,
                duration:document.getElementById("duration").value,
                maxpatient:document.getElementById("max-patient").value,
                patient:document.getElementById("patient").value,
                conduct:document.getElementById("conduct").value,
                description:document.getElementById("description").value,
            };
        console.log(reqData)
        $.post("/test_war_exploded/create-clinic-controller/updateclinic",
            reqData,
            function (data,status){
                // alert("wrong")
                //  alert(data)
            });

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
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
