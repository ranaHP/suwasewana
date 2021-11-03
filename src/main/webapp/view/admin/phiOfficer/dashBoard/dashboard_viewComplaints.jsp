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
    <script  src="<c:url value="/public/js/PHIOfficer/viewComplaints.js"/> "></script>
    <title>Suwasewana</title>
    <%--    side nav bar styles--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

    <%--pop up styles--%>
    <link rel="stylesheet" href="<c:url value="/popup/common-popup.css"/> "/>
    <script src="<c:url value="/popup/verify-patient-details/script.js"></c:url> "></script>
    <script src="<c:url value="/popup/Message.js"></c:url> "></script>
</head>
<body id="mainContent">
  <c:import url="/view/admin/partials/PHIOfficerSideNavbar.jsp" />
<%--  <div class="popup-container" id="PopupContainer"></div>--%>
  <div class="containor">

      <div class="header">
          <div class="upper-title">SUWASEWANA </div>
          <div class="dashboard-name">PHI/Dashboard/View Complaints</div>
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
          let option= document.createElement('option');
          option.value=name;
          option.innerText=name;
          document.getElementById('select').appendChild(option);
      })
  </script>
  <script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
  <script>
      // let popup= new verify_patient_detail_popup('PopupContainer',{ name : 'hansana' ,
      //     age: 23 ,
      //     NIC: '199910910064',
      //     Address:'Ihalapalukandewa,   Nanneriya road,  Galgamuwa',
      //     province:"Kurunagala",
      //     city:"Galgamuwa",
      //     diseas:['corona','HIV']
      // })


  </script>
<script defer>
    // let popup= new require_message_popup('PopupContainer', "Do you need to send a massage <br>to complainer ?")
    let complaints=[{
        Title:"Unbearable stench from Heaven fame",
        Date:"9/16/2021",
        description:"The Roman withdrawal from Africa in 255 BC was the attempt by the Roman Republic to  the survivors of their expeditionary force to Carthaginia  Africa (in what is now eastern Tunisia) during the First Punic War force to  Africa (what is now eastern Tunisia) during the session.",
        Type:"Animal issue",
        Action:"No Action",
    },
        {
            Title:"Unbearable stench from Heaven fame",
            Date:"9/16/2021",
            description:"The Roman withdrawal from Africa in 255 BC was the attempt by the Roman Republic to  the survivors of their expeditionary force to Carthaginia  Africa (in what is now eastern Tunisia) during the First Punic War force to  Africa (what is now eastern Tunisia) during the session.",
            Type:"Animal issue",
            Action:"No Action",
        },
        {
            Title:"Unbearable stench from Heaven fame",
            Date:"9/16/2021",
            description:"The Roman withdrawal from Africa in 255 BC was the attempt by the Roman Republic to  the survivors of their expeditionary force to Carthaginia  Africa (in what is now eastern Tunisia) during the First Punic War force to  Africa (what is now eastern Tunisia) during the session.",
            Type:"Animal issue",
            Action:"No Action",
        },
        {
            Title:"Unbearable stench from Heaven fame",
            Date:"9/16/2021",
            description:"The Roman withdrawal from Africa in 255 BC was the attempt by the Roman Republic to  the survivors of their expeditionary force to Carthaginia  Africa (in what is now eastern Tunisia) during the First Punic War force to  Africa (what is now eastern Tunisia) during the session.",
            Type:"Animal issue",
            Action:"No Action",
        }
    ]
    let view_complain= new viewcomplain(complaints);
</script>

</body>
</body>
</html>
