<%--
  Created by IntelliJ IDEA.
  User: Akila
  Date: 10/23/2021
  Time: 10:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="<c:url value="/public/js/PHI/RegisterPatient.js "/>"></script>
    <link rel="stylesheet" href="<c:url value="/public/css/PHI/PHI-user-registration.css "/>">
    <!-- for map -->
    <link href="https://api.mapbox.com/mapbox-gl-js/v2.4.1/mapbox-gl.css" rel="stylesheet">
    <script src="https://api.mapbox.com/mapbox-gl-js/v2.4.1/mapbox-gl.js"></script>
    <script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.min.js"></script>
    <link rel="stylesheet"
          href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.css"
          type="text/css">
    <%--    side nav bar styles--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <title>Suwasewana</title>
</head>
<body id="mainContent">
<c:import url="/view/admin/partials/PHIOfficerSideNavbar.jsp" />
<%--    <div class="maincontainer">--%>
        <div class="header">
            <div class="upper-title">SUWASEWANA</div>
            <div class="dashboard-name">PHI/Dashboard/Register users</div>
        </div>
        <form action="">
            <div class="form">
                <div class="formleft">
                    <div class="searchNyNic">
                        <div class="form-item">
                            <input type="text" id="searchNIC" autocomplete="off" required>
                            <label for="searchNIC">Search by NIC</label>
                        </div>
                    </div>

                    <div class="formrow">
                        <div class="col1">
                            First name <br>
                            <input type="text" id="input_fname"
                                   onblur="validation.nameValidation(
                                            document.getElementById('input_fname').value,
                                            'user-fname-error'
                                        );"
                                   onkeyup="validation.nameValidation(
                                            document.getElementById('input_fname').value,
                                            'user-fname-error'
                                        );"
                            >
                            <br> <label  class="error" id="user-fname-error"></label>
                        </div>
                        <div class="col2">
                            Last name <br>
                            <input type="text" id="input_lname"
                                   onblur="validation.nameValidation(
                                            document.getElementById('input_lname').value,
                                            'user-lname-error'
                                        );"
                                   onkeyup="validation.nameValidation(
                                            document.getElementById('input_lname').value,
                                            'user-lname-error'
                                        );"
                            >
                            <br> <label  class="error" id="user-lname-error"> </label>
                        </div>
                    </div>
                    <div class="formrow">
                        <div class="col1">
                            Mobile No <br>
                            <input type="text" id="input_mobile"
                                   onkeyup="validation.mobileValidation(
                                        document.getElementById('input_mobile').value,
                                        'user-mobile-error'
                                    );"
                                   onblur="validation.mobileValidation(
                                        document.getElementById('input_mobile').value,
                                        'user-mobile-error'
                                    );"
                            >
                            <br> <label  class="error" id="user-mobile-error"> </label>
                        </div>
                        <div class="col2">
                            NIC <br>
                            <input type="text" id="input_nic"
                                   onblur="validation.nicValidation(
                                        document.getElementById('input_nic'),
                                        'user-nic-error')
                                    ;"
                            >
                            <br> <label  class="error" id="user-nic-error"> </label>
                        </div>
                    </div>
                    <div class="formrow">
                        <div class="col1">
                            Province <br>
                            <select name="" id="SelectProvince"
                                    onblur="validation.selectValidation(
                                        document.getElementById('SelectProvince')
                                    );"
                            >
                                <option value="1">Select your Province</option>
                            </select>
                        </div>
                        <div class="col2">
                            City <br>
                            <select name="" id="SelectCity" name="moh"
                                    onblur="validation.selectValidation(
                                        document.getElementById('SelectCity')
                                    );"
                            >
                                <option value="1">Select your City</option>
                            </select>
                        </div>
                    </div>
                    <div class="address">
                        Address <br>
                        <input type="text" id="input_address"
                               onblur="validation.nameValidation(
                                    document.getElementById('input_address').value,
                                    'user-address-error'
                                );"
                               onkeyup="validation.nameValidation(
                                    document.getElementById('input_address').value,
                                    'user-address-error'
                                );"
                        >
                        <br> <label  class="error" id="user-address-error" style="font-size: 0.7em;"> </label>
                    </div>
                    <div class="passwordAndbtn">
                        <div class="password">
                            <div class="col1">
                                Password <br>
                                <input type="text" id="input_password"
                                       onfocus="validation.CheckPassword(); validation.setErrorMessageForField('','password1',0)"

                                >
                                <br> <label  class="error" id="password1"> </label>
                            </div>
                            <div class="col2">
                                Conform password <br>
                                <input type="text" id="input_con_password"
                                       onfocus="validation.checkpasserror('password1');"
                                       onblur="validation.CheckConformPassword(
                                                document.getElementById('input_password'),
                                                document.getElementById('input_con_password'),
                                                'password_error'
                                            );"
                                >
                                <br> <label  class="error" id="password_error"> </label>
                            </div>
                        </div>
                        <div id="message">
                            <h3>Password must contain the following:</h3>
                            <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
                            <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
                            <p id="number" class="invalid">A <b>number</b></p>
                            <p id="length" class="invalid">Minimum <b>8 characters</b></p>
                        </div>
                        <div class="buttonreg" id="btnleft">
                            <button>Add Patient</button>
                        </div>
                    </div>

                </div>
                <div class="formright">
                    <div class="map">
                        <label >Home Location</label>
                        <div class="mapcontainer">
                            <div id="map"></div>
                        </div>
                    </div>
                    <div class="registerfor">

                        <div class="searchdiseas">
                            <div class="form-item">
                                <input type="text" id="searchDiseas" autocomplete="off" required>
                                <label for="searchDiseas">Search by NIC</label>
                            </div>
                        </div>
                        <label >Register for</label>
                        <div class="disease_container">
                            <div class="diseases">
                                <input type="checkbox">
                                <label >Corona</label>
                            </div>
                            <div class="diseases">
                                <input type="checkbox">
                                <label >Corona</label>
                            </div>
                            <div class="diseases">
                                <input type="checkbox">
                                <label >Corona</label>
                            </div>
                            <div class="diseases">
                                <input type="checkbox">
                                <label >Corona</label>
                            </div>
                            <div class="diseases">
                                <input type="checkbox">
                                <label >Corona</label>
                            </div>
                            <div class="diseases">
                                <input type="checkbox">
                                <label >Corona</label>
                            </div>
                            <div class="diseases">
                                <input type="checkbox">
                                <label >Corona</label>
                            </div>
                            <div class="diseases">
                                <input type="checkbox">
                                <label >Corona</label>
                            </div>
                            <div class="diseases">
                                <input type="checkbox">
                                <label >Corona</label>
                            </div>
                            <div class="diseases">
                                <input type="checkbox">
                                <label >Corona</label>
                            </div>
                        </div>
                    </div>
                    <div id="btnright" class="buttonreg">
                        <button style="display: none;">Add Patient</button>
                    </div>
                </div>
            </div>
        </form>
<%--    </div>--%>
    <script>
        // feather.replace({width: '1.2em', height: '1.2em'})
    </script>
    <script defer>
        let validation = new FormInputValidation();
        let Province = ['Akila', 'Anjana', 'Dissanayaka']                                      //using dummy data
        let Districtarray = ['Akilaaaaa', 'Anjanaaaa', 'Dissanayakaaaa']
        let CityArray = ['Akilaaaaa', 'Anjanaaaa', 'Dissanayakaaaa']
        let MohArray = ['Akilaaaaa', 'Anjanaaaa', 'Dissanayakaaaa']

        function fillselect_option(myarray, optionId) {
            // console.log("select is work")
            myarray.map(user => {
                let myOPtion = document.createElement('option');
                myOPtion.value = user;
                myOPtion.innerText = user;
                document.getElementById(optionId).appendChild(myOPtion);
            })
        }

        fillselect_option(Province, 'SelectProvince');
        fillselect_option(CityArray, 'SelectCity');

    </script>

    <script>

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


    </script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
