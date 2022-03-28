<%--
  Created by IntelliJ IDEA.
  User: hansana
  Date: 10/15/2021
  Time: 3:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="<c:url value="/public/js/inputValidation.js"/>"></script>

    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/>"/>

    <!-- for style sheet link  -->
    <link href="<c:url value="/public/css/user/_dashboard_complain.css"/>" rel="stylesheet"/>

    <!-- for commen style  sheet link  -->
    <link href="<c:url value="/public/css/user/_commen.css"/>" rel="stylesheet"/>

    <!-- for feather icon -->
    <script src="https://unpkg.com/feather-icons"></script>

    <!-- location js -->
    <script src="<c:url value="/public/js/locationSelectGenarator.js"/>"></script>

    <!-- moh list  -->
    <script src="<c:url value="/public/js/MOHSelectGenarator.js"/>"></script>

    <%--    for popup style--%>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <%--    for popup script--%>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
    <script src="<c:url value="/public/js/complain.js"/>"></script>
    <script src="<c:url value="/public/js/navbar.js"/>"></script>
    <script src="<c:url value="/public/js/loginLogout.js"/>"></script>

    <title>Complain</title>
</head>
<body>
<!-- main container -->
<div class="container"
     style="display: flex;flex-direction: column; justify-content: space-between;min-height: 100vh;">
    <!-- hero banner -->
    <section class="hero-banner-main-header-container">
        <div class="mypopup" id="popup" style="display: none;"></div>
        <!-- for header -->
        <div class="user-main-header-container">
            <div class="main-header">
                <div class="logo">
                    <img src="<c:url value="/public/images/logo.png "/>" alt="logo" width="100%"/>
                </div>
                <div class="navbar-container">
                    <ul class="navbar">
                        <script> let navs =  new Navbar(); navs.showHeaderNavItems("navbar"); </script>
                    </ul>
                </div>
                <div class="login-register-container">
                    <div class="language">
                        <span> සිංහල </span>
                        <img src="<c:url value="/public/images/sri-lanka.png "/>" alt="sri lanakan flag" width="100%">
                    </div>
                    <script>
                        let loginRegsiter = new LoginLogout(); loginRegsiter.showLoginLogoutItems("login-register-container")
                    </script>
                </div>
            </div>
        </div>
        <!-- register form -->
    </section>
    <!-- this for latest announcements -->

    <section>
        <div class="dashboard-container">
            <div class="left-dashboard">
                <div class="dashboard-profile-details">
                    <img src="<c:url value="/public/images/avatar.png"/>" width="90px" />
                    <div class="profile-name">
                        Hansana Ranaweera
                    </div>
                    <div class="profile-location">
                        Akuressa
                    </div>
                    <div class="moh-area">
                        Matara MOH
                    </div>
                </div>
                <div class="dashboard-icon-set">

                    <div class="dash-tab">
                        <div class="dash-icon" onclick="dashboard()">

                            <img src="<c:url value="/public/images/icons/grid.svg"/>" width="20px" />
                            <!-- <object data="images/icons/grid.svg" width="20px" height="20px" style="color: brown;"> </object> -->
                        </div>
                        <div class="dash-title">
                            Dashboard
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="Diseases()">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Diseases
                        </div>
                    </div>
                    <div class="dash-tab" >
                        <div class="dash-icon" onclick="Announcement()">
                            <img src="<c:url value="/public/images/icons/volume-2.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Announcement
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="Clinic()">
                            <img src="<c:url value="/public/images/icons/layers.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Clinic
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="Complainss()">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Complain
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="Appoiment()">
                            <img src="<c:url value="/public/images/icons/calendar.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Appoiment
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="vaccine()">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
                        </div>

                        <div class="dash-title">
                            vaccine
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="vaccinetypesView()">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
                        </div>

                        <div class="dash-title">
                            vaccine types view
                        </div>
                    </div>

                </div>
            </div>
            <div class="right-dashboard">
                <div class="dashboard-page-title">
                    Complaints
                    <div class="dashboard-sub-title">
                        SUWASEWANA/COMPLAINT
                    </div>
                </div>

                <div class="dashboard-container">
                    <div class="dashboard-page-sub-title">
                        Complaints History
                    </div>
                    <form class="previous-form" id="search_cType_Title" onsubmit="return searchComplain();">
                        <div class="form-group">
                            <label for="cTitleSearch">
                                Complaint Title
                            </label>
                            <input type="text" name="name" id="cTitleSearch" autocomplete="off"
                            onfocus="document.getElementById('cTitleSearch').value='';"
                            />

                        </div>

                        <div class="form-group">
                            <label for="allComplaintsTypeSearch">
                                Complaints Type
                            </label>
                            <input id="ComplaintsTypeSearch" type="text" list="allComplaintsTypeSearch"
                                   name="ComplaintsTypeSearch" autocomplete="off"
                                   onclick="document.getElementById('ComplaintsTypeSearch').value=''";
                            >
                            <datalist id="allComplaintsTypeSearch">
                                <option value="Mahapola" option=" Mahapola"></option>
                            </datalist>
                        </div>

                        <div class="form-group d-flex-a-i-end">
                            <label>
                                &nbsp;
                            </label>
                            <button type="submit" class="submitBtn "> Search Complaint</button>
                        </div>
                    </form>
                    <div class="row previous-complaint-list" id="previous-complaint-list" style="justify-content: unset">

                    </div>
                </div>


























                <div class="dashboard-container">
                    <div class="dashboard-page-sub-title">
                        Make a Complaint
                    </div>
                    <div class="make-complaint-form">
                        <form id="New_Complain" onsubmit="return checkValidation();" method="post">
                            <div class="row">
                                <div class="form-group">
                                    <label for="cTitle">
                                        Complaint Title
                                    </label>
                                    <input type="text" name="name" id="cTitle" autocomplete="off"
                                           onkeydown="validation.checklength(
                                           document.getElementById('cTitle').value,
                                           'ecTitle',10);"
                                           onblur="validation.checklength(
                                           document.getElementById('cTitle').value,
                                           'ecTitle',10);"
                                           onfocus="validation.removeerror('ecTitle');"
                                    />
                                    <label id="ecTitle" style="color:#e90505ba"></label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="complaintType">
                                        Complaint Type
                                    </label>
                                    <input id="complaintType" type="text" list="allcomplaintType"
                                           name="complaintType" autocomplete="off"
                                        onblur="validation.selectCheck('complaintType','eallcomplaintType')";
                                           onchange="validation.selectCheck('complaintType','eallcomplaintType')"
                                           onclick="document.getElementById('complaintType').value=''";
                                    >
                                    <datalist id="allcomplaintType">
                                        <option value="Mahapola" option=" Mahapola"></option>
                                        <option value="Mahapola" option=" Mahapola"></option>
                                    </datalist>
                                    <label id="eallcomplaintType" style="color:#e90505ba"></label>
                                </div>
                                <div class="form-group">
                                    <label for="uDetailsType">
                                        User Details Type
                                    </label>
                                    <input id="uDetailsType" type="text" list="alluDetailsType" name="alluDetailsType" autocomplete="off"
                                           onblur="validation.selectCheck('uDetailsType','euDetailsType')";
                                           onchange="validation.selectCheck('uDetailsType','euDetailsType')";
                                           onclick="document.getElementById('uDetailsType').value=''";
                                    >
                                    <datalist id="alluDetailsType">
                                        <option id="1" name="With Details" value="With Details" option="With Details"></option>
                                        <option id="0" name="Anonymous" value="Anonymous" option="Anonymous"></option>
                                    </datalist>
                                    <label id="euDetailsType" style="color:#e90505ba"></label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="uDetailsType">
                                        MOH Area
                                    </label>
                                    <input id="MOHArea" type="text" list="allMOHArea" name="allMOHArea"  autocomplete="off"

                                           onchange="fillMOH('MOHArea');
                                           validation.selectCheck('MOHArea','eMOHArea');"
                                           onclick="document.getElementById('MOHArea').value='';
                                                    fillMOH('MOHArea');"
                                           onblur="validation.selectCheck('MOHArea','eMOHArea');"
                                     >
                                    <datalist id="allMOHArea">
                                    </datalist>
                                    <label id="eMOHArea" style="color:#e90505ba"></label>
                                </div>
                                <div class="form-group">
                                    <label for="phi">
                                        Your Area's PHI Name
                                    </label>
                                    <input id="phi" type="text" list="allphi" name="allphi" autocomplete="off"
                                           onblur="validation.selectCheck('phi','ephi')";
                                           onchange="validation.selectCheck('phi','ephi')"
                                           onclick="document.getElementById('phi').value=''";
                                           onfocus="document.getElementById('ephi').innerText='';"
                                    >
                                    <datalist id="allphi">
