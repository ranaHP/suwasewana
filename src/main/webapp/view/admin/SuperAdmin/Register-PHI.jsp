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

    <div class="header">
        <div class="upper-title">SUWASEWANA</div>
        <div class="dashboard-name">Admin/Register/PHI</div>
    </div>

    <div class="MR_container">
        <div class="title">
            <span>Register PHI</span>
        </div>

        <form onsubmit="return register();">
            <div class="singal_row">
                <div class="form-item">
                    <input type="text" id="fullName" value="hash" name="fullName" autocomplete="off" required
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
                        <input type="text" id="NIC" value="980939449v" name="NIC" autocomplete="off" required
                               onclick="document.getElementById('NIC').value = '' "
<%--                               onblur="validation.nicValidation(--%>
<%--                                document.getElementById('NIC'),--%>
<%--                                'LNIC')--%>
<%--                            ;"--%>
                        >
                        <label for="NIC">NIC</label>
                        <span class="error" id="LNIC"></span>
                    </div>
                </div>
                <div class="multirow_right">
                    <div class="form-item">
                        <input type="text" id="TpNo" value="0984744742"  autocomplete="off" required
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

            <div class="multirow">
                <div class="milturow_left" id="mohHeadDiv">
                    <div class="form-item" >
                        <input type="text" value="galle" id="MoHhead" name="MoHhead" autocomplete="off" required
<%--                               onclick="document.getElementById('MoHhead').value = '' "--%>
                               onblur="validation.nameValidation(
                                document.getElementById('MoHhead').value,
                                'LMoHhead'
                            );"
                               onkeyup="validation.nameValidation(
                                document.getElementById('MoHhead').value,
                                'LMoHhead'
                            );"
                        >
                        <label for="MoHhead">City</label>
                        <span class="error" id="LMoHhead"></span>
                    </div>
                </div>
                <div class="multirow_right" >
                    <div class="form-item" >
                        <input type="text" value="galle" id="street" name="street" autocomplete="off" required
<%--                               onclick="document.getElementById('street').value = '' "--%>
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
                <div class="milturow_left" id="PHIState">
                    <div class="form-item" style=" width: 100%;">
                        <input type="text" id="State" value="galle" name="State" autocomplete="off" required
                               onclick="document.getElementById('State').value = '' "
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
                    <input class="SelectColordiv" id="MArea" type="text" style="outline: none;" list="AllColors"
<%--                           onclick="document.getElementById('MArea').value = '' "--%>
                           onkeypress=""
                           onblur="validation.SearchSelect(
                                document.getElementById('MArea').value,
                                'LMArea'
                            );"
                    >
                    <datalist id="AllColors">
                        <option class="city_option" label="Akuressa" value="Akuressa">
                        <option class="city_option" label="Galgamuwa" value="Galgamuwa">
                        <option class="city_option" label="Ahangama" value="Ahangama">
                        <option class="city_option" label="Matara" value="Matara">
                        <option class="city_option" label="Akuressa" value="Akuressa">
                        <option class="city_option" label="Galgamuwa" value="Galgamuwa">
                        <option class="city_option" label="Ahangama" value="Ahangama">
                        <option class="city_option" label="Matara" value="Matara">
                        <option class="city_option" label="Akuressa" value="Akuressa">
                        <option class="city_option" label="Galgamuwa" value="Galgamuwa">
                        <option class="city_option" label="Ahangama" value="Ahangama">
                        <option class="city_option" label="Matara" value="Matara">
                    </datalist>
                    <br>
                    <span class="error" id="LMArea"></span>
                </div>
            </div>

            <div class="status" id="post" onclick="document.getElementById('post').value = '' ">
                <label > PHI</label> <input type="checkbox">
                <label > RPHI</label> <input type="checkbox">
            </div>


            <div class="submit_btn">
                <button class="submit"> Register</button>
            </div>

        </form>
    </div>


</div>
<script>
    selectedOptionList = [];

    function AddValue() {
        const Value = document.querySelector('#SelectCity').value;
        console.log("work" + Value);
        if (!Value) return;
        if (selectedOptionList.findIndex(item => Value == item) == -1) {
            selectedOptionList.push(Value);
            const Text = document.querySelector('option[value="' + Value + '"]').label;
            const option = document.createElement("option");
            option.value = "";
            option.text = "";
            // document.getElementById('selected-options-container').appendChild(option);
            document.getElementById("selected-options-container").innerHTML += `
                <div class="selected-options">
                    ${Value}
                    <div class="close-btn" onclick="deleteSelectedItem('${Value}')">
                            X
                    </div>
                </div>
                `
        }
        console.log(selectedOptionList);
        document.querySelector('#SelectCity').value = "";

    }

    function SearchSelect(feild) {
        if (selectedOptionList.length == 0) {
            document.getElementById(feild).innerHTML = "*required";
        } else {
            document.getElementById(feild).innerHTML = "";
        }
    }

    selectedOptionList = [];

    function deleteSelectedItem(value) {
        let index = selectedOptionList.findIndex(item => value == item);
        let temp = selectedOptionList.filter(item => item != value);
        selectedOptionList = temp;
        document.getElementById("selected-options-container").innerHTML = "";
        for (let i = 0; i < selectedOptionList.length; i++) {
            document.getElementById("selected-options-container").innerHTML += `
                <div class="selected-options">
                    ${selectedOptionList[i]}
                    <div class="close-btn" onclick="deleteSelectedItem('${selectedOptionList[i]}')">
                            X
                    </div>
                </div>
                `
        }
    }


    function validate(e) {
        AddValue(document.getElementById('AllColors').value,
            document.getElementById('AllColors').text);
    }

</script>
<script defer>
    let validation = new FormInputValidation();

    function register() {
        let reqData =
            {
                full_name: document.getElementById("fullName").value,
                NIC: document.getElementById("NIC").value,
                mobile: document.getElementById("TpNo").value,
                city: document.getElementById("MoHhead").value,
                street_no: document.getElementById("street").value,
                state: document.getElementById("State").value,
                c_officer_no: document.getElementById("MArea").value,
                phi_post: document.getElementById("post").value,
            };
        console.log(reqData)

       $.post("/test_war_exploded/phi-register-controller",
            reqData,
            function (data, status) {

                console.log(data.includes("success"))
                if (data.includes("success") ) {
                    popup.showRegistrationSuccessMessage({ status : 'success' , message: 'Successfully Citizen Registered'});
                } else {
                    popup.showRegistrationSuccessMessage({ status : 'fail' , message: 'Citizen Registration Fails !' , data: data});

                }

            }
        );
    }

</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
