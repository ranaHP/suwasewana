<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
  <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/createAnnouncement/ClinicAnnouncement.css"/>">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <title>Suwasewana</title>
  <%--    for side navbar style--%>
  <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
  <script src="<c:url value="/public/js/popup.js"></c:url> "></script>
  <script src="https://unpkg.com/feather-icons"></script>
  <link rel="stylesheet" href="<c:url value="/public/css/calander/calander.css "/>">
  <script src="<c:url value="/public/js/ClinicalOfficer/clinicAnnouncements.js"/>"></script>
  <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
</head>
<body>
<c:import url="/view/admin/partials/ClinicalOfficerSideNavbar.jsp"></c:import>
<div class="mypopup" id="popup" style="display: none;"></div>
<div class="AC_main_Container">
  <div class="header">
    <div class="upper-title">SUWASEWANA</div>
    <div class="dashboard-name">Clinical officer/create announcements</div>
  </div>
  <div class="c-db-container">
    <div class="row" style="width: 100%;">
      <form>
        <div class="row" style="align-items: center;justify-content: center;">
          <div class="form-group">
            <label for="clinicID">
              Search by Clinic ID
            </label>
            <input type="text" name="clinicID" id="clinicID" autocomplete="off"
                   required/>
          </div>
          <div class="form-group">
            <%--            <label for="aTitle">--%>
            <%--              &nbsp;--%>
            <%--            </label>--%>
            <button class="submitBtn " type="submit" onclick="return view() " > Search </button>
          </div>
        </div>
      </form>
    </div>
    <div class="form-container" id="form">
      <div class="left-col">
        <div class="row" >
          <form style="width: 100%;">
            <div class="row">
              <div class="form-group">
                <label for="clinic-title">
                  Announctment Title
                </label>
                <input type="text" name="clinic-title" id="clinic-title" autocomplete="off"
                       required/>

              </div>
            </div>
            <div class="row">
              <div class="form-group">
                <label for="description">
                  Announctment Description
                </label>
                <textarea rows="4" cols="50" type="text" placeholder="reason" name="description"
                          id="description">  </textarea>
              </div>

            </div>
            <div class="row" style="display: flex;flex-wrap: wrap;justify-content: flex-start;">
              <div class="form-group" style="width: 250px;">
                <label for="location">
                  Location
                </label>
                <input type="text" name="location" id="location" autocomplete="off"
                       required/>

              </div>
              <div class="form-group" style="width: 250px;">
                <label for="date-time">
                  Date & Time
                </label>
                <input type="text" name="date-time" id="date-time" autocomplete="off"
                       required/>

              </div>
              <div class="form-group" style="width: 250px;">
                <label for="duration">
                  Duration
                </label>
                <input type="text" name="duration" id="duration" autocomplete="off"
                       required/>

              </div>
              <div class="form-group" style="width: 250px;">
                <label for="conduct">
                  Conduct By
                </label>
                <input type="text" name="conduct" id="conduct" autocomplete="off"
                       required/>

              </div>
              <div class="form-group" style="width: 250px;">
                <label for="max-patient">
                  Max limit
                </label>
                <input type="text" name="max-patient" id="max-patient" autocomplete="off"
                       required/>

              </div>

              <div class="form-group" style="width: 250px;">
                <label for="disease">
                  Disease
                </label>
                <input type="text" name="disease" id="disease" autocomplete="off"
                       required/>

              </div>
            </div>

            <div class="row">
              <div class="form-group d-flex-a-i-end">

                <button class="submitBtn " type="submit" onclick="return imageUpload()" > Make Announctment</button>
              </div>

            </div>
          </form>
        </div>
      </div>
      <div class="right-col">
        <div class="row" >
          <form style="width: 100%;">
            <div class="row">
              <div class="form-group">
                <label for="patient">
                  Target Peoples
                </label>
                <input type="text" name="patient" id="patient" autocomplete="off"
                       required/>

              </div>
            </div>
            <div class="row">
              <div class="form-group">
                <label for="target-MOH">
                  Target MOH
                </label>
                <input type="text" name="target-MOH" id="target-MOH" autocomplete="off"
                       required/>

              </div>

            </div>


            <div class="row">
              <div class="form-group d-flex-a-i-end">
                <div class="image-upload-card-container">
                  <div class="image-upload-card">
                    <img id="proof1" width="100%" />
                    <input type="file" accept="image/*" name="file" id="proof1input"
                           onchange="loadFile(event , 'proof1')" style="display: none;">

                    <label for="proof1input" style="cursor: pointer;">Upload Image</label>
                  </div>
