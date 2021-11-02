<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Suwasewana</title>--%>
<%--    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_c-dashboard-createClinics.css"/> "/>--%>
<%--    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/_db-header.css"/> "/>--%>
<%--    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>--%>
<%--    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_live-card.css"/> "/>--%>
<%--    <script src="<c:url value="/public/js/Admin/InputValidation.js "/>"></script>--%>
<%--    <script src="https://unpkg.com/feather-icons"></script>--%>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
<%--    <script src="<c:url value="/public/js/ClinicalOfficer/createClinic.js"/>"></script>--%>
<%--    &lt;%&ndash;    popup js&ndash;%&gt;--%>
<%--    <script src="<c:url value="/public/js/popup.js"></c:url> "></script>--%>

<%--    &lt;%&ndash;    for side navbar style&ndash;%&gt;--%>
<%--    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>--%>
<%--    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>--%>

<%--    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>--%>
<%--</head>--%>
<%--<body>--%>
<%--<c:import url="/view/admin/partials/ClinicalOfficerSideNavbar.jsp"/>--%>
<%--<div class="mypopup" id="popup" style="display: none;"></div>--%>
<%--&lt;%&ndash;<!-- container without side nav bar -->&ndash;%&gt;--%>
<%--&lt;%&ndash;<div id="mainContent" class="container ">&ndash;%&gt;--%>

<%--&lt;%&ndash;    &lt;%&ndash;    <div class="main-content">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;    <!-- suwasewana title -->&ndash;%&gt;--%>
<%--&lt;%&ndash;    <div class="header">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="upper-title">SUWASEWANA </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="dashboard-name">Clinic/Dashboard/Create clinics</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <!-- content divide to left and right -->&ndash;%&gt;--%>
<%--&lt;%&ndash;    <div class="content" id="content">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="left">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <div class="create-clinics-title">Create Clinic Session</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <div class="form-container">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <!-- form container -->&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="form">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <form id="loginForm" onsubmit="return Checkvalidation()" >&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="form-inputs">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="left-inputs">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="inputs">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <label> Clinic Title</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <input type="text" required autocomplete="off" name="clinic-title" id="clinic-title" value="Covid awareness clinic" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="inputs">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <label> Disease</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <input type="text" required autocomplete="off" name=" disease" id="disease" value="Covid 19" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="inputs">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <label> Location</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <input type="text"  required autocomplete="off" name=" location" id="location" value="At moh"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="inputs">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <label >MOH Area</label> <br>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <input autocomplete="off" class="SelectColordiv" id="MArea" type="text" style="outline: none;" list="AllMArea" name="AllMArea"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                           onclick="document.getElementById('MArea').value='';"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                           onblur="validation.SearchSelect(&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    document.getElementById('MArea').value,&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    'LMArea'&ndash;%&gt;--%>
<%--&lt;%&ndash;                                );"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    >&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <datalist id="AllMArea">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </datalist>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <br>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <span class="error" id="LMArea" style="margin-left: 5px" ></span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="inputs">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <label> Data & Time</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <input type="text"  required autocomplete="off" name="date-time" id="date-time" value="09/08/2021"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="inputs">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <label>Duration (hours)</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <input type="text" required autocomplete="off" name="duration" id="duration" value="5 hours"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="right-inputs">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="inputs">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <label> Max Patient</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <input type="number" required autocomplete="off" name="max-patient" id="max-patient" value="50"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="inputs">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <label>Target participants </label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <input type="text" required autocomplete="off" name="patient" id="patient" value="FOr public"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="inputs">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <label> Conduct</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <input type="text" required autocomplete="off" name="conduct" id="conduct" value="by dr. dias" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="inputs">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <label>Description</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <textarea type="text"  id="description" required autocomplete="off" name="description">Every one should come before 8a.m. to the main hall of the moh</textarea>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>


<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <!-- create clinic button -->&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="create-button">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <button >Create Clinic</button>&ndash;%&gt;--%>

<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;                        </form>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;            <!-- live card section -->&ndash;%&gt;--%>
<%--&lt;%&ndash;            <div class="right">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="card-container">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div class="live-card-title"><button class="live"  onclick="card()">Click here to see Clinic Card</button></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div class="live-card-border">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="live-card" id="live-card">&ndash;%&gt;--%>

<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--<script>--%>
<%--    feather.replace()--%>
<%--</script>--%>

