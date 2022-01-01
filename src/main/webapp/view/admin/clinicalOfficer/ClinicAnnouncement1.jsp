<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Suwasewana</title>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
  <script src="<c:url value="/public/js/Admin/InputValidation.js "/>"></script>
  <%--    <script defer src="<c:url value="/public/js/Admin/view_MOH.js"></c:url> "></script>--%>
  <link rel="stylesheet" href="<c:url value="/public/css/Admin/announcements.css"/> "/>

  <%--    for popup style--%>
  <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
  <script src="<c:url value="/public/js/ClinicalOfficer/clinicVaccineAnnouncements.js"/>"></script>
  <%--    for popup script--%>
  <script src="<c:url value="/public/js/popup.js"/>"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://unpkg.com/feather-icons"></script>
  <style>
    @media only screen and (max-width: 320px ){
      .load{
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 140px;
      }
    }
  </style>

</head>
<body id="mainContent" onload="check()">
<c:import url="/view/admin/partials/ClinicalOfficerSideNavbar.jsp"/>
<div class="mypopup" id="popup" style="display: none;"></div>
<div class="Vaccin_main_Container">

  <div class="header">
    <div class="upper-title">SUWASEWANA</div>
    <div class="dashboard-name">Admin/Register/ClinicalOfficer</div>
  </div>
  <div class="body-content">
    <div class="MR_container">
      <div class="title">
        Vaccine clinic Announcement
      </div>
      <div class="seach_by_name" style="margin: 50px 0;">
        <form class="load">
          <div>
            <input id="CId" placeholder="search by clinic ID" list="AllMArea" name="AllMArea" autocomplete="off"
                   onclick="document.getElementById('CId').value='';"
<%--                   onblur="validation.SearchSelect(--%>
<%--                                    document.getElementById('CId').value,--%>
<%--                                    'LMArea'--%>
<%--                                );"--%>
            >
            <datalist id="AllMArea">
            </datalist>
            <br>
            <span class="error" id="LMArea" style="margin-left: 5px" ></span>
          </div>
         <div style="margin-top: 15px">
           <button type="submit" onclick="return view() ">Search the clinic</button>
           <button type="submit" onclick="return imageUpload() ">Create announcement</button>
         </div>
        </form>

      </div>
      <%--            <form >--%>
      <div class="body_container">
        <div class="basic_content">
<%--          <div class="basic-title">1. Basic Infromation</div>--%>

          <div class="basic_body_contetnt" id="form">
            <div class="basic_left">
              <div class="left_row">
                <div class="left_row_left"><span>clinic-title  </span></div>
                <div class="left_row_right"><input type="text" required  id="clinic-title"></div>

              </div>
              <div class="left_row">
                <div class="left_row_left"><span> description  </span></div>
                <div class="left_row_right"><input type="text" required id="description"></div>
              </div>

              <div class="left_row">
                <div class="left_row_left"><span> start_date_time  </span></div>
                <div class="left_row_right"><input type="text" required id="start_date_time"></div>
              </div>

              <div class="left_row">
                <div class="left_row_left"><span> duration  </span></div>
                <div class="left_row_right"><input type="text" required id="duration"></div>
              </div>
              <div class="left_row">
                <div class="left_row_left"><span>Location</span></div>
                <div class="left_row_right"><input type="text" id="Location" required></div>
              </div>
              <div class="left_row">
                <div class="left_row_left"><span> Target MOH</span></div>
                <div class="left_row_right"><input type="text" id="Target-MOH" required></div>
              </div>
              <div class="left_row">
                <div class="left_row_left"><span>  Target Peoples</span></div>
                <div class="left_row_right"><input type="text" id="Target-Peoples" required></div>
              </div>
<%--              <div class="left_row">--%>
<%--                <div class="left_row_left"><span> Max limit</span></div>--%>
<%--                <div class="left_row_right"><input type="text" id="Max-limit" required></div>--%>
<%--              </div>--%>

<%--              <div class="left_row">--%>
<%--                <div class="left_row_left"><span> Age limit</span></div>--%>
<%--                <div class="left_row_right"><input type="text" id="Age-limit" required></div>--%>
<%--              </div>--%>

