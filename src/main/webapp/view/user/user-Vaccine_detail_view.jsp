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
    <link href="<c:url value="/public/css/user/_dashboard-vaccine_details.css"/>" rel="stylesheet" />
    <!-- for commen style  sheet link  -->
    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/>"/>

    <!-- for feather icon -->
    <script src="https://unpkg.com/feather-icons"></script>

    <!-- location js -->
    <script src="<c:url value="/public/js/locationSelectGenarator.js"/>"></script>

    <!-- moh list  -->
    <script src="<c:url value="/public/js/MOHSelectGenarator.js"/>"></script>
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
                <div class="dashboard-page-title">
                    Pfizer-BioNTech
                </div>

                <div class="dashboard-container">
                    <div class="dashboard-page-sub-title">
                        <div class="ref_row">
                            <div class="ref_cols">Status</div>
                            <div class="ref_cols">Dosage</div>
                            <div class="ref_cols">Common side effects</div>
                            <div class="ref_cols">How it works</div>
                            <div class="ref_cols">How well it works</div>
                        </div>
                    </div>
                    <div class="dashboard-page-sub-title">
                        <img class="vaccin_image" id="v_image" src="<c:url value="/public/images/vaccine/pfizer.png  "/>"  alt="">
                    </div>
                    <div class="dashboard-page-sub-title" style="margin-top: 30px;">
                        <span class="recomanded_for_main_text">Recommended for:</span> <span class="recomanded_for" id="rec_for"> Anyone 12 or older</span>
                    </div>
                    <div class="dashboard-page-sub-title vaccination_setails_rows"  style="margin-top: 30px;">
                        <span class="v_description_title">Status</span>
                        <p style="padding-left: 10px; margin-top: 10px;" id="Status">
                            Approved for adults ages 16 and older in the U.S., with EUA for ages 12-15, and for
                            specified age groups in other countries, including in the European Union (under the name
                            Comirnaty). Pfizer-BioNTech is awaiting final approval of an EUA for children ages 5-11. The CDC
                            recommends a booster dose of the Pfizer-BioNTech vaccine for people 65 and up, residents of
                            care settings, and people 18 to 64 with underlying medical conditions or whose work may put
                            higher risk of exposure to COVID-19. That latter group may include health care workers,
                            others.
                            People with certain immunocompromising conditions can get a third dose of the
                            Pfizer-BioNTech or Moderna vaccines so they can reach a level of immunity they were not
                            able to reach after two doses. In October, the CDC issued additional interim guidelines
                            saying that moderately and severely immunocompromised people who received an mRNA
                            vaccine, and are 18 and older, may receive a booster dose of any COVID-19 vaccine at least six
                            months after their third dose
                        </p>
                    </div>
                    <div class="dashboard-page-sub-title vaccination_setails_rows"  style="margin-top: 30px;">
                        <span class="v_description_title">Dosage</span>
                        <p style="padding-left: 10px; margin-top: 10px;" id="Dosage">
                            Approved for adults ages 16 and older in the U.S., with EUA for ages 12-15, and for
                            specified age groups in other countries, including in the European Union (under the name
                            Comirnaty). Pfizer-BioNTech is awaiting final approval of an EUA for children ages 5-11. The CDC
                            recommends a booster dose of the Pfizer-BioNTech vaccine for people 65 and up, residents of
                            care settings, and people 18 to 64 with underlying medical conditions or whose work may put
                            higher risk of exposure to COVID-19. That latter group may include health care workers,
                            others.
                            People with certain immunocompromising conditions can get a third dose of the
                            Pfizer-BioNTech or Moderna vaccines so they can reach a level of immunity they were not
                            able to reach after two doses. In October, the CDC issued additional interim guidelines
                            saying that moderately and severely immunocompromised people who received an mRNA
                            vaccine, and are 18 and older, may receive a booster dose of any COVID-19 vaccine at least six
                            months after their third dose
                        </p>
                    </div>
                    <div class="dashboard-page-sub-title vaccination_setails_rows"  style="margin-top: 30px;">
                        <span class="v_description_title">Common side effects</span>
                        <p style="padding-left: 10px; margin-top: 10px;" id="side_effect">
                            Approved for adults ages 16 and older in the U.S., with EUA for ages 12-15, and for
                            specified age groups in other countries, including in the European Union (under the name
                            Comirnaty). Pfizer-BioNTech is awaiting final approval of an EUA for children ages 5-11. The CDC
                            recommends a booster dose of the Pfizer-BioNTech vaccine for people 65 and up, residents of
                            care settings, and people 18 to 64 with underlying medical conditions or whose work may put
                            higher risk of exposure to COVID-19. That latter group may include health care workers,
                            others.
                            People with certain immunocompromising conditions can get a third dose of the
                            Pfizer-BioNTech or Moderna vaccines so they can reach a level of immunity they were not
                            able to reach after two doses. In October, the CDC issued additional interim guidelines
                            saying that moderately and severely immunocompromised people who received an mRNA
                            vaccine, and are 18 and older, may receive a booster dose of any COVID-19 vaccine at least six
                            months after their third dose
                        </p>
                    </div>
                    <div class="dashboard-page-sub-title vaccination_setails_rows"  style="margin-top: 30px;">
                        <span class="v_description_title">How it works</span>
                        <p style="padding-left: 10px; margin-top: 10px;" id="How_work">
                            Approved for adults ages 16 and older in the U.S., with EUA for ages 12-15, and for
                            specified age groups in other countries, including in the European Union (under the name
                            Comirnaty). Pfizer-BioNTech is awaiting final approval of an EUA for children ages 5-11. The CDC
                            recommends a booster dose of the Pfizer-BioNTech vaccine for people 65 and up, residents of
                            care settings, and people 18 to 64 with underlying medical conditions or whose work may put
                            higher risk of exposure to COVID-19. That latter group may include health care workers,
                            others.
                            People with certain immunocompromising conditions can get a third dose of the
                            Pfizer-BioNTech or Moderna vaccines so they can reach a level of immunity they were not
                            able to reach after two doses. In October, the CDC issued additional interim guidelines
                            saying that moderately and severely immunocompromised people who received an mRNA
                            vaccine, and are 18 and older, may receive a booster dose of any COVID-19 vaccine at least six
                            months after their third dose
                        </p>
                    </div>
                    <div class="dashboard-page-sub-title vaccination_setails_rows"  style="margin-top: 30px; margin-bottom: 30px;">
                        <span class="v_description_title">How well it works</span>
                        <p style="padding-left: 10px; margin-top: 10px; padding-right: 10px;" id="How_well_work">
                            Approved for adults ages 16 and older in the U.S., with EUA for ages 12-15, and for
                            specified age groups in other countries, including in the European Union (under the name
                            Comirnaty). Pfizer-BioNTech is awaiting final approval of an EUA for children ages 5-11. The CDC
                            recommends a booster dose of the Pfizer-BioNTech vaccine for people 65 and up, residents of
                            care settings, and people 18 to 64 with underlying medical conditions or whose work may put
                            higher risk of exposure to COVID-19. That latter group may include health care workers,
                            others.
                            People with certain immunocompromising conditions can get a third dose of the
                            Pfizer-BioNTech or Moderna vaccines so they can reach a level of immunity they were not
                            able to reach after two doses. In October, the CDC issued additional interim guidelines
                            saying that moderately and severely immunocompromised people who received an mRNA
                            vaccine, and are 18 and older, may receive a booster dose of any COVID-19 vaccine at least six
                            months after their third dose
                        </p>
                    </div>

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


<script defer>

    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    vaccineId = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[1].split("/")[0];
    console.log(vaccineId);


    $.post(myUrl+"/admin-register-controller/All_vaccine_details/",

        function (data, status) {
            rs= JSON.parse(data);

            rs.map((element) => {

                if(element.ID==vaccineId){
                    document.getElementById('rec_for').innerText=element.Recommended_for;
                    document.getElementById('Status').innerText=element.status;
                    document.getElementById('Dosage').innerText=element.dosage;
                    document.getElementById('side_effect').innerText=element.side_effects;
                    document.getElementById('How_work').innerText=element.how_work;
                    document.getElementById('How_well_work').innerText=element.How_Well_work;
                    document.getElementById("v_image").src=myUrl+"/public/images/vaccine/"+element.image;
                }
            })
        }
    );
</script>


<script defer>
    let locationgenarator = new LocationSelectGenarate("allprovince", "alldistrict", "allcity");

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
</body>
</html>