<%--<script src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>--%>
<%--<script defer>--%>
<%--    let a=document.getElementById("clinic-title").value;--%>
<%--    alert(a)--%>
<%--    // let validation = new FormInputValidation();--%>
<%--    // let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");--%>
<%--    // function Checkvalidation(){--%>
<%--    //     let MOH=checkMOHid()--%>
<%--    //     if(MOH!=0){--%>
<%--    //         checkclinicregistration(event)--%>
<%--    //     }--%>
<%--    //     else {--%>
<%--    //         validation.setErrorMessageForField("Enter valid Area", 'LMArea', 0);--%>
<%--    //         document.getElementsByClassName('LMArea').value="Enter valid Area";--%>
<%--    //     }--%>
<%--    //     return false;--%>
<%--    // }--%>
<%--    // function checkclinicregistration(data) {--%>
<%--    //     let reqData =--%>
<%--    //         {--%>
<%--    //             disease:data.target.elements.disease.value,--%>
<%--    //             title:document.getElementById("clinic-title").value,--%>
<%--    //             location:data.target.elements.location.value,--%>
<%--    //             MOH:checkMOHid(),--%>
<%--    //             datetime: document.getElementById("date-time").value,--%>
<%--    //             duration: data.target.elements.duration.value,--%>
<%--    //             maxpatient:document.getElementById("max-patient").value,--%>
<%--    //             Target: data.target.elements.patient.value,--%>
<%--    //             conduct: data.target.elements.conduct.value,--%>
<%--    //             description: data.target.elements.description.value,--%>
<%--    //         };--%>
<%--    //     console.log(reqData)--%>
<%--    //     $.post("/test_war_exploded/create-clinic-controller/create",--%>
<%--    //         reqData,--%>
<%--    //         function(data,status){--%>
<%--    //             if(data.includes("sucsess")){--%>
<%--    //                 popup.showCreateClinicSuccessMessage({--%>
<%--    //                     status: 'success',--%>
<%--    //                     message: 'Successfully Created!'--%>
<%--    //                 })--%>
<%--    //             } else{--%>
<%--    //                 popup.showCreateClinicSuccessMessage({--%>
<%--    //                     status: 'fail',--%>
<%--    //                     message: 'Failed to create !',--%>
<%--    //                     data: data--%>
<%--    //                 });--%>
<%--    //             }--%>
<%--    //         }--%>
<%--    //     );--%>
<%--    //     return false;--%>
<%--    // }--%>
<%--    //--%>
<%--    // function checkMOHid(){--%>
<%--    //     var MTypeObj = document.getElementById('MArea');--%>
<%--    //     var datalist = document.getElementById(MTypeObj.getAttribute("list"));--%>
<%--    //     if(datalist.options.namedItem(MTypeObj.value)){--%>
<%--    //--%>
<%--    //         return (datalist.options.namedItem(MTypeObj.value).id);--%>
<%--    //     }--%>
<%--    //     else {--%>
<%--    //         return  0;--%>
<%--    //     }--%>
<%--    // }--%>
<%--    //--%>
<%--    // let mohDetails=[];--%>
<%--    // $.post("/test_war_exploded/user-complain-controller/moh",--%>
<%--    //     function (data, status) {--%>
<%--    //         // console.log(data);--%>
<%--    //         let rs= JSON.parse(data);--%>
<%--    //         this.mohDetails=rs;--%>
<%--    //         // console.log(data);--%>
<%--    //--%>
<%--    //         let MNames=document.getElementById("AllMArea");--%>
<%--    //         MNames.innerHTML="";--%>
<%--    //         rs.map((element,index) => {--%>
<%--    //             // console.log("moh"+element.MName)--%>
<%--    //             MNames.innerHTML+= '<option  id="'+element.MId+'"  name="'+element.MName+'" value="' + element.MName +  '" option="' + element.MName +  '" ></option>'--%>
<%--    //         })--%>
<%--    //     }--%>
<%--    // );--%>

<%--    // function updateclinics(){--%>
<%--    //     // alert("update")--%>
<%--    //     let reqData =--%>
<%--    //         {--%>
<%--    //             clinicID:document.getElementById("clinicID").value,--%>
<%--    //             disease:document.getElementById("disease").value,--%>
<%--    //             title:document.getElementById("clinic-title").value,--%>
<%--    //             location:document.getElementById("location").value,--%>
<%--    //             targetMOH:document.getElementById("target-MOH").value,--%>
<%--    //             datetime:document.getElementById("date-time").value,--%>
<%--    //             duration:document.getElementById("duration").value,--%>
<%--    //             maxpatient:document.getElementById("max-patient").value,--%>
<%--    //             patient:document.getElementById("patient").value,--%>
<%--    //             conduct:document.getElementById("conduct").value,--%>
<%--    //             description:document.getElementById("description").value,--%>
<%--    //         };--%>
<%--    //     console.log(reqData)--%>
<%--    //     $.post("/test_war_exploded/create-clinic-controller/updateclinic",--%>
<%--    //         reqData,--%>
<%--    //         function (data,status){--%>
<%--    //             // alert("wrong")--%>
<%--    //              alert(data)--%>
<%--    //         });--%>
<%--    //--%>
<%--    //     return false;--%>
<%--    // }--%>
<%--    //--%>
<%--    function view(){--%>
<%--        let clinicList=[]--%>
<%--        let reqData =--%>
<%--            {--%>
<%--                clinicID: document.getElementById("clinicID").value,--%>
<%--            };--%>
<%--        console.log(reqData);--%>
<%--        $.post("/test_war_exploded/create-clinic-controller/select",--%>
<%--            reqData,--%>
<%--            function(data,status){--%>
<%--                alert(data)--%>
<%--                clinicList=JSON.parse(data)--%>
<%--                selectClinic.setData(clinicList);--%>

<%--            }--%>
<%--        );--%>
<%--        return false;--%>
<%--    }--%>

<%--</script>--%>

<%--</body>--%>
<%--</html>--%>