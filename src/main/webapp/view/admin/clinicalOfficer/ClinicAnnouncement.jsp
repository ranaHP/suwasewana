<%--
  Created by IntelliJ IDEA.
  User: Akila
  Date: 10/17/2021
  Time: 2:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
  <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/createAnnouncement/ClinicAnnouncement.css"/>">

    <title>Title</title>

  <%--    for side navbar style--%>
  <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
<c:import url="/view/admin/partials/ClinicalOfficerSideNavbar.jsp "/>" />
<div class="AC_main_Container">
  <div class="header">
    <div class="upper-title">SUWASEWANA</div>
    <div class="dashboard-name">Admin/Register/ClinicalOfficer</div>
  </div>
  <form action="">
    <div class="AC_container">


      <div class="AC_Body_container">
        <div class="Container_left">
          <div class="LRow">
            <div class="form-item">
              <input type="text" id="fullName" autocomplete="off" required>
              <label for="fullName">Search by Name</label>
              <span class="error" id="LfullName"></span>
            </div>
          </div>
          <div class="LRow">
            <label for="">Title</label><br>
            <input type="text" name="" id="Title">
          </div>
          <div class="LRow mt5">
            <textarea rows='1' placeholder='Type Description here...'></textarea>
            <label for="" id="Des">Description</label>

          </div>
          <div class="LRow">

            <div class="DRow">
              <div class="DRow_Left">
                <div class="icon">
                  <i data-feather="circle"></i>
                </div>
                <div class="row_text">
                  <label for="">Location</label>
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
                  <label for="">Date & Time</label>
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
                  <label for="">Duration</label>
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
                  <label for="">Conduct By</label>
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
                  <label for="">Max limit</label>
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
            <label for="" id="target">Target Participant</label>
          </div>
          <div class="RRow">
            <div class="row ">
              <div class="image-upload-card-list-container">

                <div class="image-upload-card-container">
                  <div class="image-upload-card">
                    <img id="proof3" width="100%"/>
                    <input type="file" accept="image/*" name="image" id="proof3input"
                           onchange="loadFile(event, 'proof3')" style="display: none;">
                    <label id="upload-btn" for="proof3input" style="cursor: pointer;">Upload
                      Image</label>
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
      // for box-sizing other than "content-box" use:
      // el.style.cssText = '-moz-box-sizing:content-box';
      el.style.cssText = 'height:' + el.scrollHeight + 'px';
    }, 0);
  }
</script>
<script>
  feather.replace({width: "10px"})
</script>
  <script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
