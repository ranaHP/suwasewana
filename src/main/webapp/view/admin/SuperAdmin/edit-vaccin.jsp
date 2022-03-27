
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

    <%--    <script defer src="<c:url value="/public/js/Admin/view_MOH.js"></c:url> "></script>--%>
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/Add-vaccine-details.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/edit-vaccine-details.css"/> "/>

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
                Vaccine Type
            </div>
            <div class="seach_by_name" style="margin: 50px 0;">
                <form onsubmit="return LoadData();">
                    <input style="padding: 5px;" list="AllVaccineslist" name="AllVaccineslist" type="text" id="Search_V_input" placeholder="Search by vaccine name"
                           onclick="document.getElementById('Search_V_input').value='';  ";
                    >
                    <datalist id="AllVaccineslist" >

                    </datalist>
                    <button type="submit">Search</button>
                </form>

            </div>
            <%--            <form >--%>
            <div class="body_container">
                <div class="basic_content">
                    <div class="basic-title">1. Basic Infromation</div>

                    <div class="basic_body_contetnt">
                        <div class="basic_left">
                            <div class="left_row">
                                <div class="left_row_left"><span>Name of the vaccine  </span></div>
                                <div class="left_row_right"><input type="text" required  id="Name"></div>

                            </div>
                            <div class="left_row">
                                <div class="left_row_left"><span> Country  </span></div>
                                <div class="left_row_right"><input type="text" required id="country"></div>
                            </div>
                            <div class="left_row">
                                <div class="left_row_left"><span>Recommended for</span></div>
                                <div class="left_row_right"><input type="text" id="recomanded_for" required></div>
                            </div>
                            <div class="left_row">
                                <div class="left_row_left"><span>Date of issue</span></div>
                                <div class="left_row_right"><input type="text" id="date" required></div>
                            </div>
                        </div>
                        <div class="basic-right">
                            <div class="image-upload-card-container">
                                <div class="image-upload-card">
                                    <img id="proof1" width="100%"  />
                                    <input type="file" accept="image/*" name="file" id="proof1input"
                                           onchange="loadFile(event , 'proof1')" style="display: none;">

                                    <label for="proof1input" style="cursor: pointer;">Upload New one</label>
                                    <span class="error" id="upload_empty"></span>
                                </div>

                            </div>
                        </div>
                    </div>




                </div>
                <div class="advance_content">
                    <div class="basic-title"> 2. Advance Information</div>
                    <div class="advance_row">
                        <span>Status : </span><br>
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
                    <div class="btn_row">
                        <button class="btn_done_all" style="background-color: #f0ad4e;"
                                onclick="imageUpload();"
                        >Update</button>
                        <button class="btn_done_all" style="background-color: #d9534f;"
                                onclick="DelVaccine();"
                        >Delete</button>
                        <button class="btn_done_all" id="hide" onclick="sethide();" style="background-color: #ff7675;">Temporary Hide</button>
                        <button class="btn_done_all" id="unhide" onclick="setunhide();">Unhide</button>
                    </div>
                </div>
            </div>
            <%--            </form>--%>

        </div>
    </div>


</div>