<%--                                          <button onclick="imageUpload()">add</button>--%>
                </div>
              </div>

            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

</div>
<script>
  var loadFile = function (event, imgContainerId) {
    console.log("load file")
    var image = document.getElementById(imgContainerId);
    image.src = URL.createObjectURL(event.target.files[0]);
  };
</script>

<script>
  feather.replace({width: "8px"})
</script>
<script defer>
  let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
  function imageUpload() {
    console.log("image upload")
    var fd = new FormData();
    let imageNames = [];

    if ($('#proof1input')[0].files[0]) {
      fd.append('file', $('#proof1input')[0].files[0]);
      let name = new Date().toString().split(" ");
      let url1 = (name[2] + name[3] + name[4] + name[5]).replaceAll(":", "").replaceAll("+", "") +
              Math.floor(10000 + Math.random() * 10000) + "." +
              $('#proof1input')[0].files[0].name.split(".")[$('#proof1input')[0].files[0].name.split(".").length - 1];
      imageNames.push(url1);
    }

    imageNames.map((item, index) => {
      fd.append('ImageName' + (index + 1), item);
    })
    console.log("image neames array "+imageNames);
    if(imageNames.length!=0){
      $.ajax({
        url: '/test_war_exploded/fileuploadservlet1',
        type: 'post',
        data: fd,
        contentType: false,
        processData: false,
        success: function (response) {
          if (response != 0) {
            console.log("successfully image uploadedss ---- " +imageNames )

            announcement(imageNames)
          } else {
            console.log('file not uploaded');
          }
        },
      });
    }
    else {
      console.log("no image selected")
      // registerwithoutimage();
    }
    return false;
  }

  let selectClinic = new selectClinics("form");
  function view(){
    let clinicList=[]
    let reqData =
            {
              clinicID: document.getElementById("clinicID").value,
            };
    console.log(reqData);
    $.post("/test_war_exploded/create-clinic-controller/select",
            reqData,
            function(data,status){
      alert(data)
              clinicList=JSON.parse(data)
              selectClinic.setData(clinicList);

            }
    );
    return false;
  }

  function announcement(imagearray){
    let reqData =
            {
              clinicID:document.getElementById("clinicID").value,
              image:imagearray[0]
            }; function updateclinics(){
      // alert("update")
      let reqData =
              {
                clinicID:document.getElementById("clinicID").value,
                disease:document.getElementById("disease").value,
                title:document.getElementById("clinic-title").value,
                location:document.getElementById("location").value,
                targetMOH:document.getElementById("target-MOH").value,
                datetime:document.getElementById("date-time").value,
                duration:document.getElementById("duration").value,
                maxpatient:document.getElementById("max-patient").value,
                patient:document.getElementById("patient").value,
                conduct:document.getElementById("conduct").value,
                description:document.getElementById("description").value,
              };
      console.log(reqData)
      $.post("/test_war_exploded/create-clinic-controller/updateclinic",
              reqData,
              function (data,status){
                // alert("wrong")
                //  alert(data)
              });

      return false;
    }
    $.post("/test_war_exploded/clinicAnnouncementController/createA",
            reqData,
            function(data,status){
              if(data.includes("sucsess")){
                updateclinics()
                popup.showCreateClinicSuccessMessage({
                  status: 'success',
                  message: 'Successfully Created!'
                })
              } else{
                popup.showCreateClinicSuccessMessage({
                  status: 'fail',
                  message: 'Failed to create !',
                  data: data
                });
              }
            }
          );
    return false;
  }



</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"></c:url> " ></script>
</body>
</html>