<%--                                        <option value="Plz select Your MOH Area" option="Plz select Your MOH Area" readonly></option>--%>
                                    </datalist>
                                    <label id="ephi" style="color:#e90505ba"></label>
                                </div>

                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <label for="reason">
                                        Description
                                    </label>
                                    <textarea rows="4" cols="50" type="text" placeholder="deascription"
                                              name="reason" id="reason"
                                              onkeydown="validation.checklength(
                                           document.getElementById('reason').value,
                                           'ereason',10);"
                                              onblur="validation.checklength(
                                           document.getElementById('reason').value,
                                           'ereason',10);"
                                              onfocus="validation.removeerror('ereason');"
                                    ></textarea>
                                    <label id="ereason" style="color:#e90505ba"></label>
                                </div>

                            </div>
                            <div class="row ">
                                <div class="image-upload-card-list-container">
                                    <div class="image-upload-card-container">
                                        <div class="image-upload-card">
                                            <img id="proof1" width="100%" />
                                            <input type="file" accept="image/*" name="file" id="proof1input"
                                                   onchange="loadFile(event , 'proof1')" style="display: none;">

                                            <label for="proof1input" style="cursor: pointer;">Upload Image</label>
                                        </div>
                                    </div>
                                    <div class="image-upload-card-container">
                                        <div class="image-upload-card">
                                            <img id="proof2" width="100%" />
                                            <input type="file" accept="image/*" name="file" id="proof2input"
                                                   onchange="loadFile(event, 'proof2')" style="display: none;">
                                            <label for="proof2input" style="cursor: pointer;">Upload Image</label>
                                        </div>
                                    </div>
                                    <div class="image-upload-card-container">
                                        <div class="image-upload-card">
                                            <img id="proof3" width="100%" />
                                            <input type="file" accept="image/*" name="file" id="proof3input"
                                                   onchange="loadFile(event, 'proof3')" style="display: none;">
                                            <label for="proof3input" style="cursor: pointer;">Upload Image</label>
                                        </div>
                                    </div>
