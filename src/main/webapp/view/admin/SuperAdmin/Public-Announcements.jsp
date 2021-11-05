
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
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/public_Announcements.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/announcementCard.css"/> "/>
    <script src="<c:url value="/public/js/Admin/InputValidation.js "/>"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script defer src="<c:url value="/public/js/Admin/public_Announcements.js"></c:url> "></script>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
</head>
<body id="mainContent" onload="checkP()">
<c:import url="/view/admin/partials/AdminOfficerSideNavbar.jsp"></c:import>
<div class="mypopup" id="popup" style="display: none;"></div>
<div class="container">

    <div class="header">
        <div class="upper-title">SUWASEWANA </div>
        <div class="dashboard-name">Admin/Dashboard/Make announcements</div>
    </div>
<%--        select province and district--%>
    <div class="search-section">
    <div class="selected-options-container" id="selected-options-container">
    </div>

<%--        select province--%>
    <div class="down">
        <input autocomplete="off" placeholder="Province" class="SelectColordiv" id="PArea" type="text" style="outline: none;" list="AllPArea" name="AllPArea" required
               onclick="document.getElementById('PArea').value='';"
               onblur="validation.SearchSelect(
                                    document.getElementById('PArea').value,
                                    'LPArea'
                                );"
        >
        <datalist id="AllPArea">
        </datalist>
        <br>
       <button onclick="AddValue(document.getElementById('AllPArea').value, document.getElementById('AllPArea').text);SelectDistricts()">add</button>
        <span class="error" id="LPArea" style="margin-left: 5px" ></span>
    </div>
<%--      select district--%>
        <div class="selected-options-container" id="selected-options-container1">
        </div>
    <div class="down">

        <%--        <label >Province</label> <br>--%>
        <input autocomplete="off" placeholder="Districts" class="SelectColordiv" id="DArea" type="text" style="outline: none;" list="AllDArea" name="AllDArea" required
               onclick="document.getElementById('DArea').value='';"
               onblur="validation.SearchSelect(
                                    document.getElementById('DArea').value,
                                    'LDArea'
                                );"
        >
        <datalist id="AllDArea">
            <option label="All" value="All" id="All">All</option>
        </datalist>
        <br>
            <button onclick="AddDValue1(document.getElementById('AllDArea').value, document.getElementById('AllDArea').text);">add</button>
        <span class="error" id="LDArea" style="margin-left: 5px" ></span>
    </div>
    </div>
    <div class="make-announcement-container">
        <div class="left">
            <!-- form container -->
            <div class="form-container">
                <form action="">
                    <div class="form-item1" id="input-title">
                        <input type="text" id="title" autocomplete="off" onkeyup="card()" required>
                        <label for="title">Title</label>
                    </div>
                    <div class="form-item">
                        <label for="description" >Description</label>
                        <textarea id="description" name="content" rows="10" cols="30" row="5" onkeyup="card()"></textarea>
                    </div>
                    <div class="img-publish-button">
                        <div class="image-upload-card">
                            <img id="proof1" width="100%" />
                            <input type="file" accept="image/*" name="file" id="proof1input"
                                   onchange="loadFile(event , 'proof1')" style="display: none;">

                            <label for="proof1input" class="upload" style="cursor: pointer;">Upload Image</label>
                        </div>

                        <button class="publish-button" onclick="return imageUpload()">Publish</button>
                    </div>
                </form>

            </div>
            <!-- image upload and publish button section -->
        </div>
        <div class="right">
            <div class="live-card-container" >
                <div class="announcement" id="announcement">

                </div>
            </div>
        </div>
    </div>
