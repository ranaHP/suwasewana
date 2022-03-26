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
  <!-- for commen style  sheet link  -->
  <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/>"/>

  <!-- for feather icon -->
  <script src="https://unpkg.com/feather-icons"></script>

  <!-- location js -->
  <%--    <script src="<c:url value="/public/js/locationSelectGenarator.js"/>"></script>--%>

  <!-- moh list  -->
  <script src="<c:url value="/public/js/MOHSelectGenarator.js"/>"></script>
  <script src="<c:url value="/public/js/navbar.js"/>"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<!-- main container -->
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
        <div class="dashboard-page-title">
          Vaccines Approved for Use in Sri Lanka
          <div class="dashboard-sub-title">
            SUWASEWANA/vaccines
          </div>
        </div>

        <div class="dashboard-container">

          <div class="vaccination_container" id="Vaccin_container">

            <div class="vaccine_card">
              <div class="title">
                <span>Pfizer-BioNTech </span>
              </div>
              <div class="vaccin_image">
                <img src="<c:url value="/public/images/vaccine/pfizer.png"/>" alt="" >
              </div>
              <div class="vaccin_detail_row">
                <div class="vaccination_detail_icon">
                  <img src="<c:url value="/public/images/icons/vaccination/map-pin.svg "/>" alt="" srcset="">
                </div>
                <div class="vaccine_row_details">
                  <span> country  :  </span>
                  <span class="V_row_detail">United States</span>
                </div>
              </div>

              <div class="vaccin_detail_row">
                <div class="vaccination_detail_icon">
                  <img src="<c:url value="/public/images/icons/vaccination/thumbs-up.svg "/>" alt="" srcset="">
                </div>
                <div class="vaccine_row_details">
                  <span> Recommended for :    </span>
                  <span class="V_row_detail">Anyone 12 or older </span>
                </div>
              </div>
              <div class="vaccin_detail_row">
                <div class="vaccination_detail_icon">
                  <img src="<c:url value="/public/images/icons/vaccination/streamline-icon-health-medical-syringe@55x55.svg "/>" alt="" srcset="">
                </div>
                <div class="vaccine_row_details">
                  <span> Dosage :    </span>
                  <span class="V_row_detail">Two shots, 21 days apart</span>
                </div>
              </div>
              <div class="vaccin_detail_row" style="margin-bottom: 0px;">
                <div class="vaccination_detail_icon">
                  <img src="<c:url value="/public/images/icons/vaccination/calendar%20(1).svg "/>" alt="" srcset="">
                </div>
                <div class="vaccine_row_details" >
                  <span> Date :    </span>
                  <span class="V_row_detail"> Augast 2021</span>
                </div>
              </div>
              <div class="V_card_btnrow">
                <button class="V_card_btn">View more</button>
              </div>

            </div>


          </div>
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
<script defer>
  // let locationgenarator = new LocationSelectGenarate("allprovince", "alldistrict", "allcity");
  // document.getElementById('province').addEventListener('input', function (evt) {
  //     locationgenarator.provinceSelect(this.value)
  // });
  let moh = new MOHSelectGenarate('allmoh');
  mapInit();
  function mapInit() {
    mapboxgl.accessToken = 'pk.eyJ1IjoiaGFuc2FuYTg3NiIsImEiOiJja3UwMWtrb3ExNjd2Mm9xaDh2MjdjM2FoIn0.6rDLn-mL41GbBUIW3B8MIA';
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11',
      center: [80.4771, 6.0994334],
      zoom: 8
    });

    map.addControl(
            new MapboxGeocoder({
              accessToken: mapboxgl.accessToken,
              mapboxgl: mapboxgl
            })
    );

    const marker = new mapboxgl.Marker({
      draggable: true
    })
            .setLngLat([80.4771, 6.0994334])
            .addTo(map);

    function onDragEnd() {
      const lngLat = marker.getLngLat();
      coordinates.style.display = 'block';
      coordinates.innerHTML = `Longitude: ${lngLat.lng}<br />Latitude: ${lngLat.lat}`;
    }

    marker.on('dragend', onDragEnd);
  }
</script>
<script>
  feather.replace({ width: "20px" })
</script>
<script defer>
  let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
  LoadVaccine();
  let rs;
  console.log("url - "+ myUrl+"/admin-register-controller/All_vaccine_details/");
  function LoadVaccine(){
    $.post(myUrl+"/admin-register-controller/All_vaccine_details/",

            function (data, status) {
              rs= JSON.parse(data);
              let vaccineType=document.getElementById("Vaccin_container");
              vaccineType.innerHTML='';
              rs.map((element) => {
                console.log("vaccine view : "+element.view_status);
                if(element.view_status==1){
                  vaccineType.innerHTML+= `<div class="vaccine_card">
                                <div class="title">
                                    <span> `+element.Name+` </span>
                                </div>
                                <div class="vaccin_image">
                                    <img src="`+myUrl+`/public/images/vaccine/`+element.image+`" alt="" srcset="">
                                </div>
                                <div class="vaccin_detail_row">
                                    <div class="vaccination_detail_icon">
                                        <img src="<c:url value="/public/images/icons/vaccination/map-pin.svg "/>" alt="" srcset="">
                                    </div>
                                    <div class="vaccine_row_details">
                                        <span> country  :  </span>
                                        <span class="V_row_detail">`+element.Country+` </span>
                                    </div>
                                </div>

                                <div class="vaccin_detail_row">
                                    <div class="vaccination_detail_icon">
                                         <img src="<c:url value="/public/images/icons/vaccination/thumbs-up.svg "/>" alt="" srcset="">
                                    </div>
                                    <div class="vaccine_row_details">
                                        <span> Recommended for :    </span>
                                        <span class="V_row_detail">`+element.Recommended_for+`  </span>
                                    </div>
                                </div>
                                <div class="vaccin_detail_row">
                                    <div class="vaccination_detail_icon">
                                        <img src="<c:url value="/public/images/icons/vaccination/streamline-icon-health-medical-syringe@55x55.svg "/>" alt="" srcset="">
                                    </div>
                                    <div class="vaccine_row_details">
                                        <span> Dosage :    </span>
                                        <span class="V_row_detail"> `+element.dosage+` </span>
                                    </div>
                                </div>
                                <div class="vaccin_detail_row" style="margin-bottom: 0px;">
                                    <div class="vaccination_detail_icon">
                                        <img src="<c:url value="/public/images/icons/vaccination/calendar%20(1).svg "/>" alt="" srcset="">
                                    </div>
                                    <div class="vaccine_row_details" >
                                        <span> Date :    </span>
                                        <span class="V_row_detail"> `+element.Date+` </span>
                                    </div>
                                </div>
                                <div class="V_card_btnrow">
                                    <button class="V_card_btn" onclick="loadPAge(`+element.ID+`);" >View more</button>
                                </div>
                            </div>`
                }
              })
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


  function loadPAge(v_id){
    window.location='http://localhost:8080/test_war_exploded/s/'+v_id+'/vaccine-details';
  }
</script>
</body>
</html>
