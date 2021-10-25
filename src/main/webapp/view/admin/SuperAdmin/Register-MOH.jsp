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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- for map -->

  <!-- location js -->
  <script src="<c:url value="/public/js/Admin/View_location.js"/>"></script>

  <link href="https://api.mapbox.com/mapbox-gl-js/v2.4.1/mapbox-gl.css" rel="stylesheet">
  <script src="https://api.mapbox.com/mapbox-gl-js/v2.4.1/mapbox-gl.js"></script>
  <script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.min.js"></script>
  <link rel="stylesheet"
        href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.css"
        type="text/css">



  <!-- moh list  -->
  <script src="<c:url value="/public/js/MOHSelectGenarator.js"/>"></script>

  <%--    for popup style--%>
  <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
  <%--    for popup script--%>
  <script src="<c:url value="/public/js/popup.js"/>"></script>

  <%--    for side navbar style--%>
  <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

  <c:import url="/view/admin/partials/AdminOfficerSideNavbar.jsp"></c:import>
    <title>Suwasewana</title>
</head>
<body>
<div class="MR_main_Container">
  <div class="mypopup" id="popup" style="display: none;"></div>
  <div class="header">
    <div class="upper-title">SUWASEWANA</div>
    <div class="dashboard-name">Admin/Register/MOH</div>
  </div>

  <div class="MR_container">
    <div class="title">
      <span>Register MOH</span>
    </div>

    <form action="" onsubmit="return checkvalidation();" >
      <div class="multirow">
        <div class="milturow_left">
          <div class="form-item">
            <input type="text" id="MoHName" autocomplete="off"
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
            <input type="text" id="TpNo" autocomplete="off"
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
            <input type="text" id="MoHhead" autocomplete="off"
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
          <input id="SelectCity" class="SelectColordiv" type="text" style="outline: none;" list="AllCities" name="AllCities">
          <datalist id="AllCities">

          </datalist>



          <button type="button" id="addSelect" onclick="AddValue();">Add
          </button>
          <br>
          <span class="error" id="LSelectCity"></span>
        </div>
      </div>



      <div class="multirow" id="row2">
        <div class="milturow_left">
          <div class="form-group">
                <label for="province">
                  Province
                </label>
                <br>
                <input id="province"  class="SelectColordiv" style="outline: none; padding-left: 3px" type="text" list="allprovince" name="province" required onblur="test();"
                       autocomplete="off">
                <datalist id="allprovince">

                </datalist>
            </datalist>
          </div>
          <span class="error" id="LProvince"></span>
        </div>

        <div class="multirow_right">
          <label for="district">
            District
          </label>
          <br>
          <input id="district" class="SelectColordiv" style="outline: none; padding-left: 3px" type="text" list="alldistrict" name="district" required
                 autocomplete="off">
          <datalist id="alldistrict">

          </datalist>
          <br>
          <span class="error" id="LDistrict"></span>
        </div>
      </div>
      <div class="singal_row">
        <label for="city">
          City
        </label>
        <br>
        <input id="city" type="text" class="SelectColordiv" style="outline: none; padding-left: 3px" list="allcity" name="city" autocomplete="off" required>
        <datalist id="allcity">

        </datalist>
        <br>
        <span class="error" id="LCity"></span>
      </div>


      <div class="map_container">
        <label >Select MOH Area</label>
        <br>
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

</script>




































<script>
  function test(){
    // console.log("province "+document.getElementById("province").value);
  }
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
    const Value = document.getElementById('SelectCity').value;
    // console.log("work" + Value);
    if (!Value) return;
    if (selectedOptionList.findIndex(item => Value == item) == -1) {
      selectedOptionList.push(Value);
      const Text = document.querySelector('option[value="' + Value + '"]').label;
      const option = document.createElement("option");
      option.value = "";
      option.text = "";
      // document.getElementById('selected-options-container').appendChild(option);
      // console.log("value ==> "+Value);
      document.getElementById("selected-options-container").innerHTML += `<div class="selected-options">`+Value+`<div class="close-btn" onclick="deleteSelectedItem('`+ Value +`');">X</div></div>`

    }
    // console.log("selectedOptionList "+selectedOptionList);
    document.getElementById('SelectCity').value = "";

  }

  function SearchSelect(feild) {
    if (selectedOptionList.length == 0) {
      document.getElementById(feild).innerHTML = "*required";
    } else {
      document.getElementById(feild).innerHTML = "";
    }
  }
  function  deleteSelectedItem(value) {
    // console.log("del Value "+value)
    let index = selectedOptionList.findIndex(item => value == item);
    // console.log("index "+index);
    let temp = selectedOptionList.filter(item => item != value);
    // console.log("temp "+temp);
    selectedOptionList = temp;

    // console.log("selectedOptionList "+selectedOptionList)
    document.getElementById("selected-options-container").innerHTML = "";
    for (let i = 0; i < selectedOptionList.length; i++) {
      document.getElementById("selected-options-container").innerHTML += `<div class="selected-options">`+selectedOptionList[i]+`<div class="close-btn" onclick="deleteSelectedItem('`+ selectedOptionList[i] +`');">X</div></div>`
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


  function checkvalidation(){
    if(validation.mobileValidation(document.getElementById('TpNo').value, 'LTpNo')&&
            validation.nameValidation(document.getElementById('MoHName').value,'LMoHName' )&&
            validation.nameValidation(document.getElementById('MoHhead').value,'LMoHhead' )){
      console.log("correct log");
      RegisterMOH();
    }
    else{
      console.log("incorrect log");
    }

    return false;
  }

  function RegisterMOH(){
    let reqData =
            {
              uname: document.getElementById('MoHName').value,
              Mobiel: document.getElementById('TpNo').value,
              MOHHead:document.getElementById('MoHhead').value,
              allcities:JSON.stringify(selectedOptionList),
              province: document.getElementById('province').value,
              district: document.getElementById('district').value,
              city: document.getElementById('city').value,
              x: "",
              y:""
            };

    $.post("/suwasewana_war/admin-register-controller/moh",
            reqData,
            function (data, status) {
              if (data.includes("success") ) {
                console.log("success")
                popup.showRegistrationSuccessMessage({ status : 'success' , message: 'Successfully Citizen Registered'});
              } else {
                console.log("unsuccess")
                popup.showRegistrationSuccessMessage({ status : 'fail' , message: 'Citizen Registration Fails !' , data: data});

              }

            }
    );


  }
</script>
<script defer>
  let locationgenarator = new LocationSelectGenarate("allprovince", "alldistrict", "allcity", "AllCities");
  let validation = new FormInputValidation();
  let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