<%--script for take vaccine types--%>
<script defer>
    let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    // console.log("url   = "+myUrl+"/admin-register-controller/All_vaccine_details/");
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    let rs;
    LoadVaccine();
    function LoadVaccine(){
        $.post(myUrl+"/admin-register-controller/All_vaccine_details/",

            function (data, status) {
                rs= JSON.parse(data);
                let vaccineType=document.getElementById("AllVaccineslist");
                vaccineType.innerHTML='';
                rs.map((element) => {
                    vaccineType.innerHTML+= '<option  id="'+element.ID+'" name="'+element.Name+'" value="' + element.Name +  '" option="' + element.Name +  '"></option>'
                })
            }
        );
    }

    function sethide(){
        console.log("call to hide");
        let VType;
        var VTypeObj = document.getElementById("Search_V_input");
        var datalist = document.getElementById(VTypeObj.getAttribute("list"));
        if(datalist.options.namedItem(VTypeObj.value)){
            VType=(datalist.options.namedItem(VTypeObj.value).id);
            let reqData ={V_Type:VType}
            $.post(myUrl+"/admin-register-controller/vaccinehide/",
                reqData,
                function (data, status) {
                    if (data.includes("success")) {
                        popup.showVaccineTypeUpdateSuccessMessage({
                            status: 'success',
                            message: 'Successfully Hided!'
                        });
                        LoadVaccine();
                        LoadData();

                        document.getElementById("unhide").disabled = false;
                        document.getElementById("hide").disabled = true;
                        document.getElementById("hide").style.background="#bdc3c7";
                        document.getElementById("unhide").style.background="#27AE60";

                    } else {
                        popup.showVaccineTypeUpdateSuccessMessage({
                            status: 'fail',
                            message: 'Ooops! Something went wrong.'
                        });
                    }
                }
            );

        }
    }
    function setunhide(){
        console.log("call to unhide")
        let VType;
        var VTypeObj = document.getElementById("Search_V_input");
        var datalist = document.getElementById(VTypeObj.getAttribute("list"));
        if(datalist.options.namedItem(VTypeObj.value)){
            VType=(datalist.options.namedItem(VTypeObj.value).id);
            let reqData ={V_Type:VType}
            $.post(myUrl+"/admin-register-controller/vaccineunhide/",
                reqData,
                function (data, status) {
                    if (data.includes("success")) {
                        console.log("successfull unhide")
                        popup.showVaccineTypeUpdateSuccessMessage({
                            status: 'success',
                            message: 'Successfully Unhided!'
                        });
                        LoadVaccine();
                        LoadData();

                        document.getElementById("unhide").disabled = true;
                        document.getElementById("hide").disabled = false;
                        document.getElementById("hide").style.background="#ff7675";
                        document.getElementById("unhide").style.background="#bdc3c7";

                    } else {
                        console.log("unsuccessfull unhide")
                        popup.showVaccineTypeUpdateSuccessMessage({
                            status: 'fail',
                            message: 'Ooops! Something went wrong.'
                        });
                    }
                }
            );

        }
    }


    function LoadData(){
        let VType;
        let flg=0;
        var VTypeObj = document.getElementById("Search_V_input");
        var datalist = document.getElementById(VTypeObj.getAttribute("list"));
        if(datalist.options.namedItem(VTypeObj.value)){
            VType=(datalist.options.namedItem(VTypeObj.value).id);
            rs.map((element) => {

                if(element.ID==VType){
                    flg=1
                    document.getElementById("Name").value=element.Name;
                    document.getElementById("country").value=element.Country;
                    document.getElementById("recomanded_for").value=element.Recommended_for;
                    document.getElementById("date").value=element.Date;
                    document.getElementById("status").innerText=element.status;
                    document.getElementById("dosage").innerText=element.dosage;
                    document.getElementById("side_effects").innerText=element.side_effects;
                    document.getElementById("How_work").innerText=element.how_work;
                    document.getElementById("How_well_work").innerText=element.How_Well_work;
                    document.getElementById("proof1").src=myUrl+"/public/images/vaccine/"+element.image;
                    if(element.view_status==1){
                        document.getElementById("unhide").disabled = true;
                        document.getElementById("hide").disabled = false;
                        document.getElementById("hide").style.background="#ff7675";
                        document.getElementById("unhide").style.background="#bdc3c7";
                    }
                    else{
                        document.getElementById("unhide").disabled = false;
                        document.getElementById("hide").disabled = true;
                        document.getElementById("hide").style.background="#bdc3c7";
                        document.getElementById("unhide").style.background="#27AE60";
                    }
                }

            })
        }
        if(flg==0){
            clearData();
        }
        // console.log("vaccine type "+VType);
        return false;
    }
    function DelVaccine(){
        let VType;
        var VTypeObj = document.getElementById("Search_V_input");
        var datalist = document.getElementById(VTypeObj.getAttribute("list"));
        if(datalist.options.namedItem(VTypeObj.value)){
            VType=(datalist.options.namedItem(VTypeObj.value).id);
            let reqData ={V_Type:VType}
            $.post(myUrl+"/admin-register-controller/delvaccine/",
                reqData,
                function (data, status) {
                    if (data.includes("success")) {
                        console.log("successsss brooo");
                        popup.showVaccineTypeUpdateSuccessMessage({
                            status: 'success',
                            message: 'Successfully Deleted!'
                        });
                        clearData();
                        LoadVaccine();
                    } else {
                        popup.showVaccineTypeUpdateSuccessMessage({
                            status: 'fail',
                            message: 'Ooops! Something went wrong.'
                        });
                    }
                }
            );

        }
    }

