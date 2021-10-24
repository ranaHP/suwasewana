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
            <form action="">
                <div class="singal_row">
                    <div class="form-item">
                        <input type="text" id="fullName" autocomplete="off" required
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
                            <input type="text" id="NIC" autocomplete="off" required
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
                            <input type="text" id="TpNo" autocomplete="off" required
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
                            <input type="text" id="MoHhead" autocomplete="off" required
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
                            <input type="text" id="street" autocomplete="off" required
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
                            <input type="text" id="State" autocomplete="off" required
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
    </script>
    <script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
