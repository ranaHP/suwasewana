
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/Add-vaccine-details.css"/> "/>

    <%--    for popup style--%>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <%--    for popup script--%>
    <script src="<c:url value="/public/js/popup.js"/>"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>

</head>
<body id="mainContent">
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
                New Vaccine Type
            </div>
            <form onsubmit="return imageUpload();">
                <div class="body_container">
                    <div class="basic_content">
                        <div class="basic-title">1. Basic Infromation</div>

                        <div class="basic_body_contetnt">
                            <div class="basic_left">
                                <div class="left_row">
                                    <div class="left_row_left"><span>Name of the vaccine  </span></div>
                                    <div class="left_row_right"><input type="text" required  id="Name"
                                                                       onblur="validation.nameValidation(
                                                                           document.getElementById('Name').value,'LName');"
                                                                       onkeyup="validation.nameValidation(
                                                                           document.getElementById('Name').value,'LName');"
                                                                       style="margin-bottom: 2px;"
                                    >
                                        <span id="LName" style="font-size: 0.75em;color: #e33737;"></span>
                                    </div>

                                </div>
                                <div class="left_row">
                                    <div class="left_row_left"><span> Country  </span></div>
                                    <div class="left_row_right"><input type="text"  id="country"
                                                                       onblur="validation.nameValidation(
                                                                           document.getElementById('country').value,'Lcountry');"
                                                                       onkeyup="validation.nameValidation(
                                                                           document.getElementById('country').value,'Lcountry');"
                                                                       style="margin-bottom: 2px;">
                                        <span id="Lcountry" style="font-size: 0.75em;color: #e33737;"></span>
                                    </div>


                                </div>
                                <div class="left_row">

                                    <div class="left_row_left"><span>Recommended for    </span></div>
                                    <div class="left_row_right"><input type="text" id="recomanded_for"
                                                                       onblur="validation.nameValidation(
                                                                           document.getElementById('recomanded_for').value,'Lrecomanded_for');"
                                                                       onkeyup="validation.nameValidation(
                                                                           document.getElementById('recomanded_for').value,'Lrecomanded_for');"
                                                                       style="margin-bottom: 2px;"
                                    >
                                        <span id="Lrecomanded_for" style="font-size: 0.75em;color: #e33737;"></span>
                                    </div>

                                </div>
                                <div class="left_row">
                                    <div class="left_row_left"><span>Date of issue</span></div>
                                    <div class="left_row_right"><input type="text" id="date"
                                                                       onblur="validation.nameValidation(
                                                                           document.getElementById('date').value,'Ldate');"
                                                                       onkeyup="validation.nameValidation(
                                                                           document.getElementById('date').value,'Ldate');"
                                                                       style="margin-bottom: 2px;"
                                    >
                                        <span id="Ldate" style="font-size: 0.75em;color: #e33737;"></span>
                                    </div>
                                    <br>

                                </div>
                            </div>
                            <div class="basic-right">
                                <div class="image-upload-card-container">
                                    <div class="image-upload-card">
                                        <img id="proof1" width="100%" />
                                        <input type="file" accept="image/*" name="file" id="proof1input"
                                               onchange="loadFile(event , 'proof1')" style="display: none;">

                                        <label for="proof1input" style="cursor: pointer;">Upload Image</label>
                                        <span class="error" id="upload_empty"></span>
                                    </div>

                                </div>
                            </div>
                        </div>




                    </div>
                    <div class="advance_content">
                        <div class="basic-title"> 2. Advance Information</div>
                        <div class="advance_row">
                            <span>Booster Dose : </span><br>
                            <div class="row_textarea" contenteditable="true" id="status"></div>
                        </div>
                        <div class="advance_row">
                            <span>Dosage : </span><br>
                            <div class="row_textarea" contenteditable="true" id="dosage"></div>
                        </div>
                        <div class="advance_row">
                            <span>Common side effects : </span><br>
                            <div class="row_textarea" contenteditable="true" id="side_effects" ></div>
                        </div>
                        <div class="advance_row">
                            <span>How it works : </span><br>
                            <div class="row_textarea" contenteditable="true" id="How_work"></div>
                        </div>
                        <div class="advance_row">
                            <span>How well it works : </span><br>
                            <div class="row_textarea" contenteditable="true" id="How_well_work"></div>
                        </div>
                        <button type="submit" id="btn_done">Done</button>
                    </div>
                </div>
            </form>

        </div>
    </div>


</div>
<script defer>
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    let validation = new FormInputValidation();
</script>
<script>
    function clearData(){
        document.getElementById("Name").value="";
        document.getElementById("country").value="";
        document.getElementById("recomanded_for").value="";
        document.getElementById("date").value="";
        document.getElementById("status").innerText="";
        document.getElementById("dosage").innerText="";
        document.getElementById("side_effects").innerText="";
        document.getElementById("How_work").innerText="";
        document.getElementById("How_well_work").innerText="";
        document.getElementById("upload_empty").innerText="";
        document.getElementById("proof1").src=myUrl+"/public/images/logo/placeholder.png";
        return false;
    }
    function Submit_vaccin_data(imgarray){
        let reqData =
            {
                Name: document.getElementById("Name").value,
                Country: document.getElementById("country").value,
                Recommended_for: document.getElementById("recomanded_for").value,
                Date:document.getElementById("date").value,
                image:imgarray[0],
                status: document.getElementById("status").innerText,
                dosage: document.getElementById("dosage").innerText,
                side_effects: document.getElementById("side_effects").innerText,
                how_work: document.getElementById("How_work").innerText,
                How_Well_work:document.getElementById("How_well_work").innerText,

            };

        // alert()
        $.post(myUrl+"/admin-register-controller/vaccine",
            reqData,
            function (data, status) {

                if (data.includes("success")) {

                    popup.showRegistrationSuccessMessageForVaccine({
                        status: 'success',
                        message: 'Successfully Added!'
                    });
                    clearData();
                } else {

                    popup.showRegistrationSuccessMessageForVaccine({
                        status: 'fail',
                        message: 'Vaccine insertion Fails !',
                        data: data
                    });
                }
            }
        );
        // alert();

        return false;
    }
</script>
<script>
    var loadFile = function (event, imgContainerId) {
        var image = document.getElementById(imgContainerId);
        image.src = URL.createObjectURL(event.target.files[0]);
    };

    function imageUpload() {

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



        if(imageNames.length!=0){
            $.ajax({
                url: myUrl+'/vaccineFileUploadServlet',
                type: 'post',
                data: fd,
                contentType: false,
                processData: false,
                success: function (response) {
                    if (response != 0) {

                        Submit_vaccin_data(imageNames);
                    } else {

                    }
                },
            });
        }
        else {

            document.getElementById("upload_empty").innerText="Need to upload a image";

        }
        return false;
    }
</script>
<script>
    var options = ['ul','div'];
    var subOptions = {
        'ul':['li'],
        'div':['div','span', 'p']
    };

    function asd(){

    }
</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>

</html>