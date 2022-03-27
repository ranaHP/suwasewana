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

    <script src="<c:url value="/public/js/Admin/InputValidation.js"/>"></script>
    <title> User Home Suwasewana </title>
    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/>"/>

    <!-- for style sheet link  -->
    <link href="<c:url value="/public/css/user/_register-home.css"/>" rel="stylesheet"/>
    <!-- for commen style  sheet link  -->
    <link href="<c:url value="/public/css/user/_commen.css"/>" rel="stylesheet"/>

    <!-- for feather icon -->
    <script src="https://unpkg.com/feather-icons"></script>

    <!-- location js -->
    <script src="<c:url value="/public/js/locationSelectGenarator.js"/>"></script>

    <!-- moh list  -->
    <script src="<c:url value="/public/js/MOHSelectGenarator.js"/>"></script>

    <!-- map  -->
    <link href="https://api.mapbox.com/mapbox-gl-js/v2.4.1/mapbox-gl.css" rel="stylesheet">
    <script src="https://api.mapbox.com/mapbox-gl-js/v2.4.1/mapbox-gl.js"></script>
    <script
            src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.min.js"></script>
    <link rel="stylesheet"
          href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.css"
          type="text/css">

    <%--    for popup style--%>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <%--    for popup script--%>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
    <script src="<c:url value="/public/js/navbar.js"/>"></script>
    <script src="<c:url value="/public/js/loginLogout.js"/>"></script>

    <title>Registration - Suwasewana</title>
</head>
<body>
<!-- main container -->
<div class="container"
     style="display: flex;flex-direction: column; justify-content: space-between;min-height: 100vh;">
    <!-- hero banner -->
    <div class="mypopup" id="popup" style="display: none;"></div>

    <section class="hero-banner-main-header-container">
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
                        let loginRegsiter = new LoginLogout(); loginRegsiter.showLoginLogoutItemsRegister("login-register-container")
                    </script>
                </div>
            </div>
        </div>
        <!-- register form -->

        <div class="register-form-container">
            <div class="section-title" style="background-color: transparent;margin: 30px 0  ;">
                <div class="header">
                    සුවසෙවන සඳහා ලියාපදිංචිය
                </div>
                <div class="title-sub">
                    අද දිනයේ කොවිඩ් සඳහා එන්නත්කරණ කටයුතු සිදු කෙරෙන ස්ථාන 212ක්
                </div>
            </div>
            <div class="register-form">
                <form onsubmit="return checkLoginValidation(event)" id="registerForm">
                    <div class="form-sub-title">
                        <label> Personal Details </label>
                        <hr width="100%" class="m-auto hr">
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <label for="user_name">
                                Name with Initial
                            </label>
                            <input type="text" placeholder="H.P Ranaweera" name="user_name" id="user_name"
                                   required
                                   autocomplete="off"
                                   onkeyup="validation.nameValidation(
                                document.getElementById('user_name'), 'user-name-error');"
                            />
                            <div id="user-name-error" class="form-field-error"></div>
                        </div>
                        <div class="form-group">
                            <label for="nic">
                                NIC
                            </label>
                            <input type="text" placeholder="980707050V" name="nic" id="nic"
                                   autocomplete="off"
                                   onkeyup="validation.nameValidation(
                                document.getElementById('nic'), 'user-nic-error');"
                                   required
                            />
                            <div id="user-nic-error" class="form-field-error"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <label for="user-mobile">
                                Mobile Number
                            </label>
                            <input type="text" autocomplete="off" maxlength="10" placeholder="041235612" name="mobile"
                                   id="user-mobile"
                                   required
                                   onkeyup="validation.mobileValidation(
                                       document.getElementById('user-mobile').value,
                                       'user-mobile-error'
                                   ); "
                            />
                            <div id="user-mobile-error" class="form-field-error"></div>
                        </div>
                        <div class="form-group">

                        </div>
                    </div>
                    <div class="form-sub-title">
                        <label> Address </label>
                        <hr width="100%" class="m-auto hr">
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <label for="user_name">
                                Address
                            </label>
                            <input type="text" placeholder="No 54,Matara Road, Akuressa" name="address" id="address"
                                   required
                                   autocomplete="off"
                                   onkeyup="validation.nameValidation(
                                document.getElementById('address'), 'user-address-error ');"
                            />
                            <div id="user-address-error" class="form-field-error"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <label for="province">
                                Province
                            </label>
                            <input id="province" type="text" list="allprovince" name="province" required
                                   autocomplete="off">
                            <datalist id="allprovince">

                            </datalist>
                        </div>
                        <div class="form-group">
                            <label for="district">
                                District
                            </label>
                            <input id="district" type="text" list="alldistrict" name="district" required
                                   autocomplete="off">
                            <datalist id="alldistrict">

                            </datalist>
                        </div>

                    </div>

                    <div class="row">
                        <div class="form-group">
                            <label for="city">
                                City
                            </label>
                            <input id="city" type="text" list="allcity" name="city" autocomplete="off" required>
                            <datalist id="allcity">

                            </datalist>
                        </div>
                        <div class="form-group">

                        </div>

                    </div>
                    <div class="form-sub-title">
                        <label> Ministry Of Health Office </label>
                        <hr width="100%" class="m-auto hr">
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <label for="moh">
                                MOH Area
                            </label>
                            <input id="moh" type="text" list="allmoh" name="moh" autocomplete="off" required>
                            <datalist id="allmoh">

                            </datalist>
                        </div>
                        <div class="form-group">

                        </div>
                    </div>
                   <div style="display: none">
                       <div class="form-sub-title">
                           <label> Current Location (optinal) </label>
                           <hr width="100%" class="m-auto hr">
                       </div>
                       <div class="row map-container">
                           <div id="map"></div>
                           <button onclick="getLocation()" class="get-current-location">Get Current Location</button>
                           <p id="demo"></p>
                       </div>
                   </div>
                    <div class="form-sub-title">
                        <label> Password </label>
                        <hr width="100%" class="m-auto hr">
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <label for="user-password">
                                Password
                            </label>
                            <div class="w-100 p-relative">
                                <input type="password" autocomplete="false" name="user-password" id="user-password"
                                       class="w-100 p-relative" required
                                       onkeyup="validation.passwordValidation(
                                   document.getElementById('user-password').value,
                                   'user-password-error'
                               );"
                                />
                                <div onclick="passwordVisibility(0)" class="password-visibility">
                                    <i data-feather="eye-off" id="eyeOff" style="display: none" class="c-gray"> </i>
                                    <i data-feather="eye" id="eye" class="c-gray"></i>
                                </div>
                            </div>


                            <div id="user-password-error" class="form-field-error"></div>

                        </div>
                        <div class="form-group">
                            <label for="cpassword">
                                Confirm Password
                            </label>
                            <div class="w-100 p-relative">
                                <input type="password" autocomplete="false" name="cpassword" id="cpassword"
                                       class="w-100 p-relative"
                                       required
                                       onkeyup="validation.passwordValidation(
                                   document.getElementById('cpassword').value,
                                   'user-cpassword-error'
                               ); "
                                />
                                <div onclick="passwordVisibility(1)" class="password-visibility">
                                    <i data-feather="eye-off" id="eyeOff1" style="display: none" class="c-gray"> </i>
                                    <i data-feather="eye" id="eye1" class="c-gray"></i>
                                </div>
                            </div>
                            <div id="user-cpassword-error" class="form-field-error"></div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group" style="display: flex;justify-content: center;align-items: center;">
                            <button class="submitBtn" type="submit"> Register</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- this for latest announcements -->
