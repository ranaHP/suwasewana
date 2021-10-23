
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View phi</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/public_Announcements.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/announcementCard.css"/> "/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script defer src="<c:url value="/public/js/Admin/public_Announcements.js"></c:url> "></script>
</head>
<body id="mainContent">
<c:import url="/view/admin/partials/AdminOfficerSideNavbar.jsp"></c:import>
<div class="container">
    <!-- suwasewana header -->
    <div class="header">
        <div class="upper-title">SUWASEWANA </div>
        <div class="dashboard-name">Admin/Dashboard/Make announcements</div>
    </div>
    <!-- <div class="main-title">Make announcements</div> -->
    <div class="search-section">
        <div class="selected-options-container" id="selected-options-container">
        </div>
        <div class="down">
            <input id="SelectColor" type="text" list="AllColors" placeholder="select District">
            <datalist id="AllColors">
                <option label="Akuressa" value="Akuressa">
                <option label="Galgamuwa" value="Galgamuwa">
                <option label="Ahangama" value="Ahangama">
                <option label="Matara" value="Matara">
            </datalist>

            <button type="button" class="add-button" onclick="AddValue(document.getElementById('AllColors').value, document.getElementById('AllColors').text);">Add</button>
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
                        <label for="file" class="upload" style="cursor: pointer;">Upload Image</label>
                        <input type="file"  accept="image/*" name="image" id="file"  onchange="loadFile(event)" style="display: none;">
                        <button class="publish-button">Publish</button>
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
<script>
    var loadFile = function(event) {
        var image = document.getElementById('images');
        image.src = URL.createObjectURL(event.target.files[0]);
    };
</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
