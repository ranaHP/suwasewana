
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Suwasewana</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/public_Announcements.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/announcementCard.css"/> "/>
    <script src="<c:url value="/public/js/Admin/InputValidation.js "/>"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script defer src="<c:url value="/public/js/Admin/public_Announcements.js"></c:url> "></script>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/easymde/dist/easymde.min.css">
    <script src="https://cdn.jsdelivr.net/npm/easymde/dist/easymde.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/view_healt_announcement.css"/> "/>
    <style>
        .view_announcement_list{
            width: 80%;
            margin: auto;
        }

    </style>
</head>
<body id="mainContent" onload="checkP()">
<c:import url="/view/admin/partials/AdminOfficerSideNavbar.jsp"></c:import>
<div class="mypopup" id="popup" style="display: none;"></div>
<div class="container">

    <div class="header">
        <div class="upper-title">SUWASEWANA </div>
        <div class="dashboard-name">Admin/Dashboard/Make announcements</div>
    </div>
    <h1 style="text-align: center ; margin: 20px 0; color: #4b4b4b"> Public Announcements List  </h1>
    <span style="text-align: center ; margin: -10px 0; color: #4b4b4b;"> Suwasewana public announcement portal  </span>
    <div class="filter_announcement_admin" >
        
    </div>
    <div class="view_announcement_list" id="view_announcement_list">

    </div>
</div>


<script>
    let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    feather.replace(({width:"10px",height:"10px"}))
    // select
    // let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    var body=document.getElementById("view_announcement_list")
    var tbl = document.createElement("table");
    tbl.classList.add("table")
    var tblBody = document.createElement("tbody");
    getAllMOHDetails();
    let moh_details_list={};
    let MOHList = [];
    let districtList=[];
    function getAllMOHDetails() {
        let MOHList = [];
        $.post(myUrl+"/admin-controller/allAnnouncement",
            {},
            function (data, status) {
                data = JSON.parse(data);
                // console.log("asdasd");
                // console.log(data);
                // console.log("asdasd");
                tblBody.innerHTML = "";
                headers=["Id","Banner","Title","Description","Expire Time" ,"Status","Block","Update"]
                var row = document.createElement("tr");
                headers.map((item=>{
                    row.classList.add("thead")
                    var cell = document.createElement("th");
                    var cellText = document.createTextNode(item);
                    cell.appendChild(cellText);
                    row.appendChild(cell);
                    tblBody.appendChild(row);
                }))
                console.log(data)
                data.map((item)=>{
                    tblBody.innerHTML+= `
    <tr>
                  <td data-label="Banner"> ` + item.announcement_id + `</td>
                  <td data-label="Banner"><img src="` + myUrl + `/public/images/uploadimage/` + item.banner + `" width="100px" /> </td>
               <td data-label="Title">` + item.title + `</td>
                <td data-label="Didtrict">` + item.description + `</td>
                <td data-label="Head">` + item.expire_date + `</td>
                <td data-label="Mobile">`+item.status + `</td>
                <td class="Block"  data-label="ReNew" onclick=""><button>Block</button></td>
                <td class="Block"  data-label="block" onclick=""><button style=" background-color: #f6d70a"">Update</button></td>
    </tr>`
                    tbl.appendChild(tblBody);
                    body.appendChild(tbl);
                })
            }
        );
    }

</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