<%--    <button onclick="test()"> popclick </button>--%>
    <div class="main-footer">
        <div class="first-row">
            <img src="images/logo.png" width="45px"/>
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





    let locationgenarator = new LocationSelectGenarate("allprovince", "alldistrict", "allcity");
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


    let validation = new FormInputValidation();
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");

    function passwordVisibility(value) {

        if (value == 0) {
            let passwordInput = document.getElementById('user-password');
            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                document.getElementById("eyeOff").style.display = "block";
                document.getElementById("eye").style.display = "none";
            } else {
                passwordInput.type = "password";
                document.getElementById("eye").style.display = "block";
                document.getElementById("eyeOff").style.display = "none";
            }
        } else if (value == 1) {
            let passwordInput = document.getElementById('cpassword');
            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                document.getElementById("eyeOff1").style.display = "block";
                document.getElementById("eye1").style.display = "none";
            } else {
                passwordInput.type = "password";
                document.getElementById("eye1").style.display = "block";
                document.getElementById("eyeOff1").style.display = "none";
            }
        }
    }

    function hideFormError() {
        document.getElementById('user-form-error').style.display = "none";
    }

    function checkLoginValidation(data) {
        console.log(data);
        // alert("1")
        if (
            validation.mobileValidation(document.getElementById('user-mobile').value, 'user-mobile-error') &&
            validation.passwordValidation(document.getElementById('user-password').value, 'user-password-error') &&
            validation.passwordValidation(document.getElementById('cpassword').value, 'user-cpassword-error') &&
            validation.nameValidation(document.getElementById('nic'), 'user-nic-error')) {
            if (document.getElementById("user-password").value !== document.getElementById('cpassword').value) {
                document.getElementById("user-cpassword-error").innerText = " password is not match";
            } else {
                document.getElementById("user-cpassword-error").innerText = " passwords matched";
                console.log(
                    data.target.elements.user_name.value  + " -- " +
                    data.target.elements.nic.value  + " -- " +
                    document.getElementById("user-mobile").value  + " -- " +
                    data.target.elements.province.value  + " -- " +
                    data.target.elements.district.value  + " -- " +
                    data.target.elements.city.value  + " -- " +
                    data.target.elements.moh.value  + " -- " +
                    document.getElementById("user-password").value  + " -- " +
                    data.target.elements.cpassword.value  + " -- "
                )
                let reqData =
                    {
                        uname: data.target.elements.user_name.value,
                        nic: data.target.elements.nic.value,
                        umobiel: document.getElementById("user-mobile").value,
                        province: data.target.elements.province.value,
                        district: data.target.elements.district.value,
                        city: data.target.elements.city.value,
                        moh: data.target.elements.moh.value,
                        pass: document.getElementById("user-password").value,
                        address: data.target.elements.address.value,
                        location: ""
                    };
                console.log(reqData)

                var num = Math.floor(Math.random() * 90000) + 10000;


                $.post("/test_war_exploded/user-register-controller",
                    reqData,
                    function (data, status) {
                        console.log(data.includes("success"))
                        if (data.includes("success") ) {
                            popup.showRegistrationSuccessMessage({ status : 'success' , message: 'Successfully Citizen Registered'});
                        } else {
                            popup.showRegistrationSuccessMessage({ status : 'fail' , message: 'Citizen Registration Fails !' , data: data});

                        }

                    }
                );
            }
        }
        // alert("1")
        return false;
    }

</script>
<script>
    feather.replace({width: "20px"})
</script>
</body>
</html>