</script>


<script defer>
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
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
        document.getElementById("proof1").src=myUrl+"/public/images/logo/placeholder.png";
        document.getElementById("upload_empty").innerText="";
        return false;
    }
    function UpdateData(imgarray){

        let VType;
        var VTypeObj = document.getElementById("Search_V_input");
        var datalist = document.getElementById(VTypeObj.getAttribute("list"));
        if(datalist.options.namedItem(VTypeObj.value)) {
            VType = (datalist.options.namedItem(VTypeObj.value).id);

            let reqData =
                {
                    id:VType,
                    Name: document.getElementById("Name").value,
                    Country: document.getElementById("country").value,
                    Recommended_for: document.getElementById("recomanded_for").value,
                    Date:document.getElementById("date").value,
                    image:imgarray[0],
                    status: document.getElementById("status").innerText,
                    dosage: document.getElementById("dosage").innerText,
                    side_effects: document.getElementById("side_effects").innerText,
                    how_work: document.getElementById("How_work").innerText,
                    How_Well_work:document.getElementById("How_well_work").innerText
                };

            console.log("image name array - "+reqData.image);
            $.post(myUrl+"/admin-register-controller/updatevaccine",
                reqData,
                function (data, status) {

                    if (data.includes("success")) {

                        popup.showVaccineTypeUpdateSuccessMessage({
                            status: 'success',
                            message: 'Successfully Updated!'
                        });
                        clearData();
                    } else {

                        popup.showVaccineTypeUpdateSuccessMessage({
                            status: 'fail',
                            message: 'Ooops! Something went wrong.'
                        });
                    }
                }
            );

        }



        return false;
    }

    function UpdateDatawithoutImg(){

        let VType;
        var VTypeObj = document.getElementById("Search_V_input");
        var datalist = document.getElementById(VTypeObj.getAttribute("list"));
        if(datalist.options.namedItem(VTypeObj.value)) {
            VType = (datalist.options.namedItem(VTypeObj.value).id);

            let reqData =
                {
                    id:VType,
                    Name: document.getElementById("Name").value,
                    Country: document.getElementById("country").value,
                    Recommended_for: document.getElementById("recomanded_for").value,
                    Date:document.getElementById("date").value,
                    image:"",
                    status: document.getElementById("status").innerText,
                    dosage: document.getElementById("dosage").innerText,
                    side_effects: document.getElementById("side_effects").innerText,
                    how_work: document.getElementById("How_work").innerText,
                    How_Well_work:document.getElementById("How_well_work").innerText
                };

            console.log("image name array - "+reqData.image);
            $.post(myUrl+"/admin-register-controller/updatevaccinewithoutimg",
                reqData,
                function (data, status) {

                    if (data.includes("success")) {

                        popup.showVaccineTypeUpdateSuccessMessage({
                            status: 'success',
                            message: 'Successfully Unhided!'
                        });
                        clearData();
                    } else {

                        popup.showVaccineTypeUpdateSuccessMessage({
                            status: 'fail',
                            message: 'Ooops! Something went wrong.'
                        });
                    }
                }
            );

        }



        return false;
    }

</script>
<script>
    let image_name_1="";
    var loadFile = function (event, imgContainerId) {
        var image = document.getElementById(imgContainerId);
        image.src = URL.createObjectURL(event.target.files[0]);
        image_name_1=event.target.files[0].name;
        // console.log("show img name in load "+image_name_1);
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


        // console.log("image name in src "+document.getElementById("proof1").src.split('/')[document.getElementById("proof1").src.split('/').length-1].length)
        // let current_img=document.getElementById("proof1").src.split('/')[document.getElementById("proof1").src.split('/').length-1].length;
        if(imageNames.length!=0 ){
            $.ajax({
                url: myUrl+'/vaccineFileUploadServlet',
                type: 'post',
                data: fd,
                contentType: false,
                processData: false,
                success: function (response) {
                    if (response != 0) {
                        console.log("picture upload succesfully")
                        UpdateData(imageNames);
                    } else {
                        console.log("Picture upload error")
                    }
                },
            });
        }
        else {
            UpdateDatawithoutImg();
        }

        // return false;
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