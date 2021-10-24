<%--
  Created by IntelliJ IDEA.
  User: Akila
  Date: 10/17/2021
  Time: 12:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
  <link rel="stylesheet" href="<c:url value="/public/css/Admin/RegMOH.css"/>">
  <script src="<c:url value="/public/js/Admin/InputValidation.js "/>"></script>
  <!-- for map -->

  <link href="https://api.mapbox.com/mapbox-gl-js/v2.4.1/mapbox-gl.css" rel="stylesheet">
  <script src="https://api.mapbox.com/mapbox-gl-js/v2.4.1/mapbox-gl.js"></script>
  <script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.min.js"></script>
  <link rel="stylesheet"
        href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.css"
        type="text/css">


  <script src="<c:url value="/public/js/locationSelectGenarator.js"/>"></script>

  <!-- moh list  -->
  <script src="<c:url value="/public/js/MOHSelectGenarator.js"/>"></script>


  <%--    for side navbar style--%>
  <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

  <c:import url="/view/admin/partials/AdminOfficerSideNavbar.jsp"></c:import>
    <title>Suwasewana</title>
</head>
<body>

<div class="MR_main_Container">

  <div class="header">
    <div class="upper-title">SUWASEWANA</div>
    <div class="dashboard-name">Admin/Register/MOH</div>
  </div>

  <div class="MR_container">
    <div class="title">
      <span>Register MOH</span>
    </div>

    <form action="">
      <div class="multirow">
        <div class="milturow_left">
          <div class="form-item">
            <input type="text" id="MoHName" autocomplete="off" required
                   onblur="validation.nameValidation(
                                document.getElementById('MoHName').value,
                                'LMoHName'
                            );"
                   onkeyup="validation.nameValidation(
                                document.getElementById('MoHName').value,
                                'LMoHName'
                            );"
            >
            <label for="MoHName">MOH Name</label>
            <span class="error" id="LMoHName"></span>
          </div>
        </div>
        <div class="multirow_right">
          <div class="form-item">
            <input type="text" id="TpNo" autocomplete="off" required
                   onkeyup="validation.mobileValidation(
                                document.getElementById('TpNo').value,
                                'LTpNo'
                            );"
                   onblur="validation.mobileValidation(
                                document.getElementById('TpNo').value,
                                'LTpNo'
                            );"
            >
            <label for="TpNo">Mobile No.</label>
            <span class="error" id="LTpNo"></span>
          </div>
        </div>
      </div>

      <div class="multirow">
        <div class="milturow_left" id="mohHeadDiv">
          <div class="form-item" id="Moh_headdiv">
            <input type="text" id="MoHhead" autocomplete="off" required
                   onblur="validation.nameValidation(
                                document.getElementById('MoHhead').value,
                                'LMoHhead'
                            );"
                   onkeyup="validation.nameValidation(
                                document.getElementById('MoHhead').value,
                                'LMoHhead'
                            );"
            >
            <label for="MoHhead">MOH Head</label>
            <span class="error" id="LMoHhead"></span>
            <!-- <button>ssssssss</button> -->
          </div>
        </div>
        <div class="multirow_right" id="addcityDiv">
          <div class="selected-options-container" id="selected-options-container">
          </div>
          <label >Add cities for MOH</label>
          <input id="SelectCity" class="SelectColordiv" type="text" style="outline: none;" list="AllColors"
                 onkeypress=""

          >
          <datalist id="AllColors">
            <option class="city_option" label="Akuressa" value="Akuressa">
            <option class="city_option" label="Galgamuwa" value="Galgamuwa">
            <option class="city_option" label="Ahangama" value="Ahangama">
            <option class="city_option" label="Matara" value="Matara">
          </datalist>

          <button type="button" id="addSelect" onclick="AddValue(document.getElementById('AllColors').value,
                        document.getElementById('AllColors').text);">Add
          </button>
          <br>
          <span class="error" id="LSelectCity"></span>
        </div>
      </div>



      <div class="multirow" id="row2">
        <div class="milturow_left">
          <div class="form-group">
            <label >
              Province
            </label><br>
            <input id="province" class="SelectColordiv" type="text" list="allprovince" name="province" autocomplete="off"
                   onblur="validation.SearchSelect(
                                document.getElementById('province').value,
                                'LProvince'
                            );"
            >
            <datalist id="allprovince">

            </datalist>
          </div>
          <span class="error" id="LProvince"></span>
        </div>

        <div class="multirow_right">
          <label >District</label> <br>
          <!-- <input class="SelectColordiv" id="District" type="text" style="outline: none;" list="AllColors"
                 onkeypress=""
                 onblur="validation.SearchSelect(
                      document.getElementById('District').value,
                      'LDistrict'
                  );"
          >
          <datalist id="AllColors">
              <option class="city_option" label="Akuressa" value="Akuressa">
              <option class="city_option" label="Galgamuwa" value="Galgamuwa">
              <option class="city_option" label="Ahangama" value="Ahangama">
              <option class="city_option" label="Matara" value="Matara">
              <option class="city_option" label="Akuressa" value="Akuressa">
              <option class="city_option" label="Galgamuwa" value="Galgamuwa">
              <option class="city_option" label="Ahangama" value="Ahangama">
              <option class="city_option" label="Matara" value="Matara">
              <option class="city_option" label="Akuressa" value="Akuressa">
              <option class="city_option" label="Galgamuwa" value="Galgamuwa">
              <option class="city_option" label="Ahangama" value="Ahangama">
              <option class="city_option" label="Matara" value="Matara">
          </datalist> -->

          <input id="district" type="text" list="alldistrict" class="SelectColordiv" name="district" autocomplete="off"
                 onblur="validation.SearchSelect(
                                document.getElementById('district').value,
                                'LDistrict'
                            );">
          <datalist id="alldistrict">

          </datalist>
          <br>
          <span class="error" id="LDistrict"></span>
        </div>
      </div>
      <div class="singal_row">
        <label >City</label> <br>
        <!-- <input class="SelectColordiv" id="City" type="text" style="outline: none;" list="AllColors"
               onkeypress=""
               onblur="validation.SearchSelect(
                        document.getElementById('City').value,
                        'LCity'
                    );"
        >
        <datalist id="AllColors">
            <option class="city_option" label="Akuressa" value="Akuressa">
            <option class="city_option" label="Galgamuwa" value="Galgamuwa">
            <option class="city_option" label="Ahangama" value="Ahangama">
            <option class="city_option" label="Matara" value="Matara">
            <option class="city_option" label="Akuressa" value="Akuressa">
            <option class="city_option" label="Galgamuwa" value="Galgamuwa">
            <option class="city_option" label="Ahangama" value="Ahangama">
            <option class="city_option" label="Matara" value="Matara">
            <option class="city_option" label="Akuressa" value="Akuressa">
            <option class="city_option" label="Galgamuwa" value="Galgamuwa">
            <option class="city_option" label="Ahangama" value="Ahangama">
            <option class="city_option" label="Matara" value="Matara">
        </datalist> -->
        <input id="city" type="text" class="SelectColordiv" list="allcity" name="city" autocomplete="off"
               onblur="validation.SearchSelect(
                                document.getElementById('city').value,
                                'LCity'
                            );"
        >
        <datalist id="allcity">

        </datalist>
        <br>
        <span class="error" id="LCity"></span>
      </div>


      <div class="map_container">
        <label >Select MOH Area</label>
        <div class="map">
          <div id="map"></div>
        </div>
      </div>

      <div class="submit_btn">
        <button class="submit"> Add</button>
      </div>

    </form>
  </div>


