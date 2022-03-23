<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Suwasewana</title>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/RPHI/MakeAnnouncementForPHI.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <script src="https://unpkg.com/feather-icons"></script>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
    <%--    for side navbar style--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/announcementCard.css"/> "/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <script defer src="<c:url value="/public/js/RPHI/makeAnnouncementForPHI.js"></c:url> "></script>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
</head>
<body id="mainContent">
<c:import url="/view/admin/partials/RPHIOfficerSideNavbar.jsp"></c:import>
<div class="mypopup" id="popup" style="display: none;"></div>
<div class="container">
    <!-- suwasewana header -->
    <div class="header">
        <div class="upper-title">SUWASEWANA </div>
        <div class="dashboard-name">RPHI/Dashboard/Make announcements</div>
    </div>
    <!-- <div class="main-title">Make announcements</div> -->
    <div class="search-section">
<%--        <div class="selected-options-container" id="selected-options-container">--%>
<%--        </div>--%>
<%--        <div class="down">--%>
<%--            <input id="SelectColor" class="a" type="text" list="AllColors" placeholder="select MOH">--%>
<%--            <datalist id="AllColors">--%>
<%--                <option label="Akuressa" value="Akuressa">--%>
<%--                <option label="Galgamuwa" value="Galgamuwa">--%>
<%--                <option label="Ahangama" value="Ahangama">--%>
<%--                <option label="Matara" value="Matara">--%>
<%--            </datalist>--%>

<%--            <button type="button" class="add-button" onclick="AddValue(document.getElementById('AllColors').value, document.getElementById('AllColors').text);">Add</button>--%>
<%--        </div>--%>
    </div>
    <div class="make-announcement-container" style="margin: 30px 0">

        <div class="left">
            <!-- form container -->
            <div class="form-container">
                <form action="">
                    <div class="form-item1" id="input-title">
                        <input type="text" id="title" autocomplete="off" onkeyup="card()" required>
                        <label for="title">Title</label>
                    </div>
                    <div class="form-item1" id="inputtitle">
                        <label for="title">Expire date</label>
                        <input style="font-size: .7em" type="date" id="expire_date"></input>
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
    let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
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

                        MohAnnouncement(imageNames)
                    } else {
                        console.log('file not uploaded');

                    }
                },
            });
        }
        else {
            MohAnnouncement(imageNames)
            // console.log("no image selected")

            // registerwithoutimage();
        }
        return false;
    }
    function MohAnnouncement(imagearray){
        let reqData={
            // date:document.getElementById("date").value,
            title:document.getElementById("title").value,
            description:document.getElementById("description").value,
            image:imagearray[0],
            // moh:checkid(),
            expire_date:document.getElementById("expire_date").value
        };
        $.post(myUrl+"/createMoh_Announcements/createMA",
           reqData,
            function (data, status) {
            console.log(data)
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

        return false
    }
</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
