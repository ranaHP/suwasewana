<%--
  Created by IntelliJ IDEA.
  User: hansana
  Date: 10/14/2021
  Time: 7:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="<c:url value="/public/js/inputValidation.js"/>"></script>
    <title> User Home Suwasewana </title>
    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/>"/>

    <!-- for style sheet link  -->
    <link href="<c:url value="/public/css/user/_dashboard-appointment.css"/>" rel="stylesheet"/>
    <!-- for commen style  sheet link  -->
    <link href="<c:url value="/public/css/user/_commen.css"/>" rel="stylesheet"/>

    <!-- for feather icon -->
    <script src="https://unpkg.com/feather-icons"></script>

    <!-- location js -->
    <script src="<c:url value="/public/js/locationSelectGenarator.js"/>"></script>

    <!-- moh list  -->
    <script src="<c:url value="/public/js/MOHSelectGenarator.js"/>"></script>

    <%--    for popup style--%>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <%--    for popup script--%>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
    <script src="<c:url value="/public/js/appointment.js"/>"></script>
    <script src="<c:url value="/public/js/navbar.js"/>"></script>
    <script src="<c:url value="/public/js/loginLogout.js"/>"></script>

    <title>Registration - Suwasewana</title>
</head>
<body>
<!-- main container -->
<div class="container"
     style="display: flex;flex-direction: column; justify-content: space-between;min-height: 100vh;">
    <!-- hero banner -->
    <section class="hero-banner-main-header-container">
        <div class="mypopup" id="popup" style="display: none;"></div>
        <!-- for header -->
        <div class="user-main-header-container">
            <div class="main-header">
                <div class="logo">
                    <img src="<c:url value="/public/images/logo.png "/>" alt="logo" width="100%"/>
                </div>
                <div class="navbar-container">
                    <ul class="navbar">
                        <script> let navs =  new Navbar(); navs.showHeaderNavItems("navbar"); </script>
                    </ul>
                </div>
                <div class="login-register-container">
                    <div class="language">
                        <span> සිංහල </span>
                        <img src="<c:url value="/public/images/sri-lanka.png "/>" alt="sri lanakan flag" width="100%">

                    </div>
                    <script>
                        let loginRegsiter = new LoginLogout(); loginRegsiter.showLoginLogoutItems("login-register-container")
                    </script>
                </div>
            </div>
        </div>
        <!-- register form -->
    </section>
    <!-- this for latest announcements -->

    <section>
        <div class="dashboard-container">
            <div class="left-dashboard">
                <div class="dashboard-profile-details">
                    <img src="<c:url value="/public/images/avatar.png"/>" width="90px"/>
                    <div class="profile-name">
                        Hansana Ranaweera
                    </div>
                    <div class="profile-location">
                        Akuressa
                    </div>
                    <div class="moh-area">
                        Matara MOH
                    </div>
                </div>
                <div class="dashboard-icon-set">

                    <div class="dash-tab">
                        <div class="dash-icon" onclick="dashboard()">

                            <img src="<c:url value="/public/images/icons/grid.svg"/>" width="20px" />
                            <!-- <object data="images/icons/grid.svg" width="20px" height="20px" style="color: brown;"> </object> -->
                        </div>
                        <div class="dash-title">
                            Dashboard
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="Diseases()">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Diseases
                        </div>
                    </div>
                    <div class="dash-tab" >
                        <div class="dash-icon" onclick="Announcement()">
                            <img src="<c:url value="/public/images/icons/volume-2.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Announcement
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="Clinic()">
                            <img src="<c:url value="/public/images/icons/layers.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Clinic
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="Complainss()">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Complain
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="Appoiment()">
                            <img src="<c:url value="/public/images/icons/calendar.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Appoiment
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="vaccine()">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
                        </div>

                        <div class="dash-title">
                            vaccine
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="vaccinetypesView()">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
                        </div>

                        <div class="dash-title">
                            vaccine types view
                        </div>
                    </div>

                </div>
            </div>
            <div class="right-dashboard">
                <div class="dashboard-page-title">
                    Appointments
                    <div class="dashboard-sub-title">
                        SUWASEWANA/appointmentS
                    </div>
                </div>

                <div class="dashboard-container">
                    <div class="dashboard-page-sub-title">
                        Appointments Status
                    </div>
                    <divs class="previous-form">
<%--                        <div class="form-group">--%>
<%--                            <label for="aTitleSearch">--%>
<%--                                Appointment Title--%>
<%--                            </label>--%>
<%--                            <input type="text" name="aTitleSearch" id="aTitleSearch" autocomplete="off"/>--%>

