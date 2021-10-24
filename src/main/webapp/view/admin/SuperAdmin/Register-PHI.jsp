<%--
  Created by IntelliJ IDEA.
  User: Akila
  Date: 10/17/2021
  Time: 1:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
    <title>Suwasewana</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/RegPHI.css "/>">
    <script src="<c:url value="/public/js/Admin/InputValidation.js "/>"></script>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <%--    for popup style--%>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <%--    for popup script--%>
    <script src="<c:url value="/public/js/popup.js"/>"></script>

    <c:import url="/view/admin/partials/AdminOfficerSideNavbar.jsp"></c:import>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <c:import url="/view/admin/partials/AdminOfficerSideNavbar.jsp"></c:import>
</head>
<body>
<div class="MR_main_Container">

    <div class="header">
        <div class="upper-title">SUWASEWANA</div>
        <div class="dashboard-name">Admin/Register/PHI</div>
    </div>

    <div class="MR_container">
        <div class="title">
            <span>Register PHI</span>
        </div>

        <form onsubmit="return imageUpload();">
            <div class="singal_row">
                <div class="form-item">
                    <input type="text" id="fullName" value="hash" name="fullName" autocomplete="off"
                           onclick="document.getElementById('fullName').value = '' "
                           onblur="validation.nameValidation(
                            document.getElementById('fullName').value,
                            'LfullName'
                        );"
                           onkeyup="validation.nameValidation(
                            document.getElementById('fullName').value,
                            'LfullName'
                        );"
                    >
                    <label for="fullName">Full Name</label>
                    <span class="error" id="LfullName"></span>
                </div>
            </div>
            <div class="multirow">
                <div class="milturow_left">
                    <div class="form-item">
                        <input type="text" id="NIC" value="980939449v" name="NIC" autocomplete="off"
                               onclick="document.getElementById('NIC').value = '' "
<%--                               onblur="validation.nicValidation(--%>
<%--                                document.getElementById('NIC'),--%>
<%--                                'LNIC')--%>
<%--                            ;"--%>
                        >
                        <label for="NIC">NIC</label>
                        <span class="error" id="LNIC"></span>
                    </div>
                </div>
                <div class="multirow_right">
                    <div class="form-item">
                        <input type="text" id="TpNo" value="0984744742"  autocomplete="off"
                               onclick="document.getElementById('TpNo').value = '' "
                               onkeyup="validation.mobileValidation(
                                document.getElementById('TpNo').value,
                                'LTpNo'
                            );"
                               onblur="validation.mobileValidation(
                                document.getElementById('TpNo').value,
                                'LTpNo'
                            );"
                        >
                        <label for="TpNo">Mobile No.</label>
                        <span class="error" id="LTpNo"></span>
                    </div>
                </div>
            </div>

            <div class="multirow" style="margin-top: 30px;">
                <div class="milturow_left" id="mohHeadDiv">
                    <div class="form-item" >
                        <input type="text" value="galle" id="MoHhead" name="MoHhead" autocomplete="off"
<%--                               onclick="document.getElementById('MoHhead').value = '' "--%>
                               onblur="validation.nameValidation(
                                document.getElementById('MoHhead').value,
                                'LMoHhead'
                            );"
                               onkeyup="validation.nameValidation(
                                document.getElementById('MoHhead').value,
                                'LMoHhead'
                            );"
                        >
                        <label for="MoHhead">City</label>
                        <span class="error" id="LMoHhead"></span>
                    </div>
                </div>
                <div class="multirow_right" >
                    <div class="form-item" >
                        <input type="text" value="galle" id="street" name="street" autocomplete="off"
