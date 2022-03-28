<%--
  Created by IntelliJ IDEA.
  User: Akila
  Date: 10/29/2021
  Time: 10:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Vaccine view</title>

    <!-- for style sheet link  -->
    <link href="<c:url value="/public/css/user/_dashboard-vaccine-type.css "/>" rel="stylesheet" />
    <link href="<c:url value="/public/css/user/register_for_vaccine.css "/>" rel="stylesheet" />
    <!-- for commen style  sheet link  -->
    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/>"/>

    <!-- for feather icon -->
    <script src="https://unpkg.com/feather-icons"></script>

    <!-- location js -->
    <%--    <script src="<c:url value="/public/js/locationSelectGenarator.js"/>"></script>--%>

    <!-- moh list  -->
    <script src="<c:url value="/public/js/MOHSelectGenarator.js"/>"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="<c:url value="/public/js/navbar.js"/>"></script>

    <%--    for popup style--%>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <%--    for popup script--%>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
</head>
<body>
<!-- main container -->
<div class="mypopup" id="popup" style="display: none;"></div>
<div class="container"
     style="display: flex;flex-direction: column; justify-content: space-between;min-height: 100vh;">
    <!-- hero banner -->
    <section class="hero-banner-main-header-container">
        <!-- for header -->
        <div class="user-main-header-container">
            <div class="main-header">
                <div class="logo">
                    <img src="<c:url value="/public/images/logo.png "/>"  alt="logo" width="100%" />
                </div>
                <div class="navbar-container">
                    <ul class="navbar">
                        <script> let navs =  new Navbar(); navs.showHeaderNavItems("navbar"); </script>
                    </ul>
                </div>
                <div class="login-register-container">
                    <div class="language">
                        <span> සිංහල </span>
                        <img src="<c:url value="/public/images/sri-lanka.png "/>"  alt="sri lanakan flag" width="100%">
                    </div>
                    <div class="register-btn">
                        Register
                    </div>
                    <div class="login-btn">
                        Login
                    </div>
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
                    <img src="<c:url value="/public/images/avatar.png "/>"  width="90px" />
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

                <div style="margin-right: 78px; margin-top: 100px">

                    <table>
                        <caption>Registered Vaccine Clinics</caption>
                        <thead>
                        <tr>

                            <th scope="col">Vaccine</th>
                            <th scope="col">Date</th>
                            <th scope="col">Time</th>
                            <th scope="col">Location</th>
                            <th scope="col">Queue No</th>
                            <th scope="col"></th>
                        </tr>
                        </thead>
                        <tbody id="registeredClinicList">
                        <tr>

                            <td data-label="Vaccine">Sinopharm</td>
                            <td data-label="Date">04/01/2016</td>
                            <td data-label="Time">6.34am</td>
                            <td data-label="Location">Galgamuwa</td>
                            <td data-label="Q_No">25</td>
                            <td data-label=""> <button class="btn-register cancle"> Cancle</button> </td>
                        </tr>



                        </tbody>
                    </table>

                    <hr class="hr-1">

                    <table>
                        <caption>Available Vaccine Clinics</caption>
                        <thead>
                        <tr>
                            <th scope="col">Vaccine</th>
                            <th scope="col">Date</th>
                            <th scope="col">Time</th>
                            <th scope="col">Available seats</th>
                            <th scope="col">Age limit</th>
                            <th scope="col">Location</th>
                            <th scope="col">Dosage</th>
                            <th scope="col"></th>
                        </tr>
                        </thead>
                        <tbody id="available_clinic_list">
                        <tr>
                            <td data-label="Vaccine">Sinopharm</td>
                            <td data-label="Date">04/01/2016</td>
                            <td data-label="Time">6.34am</td>
                            <td data-label="Available seats">100</td>
                            <td data-label="Age limit">20-30</td>
                            <td data-label="Location">Galgamuwa</td>
                            <td data-label="Dosage">all</td>
                            <td data-label=""> <button class="btn-register"> Register</button> </td>
                        </tr>

                        <tr>
                            <td data-label="Vaccine">Sinopharm</td>
                            <td data-label="Date">04/01/2016</td>
                            <td data-label="Time">6.34am</td>
                            <td data-label="Available seats">100</td>
                            <td data-label="Age limit">20-30</td>
                            <td data-label="Location">Galgamuwa</td>
                            <td data-label="Dosage">all</td>
                            <td data-label=""> <button class="btn-register"> Register</button> </td>
                        </tr>
                        <tr>
                            <td data-label="Vaccine">Sinopharm</td>
                            <td data-label="Date">04/01/2016</td>
                            <td data-label="Time">6.34am</td>
                            <td data-label="Available seats">100</td>
                            <td data-label="Age limit">20-30</td>
                            <td data-label="Location">Galgamuwa</td>
                            <td data-label="Dosage">all</td>
                            <td data-label=""> <button class="btn-register"> Register</button> </td>
                        </tr>

                        </tbody>
                    </table>



                </div>

            </div>
        </div>
    </section>
    <div class="main-footer">
        <div class="first-row">
            <img src="<c:url value="/public/images/logo.png "/>"  width="45px" />
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

