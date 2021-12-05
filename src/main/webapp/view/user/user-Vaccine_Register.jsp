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
            <li class="nav-item"> Home </li>
            <li class="nav-item"> Diseases </li>
            <li class="nav-item"> Announcement </li>
            <li class="nav-item"> Clinik </li>
            <li class="nav-item"> Appointment </li>
            <li class="nav-item special-nav"> Request Ambulance </li>
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
            <div class="dash-icon">
              <img src="<c:url value="/public/images/icons/grid.svg "/>"  width="20px" />
              <!-- <object data="images/icons/grid.svg" width="20px" height="20px" style="color: brown;"> </object> -->
            </div>
            <div class="dash-title">
              Dashboard
            </div>
          </div>
          <div class="dash-tab">
            <div class="dash-icon">
              <img src="<c:url value="/public/images/icons/activity.svg "/>"  width="20px" />
            </div>
            <div class="dash-title">
              Diseases
            </div>
          </div>
          <div class="dash-tab">
            <div class="dash-icon">
              <img src="<c:url value="/public/images/icons/volume-2.svg "/>" width="20px" />
            </div>
            <div class="dash-title">
              Announcement
            </div>
          </div>
          <div class="dash-tab">
            <div class="dash-icon">
              <img src="<c:url value="/public/images/icons/layers.svg "/>"  width="20px" />
            </div>
            <div class="dash-title">
              Clinic
            </div>
          </div>
          <div class="dash-tab">
            <div class="dash-icon">
              <img src="<c:url value="/public/images/icons/activity.svg"/>"  width="20px" />
            </div>
            <div class="dash-title">
              Complain
            </div>
          </div>
          <div class="dash-tab">
            <div class="dash-icon">
              <img src="<c:url value="/public/images/icons/calendar.svg "/>"  width="20px" />
            </div>
            <div class="dash-title">
              Appoiment
            </div>
          </div>
          <div class="dash-tab">
            <div class="dash-icon">
              <img src="<c:url value="/public/images/icons/edit.svg "/>"  width="20px" />
            </div>
            <div class="dash-title">
              Edite Profile
            </div>
          </div>
          <div class="dash-tab">
            <div class="dash-icon">
              <img src="<c:url value="/public/images/icons/activity.svg "/>"  width="20px" />
            </div>
            <div class="dash-title">
              Patient
            </div>
          </div>
          <div class="dash-tab">
            <div class="dash-icon">
              <img src="<c:url value="/public/images/icons/activity.svg "/>"  width="20px" />
            </div>
            <div class="dash-title">
              Support
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
                      <th scope="col">Registration number</th>
                      <th scope="col">Vaccine</th>
                      <th scope="col">Date</th>
                      <th scope="col">Time</th>
                      <th scope="col">Available seats</th>
                      <th scope="col">Location</th>
                      <th scope="col"></th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                      <td data-label="Registration number">19000383</td>
                      <td data-label="Vaccine">Sinopharm</td>
                      <td data-label="Date">04/01/2016</td>
                      <td data-label="Time">6.34am</td>
                      <td data-label="Available seats">100</td>
                      <td data-label="Location">Galgamuwa</td>
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
        <ul class="navbar">
          <li class="nav-item"> Home </li>
          <li class="nav-item"> Diseases </li>
          <li class="nav-item"> Announcement </li>
          <li class="nav-item"> Clinik </li>
          <li class="nav-item"> Appointment </li>
          <li class="nav-item special-nav"> Request Ambulance </li>
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
  console.log("url - "+ myUrl+"/admin-register-controller/All_vaccine_details/");


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

              // Show Details
              // console.log("Gender : " + gender)
              // console.log("Year : " + year)
              // console.log("Month : " + month)
              // console.log("Day :" + day)

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

  function addTimes(time0, time1) {
      return timeFromMins(timeToMins(time0) + timeToMins(time1));
  };

    function RegisterForclinic(vaccine_clinic_id,vaccine_id,year,month,day,max_sheet,Next_sloat){

        // console.log("vaccine_clinic_id = "+vaccine_clinic_id);
        // console.log("vaccine_id = "+vaccine_id);
        let date=year+"-"+month+"-"+day
        console.log("##################Date = "+date);
        // console.log("Next_sloat = "+Next_sloat.toFixed( 2 ));
        // // console.log("avalble slot  = "+Next_sloat.replace("_",":"));
        // console.log("max_sheet = "+max_sheet);
        let sloat=(Next_sloat.toFixed( 2 )).toString().replace(".",":")
        // console.log("sloat = "+sloat);

        let new_next_sloat=addTimes(sloat, '00:05:00');
        // console.log("new_next_sloat = "+new_next_sloat);

        let avalabel_seats=--max_sheet;
        let reqData =
            {
                Set_sloat:sloat,
                new_next_sloat:new_next_sloat,
                avalabel_seats:avalabel_seats,
                vaccine_clinic_id:vaccine_clinic_id,
                Date:date,
                vaccine_id:vaccine_id

            };

        // console.log("reqDatadate "+reqData.Date)




        $.post(myUrl+"/Vaccine-controller/updateVaccineNextSloat_Maxseet",
            reqData,
            function (data, status) {

                if (data.includes("success")) {
                    console.log("successsss brooo")
                    popup.showUserVaccineRegisterSuccessMessage({
                        status: 'success',
                        message: 'Successfully Registerd!',
                        data: date,
                        Set_sloat:sloat
                    });
                    LoadVaccineclinic();
                } else {
                    console.log("unsuccesssss brooo")
                    popup.showUserVaccineRegisterSuccessMessage({
                        status: 'fail',
                        message: 'Complain Send Fail !',

                    });
                }
            }
        );


    }
  LoadVaccineclinic();
  let age=calculateage("199910910064");
  function LoadVaccineclinic(){
    $.post(myUrl+"/Vaccine-controller/viewVaccineClinicdetail/",
            function (data, status) {
              rs= JSON.parse(data);
              let available_clinic_list=document.getElementById("available_clinic_list");
                available_clinic_list.innerHTML='';
              rs.map((element) => {
                  console.log("element.date "+element.date);
                  let date=((element.date).split(" ")[0]) ;

                  let x=new Date(element.date);
                  let year=x.getFullYear();
                  let month=x.getMonth()+1;
                  let day=x.getDate();



                let avlable_time_slot=element.Next_sloat.replace(":",".");
                // console.log("avlable_time_slot "+ avlable_time_slot);


                    if(age<= parseInt(element.Upper_Age) && age> parseInt(element.Lower_Age) && (element.Status!="alreadyHave")){
                        available_clinic_list.innerHTML+= `
                       <tr>
                          <td data-label="Vaccine">`+element.vaccine_name+`</td>
                          <td data-label="Date">`+date+`</td>
                          <td data-label="Time">`+element.Next_sloat+`</td>
                          <td data-label="Available seats">`+element.max_sheet+`</td>
                          <td data-label="Age limit">`+element.Lower_Age+`-`+element.Upper_Age+`</td>
                          <td data-label="Location">`+element.location+`</td>
                          <td data-label="Dosage">`+element.Dosage+`</td>
                          <td data-label=""> <button class="btn-register" onclick="RegisterForclinic(`+element.vaccine_clinic_id+`,`+element.vaccine_id+`,`+year+`,`+month+`,`+day+`,`+element.max_sheet+`,`+avlable_time_slot+`);"> Register</button> </td>
                      </tr>`
                    }
              //,`+element.Next_sloat+`,`+element.max_sheet+`
                    else{
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


</script>
</body>
</html>
