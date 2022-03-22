<%--
  Created by IntelliJ IDEA.
  User: hansana
  Date: 8/27/2021
  Time: 7:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--    <link rel="stylesheet" href="<c:url value="/public/css/partials/_login.css"/>"/>--%>
    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/>"/>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <%-- input field validation--%>
    <script src="<c:url value="/public/js/inputValidation.js"/>"></script>
    <!-- for style sheet link  -->
    <link href="<c:url value="/public/css/user/_login-home.css"/>" rel="stylesheet"/>
    <!-- for commen style  sheet link  -->
    <link href="<c:url value="/public/css/user/_commen.css"/>" rel="stylesheet"/>
    <script src="<c:url value="/public/js/navbar.js"/>"></script>
    <script src="<c:url value="/public/js/loginLogout.js"/>"></script>

</head>
<body>
<!-- main container -->
<div class="container"
     style="display: flex;flex-direction: column; justify-content: space-between;min-height: 100vh;">
    <!-- hero banner -->
    <section class="hero-banner-main-header-container">
        <!-- for header -->
        <div class="user-main-header-container">
            <div class="main-header">
                <div class="logo">
                    <img src="<c:url value="/public/images/logo.png "/>" alt="logo" width="100%"/>
                </div>
                <div class="navbar-container">
                    <ul class="navbar">
                        <script> let navs =  new Navbar(); navs.showHeaderNavItems("navbar"); </script>
                    </ul>
                </div>
                <div class="login-register-container">
                    <div class="language">
                        <span> සිංහල </span>
                        <img src="<c:url value="/public/images/sri-lanka.png "/>" alt="sri lanakan flag" width="100%">
                    </div>
                    <script>
                        let loginRegsiter = new LoginLogout(); loginRegsiter.showLoginLogoutItemsLogin("login-register-container")
                    </script>
                </div>
            </div>
        </div>
        <!-- register form -->

        <div class="login-form-container">
            <div class="section-title" style="background-color: transparent;margin: 30px 0  ;">
                <div class="header">
                    සුවසෙවන වෙත පිවිසෙන්න

                </div>
                <div class="title-sub">
                    අද දිනයේ කොවිඩ් සඳහා එන්නත්කරණ කටයුතු සිදු කෙරෙන ස්ථාන 212ක්
                </div>
            </div>
            <div class="login-form">
                <form onsubmit="return checkLoginValidation()" id="loginForm">
                    <div class="form-sub-title">
                        <label> Login Credentials</label>
                        <hr width="100%" class="m-auto hr">
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <label for="user-mobile">
                                Mobile Number
                            </label>
                            <input type="text" autofocus
                                   autocomplete="off" name="user-mobile" id="user-mobile"
                                   onkeyup="validation.mobileValidation(
                                       document.getElementById('user-mobile').value,
                                       'user-mobile-error'
                                   ); hideFormError();"
                                   maxlength="10"
                                   value="0412283111"
                            />
                            <div id="user-mobile-error" class="form-field-error"></div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="form-group">
                            <label for="user-password">
                                Password
                            </label>
                            <div class="w-100 p-relative">
                                <input type="password" autocomplete="false" name="user-password" id="user-password"
                                       class="w-100 p-relative"
                                       onkeyup="validation.passwordValidation(
                                   document.getElementById('user-password').value,
                                   'user-password-error'
                               ); hideFormError()"
                                  value="asd123ASD123"
                                />
                                <div onclick="passwordVisibility()" class="password-visibility">
                                    <i data-feather="eye-off" id="eyeOff" style="display: none" class="c-gray"> </i>
                                    <i data-feather="eye" id="eye" class="c-gray"></i>
                                </div>
                            </div>


                            <div id="user-password-error" class="form-field-error"></div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="form-group" style="display: flex;justify-content: center;align-items: center;">
                            <button class="submitBtn"> Login</button>
                        </div>
                    </div>
                    <div id="user-form-error" class="d-none form-response-error t-center pt-5" >
                        user mobile or password invalid! please try again.
                    </div>
<%--                    <div class="row" style="justify-content: space-around;">--%>
<%--                        <div class="item">--%>
<%--                            <img src="<c:url value="/public/images/google.png"/>" width="15px"/>--%>
<%--                            Google සමග පිවිසීම--%>
<%--                        </div>--%>
<%--                        <div class="item">--%>
<%--                            හෝ--%>
<%--                        </div>--%>
<%--                        <div class="item">--%>
<%--                            <img src="<c:url value="/public/images/facebook.png"/>" width="15px"/>--%>
<%--                            Facebook සමග පිවිසීම--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <div class="row login-footer">
                        <div class="login-footer-text">
                            Feather is a collection of simply beautiful open source icons.<br/> Each icon is
                            designed on a 24x24 grid with an emphasis on simplicity
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- this for latest announcements -->

    <div class="main-footer">
        <div class="first-row">
            <img src="<c:url value="/public/images/logo.png "/>" alt="logo" width="45px"/>
            <div class="navbar-container">
                <ul class="navbar navbar1">
                    <script> let navs1s =  new Navbar(); navs.showHeaderNavItems("navbar1"); </script>
                </ul>
            </div>
        </div>
        <div class="second-row">
            © 2021 SUWASEWANA.LK | All Right Reserved
        </div>
    </div>
</div>
<script defer  src="<c:url value="/public/js/citizen/citizen.js"/>"></script>
<script>
    feather.replace({width: "16px"})
</script>
</body>
</html>