<%--                                    <button onclick="imageUpload();"> add pic</button>--%>

                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group d-flex-a-i-end">
                                    <button type="submit" class="submitBtn "> Make Complaint</button>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="main-footer">
        <div class="first-row">
            <img src="<c:url value="/public/images/logo.png "/>" alt="logo" width="45px"/>

            <div class="navbar-container">
                <ul class="navbar navbar1">
                    <script> let navs1 =  new Navbar(); navs.showHeaderNavItems("navbar1"); </script>
                </ul>
            </div>
        </div>
        <div class="second-row">
            © 2021 SUWASEWANA.LK | All Right Reserved
        </div>
    </div>

</div>




<script>
    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    // for validate inputs
    function checkValidation(){

        var phiObj = document.getElementById("phi");
        var datalist = document.getElementById(phiObj.getAttribute("list"));
        if(datalist.options.namedItem(phiObj.value)){
            PId=(datalist.options.namedItem(phiObj.value).id);
        }


        if( validation.checklength(document.getElementById('cTitle').value,'ecTitle',10) &&
            validation.selectCheck('complaintType','eallcomplaintType') &&
            validation.selectCheck('uDetailsType','euDetailsType') &&
            validation.selectCheck('MOHArea','eMOHArea') &&
            validation.selectCheck('phi','ephi')&&
            validation.checklength(document.getElementById('reason').value,'ereason',10)&&
            PId!=0
        ){
            // console.log("correct");
            imageUpload();
        }
        else {
            validation.checklength(document.getElementById('cTitle').value,'ecTitle',10);
            validation.selectCheck('complaintType','eallcomplaintType');
            validation.selectCheck('uDetailsType','euDetailsType');
            validation.selectCheck('MOHArea','eMOHArea');
            validation.selectCheck('phi','ephi');
            validation.checklength(document.getElementById('reason').value,'ereason',10);
            if(PId==0){
                document.getElementById('ephi').innerText="Pleace select Another near MOH Area";
            }
            // console.log("incorrect");


            // alert();

        }

        return false;
    }
