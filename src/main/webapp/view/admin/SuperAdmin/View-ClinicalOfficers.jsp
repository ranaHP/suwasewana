
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
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/view_ClinicalOfficers.css"/> "/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%--    <script defer src="<c:url value="/public/js/Admin/view_ClinicalOfficers.js"></c:url> "></script>--%>
</head>
<body id="mainContent">
<c:import url="/view/admin/partials/AdminOfficerSideNavbar.jsp"></c:import>
<div class="container" >
    <!-- suwasewana header -->
    <div class="header">
        <div class="upper-title">SUWASEWANA </div>
        <div class="dashboard-name">Admin/Dashboard/View Clinical Officers</div>
    </div>
    <div class="mypopup" id="popup" style="display: none;"></div>
    <!-- view phi title -->
    <div class="main-title">
<%--        View phi--%>
    </div>
    <div class="search-section">
        <div class="select"  id="select_district">
            <select name="" id="select" onchange="checkM()">
                <option value="1">select district</option>
            </select>
        </div>
        <div class="select">
            <select name="" id="select1" onchange="checkM()">
                <option value="1">select area</option>
            </select>
        </div>
<%--        <div class="search-officer">--%>
<%--            <input type="text" id="search" autocomplete="off" required>--%>
<%--            <label for="search">Search with name</label>--%>
<%--            <div class="search-m" for="search"><i class="icon" data-feather="search"></i></div>--%>
<%--        </div>--%>
    </div>
</div>
<script defer>
    let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    feather.replace(({width:"10px",height:"10px"}))
    // select
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    // let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    var body=document.getElementById("mainContent")
    var tbl = document.createElement("table");
    tbl.classList.add("table")
    var tblBody = document.createElement("tbody");
    getAllCDetails();
    let moh_details_list={};
    let MOHList = [];
    let districtList=[];
    function getAllCDetails() {
        let MOHList = [];
        $.post(myUrl+"/admin-controller/C_all",
            {},
            function (data, status) {
                data = JSON.parse(data);
                console.log("asdasd");
                console.log(data);
                console.log("asdasd");
                tblBody.innerHTML = "";
                headers=["name","MOH","District","Mobile","ReNew","Block","Remove"]
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
                  <td data-label="MOHName">` + item.Name + `</td>
               <td data-label="MOHName">` + item.MOHAREA + `</td>
                <td data-label="Didtrict">` + item.District + `</td>
                <td data-label="Mobile">`+item.Mobile + `</td>
                <td class="update"  data-label="ReNew" onclick="popup.showRenewAlertMessage('`+item.NIC+`')"><button>Re New MAC</button></td>
                <td class="Block"  data-label="block" onclick="popup.showBlockAlertMessage('`+item.NIC+`')"><button>Block</button></td>
                <td class="Block"  data-label="Remove" onclick="popup.showRemoveAlertMessage('`+item.NIC+`')"><button>Remove</button></td>



    </tr>
    `
                    tbl.appendChild(tblBody);
                    body.appendChild(tbl);
                    MOHList.push(item.MOHAREA)
                    districtList.push(item.District)

                })
                // console.log(MOHList)
                MOHList.map(name=>{
                    console.log(name)
                    let option= document.createElement('option')
                    option.value=name
                    option.innerText=name
                    document.getElementById('select1').appendChild(option)
                })
                //
                districtList.map(name=>{
                    console.log(name)
                    let option= document.createElement('option')
                    option.value=name
                    option.innerText=name
                    document.getElementById('select').appendChild(option)
                })
            }
        );
    }

    function checkM() {
        let MOHList = [];
        $.post(myUrl+"/admin-controller/C_all",
            {},
            function (data, status) {
                data = JSON.parse(data);
                tblBody.innerHTML = "";
                var select = document.getElementById("select")
                var select1 = document.getElementById("select1")
                var value = select.options[select.selectedIndex].value;
                var value1 = select1.options[select1.selectedIndex].value;
                headers=["name","MOH","District","Mobile","ReNew","Block","Remove"]
                var row = document.createElement("tr");
                headers.map((item=>{
                    row.classList.add("thead")
                    var cell = document.createElement("th");
                    var cellText = document.createTextNode(item);
                    cell.appendChild(cellText);
                    row.appendChild(cell);
                    tblBody.appendChild(row);
                }))
                console.log("m")
                console.log(value1)
                console.log(value)
                data.map((item)=>{
                    if(value1==item.MOHAREA || value==item.District) {
                        console.log(item.MOHAREA)
                        tblBody.innerHTML += `
    <tr>
                <td data-label="MOHName">` + item.Name + `</td>
               <td data-label="MOHName">` + item.MOHAREA + `</td>
                <td data-label="Didtrict">` + item.District + `</td>
                <td data-label="Mobile">`+item.Mobile + `</td>
                <td class="update"  data-label="ReNew" onclick="popup.showRenewAlertMessage('`+item.NIC+`')"><button>Re New MAC</button></td>
                <td class="Block"  data-label="block" onclick="popup.showBlockAlertMessage('`+item.NIC+`')"><button>Block</button></td>
                 <td class="Block"  data-label="Remove" onclick="popup.showRemoveAlertMessage('`+item.NIC+`')"><button>Remove</button></td>

    </tr>
    `
                        tbl.appendChild(tblBody);
                        body.appendChild(tbl);
                    }
                })

            }
        );
    }


    function block(data) {
        // alert(data)
        let reqData =
            {
                id: data,
            };
        $.post(myUrl + "/admin-controller/blockClinicalO",
            reqData,
            function (data, status) {
                if (data.includes("success")) {
                    popup.hidePopup()
                    popup.showBlockSuccessMessage({
                        status: 'success',
                        message: 'Officer successfully blocked!'
                    });

                } else {
                    popup.showBlockSuccessMessage({
                        status: 'fail',
                        message: 'Officer block failed !',
                        data: data
                    });
                }
            })

    }
    function Remove(data) {
        // alert(data)
        let reqData =
            {
                id: data,
            };
        $.post(myUrl + "/admin-controller/removeC",
            reqData,
            function (data, status) {
                if (data.includes("success")) {
                    popup.hidePopup()
                    popup.showRemoveSuccessMessage({
                        status: 'success',
                        message: 'Officer successfully Removed!'
                    });

                } else {
                    popup.showRemoveSuccessMessage({
                        status: 'fail',
                        message: 'Officer block Removed !',
                        data: data
                    });
                }
            })

    }

        function renew(data){
            // alert(data)
            let reqData =
                {
                    id: data,
                };
            $.post(myUrl+"/admin-controller/renewC",
                reqData,
                function (data, status) {
                    if (data.includes("success")) {
                        popup.hidePopup()
                        popup. showRenewSuccessMessage({
                            status: 'success',
                            message: 'Mac renew success!'
                        });

                    } else {
                        popup. showRenewSuccessMessage({
                            status: 'fail',
                            message: 'Mac renew failed !',
                            data: data
                        });
                    }
                })

    }


</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