<%--                        </div>--%>

                        <div class="form-group">
                            <label for="appointmentTypeSearch">
                                Appointment Type
                            </label>
                            <input id="appointmentTypeSearch" type="text" list="allappointmentTypeSearch"
                                   name="appointmentTypeSearch" autocomplete="off" onclick="document.getElementById('appointmentTypeSearch').value = '' ">
                            <datalist id="allappointmentTypeSearch">

                            </datalist>

                        </div>
                        <div class="form-group">
                            <label for="phiSearch">
                                Your Area's PHI Name
                            </label>
                            <input id="phiSearch" type="text" list="allphiSearch" name="phiSearch" autocomplete="off" onclick="document.getElementById('phiSearch').value = '' ">
                            <datalist id="allphiSearch">
                                <option value="Hansana" option="Hansana"></option>
                            </datalist>
                        </div>

                        <div class="form-group d-flex-a-i-end">
                            <label>
                                &nbsp;
                            </label>
                            <button class="submitBtn" onclick="searchAppointment()" > Search Appointment</button>
                        </div>

                    </divs>
                    <div class="row previous-appointment-list" id="previous-appointment-list">

                    </div>
                </div>

                <div class="dashboard-container">
                    <div class="dashboard-page-sub-title">
                        Make a appointments
                    </div>
                    <div class="make-appointment-form">

                        <form onsubmit="return makeAppointment(event);">
                            <div class="row">
                                <div class="form-group">
                                    <label for="aTitle">
                                        Appointment Title
                                    </label>
                                    <input type="text" name="name" id="aTitle" autocomplete="off"
                                            required minlength="10" value="To get a sign for Mahapola Application" />

                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <label for="appointmentType">
                                        Appointment Type
                                    </label>
                                    <input id="appointmentType" type="text" list="allappointmentType" required
                                           name="appointmentType" autocomplete="off" onclick="document.getElementById('appointmentType').value = '' ">
                                    <datalist id="allappointmentType">

                                    </datalist>
                                </div>
                                <div class="form-group">
                                    <label for="phi">
                                        Your Area's PHI Name
                                    </label>
                                    <input id="phi" type="text" list="allphi" name="phi" autocomplete="off" required
                                            onclick="document.getElementById('phi').value = '' ">
                                    <datalist id="allphi">
                                        <option value="Mr Anjana" ></option>
                                    </datalist>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="reason">
                                        Reason of Appointment
                                    </label>
                                    <textarea rows="4" cols="50" type="text" placeholder="Reason...." name="reason"
                                              id="reason"> Violating the very strict and complicated definitions and rules under the Health Insurance Portability and Accountability Act (HIPAA) can cause serious repercussions – both for individual employees as well as the company, clinic, practice or hospital where the PHI breach occurred. The Office of Civil Rights does not grade on a curve.  </textarea>
                                </div>

                            </div>
                            <div class="row">
                                <div class="form-group d-flex-a-i-end">
                                    <button class="submitBtn " type="submit" > Make Appointment</button>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="main-footer">
        <div class="first-row">
            <img src="<c:url value="/public/images/logo.png "/>" alt="logo" width="45px"/>
            <div class="navbar-container">
                <ul class="navbar navbar1">
                    <script> let navs1 =  new Navbar(); navs.showHeaderNavItems("navbar1"); </script>
                </ul>
            </div>
        </div>
        <div class="second-row">
            © 2021 SUWASEWANA.LK | All Right Reserved
        </div>
    </div>
