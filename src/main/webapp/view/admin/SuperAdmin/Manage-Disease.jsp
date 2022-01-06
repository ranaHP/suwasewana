<%--
  Created by IntelliJ IDEA.
  User: hansana
  Date: 1/1/2022
  Time: 9:23 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add disease</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <%--    for popup style--%>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <%--    for popup script--%>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <link href="<c:url value="/public/css/user/_commen.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/public/css/Admin/diseases.css"/>" rel="stylesheet"/>

</head>
<body id="mainContent">
<c:import url="/view/admin/partials/AdminOfficerSideNavbar.jsp"/>
<div class="mypopup" id="popup" style="display: none;"></div>
<div class="manage_disease_main_Container">

    <div class="header">
        <div class="upper-title">SUWASEWANA</div>
        <div class="dashboard-name">Admin/Register/ClinicalOfficer</div>
    </div>
    <div class="add-disease">
        <div class="body-content">
            <div class="MR_container">
                <div class="manage-diseases-container">
                    <div class="form-header">
                        <div class="form-header-title">
                            Current Comment Disease in Sri lanka
                        </div>
                        <div class="primary-outline-btn ">
                            Add New Disease
                        </div>
                    </div>
                    <div class="disease-table-container">
                        <div class="container">

                            <div class="table">
                                <div class="table-header">
                                    <div class="header__item">Rank</div>
                                    <div class="header__item">Disease</div>
                                    <div class="header__item">Registered</div>
                                    <div class="header__item">Clinics</div>
                                    <div class="header__item " >Action</div>
                                </div>
                                <div class="table-content">
                                    <div class="table-row">
                                        <div class="table-data">1</div>
                                        <div class="table-data"><a>Covid 19</a></div>
                                        <div class="table-data">352,212,222</div>
                                        <div class="table-data">120</div>
                                        <div class="table-data disease-action-btn-container"  >
                                            <div class="warnig-outline-btn"> Edit</div>
                                            <div  class="danger-outline-btn"> Block For Pepols </div>
                                        </div>
                                    </div>
                                    <div class="table-row">
                                        <div class="table-data">1</div>
                                        <div class="table-data"><a>Covid 19</a></div>
                                        <div class="table-data">352,212,222</div>
                                        <div class="table-data">120</div>
                                        <div class="table-data disease-action-btn-container"  >
                                            <div class="warnig-outline-btn"> Edit</div>
                                            <div  class="danger-outline-btn"> Block For Pepols </div>
                                        </div>
                                    </div>
                                    <div class="table-row">
                                        <div class="table-data">1</div>
                                        <div class="table-data"><a>Covid 19</a></div>
                                        <div class="table-data">352,212,222</div>
                                        <div class="table-data">120</div>
                                        <div class="table-data disease-action-btn-container"  >
                                            <div class="warnig-outline-btn"> Edit</div>
                                            <div  class="danger-outline-btn"> Block For Pepols </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>


</div>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