</div>

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
<script>
  selectedOptionList = [];

  function AddValue() {
    const Value = document.querySelector('#SelectCity').value;
    console.log("work" + Value);
    if (!Value) return;
    if (selectedOptionList.findIndex(item => Value == item) == -1) {
      selectedOptionList.push(Value);
      const Text = document.querySelector('option[value="' + Value + '"]').label;
      const option = document.createElement("option");
      option.value = "";
      option.text = "";
      // document.getElementById('selected-options-container').appendChild(option);
      document.getElementById("selected-options-container").innerHTML += `
                <div class="selected-options">
                    ${Value}
                    <div class="close-btn" onclick="deleteSelectedItem('${Value}')">
                            X
                    </div>
                </div>
                `
    }
    console.log(selectedOptionList);
    document.querySelector('#SelectCity').value = "";

  }

  function SearchSelect(feild) {
    if (selectedOptionList.length == 0) {
      document.getElementById(feild).innerHTML = "*required";
    } else {
      document.getElementById(feild).innerHTML = "";
    }
  }

  selectedOptionList = [];

  function deleteSelectedItem(value) {
    let index = selectedOptionList.findIndex(item => value == item);
    let temp = selectedOptionList.filter(item => item != value);
    selectedOptionList = temp;
    document.getElementById("selected-options-container").innerHTML = "";
    for (let i = 0; i < selectedOptionList.length; i++) {
      document.getElementById("selected-options-container").innerHTML += `
                <div class="selected-options">
                    ${selectedOptionList[i]}
                    <div class="close-btn" onclick="deleteSelectedItem('${selectedOptionList[i]}')">
                            X
                    </div>
                </div>
                `
    }
  }


  var wage = document.getElementById("SelectCity");
  wage.addEventListener("keydown", function (e) {
    if (e.code === "Enter") {  //checks whether the pressed key is "Enter"
      validate(e);
    }
  });


  function validate(e) {
    AddValue(document.getElementById('allcity').value,
            document.getElementById('allcity').text);
  }

</script>
<script defer>
  let locationgenarator = new LocationSelectGenarate("allprovince", "alldistrict", "allcity");
  // document.getElementById('province').addEventListener('input', function (evt) {
  //     locationgenarator.provinceSelect(this.value)
  // });
  let moh = new MOHSelectGenarate('allmoh');
</script>
<script defer>
  let validation = new FormInputValidation();
</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