</div>
<script defer>

    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    var loadFile = function(event) {
        var image = document.getElementById('proof1input');
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
                        PublicAnnouncement(imageNames)
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
    function PublicAnnouncement(imagearray){
            let reqData={
                title:document.getElementById("title").value,
                description:document.getElementById("description").value,
                image:imagearray[0],
            };

            $.post("/test_war_exploded/admin-controller/PublicAnnouncement",
                reqData,
                function (data, status) {
                alert(data)
                    if(data){
                        popup.showCreateClinicSuccessMessage({
                            status: 'success',
                            message: 'Successfully Created!'
                        })
                        AddProvince(data)
                        AddDistricts(data)
                    } else{
                        popup.showCreateClinicSuccessMessage({
                            status: 'fail',
                            message: 'Failed to create !',
                            data: data
                        });
                    }
            }
            );
            return false
    }
</script>
<script defer>
    function SelectDistricts(){
        let reqData={
            province_id:checkid(),
        };
        console.log(reqData)
        $.post("/test_war_exploded/admin-controller/districtsSelect",
            reqData,
            function (data, status) {
                let PDetails=[];
                // console.log(data);
                let rs= JSON.parse(data);
                this.PDetails=rs;
                // console.log(data);
                let DNames=document.getElementById("AllDArea");
                // DNames.innerHTML="";

                rs.map((element,index) => {
                    DNames.innerHTML+= '<option  id="'+element.province_id+'"  name="'+element.name+'" value="' + element.name +  '" option="' + element.name +  '" ></option>'
                })
                // console.log("data"+data)
                document.querySelector('#PArea').value ="";
                }
        );

        return false
    }
    let validation = new FormInputValidation();
    function checkP(){
        // alert("hiiiiiii")
        let PDetails=[];
        $.post("/test_war_exploded/admin-controller/provinceAll",
            function (data, status) {
                console.log(data);
                let rs= JSON.parse(data);
                this.PDetails=rs;
                // console.log(data);
                let PNames=document.getElementById("AllPArea");
                PNames.innerHTML="";
                PNames.innerHTML+= '<option  id="'+"777" +'"  name="'+"777"+'" value="' + "All" +  '" option="' + "777"+  '" ></option>'

                rs.map((element,index) => {
                    PNames.innerHTML+= '<option  id="'+element.province_id+'"  name="'+element.name+'" value="' + element.name +  '" option="' + element.name +  '" ></option>'
                })
            }
        );
    }
    function checkid(){
        // alert("check")
        var MTypeObj = document.getElementById('PArea');
        var datalist = document.getElementById(MTypeObj.getAttribute("list"));
        if(datalist.options.namedItem(MTypeObj.value)){
                // console.log("ooption"+ datalist.options.namedItem(MTypeObj.value).id)
                return (datalist.options.namedItem(MTypeObj.value).id);
        }
        else {
            return  0;
        }

    }

    function takePID(province,data){
        let id=data;
        let reqData={
            PName:province,
        }
        console.log(reqData)
        alert(reqData)
        $.post("/test_war_exploded/admin-controller/provinceIdSelect",
            reqData,
            function (data){
                let name=JSON.parse(data)
                name.map(item=>{
                    let provinceId=item.province_id
                    let reqData={
                        provinceId:provinceId,
                        announcement_id: id
                    }
                    console.log(reqData)
                    $.post("/test_war_exploded/admin-controller/addprovince")
                         reqData,
                        function (data){
                           console.log(data)
                        }
                })
            });
    }

    function takeDID(district,data){
        let id=data
        let reqData={
            DName:district,
            announcement_id: id
        }
        console.log(reqData)
        $.post("/test_war_exploded/admin-controller/districtsIdSelect",
            reqData,
            function (data){
             let name=JSON.parse(data)
                name.map(item=>{
                    let districtId=item.districtId
                    let reqData={
                        provinceId:districtId,
                        announcement_id: id
                    }
                    console.log(reqData)
                    $.post("/test_war_exploded/admin-controller/adddistrict")
                    reqData,
                        function (data){
                            console.log(data)
                        }
                })
            });
    }

   function AddDistricts(data){
       selectedOptionList1.map(i=>{
               takeDID(i,data)
       })
   }
    function AddProvince(data){
        selectedOptionList.map(i=>{
               takePID(i,data)
        })
    }
</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