<%--              <div class="left_row">--%>
<%--                <div class="left_row_left"><span> Vaccine name</span></div>--%>
<%--                <div class="left_row_right"><input type="text" id="Vaccine-name" required></div>--%>
<%--              </div>--%>
            </div>
            <div class="basic-right">
              <div class="left_row">
                <div class="left_row_left"><span> Max limit</span></div>
                <div class="left_row_right"><input type="text" id="Max-limit" required></div>
              </div>

              <div class="left_row">
                <div class="left_row_left"><span> Age limit</span></div>
                <div class="left_row_right"><input type="text" id="Age-limit" required></div>
              </div>

              <div class="left_row">
                <div class="left_row_left"><span> Vaccine name</span></div>
                <div class="left_row_right"><input type="text" id="Vaccine-name" required></div>
              </div>
              <div class="image-upload-card-container">
                <div class="image-upload-card" style="margin-bottom: 220px">
                  <img id="proof1" width="100%" />
                  <input type="file" accept="image/*" name="file" id="proof1input"
                         onchange="loadFile(event , 'proof1')" style="display: none;">

                  <label for="proof1input" style="cursor: pointer;">Upload Image</label>
                </div>
<%--                <div><button onclick="imageUpload()">Create announcement</button></div>--%>
<%--                                                          <button onclick="imageUpload()">add</button>--%>
              </div>
            </div>
          </div>
        </div>
      </div>
</body>
<script defer>
  let validation = new FormInputValidation();
  let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
  var loadFile = function (event, imgContainerId) {
    console.log("load file")
    var image = document.getElementById(imgContainerId);
    image.src = URL.createObjectURL(event.target.files[0]);
  };

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

            Vannouncement(imageNames)
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

  function Vannouncement(imagearray){
   let reqData ={
     title:document.getElementById("clinic-title").value,
     description:document.getElementById("description").value,
     image:imagearray[0],
     Vaccinename:document.getElementById("Vaccine-name").value,
     Maxlimit:document.getElementById("Max-limit").value,
     Location:document.getElementById("Location").value,
     TargetPeoples:document.getElementById("Target-Peoples").value,
     startdatetime:document.getElementById("start_date_time").value,
     duration:document.getElementById("duration").value,
     age_limit:document.getElementById("Age-limit").value,
     TargetMOH:document.getElementById("Target-MOH").value,
     CId:checkid(),

   };
   console.log(reqData)
    $.post("/test_war_exploded/clinicAnnouncementController/createVA",
            reqData,
            function(data,status){
              if(data.includes("sucsess")){
                // updateclinics()
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

  }
  let selectVclinics = new selectVacClinics("form");

  function view(){
    let clinicListArray=[]
    let reqData =
            {
              clinicID: document.getElementById("CId").value,
            };
    console.log(reqData)
    $.post("/test_war_exploded/create-clinic-controller/select-V-Clinics",
            reqData,
            function(data1,status){
               alert(data1)
              clinicListArray=JSON.parse(data1)
              // console.log(clinicListArray)
              selectVclinics.setData(clinicListArray);

            }
    );
    return false
  }



  function checkid(){
    // alert("check")
    var MTypeObj = document.getElementById('CId');
    var datalist = document.getElementById(MTypeObj.getAttribute("list"));
    if(datalist.options.namedItem(MTypeObj.value)){
     alert(datalist.options.namedItem(MTypeObj.value).id)
      return (datalist.options.namedItem(MTypeObj.value).id);
    }
    else {
      return  0;
    }
  }



</script>
<script>

 function check(){
   let mohDetails=[];
   $.post("/test_war_exploded/create-clinic-controller/VaccineClinicsView",
           function (data, status) {
             // console.log(data);
             let rs= JSON.parse(data);
             this.mohDetails=rs;
             // console.log(data);

             let MNames=document.getElementById("AllMArea");
             MNames.innerHTML="";
             rs.map((element,index) => {
               // console.log("moh"+element.MName)
               MNames.innerHTML+= '<option  id="'+element.vcs_id+'"  name="'+element.vcs_id+'" value="'+element.vcs_id +  '" option="' +element.vcs_id +  '" ></option>'
             })
           }
   );
   return false
 }

</script>
</html>