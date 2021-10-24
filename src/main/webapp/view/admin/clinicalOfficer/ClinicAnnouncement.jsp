<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
  <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/createAnnouncement/ClinicAnnouncement.css"/>">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <title>Title</title>

  <%--    for side navbar style--%>
  <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
  <script src="https://unpkg.com/feather-icons"></script>
  <link rel="stylesheet" href="<c:url value="/public/css/calander/calander.css "/>">
  <script src="<c:url value="/public/js/ClinicalOfficer/clinicAnnouncements.js"/>"></script>

</head>
<body>
<c:import url="/view/admin/partials/ClinicalOfficerSideNavbar.jsp"></c:import>
<div id="mainContent" class="AC_main_Container">
  <div class="header">
    <div class="upper-title">SUWASEWANA</div>
    <div class="dashboard-name">Admin/Register/ClinicalOfficer</div>
  </div>
  <form action="" id="form">
    <div class="AC_container">
      <div class="AC_Body_container" id="AC_Body_container">
        <div class="Container_left">
          <div class="LRow">
            <div class="form-item">
              <input type="text" id="clinicID"  autocomplete="off" required>
              <label class="name" for="clinicID">Search by Name</label>
              <span class="error" id="LfullName" onclick="view()"><i class="icon" data-feather="search"></i></span>
            </div>
          </div>
          <div class="LRow">
            <label>Title</label><br>
            <input type="text" name="" id="Title">
          </div>
          <div class="LRow mt5">
            <textarea rows='1' placeholder='Type Description here...'></textarea>
            <label id="Des">Description</label>

          </div>
          <div class="LRow">

            <div class="DRow">
              <div class="DRow_Left">
                <div class="icon">
                  <i data-feather="circle"></i>
                </div>
                <div class="row_text">
                  <label>Location</label>
                </div>
              </div>
              <div class="DRow_Right">
                <input type="text">
              </div>
            </div>

            <div class="DRow">
              <div class="DRow_Left">
                <div class="icon">
                  <i data-feather="calendar"></i>
                </div>
                <div class="row_text">
                  <label>Date & Time</label>
                </div>
              </div>
              <div class="DRow_Right">
                <input type="text">
              </div>
            </div>
            <div class="DRow">
              <div class="DRow_Left">
                <div class="icon">
                  <i data-feather="clock"></i>
                </div>
                <div class="row_text">
                  <label>Duration</label>
                </div>
              </div>
              <div class="DRow_Right">
                <input type="text">
              </div>
            </div>
            <div class="DRow">
              <div class="DRow_Left">
                <div class="icon">
                  <i data-feather="user"></i>
                </div>
                <div class="row_text">
                  <label>Conduct By</label>
                </div>
              </div>
              <div class="DRow_Right">
                <input type="text">
              </div>
            </div>
            <div class="DRow">
              <div class="DRow_Left">
                <div class="icon">
                  <i data-feather="triangle"></i>
                </div>
                <div class="row_text">
                  <label >Max limit</label>
                </div>
              </div>
              <div class="DRow_Right">
                <input type="text">
              </div>
            </div>

          </div>
        </div>
        <div class="Container_right">
          <div class="RRow">
            <textarea rows='1' id="TargetP" placeholder='Type target patients here...'></textarea>
            <label id="target">Target Participant</label>
          </div>
          <div class="RRow">
            <div class="row ">
              <div class="image-upload-card-list-container">

                <div class="image-upload-card-container">
                  <div class="image-upload-card">
                    <img id="proof3" width="100%"/>
                    <input type="file" accept="image/*" name="image" id="proof3input"
                           onchange="loadFile(event, 'proof3')" style="display: none;">
                    <label id="upload-btn" for="proof3input" style="cursor: pointer;">Upload Image</label>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <button id="sybmit">submit</button>
    </div>
  </form>

</div>
<script>
  var loadFile = function (event, imgContainerId) {
    var image = document.getElementById(imgContainerId);
    image.src = URL.createObjectURL(event.target.files[0]);
  };
</script>
<script defer>
  var textarea = document.querySelector('textarea');

  textarea.addEventListener('keydown', autosize);
  function autosize() {
    var el = this;
    setTimeout(function () {
      el.style.cssText = 'height:auto; padding:0';
      el.style.cssText = 'height:' + el.scrollHeight + 'px';
    }, 0);
  }
</script>
<script>
  feather.replace({width: "8px"})
</script>
<script defer>

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
              clinicList=JSON.parse(data)
              selectClinic.setData(clinicList);
              alert(data)
            }
    );
  }
</script>
  <script defer src="<c:url value="/public/js/common/side-navbar.js"></c:url> " ></script>
</body>
</html>