<%--                               onclick="document.getElementById('street').value = '' "--%>
                               onblur="validation.nameValidation(
                                document.getElementById('street').value,
                                'Lstreet'
                            );"
                               onkeyup="validation.nameValidation(
                                document.getElementById('street').value,
                                'Lstreet'
                            );"
                        >
                        <label for="street">Street No</label>
                        <span class="error" id="Lstreet"></span>
                    </div>
                </div>

            </div>
            <div class="multirow">
                <div class="milturow_left" id="PHIState">
                    <div class="form-item" style=" width: 100%;">
                        <input type="text" id="State" value="galle" name="State" autocomplete="off"
                               onclick="document.getElementById('State').value = '' "
                               onblur="validation.nameValidation(
                                document.getElementById('State').value,
                                'LState'
                            );"
                               onkeyup="validation.nameValidation(
                                document.getElementById('State').value,
                                'LState'
                            );"
                        >
                        <label for="State">State</label>
                        <span class="error" id="LState"></span>
                    </div>
                </div>
                <div class="multirow_right" id="addcityDiv">
                    <label >MOH Area</label> <br>
                    <input class="SelectColordiv" id="MArea" type="text" style="outline: none;" list="AllMArea" name="AllMArea"
                           onclick="document.getElementById('MArea').value='';"
                           onblur="validation.SearchSelect(
                                    document.getElementById('MArea').value,
                                    'LMArea'
                                );"
                    >
                    <datalist id="AllMArea">
                    </datalist>
                    <button onclick="test();">test</button>
                    <br>
                    <span class="error" id="LMArea" style="margin-left: 5px" ></span>
                </div>
            </div>

            <div class="multirow" style="margin-top: 30px;">
                <div class="milturow_left" >
                    <div class="form-item" >
                        <input type="text" value="galle" id="Postalcode"  autocomplete="off"
                               onblur="validation.nameValidation(
                                document.getElementById('Postalcode').value,
                                'LPostalcode'
                            );"
                               onkeyup="validation.nameValidation(
                                document.getElementById('Postalcode').value,
                                'LPostalcode'
                            );"
                        >
                        <label for="MoHhead">Postalcode</label>
                        <span class="error" id="LPostalcode"></span>
                    </div>
                </div>
                <div class="multirow_right" >
                </div>

            </div>

            <div class="singal_row" style="margin-top: 20px">
                <div class="image-upload-card-list-container">
                    <div class="image-upload-card-container">
                        <div class="image-upload-card">
                            <img id="proof1" width="100%" />
                            <input type="file" accept="image/*" name="file" id="proof1input"
                                   onchange="loadFile(event , 'proof1')" style="display: none;">

                            <label for="proof1input" style="cursor: pointer;">Upload Image</label>
                        </div>
<%--                        <button onclick="imageUpload()">add</button>--%>
                    </div>


                </div>
            </div>
            <div class="status" id="post" onclick="document.getElementById('post').value = '' ">
                <label > PHI</label> <input type="checkbox">
                <label > RPHI</label> <input type="checkbox">
            </div>


            <div class="submit_btn">
                <button class="submit"> Register</button>
            </div>

        </form>
    </div>


</div>

<%--for image upload--%>
<script>
    function checkMOHid(){
        var MTypeObj = document.getElementById('MArea');
        var datalist = document.getElementById(MTypeObj.getAttribute("list"));
        if(datalist.options.namedItem(MTypeObj.value)){

            return (datalist.options.namedItem(MTypeObj.value).id);
        }
        else {
            return  0;
        }
    }
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


        console.log("image neames array "+imageNames);
        if(imageNames.length!=0){
            $.ajax({
                url: '/suwasewana_war/fileuploadservlet',
                type: 'post',
                data: fd,
                contentType: false,
                processData: false,
                success: function (response) {
                    if (response != 0) {
                        console.log("successfully image uploadedss ---- " +imageNames )
                        registerwithimage(imageNames);
                    } else {
                        console.log('file not uploaded');

                    }
                },
            });
        }
        else {
            console.log("no image selected")
            registerwithoutimage();
        }
        return false;
    }
</script>


<script defer>
    let validation = new FormInputValidation();

    function registerwithimage(imagearray) {
        let reqData =
            {
                full_name: document.getElementById("fullName").value,
                NIC: document.getElementById("NIC").value,
                mobile: document.getElementById("TpNo").value,
                Address:document.getElementById("TpNo").value,
                city: document.getElementById("MoHhead").value,
                District: document.getElementById("street").value,
                phi_post: document.getElementById("post").value,
            };
        console.log(reqData)
        console.log("with image " + imagearray[0])

        return false;
    }
    function registerwithoutimage() {
        console.log("without image")
        let reqData =
            {
                full_name: document.getElementById("fullName").value,
                NIC: document.getElementById("NIC").value,
                mobile: document.getElementById("TpNo").value,
                city: document.getElementById("MoHhead").value,
                street_no: document.getElementById("street").value,
                state: document.getElementById("State").value,
                c_officer_no: document.getElementById("MArea").value,
                phi_post: document.getElementById("post").value,
            };
        console.log(reqData)


        return false;
    }





</script>

<script defer>
    let mohDetails=[];
    $.post("/suwasewana_war/user-complain-controller/moh",
        function (data, status) {
            // console.log(data);
            let rs= JSON.parse(data);
            this.mohDetails=rs;
            // console.log(data);

            let MNames=document.getElementById("AllMArea");
            MNames.innerHTML="";
            rs.map((element,index) => {
                // console.log("moh"+element.MName)
                MNames.innerHTML+= '<option  id="'+element.MId+'"  name="'+element.MName+'" value="' + element.MName +  '" option="' + element.MName +  '" ></option>'
            })
        }
    );
</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