</script>


<%--image upload--%>
<script>
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
        if ($('#proof2input')[0].files[0]) {
            fd.append('file', $('#proof2input')[0].files[0]);
            let name = new Date().toString().split(" ");
            let url2 = (name[2] + name[3] + name[4] + name[5]).replaceAll(":", "").replaceAll("+", "") +
                Math.floor(10000 + Math.random() * 10000) + "." +
                $('#proof2input')[0].files[0].name.split(".")[$('#proof2input')[0].files[0].name.split(".").length - 1];
            imageNames.push(url2);

        }
        if ($('#proof3input')[0].files[0]) {
            fd.append('file', $('#proof3input')[0].files[0]);
            let name = new Date().toString().split(" ");
            let url3 = (name[2] + name[3] + name[4] + name[5]).replaceAll(":", "").replaceAll("+", "") +
                Math.floor(10000 + Math.random() * 10000) + "." +
                $('#proof3input')[0].files[0].name.split(".")[$('#proof3input')[0].files[0].name.split(".").length - 1];
            imageNames.push(url3);
        }

        imageNames.map((item, index) => {
            fd.append('ImageName' + (index + 1), item);
        })


        // console.log("image neames array "+imageNames);
        // console.log("image neames length "+imageNames.length);
        // alert();
        if(imageNames.length!=0){
            // console.log("inside upload img if")
            // alert();
            $.ajax({
                url: myUrl+'/fileuploadservlet',
                type: 'post',
                data: fd,
                contentType: false,
                processData: false,
                success: function (response) {
                    if (response != 0) {
                        // console.log("successfully image uploadedss ---- " +imageNames )
                        makeComplainwithimg(imageNames);
                    } else {
                        // console.log('file not uploaded');

                    }
                },
            });
        }
        else {
            // console.log("inside upload img else")
            makeComplains();
        }

        return false;
    }


    // reset inputs
    function resetfrom(){
        document.getElementById("cTitle").value="";
        document.getElementById("complaintType").value="";
        document.getElementById("uDetailsType").value="";
        document.getElementById("phi").value="";
        document.getElementById("MOHArea").value="";
        document.getElementById("proof1").src=myUrl+"/public/images/logo/placeholder.png";
        document.getElementById("proof2").src=myUrl+"/public/images/logo/placeholder.png";
        document.getElementById("proof3").src=myUrl+"/public/images/logo/placeholder.png";
    }
    <%--make complain--%>
    function makeComplains(){

        let url1 = " ";
        let url2 = " ";
        let url3 = " ";

        // take complaintype
        var CTypeObj = document.getElementById("complaintType");
        var datalist = document.getElementById(CTypeObj.getAttribute("list"));
        let ComplainType;
        let UserType;
        let PId;
        let MOHId;
        if(datalist.options.namedItem(CTypeObj.value)){
            ComplainType=(datalist.options.namedItem(CTypeObj.value).id);
        }

        // take usertype
        var UTypeObj = document.getElementById("uDetailsType");
        var datalist = document.getElementById(UTypeObj.getAttribute("list"));
        if(datalist.options.namedItem(UTypeObj.value)){
            UserType=(datalist.options.namedItem(UTypeObj.value).id);
        }

        // take phiID
        var phiObj = document.getElementById("phi");
        var datalist = document.getElementById(phiObj.getAttribute("list"));
        if(datalist.options.namedItem(phiObj.value)){
            PId=(datalist.options.namedItem(phiObj.value).id);
        }

        //take moh
        var mohObj = document.getElementById("MOHArea");
        var datalist = document.getElementById(mohObj.getAttribute("list"));
        if(datalist.options.namedItem(mohObj.value)){
            MOHId=(datalist.options.namedItem(mohObj.value).id);
        }



        let reqData =
            {
                cTitle: document.getElementById("cTitle").value,
                cType: ComplainType,
                uType: UserType,
                cPhi: PId,
                cReason: document.getElementById("reason").value,
                img1:url1,
                img2:url2,
                img3:url3,
                MOH:MOHId
            };
        $.post(myUrl+"/user-complain-controller/create",
            reqData,
            function (data, status) {
                // console.log(data.includes("success"))
                if (data.includes("success")) {
                    // console.log("successsss brooo")
                    popup.showAppointmentSuccessMessage({
                        status: 'success',
                        message: 'Complain Successfully Added!'
                    });
                    resetfrom();
                    getAllComplain();
                    document.getElementById('New_Complain').reset();
                } else {
                    // console.log("unsuccesssss brooo")
                    popup.showAppointmentSuccessMessage({
                        status: 'fail',
                        message: 'Complain Send Fail !',
                        data: data
                    });
                }
            }
        );
        return false;
    }
    // MAke complain without image
    function makeComplainwithimg(imageNames) {
        // console.log("make complain call");

        let url1 = (imageNames[0]==null ? " ":imageNames[0] );
        let url2 = (imageNames[1]==null ? " ":imageNames[1] );
        let url3 = (imageNames[2]==null ? " ":imageNames[2] );

        // let url1 = " ";
        // let url2 = " ";
        // let url3 = " ";

        // take complaintype
        var CTypeObj = document.getElementById("complaintType");
        var datalist = document.getElementById(CTypeObj.getAttribute("list"));
        let ComplainType;
        let UserType;
        let PId;
        let MOHId;
        if(datalist.options.namedItem(CTypeObj.value)){
             ComplainType=(datalist.options.namedItem(CTypeObj.value).id);
        }

        // take usertype
        var UTypeObj = document.getElementById("uDetailsType");
        var datalist = document.getElementById(UTypeObj.getAttribute("list"));
        if(datalist.options.namedItem(UTypeObj.value)){
            UserType=(datalist.options.namedItem(UTypeObj.value).id);
        }

        // take phiID
        var phiObj = document.getElementById("phi");
        var datalist = document.getElementById(phiObj.getAttribute("list"));
        if(datalist.options.namedItem(phiObj.value)){
            PId=(datalist.options.namedItem(phiObj.value).id);
        }

        //take moh
        var mohObj = document.getElementById("MOHArea");
        var datalist = document.getElementById(mohObj.getAttribute("list"));
        if(datalist.options.namedItem(mohObj.value)){
            MOHId=(datalist.options.namedItem(mohObj.value).id);
        }


        let reqData =
            {
                cTitle: document.getElementById("cTitle").value,
                cType: ComplainType,
                uType: UserType,
                cPhi: PId,
                cReason: document.getElementById("reason").value,
                img1:url1,
                img2:url2,
                img3:url3,
                MOH:MOHId
            };


        $.post(myUrl+"/user-complain-controller/create",
            reqData,
            function (data, status) {
                if (data.includes("success")) {
                    popup.showAppointmentSuccessMessage({
                        status: 'success',
                        message: 'Complain Successfully Added!'
                    });
                    resetfrom();
                    getAllComplain();
                } else {
                    popup.showAppointmentSuccessMessage({
                        status: 'fail',
                        message: 'Complain Send Fail !',
                        data: data
                    });
                }
            }
        );
        return false;
    }
