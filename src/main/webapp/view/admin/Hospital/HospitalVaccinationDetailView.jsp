<%--
  Created by IntelliJ IDEA.
  User: Akila
  Date: 12/6/2021
  Time: 1:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href="<c:url value="/public/css/HospitalView.css"/>" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Title</title>
</head>
<body id="mainContent">
<c:import url="/view/admin/partials/ClinicalOfficerSideNavbar.jsp"/>
<div class="vaccine-list-container" >
    <hr>
    <div class="search-row">

        <div class="nic">
            <span>NIC : </span>
            <input type="text" id="nicval" onchange="LoadVaccineclinic();">

        </div>

    </div>
    <hr>
    <div class="search-content">
        <div class="user-details">
            <p>Name : <span id="name">-</span></p>
            <p>Age : <span id="age">0</span></p>
            <p>Dosage : <span id="dosage">0</span></p>
        </div>

        <table id="vtable" style="display: none">
            <caption>Vaccine details </caption>
            <thead>
            <tr>
                <th scope="col">Vaccine</th>
                <th scope="col">Date</th>
                <th scope="col">Location</th>
            </tr>
            </thead>
            <tbody id="vaccineDetails">

            </tbody>
        </table>
        <p style="display:none;font-size: 30px;margin-top: 100px;color: rgba(0, 0, 0, 0.671);" id="nodataFound" >
            No Data Found!
        </p>
    </div>
</div>

<script>
    let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

    function calculateage(name) {
        let NICNo = name;
        let isValida = true;
        var dayText = 0;
        var year = "";
        var month = "";
        var day = "";
        var gender = "";
        if (NICNo.length != 10 && NICNo.length != 12) {
            // console.log("if")
            isValida = false;

        } else if (NICNo.length == 10 && !this.$.isNumeric(NICNo.substr(0, 9))) {
            // console.log("else if")

            isValida = false;
        } else {

            isValida = true;
            // Year
            if (NICNo.length == 10) {
                year = "19" + NICNo.substr(0, 2);
                dayText = parseInt(NICNo.substr(2, 3));
            } else {
                year = NICNo.substr(0, 4);
                dayText = parseInt(NICNo.substr(4, 3));
            }

            // Gender
            if (dayText > 500) {
                gender = "Female";
                dayText = dayText - 500;
            } else {
                gender = "Male";
            }

            // Day Digit Validation
            if (dayText < 1 && dayText > 366) {
                $("#error").html("Invalid NIC NO");
            } else {

                //Month
                if (dayText > 335) {
                    day = dayText - 335;
                    month = "12";
                } else if (dayText > 305) {
                    day = dayText - 305;
                    month = "11";
                } else if (dayText > 274) {
                    day = dayText - 274;
                    month = "10";
                } else if (dayText > 244) {
                    day = dayText - 244;
                    month = "9";
                } else if (dayText > 213) {
                    day = dayText - 213;
                    month = "8";
                } else if (dayText > 182) {
                    day = dayText - 182;
                    month = "7";
                } else if (dayText > 152) {
                    day = dayText - 152;
                    month = "6";
                } else if (dayText > 121) {
                    day = dayText - 121;
                    month = "5";
                } else if (dayText > 91) {
                    day = dayText - 91;
                    month = "4";
                } else if (dayText > 60) {
                    day = dayText - 60;
                    month = "3";
                } else if (dayText < 32) {
                    month = "1";
                    day = dayText;
                } else if (dayText > 31) {
                    day = dayText - 31;
                    month = "2";
                }

                // Show Details
                // console.log("Gender : " + gender)
                // console.log("Year : " + year)
                // console.log("Month : " + month)
                // console.log("Day :" + day)

                let birthday=year+"/"+month+"/"+day;
                let age =getAge(birthday);
                return age;
            }
        }
    }
    function getAge(dateString) {
        var today = new Date();
        var birthDate = new Date(dateString);
        var age = today.getFullYear() - birthDate.getFullYear();
        var m = today.getMonth() - birthDate.getMonth();
        if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
            age--;
        }
        return age;
    }

    function LoadVaccineclinic(){
        console.log("call to loadvaccin function")
        $.post(myUrl+"/Vaccine-controller/GetuserVaccineDetail/",
            function (data, status) {
                rs= JSON.parse(data);
                let available_clinic_list=document.getElementById("vaccineDetails");
                available_clinic_list.innerHTML='';
                let nic=document.getElementById("nicval").value;
                let age=calculateage(nic);
                var flg=0;
                let count=0;
                let name="";
                rs.map((element) => {

                    let date=((element.Date).split(" ")[0]) ;
                    console.log("my nic "+nic);
                    console.log("their nic "+element.userNic);
                    console.log("app.nic.toLowerCase() "+nic.toLowerCase())
                    console.log("(element.userNic.toLowerCase()) "+(element.userNic.toLowerCase()))

                    if(nic.toLowerCase().includes(element.userNic.toLowerCase())){
                        console.log("fount equal nic")
                        flg=1;
                        name=element.userName;
                        count++;
                        available_clinic_list.innerHTML+= `
                       <tr>
                        <td data-label="Vaccine">`+element.VaccineName+`</td>
                        <td data-label="Date">`+date+`</td>
                        <td data-label="Location">`+element.Location+`</td>
                        </tr>`
                    }
                });
                document.getElementById("name").innerText=name;
                document.getElementById("age").innerText=(age>0)? age : "0";
                document.getElementById("dosage").innerText=(count>0)? count : "0";

                console.log("count "+count);
                if(count==0){
                    console.log("no data found");
                    document.getElementById("vtable").style.display = "none";
                    document.getElementById("nodataFound").style.display = "block";
                }
                else{
                    console.log(" data found");
                    document.getElementById("vtable").style.display = "block";
                    document.getElementById("nodataFound").style.display = "none";
                }
            }
        );
    }


</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
