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
    <div class="mypopup" id="popup" style="display: none;"></div>
    <div class="header">
        <div class="upper-title">SUWASEWANA</div>
        <div class="dashboard-name">Admin/Register/PHI</div>
    </div>

    <div class="MR_container">
        <div class="title">
            <span>Registration of Public Health Inspector</span>
        </div>
        <form onsubmit="return checkvalidation();">

            <div class="singal_row">
                <div class="form-item">
                    <input type="text" id="fullName" value="Akila"  name="fullName" autocomplete="off"
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
                        <input type="text" id="NIC" value="199910910064" name="NIC" autocomplete="off"
                               onclick="document.getElementById('NIC').value = '' ;"
                               onblur="validation.nicValidation(
                                    document.getElementById('NIC'),
                                    'LNIC')
                                ;"
                        >
                        <label for="NIC">NIC</label>
                        <span class="error" id="LNIC"></span>
                    </div>
                </div>
                <div class="multirow_right">
                    <div class="form-item">
                        <input type="text" id="TpNo" value="0713895000"  autocomplete="off"
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

                        <input id="District" class="SelectColordiv" style="outline: none; " type="text" list="alldistrict" name="district" required
                               autocomplete="off"
                               onblur="validation.selectCheck('District','LDistrict')";
                               onchange="validation.selectCheck('District','LDistrict');
                               checkDistrictidAndFillCity();"
                               onclick="document.getElementById('District').value='';
                                                    checkDistrictidAndFillCity();"
                        >
                        <datalist id="alldistrict">

                        </datalist>
                        <label for="District">District</label>
                        <div class="error" id="LDistrict" ></div>
                    </div>

                </div>
                <div class="multirow_right" >
                    <div class="form-item" >

                        <input id="City" class="SelectColordiv" style="outline: none; " type="text" list="allCity" name="allCity" required
                               autocomplete="off"
                               onblur="validation.selectCheck('City','LCity')";
                               onchange="validation.selectCheck('City','LCity');"
                               onclick="document.getElementById('City').value='';"
                        >
                        <datalist id="allCity">

                        </datalist>
                        <label for="City">City</label>
                        <span class="error" id="LCity"></span>
                    </div>
                </div>

            </div>
            <div class="multirow">
                <div class="milturow_left" id="PHIState">
                    <div class="form-item" style=" width: 100%;">
                        <label style=" width: 90%" style="margin-bottom:10px; " >MOH Area</label>
                        <input class="SelectColordiv" id="MArea" type="text" style="outline: none;" list="AllMArea" name="AllMArea"
                               onclick="document.getElementById('MArea').value='';"
                               onblur="validation.selectCheck('MArea','LMArea')";
                               onchange="validation.selectCheck('MArea','LMArea')";
                        >
                        <datalist id="AllMArea">
                        </datalist>

                        <span class="error" id="LMArea" style="margin-left: 5px" ></span>
                    </div>
                </div>
                <div class="multirow_right" id="addcityDiv">

                </div>
            </div>



            <div class="singal_row" style="margin-top: 20px">
                <div class="image-upload-card-list-container">
                    <div class="image-upload-card-container">
                        <div class="image-upload-card">
                            <img id="proof1" width="100%" style="margin-top: 10px"/>
                            <input type="file" accept="image/*" name="file" id="proof1input"
                                   onchange="loadFile(event , 'proof1')" style="display: none;">

                            <label for="proof1input" style="cursor: pointer;">Upload Image</label>
                        </div>
                        <%--                        <button onclick="imageUpload()">add</button>--%>
                    </div>
                </div>
            </div>
            <div class="status" id="post" onclick="document.getElementById('post').value = '' ">
                <label > PHI</label> <input type="radio" id="phi" name="post" value="PHI" checked>
                <label > RPHI</label>  <input type="radio" id="rphi" name="post" value="RPHI">
            </div>


            <div class="submit_btn">
                <button class="submit"> Register</button>
            </div>

        </form>

        <div class="bulck_registration_form"  >
            <style>

                .bulck_registration_form{
                    box-sizing: border-box;
                    padding: 20px;
                    width: 100%;
                    border: 1px solid #bdbdbd;
                    margin-top: 10px;
                    /*padding-left: 5px;*/
                    border-radius: 5px;
                    box-shadow: 1px 3px 6px rgba(0, 0, 0, 0.16);

                }
                table{
                    font-size: .9em;
                    width: 100%;
                    margin: auto;
                }
                th{
                    padding: 5px;
                    color: rgb(58, 58, 58);
                    font-size: .8em;
                    font-weight: 500;
                }
                .register_btn{
                    box-shadow: 1px 3px 5px rgba(0, 0, 0, 0.178);
                    background-color: #2108ff;
                    font-size: 1em;

                }
                .add-all-btn{
                    /*font-size: .8em;*/
                    box-shadow: 1px 3px 5px rgba(0, 0, 0, 0.178);
                    background-color: #2108ff;

                }
                .refresh-from-local{
                    /*font-size: .8em;*/
                    box-shadow: 1px 3px 5px rgba(0, 0, 0, 0.178);
                    background-color: white;
                    color: #343434;

                }
                .refresh-from-local:hover{
                    color: white;
                }
                td{
                    padding: 5px;
                    color: rgb(58, 58, 58);
                    font-size: .8em;
                    font-weight: 500;
                }
                table {
                    font-family: arial, sans-serif;
                    border-collapse: collapse;
                    width: 100%;
                }

                td, th {
                    border: 1px solid #dddddd;
                    text-align: left;
                    padding: 8px;
                }
            </style>

            <h5 style="color: #1d1b31;font-weight: 500;padding-bottom: 10px"> Bulk Registration of Public Health Inspector </h5>
            <hr>
            <br>
            <input type="file" id="file" style="display: none;">
            <label class="submit" for="file" style="cursor: pointer;">Upload PHI Data Set (CSV file)</label>

            <button class="submit add-all-btn" onclick="phiBluckAddition()" > Register All PHI</button>
            <button class=" submit refresh-from-local" onclick="makeTable()"> Refresh From LocalStorage</button>
            <table border="1" id="bulkAdditionTable">
                <tr>
                    <th>Full_name</th>
                    <th>NIC </th>
                    <th>Mobile</th>
                    <th>device_MAC</th>
                    <th>Address</th>
                    <th>City</th>
                    <th>District</th>
                    <th>phi_post</th>
                    <th>PostalCode</th>
                    <th>MohId </th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>


            </table>
        </div>

    </div>


