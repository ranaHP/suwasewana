<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/public/css/partials/phiOfficer/dashBoard/_phi-dashboard-viewComplaints.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/> "/>
    <script src="https://unpkg.com/feather-icons"></script>
    <script defer src="<c:url value="/public/js/PHIOfficer/viewComplaints.js"/> "></script>

    <title>Suwasewana</title>
    <%--    side nav bar styles--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<body id="mainContent">
  <c:import url="/view/admin/partials/PHIOfficerSideNavbar.jsp" />
  <div class="containor">
      <div class="header">
          <div class="upper-title">SUWASEWANA </div>
          <div class="dashboard-name">PHI/Dashboard/View announcements</div>
      </div>
      <div class="content">
          <div class="left">
              <div class="search-section">
                  <select name="" id="select">
                      <option value="1">select the complaint type</option>
                  </select>
              </div>
              <div class="complain-section" id="complain-section">

              </div>
          </div>
      </div>
  </div>

  <script>
      complaints=["Environmental issues","Animal issues","Water related issue","Unhealthy foods related","Land issues","other"];
      complaints.map(name=>{
          let option= document.createElement('option')
          option.value=name
          option.innerText=name
          document.getElementById('select').appendChild(option)
      })
  </script>
  <script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