</script>


<%--initialize--%>
<script>
    let validation = new FormInputValidation();
    let complain= new Complain('previous-complaint-list');
</script>


<%--popup--%>
<script defer>
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
        var loadFile = function (event, imgContainerId) {
        var image = document.getElementById(imgContainerId);
        image.src = URL.createObjectURL(event.target.files[0]);
    };
</script>


<%--for search--%>
<script>
    function searchComplain(){
        var ComplainTypeObj = document.getElementById("ComplaintsTypeSearch");
        var complaindatalist = document.getElementById(ComplainTypeObj.getAttribute("list"));
        let CType,Title;
        if(complaindatalist.options.namedItem(ComplainTypeObj.value)){
            CType=(complaindatalist.options.namedItem(ComplainTypeObj.value).id);
        }


        let searchItem = {
            Title : document.getElementById("cTitleSearch").value,
            complaintype: CType,
            nic:"199910910064"
        }
        let complainCardList = [];
        $.post(myUrl+"/user-complain-controller/search",
            searchItem,
            function (data, status) {
                // // console.log("unsuccesssss brooo "+data)
                complainCardList = JSON.parse(data);
                typedatalist=complainCardList;
                document.getElementById("previous-complaint-list").innerHTML = " ";
                complain.setData(complainCardList);
            }
        );
        return false;
    }
