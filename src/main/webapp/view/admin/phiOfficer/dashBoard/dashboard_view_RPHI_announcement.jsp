<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Suwasewana</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/public/css/partials/phiOfficer/dashBoard/view_RPHI_announcement.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/> "/>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="<c:url value="/public/js/PHIOfficer/view_RPHI_announcement.js"/> "></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <%--    side-nav-bar--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<body id="mainContent">
<c:import url="/view/admin/partials/PHIOfficerSideNavbar.jsp" />
<div class="container">
    <!-- suwasewana header -->
    <div class="header">
        <div class="upper-title">SUWASEWANA </div>
        <div class="dashboard-name">PHI/Dashboard/View announcements</div>
    </div>
    <div class="main-title">RPHI Announcement</div>
    <div class="cardselect">
        <div class="searchbar">
            <input id="post-date" placeholder="search by clinic date" list="AllMArea" name="AllMArea" autocomplete="off"

                   onclick="document.getElementById('post-date').value='';"
            >
            <datalist id="AllMArea">
            </datalist>
            <br>
            <span class="error" id="LMArea" style="margin-left: 5px" ></span>
            <button onclick="searchD()">Search</button>
        </div>
    </div>
    <!-- page title -->

    <!-- announcements container -->
    <div class="announcements-container" id="announcements-container">

    </div>
</div>
</div>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
<script defer>
    selectA()
  function selectA(){
      let selectA = new View_RPHI_announcement("announcements-container");

      let AListArray=[]

      // console.log(reqData)
      $.post("/test_war_exploded/createRPHI_Announcements/selectmohAnnouncemnt",
          // reqData,
          function(data1,status){
              // alert(data1)
              AListArray=JSON.parse(data1)
              // console.log(clinicListArray)
              selectA.setData(AListArray);

          }
      );
  }


</script>
<script defer>

    let mohDetails=[];
    $.post("/test_war_exploded/createRPHI_Announcements/selectA",
        function (data, status) {
            console.log(data);
            let rs= JSON.parse(data);
            this.mohDetails=rs;
            console.log(data);

            let MNames=document.getElementById("AllMArea");
            MNames.innerHTML="";
            rs.map((element,index) => {
                // console.log("moh"+element.MName)
                MNames.innerHTML+= '<option  id="'+element.announcement_id+'"  name="'+element.announcement_id+'" value="'+element.posted_date +  '" option="' +element.announcement_id +  '" ></option>'
            })
        }
    );

    // updateAStatus();
    // function updateAStatus(){
    //     $.post("/test_war_exploded/createRPHI_Announcements/updateAStatus",
    //         {},
    //         function (data, status) {
    //            if(data.includes("sucsess")){
    //                selectA()
    //            }
    //         }
    //     );
    // }
</script>
</body>
</html>