<script>
    feather.replace({ width: "20px" })
</script>
<script defer>
    let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");

    let rs;


    function calculateage(name) {
        let NICNo = name;
        let isValida = true;
        var dayText = 0;
        var year = "";
        var month = "";
        var day = "";
        var gender = "";
        if (NICNo.length != 10 && NICNo.length != 12) {
            // console.log("if")
            isValida = false;

        } else if (NICNo.length == 10 && !this.$.isNumeric(NICNo.substr(0, 9))) {
            // console.log("else if")

            isValida = false;
        } else {

            isValida = true;
            // Year
            if (NICNo.length == 10) {
                year = "19" + NICNo.substr(0, 2);
                dayText = parseInt(NICNo.substr(2, 3));
            } else {
                year = NICNo.substr(0, 4);
                dayText = parseInt(NICNo.substr(4, 3));
            }

            // Gender
            if (dayText > 500) {
                gender = "Female";
                dayText = dayText - 500;
            } else {
                gender = "Male";
            }

            // Day Digit Validation
            if (dayText < 1 && dayText > 366) {
                $("#error").html("Invalid NIC NO");
            } else {

                //Month
                if (dayText > 335) {
                    day = dayText - 335;
                    month = "12";
                } else if (dayText > 305) {
                    day = dayText - 305;
                    month = "11";
                } else if (dayText > 274) {
                    day = dayText - 274;
                    month = "10";
                } else if (dayText > 244) {
                    day = dayText - 244;
                    month = "9";
                } else if (dayText > 213) {
                    day = dayText - 213;
                    month = "8";
                } else if (dayText > 182) {
                    day = dayText - 182;
                    month = "7";
                } else if (dayText > 152) {
                    day = dayText - 152;
                    month = "6";
                } else if (dayText > 121) {
                    day = dayText - 121;
                    month = "5";
                } else if (dayText > 91) {
                    day = dayText - 91;
                    month = "4";
                } else if (dayText > 60) {
                    day = dayText - 60;
                    month = "3";
                } else if (dayText < 32) {
                    month = "1";
                    day = dayText;
                } else if (dayText > 31) {
                    day = dayText - 31;
                    month = "2";
                }



                let birthday=year+"/"+month+"/"+day;
                let age =getAge(birthday);
                return age;
            }
        }
    }
    function getAge(dateString) {
        var today = new Date();
        var birthDate = new Date(dateString);
        var age = today.getFullYear() - birthDate.getFullYear();
        var m = today.getMonth() - birthDate.getMonth();
        if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
            age--;
        }
        return age;
    }

    // function list for add two times
    function timeToMins(time) {
        var b = time.split(':');
        return b[0] * 60 + +b[1];
    };

    function timeFromMins(mins) {
        function z(n) {
            if (n < 0) return ('-0' + (n).toString().slice(1));
            return (n < 10 ? '0' : '') + n;
        };

        var h = (mins / 60 | 0);
        var m = mins % 60;
        return z(h) + ':' + z(m);
    };

    function addTimes(time0, time1) {  //require time in _:_:_ format
        return timeFromMins(timeToMins(time0) + timeToMins(time1));
    };

    function RegisterForclinic(vaccine_clinic_id,vaccine_id,max_sheet,date,sloat,Que_no){
        console.log("Queue no "+Que_no)
        let new_next_sloat=addTimes(sloat, '00:05:00');
        console.log("sloat "+sloat)
        console.log("next slot - "+ new_next_sloat)
        let avalabel_seats=--max_sheet;
        let QNo= parseInt(Que_no)+1
        console.log("Queue no +1 "+QNo)

        let timeWithAmPm=""
        let AmPm=parseInt(sloat.split(":")[0])
        if(AmPm<7 || AmPm==12){
            timeWithAmPm=sloat+" PM"
        }
        else{
            timeWithAmPm=sloat+" Am"
        }

        let reqData =
            {
                Set_sloat:sloat,
                new_next_sloat:new_next_sloat,
                avalabel_seats:avalabel_seats,
                vaccine_clinic_id:vaccine_clinic_id,
                Date:date,
                vaccine_id:vaccine_id,
                Next_Que_no:QNo
            };
        let TpNo = getCookie("uDetails").split("/")[2]
        TpNo='0713806000';
        let message= `Covid-19 Vaccination Program.
        Queue no:`+Que_no +`
        Time slot: `+timeWithAmPm+`
        Date : `+date+`
        We are waiting for you!
        Stay safe
        ~SUWASEWANA~
        `

        $.post(myUrl+"/Vaccine-controller/updateVaccineNextSloat_Maxseet",
            reqData,
            function (data, status) {

                if (data.includes("success")) {
                    popup.showUserVaccineRegisterSuccessMessage({
                        status: 'success',
                        message: 'Successfully Registerd!',
                        data: date,
                        Set_sloat:timeWithAmPm,
                        Next_Que_no:Que_no
                    });
                    sendmsg(TpNo,message)
                    LoadVaccineclinic();
                    ViewRegisterdClinics();
                } else {
                    popup.showUserVaccineRegisterSuccessMessage({
                        status: 'fail',
                        message: 'Oops! Something Went Wrong',
                    });
                }
            }
        );
    }
    // send message when they register
    // function sendmsg() {
    //     numbers.map(i => {
    //             var xhttp = new XMLHttpRequest();
    //             xhttp.onreadystatechange = function () {
    //                 if (this.readyState == 4 && this.status == 200) {
    //                     document.getElementById("demo").innerHTML =
    //                         this.responseText;
    //                 }
    //             };
    //             xhttp.open("GET", "https://app.notify.lk/api/v1/send?user_id=15170&api_key=JxIvVwu5Ww2TF7aYeFx0&sender_id=NotifyDEMO&to=+94" + i + "&message=good night", true);
    //             xhttp.send();
    //         }
    //     )
    // }


    // To take cookies from browser
    function getCookie(cname) {
        let name = cname + "=";
        let decodedCookie = decodeURIComponent(document.cookie);
        let ca = decodedCookie.split(';');
        for(let i = 0; i <ca.length; i++) {
            let c = ca[i];
            while (c.charAt(0) == ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "";
    }

    //final function for sending sms
    function sendmsg(TNo,msg) {
        TNo=TNo.substring(1)
        let FormatedTNo="+94"+TNo
        console.log("Tp no "+FormatedTNo +"\nMessage "+msg)
        let reqData =
            {
                message:msg,
                to:parseInt(FormatedTNo),
            };
        // $.post("https://app.notify.lk/api/v1/send?user_id=15808&api_key=8h4xvxbwtVgXH7dyZnN9&sender_id=NotifyDEMO",
        //     reqData,
        //     function(data,status){
        //         // console.log("data")
        //
        //     }
        // );

        return false;
    }

    LoadVaccineclinic();
    let nic = getCookie("uDetails").split("/")[1]
    nic="199910910060"
    let age=calculateage(nic);
    console.log("Nic - "+nic)
    function LoadVaccineclinic(){
        // console.log("Nic in js "+getCookie("uDetails").split("/")[0])
        $.post(myUrl+"/Vaccine-controller/viewVaccineClinicdetail/",
            function (data, status) {
                rs= JSON.parse(data);
                let available_clinic_list=document.getElementById("available_clinic_list");
                available_clinic_list.innerHTML='';

                rs.map((element) => {
                    let date=((element.date).split(" ")[0]) ;
                    let expdate=new Date(element.date);
                    let currentDate=new Date();
                    console.log("Que no = "+element.Que_no)

                   // For check comming data
                    /*console.log("age = "+age)
                    console.log("element.Upper_Age = "+element.Upper_Age)
                    console.log("element.Lower_Age = "+element.Lower_Age)
                    console.log("element.max_sheet= "+element.max_sheet)
                    console.log("currentDate= "+currentDate)
                    console.log("expdate = "+expdate)

                    console.log("age<= parseInt(element.Upper_Age ")
                    if(age<= parseInt(element.Upper_Age))
                        console.log("True")
                    else
                        console.log("False")

                    console.log("age>= parseInt(element.Lower_Age ")
                    if(age>= parseInt(element.Lower_Age))
                        console.log("True")
                    else
                        console.log("False")

                    console.log("(element.Status!=alreadyHave) =")
                    if((element.Status!="alreadyHave"))
                        console.log("True")
                    else
                        console.log(element.Status+" -False")

                    console.log("(element.max_sheet>0) = ")
                    if((element.max_sheet>0))
                        console.log("True")
                    else
                        console.log("False")

                    console.log("(currentDate<=expdate) ")
                    if((currentDate<=expdate))
                        console.log("True")
                    else
                        console.log("False")

                    console.log("############################################")*/
                    let QNo=element.Que_no;
                    if(age<= parseInt(element.Upper_Age) && age>= parseInt(element.Lower_Age) && (element.Status!="alreadyHave") &&(element.max_sheet>0) && (currentDate<=expdate)){
                        /*console.log("True can view")
                        console.log("======================================================================/n")*/
                        available_clinic_list.innerHTML+= `
                       <tr>
                          <td data-label="Vaccine">`+element.vaccine_name+`</td>
                          <td data-label="Date">`+date+`</td>
                          <td data-label="Time">`+element.Next_sloat+`</td>
                          <td data-label="Available seats">`+element.max_sheet+`</td>
                          <td data-label="Age limit">`+element.Lower_Age+`-`+element.Upper_Age+`</td>
                          <td data-label="Location">`+element.location+`</td>
                          <td data-label="Dosage">`+element.Dosage+`</td>
                          <td data-label=""> <button class="btn-register" onclick="RegisterForclinic(`+element.vaccine_clinic_id+`,`+element.vaccine_id+`,`+element.max_sheet+`,'`+date+`','`+element.Next_sloat+`',`+QNo+`);"> Register</button> </td>
                      </tr>`



                    }
                    else if (currentDate>=expdate){
                        // console.log("can't view expired")
                        // console.log("======================================================================/n")
                        available_clinic_list.innerHTML+= ''
                    }
                    else{
                        // console.log("False can't register")
                        // console.log("======================================================================/n")
                        available_clinic_list.innerHTML+= `
                       <tr>
                          <td data-label="Vaccine">`+element.vaccine_name+`</td>
                          <td data-label="Date">`+date+`</td>
                          <td data-label="Time">`+element.Next_sloat+`</td>
                          <td data-label="Available seats">`+element.max_sheet+`</td>
                          <td data-label="Age limit">`+element.Lower_Age+`-`+element.Upper_Age+`</td>
                          <td data-label="Location">`+element.location+`</td>
                          <td data-label="Dosage">`+element.Dosage+`</td>
                          <td data-label=""> <button class="btn-register" style="display: none"> Register</button> </td>
                      </tr>`
                    }
                })
            }
        );
    }

    // To take available dose count
    async function Takedosecount(regno) {
        let availableDose = 0;
        await $.post(myUrl + "/Vaccine-controller/GetRegisterdVaccineClinicDetail/",
            function (data, status) {
                rs = JSON.parse(data);
                rs.map((element) => {

                    let clinic_id = element.vaccine_clinic_id;
                    if (clinic_id == regno) {
                        availableDose = parseInt(element.max_sheet) + 1
                    }
                })

            }
        );
       return availableDose;
    }
    async function Take_clinic_id(regno) {
        let clinicid = 0;
        await $.post(myUrl + "/Vaccine-controller/GetRegisterdVaccineClinicDetail/",
            function (data, status) {
                rs = JSON.parse(data);
                rs.map((element) => {

                    let clinic_id = element.vaccine_clinic_id;
                    if (clinic_id == regno) {
                        clinicid = element.Regno
                    }
                })

            }
        );
        return clinicid;

    }

    // CAncle clinic that registered async function
    async function CancleClinic(regno){

        let availableDose=await Takedosecount(regno);
        let clinicid=await Take_clinic_id(regno);
        let reqData={
            regNo:regno,
            availableDose:availableDose,
            clinicid:clinicid
        }

        $.post(myUrl+"/Vaccine-controller/CancleVaccineClinic",
            reqData,
            function (data, status) {

                if (data.includes("success")) {
                    popup.CancleClinicSuccessMessage({
                        status: 'success',
                        message: 'Successfully Cancled!',
                    });
                    LoadVaccineclinic();
                    ViewRegisterdClinics();
                } else {
                    popup.CancleClinicSuccessMessage({
                        status: 'fail',
                        message: 'Please try again',
                    });
                }
            }
        );
    }

    ViewRegisterdClinics();
    async function ViewRegisterdClinics(){
        console.log("ViewRegisterdClinics call")
        $.post(myUrl+"/Vaccine-controller/GetRegisterdVaccineClinicDetail/",
            await function (data, status) {
                rs= JSON.parse(data);
                let registered_clinic_list=document.getElementById("registeredClinicList");
                registered_clinic_list.innerHTML='';
                rs.map((element) => {
                    let date=((element.date).split(" ")[0]) ;
                    let time=((element.date).split(" ")[1]).split(":")[0]+"."+((element.date).split(" ")[1]).split(":")[1];
                    let expdate=new Date(element.date);
                    let currentDate=new Date();
                    // console.log("expdate "+expdate)
                    // console.log("currentDate "+currentDate)

                    if(currentDate<=expdate){
                        console.log("not expired yet")

                        registered_clinic_list.innerHTML+= `
                       <tr>
                          <td data-label="Vaccine">`+element.vaccine_name+`</td>
                          <td data-label="Date">`+date+`</td>
                          <td data-label="Time">`+time+`</td>
                          <td data-label="Location">`+element.location+`</td>
                          <td data-label="Q_No">`+element.Que_no+`</td>
                          <td data-label=""> <button class="btn-register cancle" onclick="CancleClinic(`+element.vaccine_clinic_id+`)"> Cancle</button> </td>
                        </tr>`
                    }
                    else {
                        console.log("expired")
                        registered_clinic_list.innerHTML+= `
                       <tr>
                          <td data-label="Vaccine">`+element.vaccine_name+`</td>
                          <td data-label="Date">`+date+`</td>
                          <td data-label="Time">`+time+`</td>
                          <td data-label="Location">`+element.location+`</td>
                           <td data-label="Q_No">-</td>
                          <td data-label=""> <button class="btn-register cancle" style="display: none" "> Cancle</button> </td>
                        </tr>`
                    }
                })
            }
        );
    }


    //newslot time should 08:23 format
    //when reschdule time then update it in vaccine_clinic->next_Available_time_slote also
    //reschdule("2023-12-05", "11:40:00","18")
    function reschdule(newslot_Date,newslot_time,clinicid){
        let reqData =
            {
                newslot_Date:newslot_Date,
                newslot_time:newslot_time,
                clinicid:clinicid

            };
        let User_Tp_slot=[]

        $.post(myUrl+"/Vaccine-controller/GetVaccineClinicDetailForReschdule/",
            reqData,
            function (data, status) {
                rs= JSON.parse(data);
                let registered_clinic_list=document.getElementById("registeredClinicList");
                registered_clinic_list.innerHTML='';
                let new_next_sloat=newslot_time
                let tpno=""
                rs.map((element) => {
                    let regno=element.reg_No;

                    new_next_sloat=addTimes(newslot_time, '00:05:00');
                    tpno=element.TpNo;
                    User_Tp_slot.push({tpno:new_next_sloat});       //List of useres mobile no and new slot to send message
                    console.log("hi")
                    console.log(User_Tp_slot)
                    UpdateDateAndTimeWhenRechdule(regno,newslot_Date,newslot_time)
                    newslot_time=new_next_sloat

                })
                UpdateLastTimeSlot(new_next_sloat,clinicid)
            }
        );
    }
    function UpdateLastTimeSlot(new_next_sloat,clinicid){
        let reqData =
            {
                clinic_id:clinicid,
                newslot_Date:new_next_sloat
            };
        $.post(myUrl+"/Vaccine-controller/updateTimeSlotsOfClinicTable",
            reqData,
            function (data, status) {

                if (data.includes("success")) {
                    console.log("success broooooooo")

                } else {
                    console.log("unsuccess broooooooo")
                }
            }
        );
    }
    function UpdateDateAndTimeWhenRechdule(clinic_id,newslot_Date,newslot_time){
        // console.log("clinic id "+clinic_id+" || newslot_Date "+newslot_Date+" || newslot_time "+newslot_time)

        let reqData =
            {
                clinic_id:clinic_id,
                newslot_Date:newslot_Date,
                newslot_time:newslot_time
            };

        $.post(myUrl+"/Vaccine-controller/updateTimeSlotsOfUsers",
            reqData,
            function (data, status) {

                if (data.includes("success")) {
                    // console.log("success broooooooo")

                } else {
                    // console.log("unsuccess broooooooo")
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
    function vaccinetypesView(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"ViewVaccinesForUser");
    }

    function Edit(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/");
    }

</script>
</body>
</html>