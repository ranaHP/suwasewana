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
  <script src="https://unpkg.com/feather-icons"></script>
  <link rel="stylesheet" href="<c:url value="/public/css/calander/calander.css "/>">
  <script src="<c:url value="/public/js/ClinicalOfficer/clinicAnnouncements.js"/>"></script>

</head>
<body>
<c:import url="/view/admin/partials/ClinicalOfficerSideNavbar.jsp"></c:import>
<div class="AC_main_Container">
  <div class="header">
    <div class="upper-title">SUWASEWANA</div>
    <div class="dashboard-name">Admin/Register/ClinicalOfficer</div>
  </div>
  <div class="c-db-container">
    <div class="row" style="width: 100%;">
      <form>
        <div class="row" style="align-items: center;justify-content: center;">
          <div class="form-group">
            <label for="aTitle">
              Clinic Name
            </label>
            <input type="text" name="name" id="aTitle12" autocomplete="off"
                   required/>
          </div>
          <div class="form-group">
            <label for="aTitle">
              &nbsp;
            </label>
            <button class="submitBtn " type="submit" > Search </button>
          </div>
        </div>
      </form>
    </div>
    <div class="form-container">
      <div class="left-col">
        <div class="row" >
          <form style="width: 100%;">
            <div class="row">
              <div class="form-group">
                <label for="aTitle">
                  Announctment Title
                </label>
                <input type="text" name="name" id="aTitle1" autocomplete="off"
                       required/>

              </div>
            </div>
            <div class="row">
              <div class="form-group">
                <label for="reason">
                  Announctment Description
                </label>
                <textarea rows="4" cols="50" type="text" placeholder="reason" name="reason"
                          id="reason"> Reason.... </textarea>
              </div>

            </div>
            <div class="row" style="display: flex;flex-wrap: wrap;justify-content: flex-start;">
              <div class="form-group" style="width: 250px;">
                <label for="aTitle">
                  Location
                </label>
                <input type="text" name="name" id="aTitle2" autocomplete="off"
                       required/>

              </div>
              <div class="form-group" style="width: 250px;">
                <label for="aTitle">
                  Date & Time
                </label>
                <input type="text" name="name" id="aTitle3" autocomplete="off"
                       required/>

              </div>
              <div class="form-group" style="width: 250px;">
                <label for="aTitle">
                  Duration
                </label>
                <input type="text" name="name" id="aTitle31" autocomplete="off"
                       required/>

              </div>
              <div class="form-group" style="width: 250px;">
                <label for="aTitle">
                  Conduct By
                </label>
                <input type="text" name="name" id="aTitle4" autocomplete="off"
                       required/>

              </div>
              <div class="form-group" style="width: 250px;">
                <label for="aTitle">
                  Max limit
                </label>
                <input type="text" name="name" id="aTitle5" autocomplete="off"
                       required/>

              </div>
            </div>

            <div class="row">
              <div class="form-group d-flex-a-i-end">

                <button class="submitBtn " type="submit" > Make Announctment</button>
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
                <label for="aTitle">
                  Target Peoples
                </label>
                <input type="text" name="name" id="aTitle" autocomplete="off"
                       required/>

              </div>
            </div>
            <div class="row">


            </div>


            <div class="row">
              <div class="form-group d-flex-a-i-end">
                <div class="image-upload-card-container">
                  <div class="image-upload-card">
                    <img id="proof2" width="100%" />
                    <input type="file" accept="image/*" name="file" id="proof2input"
                           onchange="loadFile(event, 'proof2')" style="display: none;">
                    <label for="proof2input" style="cursor: pointer;">Upload Image</label>
                  </div>
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
