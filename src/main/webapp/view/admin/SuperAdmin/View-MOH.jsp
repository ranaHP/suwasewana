
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
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/view_MOH.css"/> "/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
<%--    <script defer src="<c:url value="/public/js/Admin/view_MOH.js"></c:url> "></script>--%>
</head>
<body id="mainContent">
<c:import url="/view/admin/partials/AdminOfficerSideNavbar.jsp"/>
<div class="container">
    <!-- suwasewana header -->
    <div class="header">
        <div class="upper-title">SUWASEWANA </div>
        <div class="dashboard-name">Admin/Dashboard/View MOH</div>
    </div>
    <!-- view phi title -->
    <div class="main-title">
        View MOH
    </div>
    <div class="search-section">
        <div class="select">
            <select name="" id="select" onchange="getAllMOHDetailsD()">
                <option value="1">select district</option>
            </select>
        </div>
        <div class="select">
            <select name="" id="select1" onchange="getAllMOHDetailsM()">
                <option value="1">select MOH</option>
            </select>
        </div>
<%--        <div class="search-officer">--%>
<%--            <input type="text" id="search" autocomplete="off" required>--%>
<%--            <label for="search">Search with name</label>--%>
<%--            <div class="search-m" for="search"><i class="icon" data-feather="search"></i></div>--%>
<%--        </div>--%>
    </div>

</div>

<script>
    let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    var body=document.getElementById("mainContent")
    var tbl = document.createElement("table");
    tbl.classList.add("table")
    var tblBody = document.createElement("tbody");
    getAllMOHDetails();
    let moh_details_list={};
    let MOHList = [];
    let districtList=[];
    function getAllMOHDetails() {
        let MOHList = [];
        $.post(myUrl+"/admin-controller/mohall",
            {},
            function (data, status) {
                data = JSON.parse(data);
                console.log("asdasd");
                console.log(data);
                console.log("asdasd");
                // var body=document.getElementById("mainContent")
                // var tbl = document.createElement("table");
                // tbl.classList.add("table")
                // var tblBody = document.createElement("tbody");
                tblBody.innerHTML = "";
                headers=["MOH name","District","Head","Mobile"]
                var row = document.createElement("tr");
                headers.map((item=>{
                    row.classList.add("thead")
                    var cell = document.createElement("th");
                    var cellText = document.createTextNode(item);
                    cell.appendChild(cellText);
                    row.appendChild(cell);
                    tblBody.appendChild(row);
                }))
                data.map((item)=>{
                    tblBody.innerHTML+= `
    <tr>
                <td data-label="MOHName">` + item.MName + `</td>
                <td data-label="Didtrict">` + item.District + `</td>
                <td data-label="Head">` + item.MOHHead + `</td>
                <td data-label="Mobile">`+item.TpNo + `</td>

    </tr>
    `
                    tbl.appendChild(tblBody);
                    body.appendChild(tbl);
                    MOHList.push(item.MName)
                    districtList.push(item.District)

                })
                console.log(MOHList)
                MOHList.map(name=>{
                    console.log(name)
                    let option= document.createElement('option')
                    option.value=name
                    option.innerText=name
                    document.getElementById('select1').appendChild(option)
                })

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

    function getAllMOHDetailsM() {
        let MOHList = [];
        $.post(myUrl+"/admin-controller/mohall",
            {},
            function (data, status) {
                data = JSON.parse(data);
                tblBody.innerHTML = "";
                var select = document.getElementById("select")
                var select1 = document.getElementById("select1")
                var value = select.options[select.selectedIndex].value;
                var value1 = select1.options[select1.selectedIndex].value;
                headers=["MOH name","District","Head","Mobile"]
                var row = document.createElement("tr");
                headers.map((item=>{
                    row.classList.add("thead")
                    var cell = document.createElement("th");
                    var cellText = document.createTextNode(item);
                    cell.appendChild(cellText);
                    row.appendChild(cell);
                    tblBody.appendChild(row);
                }))
                data.map((item)=>{
                    console.log(value1)
                    console.log("fff")
                    console.log(item.MName)
                    if(value1==item.MName) {
                        tblBody.innerHTML += `
    <tr>
                <td data-label="MOHName">` + item.MName + `</td>
                <td data-label="Didtrict">` + item.District + `</td>
                <td data-label="Head">` + item.MOHHead + `</td>
                <td data-label="Mobile">` + item.TpNo + `</td>

    </tr>
    `
                        tbl.appendChild(tblBody);
                        body.appendChild(tbl);
                    }
                })

            }
        );
    }

    function getAllMOHDetailsD() {
        let MOHList = [];
        $.post(myUrl+"/admin-controller/mohall",
            {},
            function (data, status) {
                data = JSON.parse(data);
                tblBody.innerHTML = "";
                var select = document.getElementById("select")
                var select1 = document.getElementById("select1")
                var value = select.options[select.selectedIndex].value;
                var value1 = select1.options[select1.selectedIndex].value;
                headers=["MOH name","District","Head","Mobile"]
                var row = document.createElement("tr");
                headers.map((item=>{
                    row.classList.add("thead")
                    var cell = document.createElement("th");
                    var cellText = document.createTextNode(item);
                    cell.appendChild(cellText);
                    row.appendChild(cell);
                    tblBody.appendChild(row);
                }))
                data.map((item)=>{
                    console.log(value1)
                    console.log("fff")
                    console.log(item.MName)
                    if(value==item.District) {
                        tblBody.innerHTML += `
    <tr>
                <td data-label="MOHName">` + item.MName + `</td>
                <td data-label="Didtrict">` + item.District + `</td>
                <td data-label="Head">` + item.MOHHead + `</td>
                <td data-label="Mobile">` + item.TpNo + `</td>

    </tr>
    `
                        tbl.appendChild(tblBody);
                        body.appendChild(tbl);
                    }
                })

            }
        );
    }

    view()
function view(){
    MOHList.map(name=>{
        console.log("h")
        console.log(name)
    })
}





    districts=["Galle","Matara","Colombo","Hambanthota","Nuwara","Kegalle","Nuwara Eliya","Jaffna"];
    // MOHList.map(name=>{
    //     console.log(name)
    //     let option= document.createElement('option')
    //     option.value=name
    //     option.innerText=name
    //     document.getElementById('select').appendChild(option)
    // })

    // areas=["ahangama","Eluketiya","Habaraduwa","Unawatuna","Galle","Hikkaduwa"];
    // areas.map(name=>{
    //     let option= document.createElement('option')
    //     option.value=name
    //     option.innerText=name
    //     document.getElementById('select1').appendChild(option)
    // })
</script>
<script>
    feather.replace(({width:"10px",height:"10px"}))
</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