</div>
<script defer>
    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    let validation = new FormInputValidation();
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    document.getElementById('file').onchange = function () {
        // console.log('asd')
        var file = this.files[0];

        var reader = new FileReader();
        reader.onload = function (progressEvent) {
            var lines = this.result.split('\n');
            let phi_data = [];
            for (var line = 1; line < lines.length; line++) {
                // console.log(lines[line].split(","));
                let temp = {
                    phi_Id: "",
                    full_name: lines[line].split(",")[0],
                    NIC: lines[line].split(",")[1],
                    mobile: lines[line].split(",")[2],
                    device_MAC: lines[line].split(",")[3],
                    Address: lines[line].split(",")[4],
                    City: lines[line].split(",")[5],
                    District: lines[line].split(",")[6],
                    phi_post: lines[line].split(",")[7],
                    login_status: "0",
                    password: "",
                    PostalCode: lines[line].split(",")[8],
                    mohId: lines[line].split(",")[9],
                    DP: "",
                    suspended_time: "",
                    databse_support: "no"
                }
                phi_data.push(temp);


            }
            localStorage.setItem("phiTemparyData", JSON.stringify(phi_data));
            makeTable()
        };
        reader.readAsText(file);
    };

    function phiBluckAddition() {
        if (localStorage.getItem("phiTemparyData") == "") {
            return;
        }
        let phi_data_set = JSON.parse(localStorage.getItem("phiTemparyData"));
        let phi_temp = phi_data_set;
        phi_data_set.map((phi, index) => {

            let reqData =
                {
                    full_name: phi.full_name ,
                    NIC: phi.NIC,
                    mobile:phi.mobile ,
                    Address: phi.Address,
                    city: phi.City,
                    District: phi.District,
                    phi_post: "PHI",
                    postalCode: phi.PostalCode,
                    MOHArea: phi.mohId,
                    DP:""
                };

            console.log(reqData)
            $.post(myUrl+ "/admin-register-controller/phi",
                reqData,
                function (data, status) {
                    console.log(data)
                    if (data.includes("success")) {
                        document.getElementById("bpds"+index).innerHTML = "✅ Registered ";
                        phi_temp[index].databse_support = "✅ Registered ";
                    } else {
                        document.getElementById("bpds"+index).innerHTML = "❌ " +data ;
                        phi_temp[index].databse_support = "❌ " +data ;
                    }
                }
            );

        })
        localStorage.removeItem("phiTemparyData");
        console.log(phi_data_set)
        console.log(phi_temp)
        localStorage.setItem("phiTemparyData" , JSON.stringify(phi_temp))
    }
    function makeTable(){
        if (localStorage.getItem("phiTemparyData") == "") {
            return;
        }
        let phi_data_set = JSON.parse(localStorage.getItem("phiTemparyData"));
        phi_data_set.map((temp, index) => {
            document.getElementById("bulkAdditionTable").innerHTML += `
                        <tr>
                    <td id="bpdf` +index + `" >`+ temp.full_name +`</td>
                     <td id="bpdnic` +index + `" >`+ temp.NIC +`</td>
                     <td id="bpdfmobile` +index + `">`+ temp.mobile +`</td>
                     <td id="bpddm` +index + `">`+ temp.device_MAC +`</td>
                     <td id="bpda` +index + `">`+ temp.Address+`</td>
                     <td id="bpdc` +index + `">`+ temp.City+`</td>
                     <td id="bpdd` +index + `">`+ temp.District+`</td>
                     <td id="bpdpp` +index + `">`+ temp.phi_Id +`</td>
                     <td id="bpdpc` +index + `">`+ temp.PostalCode+`</td>
                     <td id="bpdmoh` +index + `">`+ temp.mohId+`</td>
                     <td id="bpds` +index + `">`+ (temp.databse_support == "no"  ? "Not Registered" : "Registered ✅") +`</td>
                     <td id="bpda` +index + `">
                         <button class="submit register_btn"> Register </button>
                     </td>
                </tr>`;
        })
    }
