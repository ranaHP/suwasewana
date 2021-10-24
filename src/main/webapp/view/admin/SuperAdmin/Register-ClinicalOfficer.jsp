<%--
  Created by IntelliJ IDEA.
  User: Akila
  Date: 10/16/2021
  Time: 10:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
    <title>Title</title>
    <script src="<c:url value="/public/js/Admin/InputValidation.js "/>"></script>
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/RegClinicalOfficer.css "/>"/>


    <%--    for side navbar style--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

    <title> User Home Suwasewana </title>

</head>
<body>
    <c:import url="/view/admin/partials/AdminOfficerSideNavbar.jsp"></c:import>
    <div class="MR_main_Container">
        <div class="header">
            <div class="upper-title">SUWASEWANA</div>
            <div class="dashboard-name">Admin/Register/ClinicalOfficer</div>
        </div>
        <div class="MR_container">
            <div class="title">
                <span>Register Clinical Officer</span>
            </div>
            <form action=""  onsubmit="return checkvalidation();" >
                <div class="singal_row">
                    <div class="form-item">
                        <input type="text" id="fullName" autocomplete="off"
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
                            <input type="text" id="NIC" autocomplete="off"
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
                            <input type="text" id="TpNo" autocomplete="off"
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
                <div class="multirow">
                    <div class="milturow_left" >
                        <div class="form-item" id="Moh_headdiv">
                            <input type="text" id="COCity" autocomplete="off"
                                   onblur="validation.nameValidation(
                                    document.getElementById('COCity').value,
                                    'LCOCity'
                                );"
                                   onkeyup="validation.nameValidation(
                                    document.getElementById('COCity').value,
                                    'LCOCity'
                                );"
                            >
                            <label for="COCity">City</label>
                            <span class="error" id="LCOCity"></span>
                        </div>
                    </div>
                    <div class="multirow_right" >
                        <div class="form-item" >
                            <input type="text" id="street" autocomplete="off"
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
                    <div class="milturow_left"  style="display: flex; align-items: flex-end;">
                        <div class="form-item" >
                            <input type="text" id="State" autocomplete="off"
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


                <div class="submit_btn">
                    <button class="submit"> Register</button>
                </div>

            </form>
        </div>


    </div>



    <script defer>
        let validation = new FormInputValidation();
    </script>



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
        function checkvalidation(){
            let mohid=checkMOHid();
            if(validation.nameValidation(document.getElementById('fullName').value,'LfullName' )&&
                validation.nicValidation( document.getElementById('NIC'),'LNIC')&&
                validation.mobileValidation(document.getElementById('TpNo').value,'LTpNo')&&
                validation.nameValidation(document.getElementById('COCity').value,'LCOCity' )&&
                validation.nameValidation( document.getElementById('street').value,'Lstreet')&&
                validation.nameValidation(document.getElementById('State').value,'LState' )&&
                validation.SearchSelect(document.getElementById('MArea').value,'LMArea' )&&
                (mohid!=0)){
                console.log("correct log");
                registerClinicalOfficer();
            }
            else{
                validation.nameValidation(document.getElementById('fullName').value,'LfullName' );
                validation.nicValidation( document.getElementById('NIC'),'LNIC');
                validation.mobileValidation(document.getElementById('TpNo').value,'LTpNo');
                validation.nameValidation(document.getElementById('COCity').value,'LCOCity' );
                validation.nameValidation( document.getElementById('street').value,'Lstreet');
                validation.nameValidation(document.getElementById('State').value,'LState' );
                validation.SearchSelect(document.getElementById('MArea').value,'LMArea' );
                if(mohid==0){
                    validation.setErrorMessageForField("Enter valid Area", 'LMArea', 0)
                }

            }

            return false;
        }

        function registerClinicalOfficer(){
            let reqData =
                {
                    CName: document.getElementById("fullName").value,
                    CNIC: document.getElementById("NIC").value,
                    CTpNo: document.getElementById("TpNo").value,
                    Ccity: document.getElementById("COCity").value,
                    Cstreet: document.getElementById("street").value,
                    CState: document.getElementById("State").value,
                    CMohArea:checkMOHid()
                };
            console.log("sending data "+reqData.CName);
            console.log("sending data "+reqData.CNIC);
            console.log("sending data "+reqData.CTpNo);
            console.log("sending data "+reqData.Ccity);
            console.log("sending data "+reqData.Cstreet);
            console.log("sending data "+reqData.CState);
            console.log("sending data "+reqData.CMohArea);

            $.post("/suwasewana_war/admin-register-controller/clinical_officer",
                reqData,
                function (data, status) {
                    console.log(data.includes("success"))
                    if (data.includes("success")) {
                        popup.showAppointmentSuccessMessage({
                            status: 'success',
                            message: 'Appointment Successfully Requested!'
                        });
                    } else {
                        popup.showAppointmentSuccessMessage({
                            status: 'fail',
                            message: 'Appointment Request Fails !',
                            data: data
                        });
                    }
                }
            );
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
        // console.log(mohDetails);




    </script>



    <script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>






</body>
</html>
