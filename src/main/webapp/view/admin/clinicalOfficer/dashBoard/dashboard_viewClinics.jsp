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


    //update clinics

    //select clinis

    function select(id){
        // let selectClinic = new selectClinics("form");

            let clinicList=[]
            let reqData =
                {
                    clinicID: id,
                };
            console.log(reqData);
            $.post("/test_war_exploded/create-clinic-controller/select",
                reqData,
                function(data,status){
                    // alert(data)
                    console.log(data)
                    clinicList=JSON.parse(data)
                    // selectClinic.setData(clinicList);
                    document.getElementById("mainContent").innerHTML=" "
                    document.getElementById("mainContent").innerHTML+=`
                          <div class="header">
                    <div class="upper-title">SUWASEWANA </div>
                    <div class="dashboard-name">Clinical officer/Dashboard/Clinic List</div>
                            </div>
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
                                    <label> Disease</label>
                                    <input type="text" required autocomplete="off" name=" disease" id="disease" value="Covid 19" />
                                </div>
                                <div class="inputs">
                                    <label> Location</label>
                                    <input type="text"  required autocomplete="off" name=" location" id="location" value="At moh"/>
                                </div>
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
                                    <label> Data & Time</label>
                                    <input type="text"  required autocomplete="off" name="date-time" id="date-time" value="09/08/2021"/>
                                </div>
                                <div class="inputs">
                                    <label>Duration (hours)</label>
                                    <input type="text" required autocomplete="off" name="duration" id="duration" value="5 hours"/>
                                </div>
                            </div>
                            <div class="right-inputs">
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
                                <button  onclick="updateclinics()">Create Clinic</button>

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
                    `

                }
            );
            return false;

    }

    function updateclinics(){
        alert("update")
        // // alert("update")
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
        // $.post("/test_war_exploded/create-clinic-controller/updateclinic",
        //     reqData,
        //     function (data,status){
        //         // alert("wrong")
        //          alert(data)
        //     });
        //
        // return false;
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


        let Details=[];
        $.post("/test_war_exploded/create-clinic-controller/all-Clinics",
        function (data, status) {
        let rs= JSON.parse(data);
        this.Details=rs;
        let MNames=document.getElementById("AllMArea");
        MNames.innerHTML="";
        rs.map((element,index) => {
        // console.log("moh"+element.MName)
        MNames.innerHTML+= '<option  id="'+element.clinicID+'"  name="'+element.clinicID+'" value="'+element.datetime +  '" option="' +element.clinicID +  '" ></option>'
    })
    }
        );







</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