</script>
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
    function checkDistrictidAndFillCity(){
        var MTypeObj = document.getElementById('District');
        var datalist = document.getElementById(MTypeObj.getAttribute("list"));
        if(datalist.options.namedItem(MTypeObj.value)){

            viewCity( (datalist.options.namedItem(MTypeObj.value).id));
        }

    }
    function datalistId(feild){
        var MTypeObj = document.getElementById(feild);
        var datalist = document.getElementById(MTypeObj.getAttribute("list"));
        if(datalist.options.namedItem(MTypeObj.value)){
            return ( (datalist.options.namedItem(MTypeObj.value).id));
        }
    }

    function viewCity(Did){
        $.post(myUrl + "/user-complain-controller/city",
            function (data, status) {
                // console.log(data);
                let rs= JSON.parse(data);
                this.mohDetails=rs;
                // console.log(data);

                let MNames=document.getElementById("allCity");
                MNames.innerHTML="";
                rs.map((element,index) => {
                    // console.log("moh"+element.MName)
                    if(Did==element.district_id){
                        MNames.innerHTML+= '<option  id="'+element.city_id+'"  name="'+element.name+'" value="' + element.name +  '" option="' + element.name +  '" ></option>'

                    }


                })
            }
        );
    }
    viewDistrict()
    function viewDistrict(){
        $.post(myUrl + "/user-complain-controller/district",
            function (data, status) {
                console.log(data);
                let rs= JSON.parse(data);
                this.mohDetails=rs;
                // console.log(data);

                let MNames=document.getElementById("alldistrict");
                MNames.innerHTML="";
                rs.map((element,index) => {
                    // console.log("moh"+element.MName)
                    MNames.innerHTML+= '<option  id="'+element.district_id+'"  name="'+element.name+'" value="' + element.name +  '" option="' + element.name +  '" ></option>'

                })
            }
        );
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


        // console.log("image neames array "+imageNames);
        if(imageNames.length!=0){
            $.ajax({
                url: myUrl+ "/fileuploadservlet",
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
            // console.log("no image selected")
            registerwithoutimage();
        }
        return false;
    }
</script>


<script defer>

    function checkvalidation(){
        let mohid=checkMOHid();
        if(

            validation.selectCheck('District','LDistrict')&&
            validation.selectCheck('City','LCity')&&
            validation.selectCheck('MArea','LMArea')&&
            validation.mobileValidation(document.getElementById('TpNo').value,'LTpNo')&&
            validation.nicValidation( document.getElementById('NIC'),'LNIC')&&
            validation.nameValidation( document.getElementById('fullName').value,'LfullName')&&
            (mohid!=0)
        )
        {
            console.log("correct detais ");
            imageUpload();
        }
        else {


            validation.selectCheck('District','LDistrict');
            validation.selectCheck('City','LCity');
            validation.selectCheck('MArea','LMArea');
                validation.mobileValidation(document.getElementById('TpNo').value,'LTpNo');
                validation.nicValidation( document.getElementById('NIC'),'LNIC');
                validation.nameValidation( document.getElementById('fullName').value,'LfullName');
            if(mohid==0){
                validation.setErrorMessageForField("Enter valid Area", 'LMArea', 0);
                document.getElementsByClassName('LMArea').value="Enter valid Area";
            }
        }

        return false;
    }
    function registerwithimage(imagearray) {
        let reqData =
            {
                full_name: document.getElementById("fullName").value,
                NIC: document.getElementById("NIC").value,
                mobile: document.getElementById("TpNo").value,
                city: datalistId("City"),
                District: datalistId("District"),
                phi_post: document.querySelector('input[name="post"]:checked').value,
                MOHArea:checkMOHid(),
                DP:imagearray[0]
            };
        console.log("post ==== "+reqData)
        $.post(myUrl+ "/admin-register-controller/phi",
            reqData,
            function (data, status) {
                console.log(data.includes("success"))
                if (data.includes("success")) {
                    popup.Register({
                        status: 'success',
                        message: 'Officer Successfully Added!'
                    });
                } else {
                    popup.Register({
                        status: 'fail',
                        message: 'Officer Registration Fails !',
                        data: data
                    });
                }
            }
        );
        return false;
    }
    function registerwithoutimage() {
        console.log("without image")
        let reqData =
            {
                full_name: document.getElementById("fullName").value,
                NIC: document.getElementById("NIC").value,
                mobile: document.getElementById("TpNo").value,
                city: datalistId("City"),
                District: datalistId("District"),
                phi_post: document.querySelector('input[name="post"]:checked').value,
                MOHArea:checkMOHid(),
                DP:" "
            };

        console.log("post ==== "+reqData)
        $.post(myUrl+ "/admin-register-controller/phi",
            reqData,
            function (data, status) {
                console.log(data.includes("success"))
                if (data.includes("success")) {
                    popup.Register({
                        status: 'success',
                        message: 'Officer Successfully Added!'
                    });
                } else {
                    popup.Register({
                        status: 'fail',
                        message: 'Officer Registration Fails !',
                        data: data
                    });
                }
            }
        );

        return false;
    }





</script>

<script defer>
    // console.log("url = "+myUrl)
    let mohDetails=[];
    $.post(myUrl + "/user-complain-controller/moh",
        function (data, status) {
            console.log(data);
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