</div>
<script defer>
    let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    let appointment = new Appointment("previous-appointment-list");
    getAllAppointment()
    getAllAppointmentType()
    ViewPHI()
    function getAllAppointment() {
        // popup.showDeleteAlertMessage({data: "if you want to delete this Appointment. Please type 'Delete' in the below input details."})
        let appointmentCardList = [];
        $.post(myUrl+"/user-appointment-controller/view",
            {
                aType: "",
                aTitle: "",
            },
            function (data, status) {
                appointmentCardList = JSON.parse(data);
                console.log(appointmentCardList)
                document.getElementById("previous-appointment-list").innerHTML = " ";
                appointment.setData(appointmentCardList);

            }
        );
    }
    function getAllAppointmentType() {
        // popup.showDeleteAlertMessage({data: "if you want to delete this Appointment. Please type 'Delete' in the below input details."})
        let appointmentCardList = [];
        $.post(myUrl+"/user-appointment-controller/type",
            {},
            function (data, status) {
                appointmentTypeList = JSON.parse(data);
                // console.log(appointmentTypeList)
                appointmentTypeList.map( aType => {
                    document.getElementById("allappointmentTypeSearch").innerHTML += "<option option='" + aType.typeNumber + "' value='" + aType.typeName + "' name='"  + aType.typeName +"'>";
                    document.getElementById("allappointmentType").innerHTML += "<option option='" + aType.typeNumber + "' value='" + aType.typeName + " | " + aType.typeNumber + "' name='"  + aType.typeName +"'>";
                })
                // document.getElementById("previous-appointment-list").innerHTML = " ";
                // appointment.setData(appointmentCardList);

            }
        );
    }
    function makeAppointment(makeAnnouncementData) {
        var phiObj = document.getElementById("phi");
        var datalist = document.getElementById(phiObj.getAttribute("list"));
        if(datalist.options.namedItem(phiObj.value)){
            PId=(datalist.options.namedItem(phiObj.value).id);
        }
        let reqData =
            {
                aTitle: document.getElementById("aTitle").value,
                aType: Number(document.getElementById("appointmentType").value.split("| ")[1]),
                aPhi: PId,
                aReason: document.getElementById("reason").value,
            };
        console.log(reqData);
        $.post(myUrl+"/user-appointment-controller/create",
            reqData,
            function (data, status) {
                if (data.includes("success")) {
                    popup.showAppointmentSuccessMessage({
                        status: 'success',
                        message: 'Appointment Successfully Requested!'
                    });
                    getAllAppointment();
                } else {
                    popup.showAppointmentSuccessMessage({
                        status: 'fail',
                        message: 'Appointment Request Fails !',
                        data: data
                    });
                }
            }
        );
        return false;
    }
    function deleteCheckInputVsUserInput(appointmentId){
        let userInput = document.getElementById("delete_input").checked;
        console.log(userInput);
        console.log("userInput");

        if(userInput == true){
            document.getElementById("deleteAuthErrorMessage").style.display = "none";
            deleteAppointment(appointmentId);
        }else{
            document.getElementById("deleteAuthErrorMessage").style.display = "block";
        }
    }
    function deleteAppointment(appointmentId){
        $.post(myUrl+"/user-appointment-controller/delete",
            {
                appointmentId: appointmentId
            },
            function (data, status) {
                console.log(data.includes("success"))
                if (data.includes("success")) {
                    popup.showAppointmentSuccessMessage({
                        status: 'success',
                        message: 'Appointment Successfully Deleted!'
                    });
                    getAllAppointment();
                } else {
                    popup.showAppointmentSuccessMessage({
                        status: 'fail',
                        message: 'Appointment Request Fails !',
                        data: data
                    });
                }
            }
        );
    }
    function searchAppointment(){
        let searchItem = {
            appointmentTypeSearch : document.getElementById("appointmentTypeSearch").value,
            phiSearch: document.getElementById("phiSearch").value
        }
        appointment.setSearch(searchItem);
    }
    function ViewPHI(){
        $.post(myUrl+"/user-appointment-controller/phi",
            function (data, status) {
                let rs= JSON.parse(data);
                let PNames=document.getElementById("allphi");
                PNames.innerHTML="";
                rs.map((element) => {
                    console.log(element)
                    PNames.innerHTML+= '<option id="'+element.NIC+'" name="'+element.full_name + ' - ' + element.City +'" value="' + element.full_name + ' - ' + element.City +'" option="' + element.full_name + ' - ' + element.City  +  '"></option>'
                })
            }
        );
    }
    function chooseTimeSlot(data){
        let selected_time_slot = "";
        var radios = document.getElementsByName('timeSlot');
        for (var i = 0, length = radios.length; i < length; i++) {
            if (radios[i].checked) {
                selected_time_slot = radios[i].value;
                break;
            }
        }
        let reqData =   {
            app_id: data.app_id,
            status: selected_time_slot+" selected",
        }
        $.post(myUrl+"/user-appointment-controller/selectTimeSlot",
          reqData,
            function (data, status) {
                let result = JSON.parse(data);
                if(result.status.includes('success')){
                    getAllAppointment();
                    popup.hidePopup();
                }else{
                    popup.appointmentActionFail({data: result.status});
                }

            }
        );
    }
    function requestAnotherTime(data){
        // console.log(data);
        let reqData =   {
            app_id: data.app_id,
            status: "pending",
            round: data.round
        };
        // console.log(reqData)
        $.post(myUrl+"/user-appointment-controller/reRequestTimeSlot",
            reqData,
            function (data, status) {
                let result = JSON.parse(data);
                if(result.status.includes('success')){
                    getAllAppointment();
                    popup.hidePopup();
                }else{
                    popup.appointmentActionFail({data: result.status});
                }

            }
        );
    }
    function dashboard(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/");
    }

    function Diseases(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"diseases");
    }

    function Announcement(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"announcement");
    }

    function Clinic(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"clinic");
    }

    function Complainss(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"complain");
    }

    function Appoiment(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"appointment");
    }
    function vaccine(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"Register-for-vaccine");
    }

    function Edit(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/");
    }

    function vaccinetypesView(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"ViewVaccinesForUser");
    }

</script>
</body>
</html>
