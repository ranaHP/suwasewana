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
<%--  <link rel="stylesheet" href="<c:url value="/public/css/Admin/Add-vaccine-details.css"/> "/>--%>
  <link rel="stylesheet" href="<c:url value="/public/css/Admin/announcements.css"/> "/>

  <%--    for popup style--%>
  <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
  <script src="<c:url value="/public/js/ClinicalOfficer/clinicAnnouncements.js"/>"></script>
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
        Normal clinic Announcement
      </div>
      <div class="seach_by_name" style="margin: 50px 0;">
        <form class="load">
          <div>
            <input id="clinicID" placeholder="search by clinic ID" list="AllMArea" name="AllMArea" autocomplete="off"
                   onclick="document.getElementById('clinicID').value='';"
                   onblur="validation.SearchSelect(
                                    document.getElementById('clinicID').value,
                                    'LMArea'
                                );"
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
                <div class="left_row_right"><input type="text" name="clinic-title" id="clinic-title" autocomplete="off"
                                                   required/></div>

              </div>
              <div class="left_row">
                <div class="left_row_left"><span> description  </span></div>
                <div class="left_row_right"><input type="text" placeholder="reason" autocomplete="off" name="description"
                                                      id="description">  </input></div>
              </div>

              <div class="left_row">
                <div class="left_row_left"><span> start_date_time  </span></div>
                <div class="left_row_right"><input type="text" name="date-time" id="date-time" autocomplete="off"
                                                   required/></div>
              </div>

              <div class="left_row">
                <div class="left_row_left"><span> duration  </span></div>
                <div class="left_row_right"><input type="text" name="duration" id="duration" autocomplete="off"
                                                   required/></div>
              </div>
              <div class="left_row">
                <div class="left_row_left"><span>Location</span></div>
                <div class="left_row_right"> <input type="text" name="location" id="location" autocomplete="off"
                                                    required/></div>
              </div>
              <div class="left_row">
                <div class="left_row_left"><span> Target MOH</span></div>
                <div class="left_row_right"><input type="text" name="target-MOH" id="target-MOH" autocomplete="off"
                                                   required/></div>
              </div>
              <div class="left_row">
                <div class="left_row_left"><span>  Target Peoples</span></div>
                <div class="left_row_right"><input type="text" name="patient" id="patient" autocomplete="off"
                                                   required/></div>
              </div>
<%--              <div class="left_row">--%>
<%--                <div class="left_row_left"><span> Max limit</span></div>--%>
<%--                <div class="left_row_right"> <input type="text" name="max-patient" id="max-patient" autocomplete="off"--%>
<%--                                                    required/></div>--%>
<%--              </div>--%>

<%--              <div class="left_row">--%>
<%--                <div class="left_row_left"><span> Disease</span></div>--%>
<%--                <div class="left_row_right"><input type="text" name="disease" id="disease" autocomplete="off"--%>
<%--                                                   required/></div>--%>
<%--              </div>--%>

<%--              <div class="left_row">--%>
<%--                <div class="left_row_left"><span> Conduct by</span></div>--%>
<%--                <div class="left_row_right"><input type="text" id="conduct" required></div>--%>
<%--              </div>--%>
            </div>
            <div class="basic-right">
<%--              <div class="left_row">--%>
<%--                <div class="left_row_left"><span>  Target Peoples</span></div>--%>
<%--                <div class="left_row_right"><input type="text" name="patient" id="patient" autocomplete="off"--%>
<%--                                                   required/></div>--%>
<%--              </div>--%>
              <div class="left_row">
                <div class="left_row_left"><span> Max limit</span></div>
                <div class="left_row_right"> <input type="text" name="max-patient" id="max-patient" autocomplete="off"
                                                    required/></div>
              </div>
              <div class="left_row">
                <div class="left_row_left"><span> Disease</span></div>
                <div class="left_row_right"><input type="text" name="disease" id="disease" autocomplete="off"
                                                   required/></div>
              </div>

              <div class="left_row">
                <div class="left_row_left"><span> Conduct by</span></div>
                <div class="left_row_right"><input type="text" id="conduct" required></div>
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
<%--  let validation = new FormInputValidation();--%>
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

function announcement(imagearray){
  let reqData =
          {
            clinicID:document.getElementById("clinicID").value,
            image:imagearray[0]
          };
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

function updateclinics(){
    // alert("update")
    let reqData =
        {
            clinicID:checkMOHid(),
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
            console.log(data)
            clinicList=JSON.parse(data)
            selectClinic.setData(clinicList);
          }
  );
  return false;
}



  function checkMOHid(){
    // alert("check")
    var MTypeObj = document.getElementById('clinicID');
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
  $.post("/test_war_exploded/create-clinic-controller/all-Clinics",
          function (data, status) {
            console.log(data);
            let rs= JSON.parse(data);
            this.mohDetails=rs;
            console.log(data);

            let MNames=document.getElementById("AllMArea");
            MNames.innerHTML="";
            rs.map((element,index) => {
              // console.log("moh"+element.MName)
              MNames.innerHTML+= '<option  id="'+element.clinicID+'"  name="'+element.clinicID+'" value="'+element.clinicID +  '" option="' +element.clinicID +  '" ></option>'
            })
          }
  );
}
</script>
</html>