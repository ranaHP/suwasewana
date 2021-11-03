
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="<c:url value="/public/js/Admin/InputValidation.js "/>"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script defer src="<c:url value="/public/js/Admin/public_Announcements.js"></c:url> "></script>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
</head>
<body id="mainContent" onload="check()">
<c:import url="/view/admin/partials/RPHIOfficerSideNavbar.jsp"></c:import>
<div class="mypopup" id="popup" style="display: none;"></div>
<div class="container">
    <!-- suwasewana header -->
    <div class="header">
        <div class="upper-title">SUWASEWANA </div>
        <div class="dashboard-name">RPHI/Dashboard/Make announcements</div>
    </div>
    <div class="search-section">
        <div class="down">

        <label >MOH Area</label> <br>
        <input autocomplete="off" class="SelectColordiv" id="MArea" type="text" style="outline: none;" list="AllMArea" name="AllMArea" required
               onclick="document.getElementById('MArea').value='';"
               onblur="validation.SearchSelect(
                                    document.getElementById('MArea').value,
                                    'LMArea'
                                );"
        >
        <datalist id="AllMArea">
        </datalist>
        <br>
        <span class="error" id="LMArea" style="margin-left: 5px" ></span>

        </div></div>
    <div class="make-announcement-container">

        <div class="left">
            <!-- form container -->
            <div class="form-container">
                <form action="">
                    <div class="form-item1" id="input-title">
                        <input type="text" id="title" autocomplete="off" onkeyup="card()" required>
                        <label for="title">Title</label>
                    </div>
<%--                    <div class="post-date" id="date">posted date -:${today} </div>--%>
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
        var image = document.getElementById('images');
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

                        StaffAnnouncement(imageNames)
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

    function StaffAnnouncement(imagearray){
        let reqData={
            // date:document.getElementById("date").value,
            title:document.getElementById("title").value,
            description:document.getElementById("description").value,
            image:imagearray[0],
            moh:checkid()
        };
        // console.log(reqData)
        $.post("/test_war_exploded/createRPHI_Announcements/createA",
            reqData,
            function (data, status) {
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
                }}
        );

        return false
    }

</script>
<script>
    let validation = new FormInputValidation();
    function check(){
        let mohDetails=[];
        $.post("/test_war_exploded/user-complain-controller/moh",
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
    }

    function checkid(){
        // alert("check")
        var MTypeObj = document.getElementById('MArea');
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

<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