</script>


<script>
    // View images in complains
    function viewImg(url){
        console.log("Image can be view "+url)
        popup.viewImg(url)
    }
    getAllComplain();
    let typedatalist={};
    function getAllComplain() {
        let complainCardList = [];
        $.post(myUrl+"/user-complain-controller/view",
            {},
            function (data, status) {
                complainCardList = JSON.parse(data);
                typedatalist=complainCardList;
                document.getElementById("previous-complaint-list").innerHTML = " ";
                complain.setData(complainCardList);
            }
        );
    }

</script>


<%--script for take complain types--%>
<script >
    $.post(myUrl+"/user-complain-controller/",
        function (data, status) {
            let rs= JSON.parse(data);
            let complainType=document.getElementById("allcomplaintType");
            let searchcomplintype=document.getElementById("allComplaintsTypeSearch");
            complainType.innerHTML="";
            searchcomplintype.innerHTML="";
            rs.map((element) => {
                complainType.innerHTML+= '<option  id="'+element.CType+'" name="'+element.Type+'" value="' + element.Type +  '" option="' + element.Type +  '"></option>'
                searchcomplintype.innerHTML+='<option  id="'+element.CType+'" name="'+element.Type+'" value="' + element.Type +  '" option="' + element.Type +  '"></option>'
            })
        }
    );

<%--script for take MOH list--%>
    let mohDetails=[];
    $.post(myUrl+"/user-complain-controller/moh",
        function (data, status) {
            let rs= JSON.parse(data);
            this.mohDetails=rs;

            let MNames=document.getElementById("allMOHArea");
            MNames.innerHTML="";
            rs.map((element,index) => {
                MNames.innerHTML+= '<option  id="'+element.MId+'"  name="'+element.MName+'" value="' + element.MName +  '" option="' + element.MName +  '" ></option>'
            })
        }
    );

    function fillMOH(listid){

        var listObj = document.getElementById(listid);
         var datalist = document.getElementById(listObj.getAttribute("list"));
         if(datalist.options.namedItem(listObj.value)){
             let mohid=(datalist.options.namedItem(listObj.value).id);
             ViewPHI(mohid);
         }

    }





    // view phis in data list
    function ViewPHI(mid){
        $.post(myUrl+"/user-complain-controller/phi",
            function (data, status) {
                let rs= JSON.parse(data);
                let PNames=document.getElementById("allphi");
                PNames.innerHTML="";
                let i=0;
                rs.map((element) => {

                    if(element.mohId==mid){
                        i=1;
                        PNames.innerHTML+= '<option id="'+element.NIC+'" name="'+ element.full_name +'-'+element.assignCity+'"  value="'+ element.full_name +'-'+element.assignCity+'"   option="'+ element.full_name +' - '+element.assignCity+'" ></option>'
                    }
                })
                if(i==0){
                    PNames.innerHTML="";
                    PNames.innerHTML= '<option id="0" name="No PHI assigned yet" value="No PHI assigned yet" option="No PHI assigned yet"></option>'
                }
            }
        );
    }
    // side bar links
    function dashboard(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/");
    }

    function Diseases(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"diseases");
    }

    function Announcement(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"announcement");
    }

    function Clinic(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"clinic");
    }

    function Complainss(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"complain");
    }

    function Appoiment(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"appointment");
    }
    function vaccine(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"Register-for-vaccine");
    }

    function Edit(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/");
    }

    function vaccinetypesView(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"ViewVaccinesForUser");
    }

</script>

<script>
    feather.replace({ width: "20px" })
</script>
</body>
</html>
