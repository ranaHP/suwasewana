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
<%--    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/>"/>--%>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <%-- input field validation--%>
<%--    <script src="<c:url value="/public/js/inputValidation.js"/>"></script>--%>
    <script>
        <%@include file="../../public/js/inputValidation.js"%>
    </script>
    <style>
        <%@include file="../../public/css/partials/_login.css"%>
        <%@include file="../../public/css/commenStyles.css"%>
    </style>
</head>
<body>
<div class="login">
    <div class="container">
        <%--left division --%>
        <div class="left">
            <%--logo container--%>
            <div class="logo">
                <img src="<c:url value="/public/images/logo/logo.png"/>"/>
            </div>
            <%--logo container--%>
            <div class="features">
                <div class="feature">
                    <div class="feature-icon">
                        <i data-feather="check-circle"></i>
                    </div>
                    <span> Government Announcement </span>
                </div>

                <div class="feature">
                    <div class="feature-icon">
                        <i data-feather="check-circle"></i>
                    </div>
                    <span> Clinic Schedule </span>
                </div>

                <div class="feature">
                    <div class="feature-icon">
                        <i data-feather="check-circle"></i>
                    </div>
                    <span> PHI's  Announcement </span>
                </div>

                <div class="feature">
                    <div class="feature-icon">
                        <i data-feather="check-circle"></i>
                    </div>
                    <span> Diseases Information </span>
                </div>

                <div class="feature">
                    <div class="feature-icon">
                        <i data-feather="check-circle"></i>
                    </div>
                    <span> Medicine Reminders </span>
                </div>

                <div class="feature">
                    <div class="feature-icon">
                        <i data-feather="check-circle"></i>
                    </div>
                    <span> Emergency Ambulance </span>
                </div>
            </div>
            <%--                login svg image comtaienr    --%>
            <div class="login-image">
                <img src="<c:url value="/public/images/svg/login/image1.svg"/>"/>
            </div>
        </div>
        <%--                lofin form container--%>
        <div class="right">
            <%--                having-troble container--%>
            <div class="having-trouble">
                Having troubles: <span> Get Help </span>
            </div>
            <%--                logo for sm size--%>
            <div class="sm-logo">
                <img src="<c:url value="/public/images/logo/logo.png"/>" width="30px"/>
            </div>
            <%--                login from--%>
            <div class="login-form">
                <%--                    flofin form title--%>
                <div class="login-title">
                    LOGIN WITH USER ACCOUNT
                </div>
                <%--                    login form description--%>
                <div class="login-description">
                    Feather is a collection of simply beautiful open source icons. Each icon is
                    designed on a 24x24 grid with an emphasis on simplicity/
                </div>
                <form onsubmit="return checkLoginValidation()" id="loginForm">

                    <div class="form-group">
                        <label> Mobile Number</label>
                        <input type="text" autofocus
                               autocomplete="off" name="user-mobile" id="user-mobile"
                               onkeyup="validation.mobileValidation(
                                       document.getElementById('user-mobile').value,
                                       'user-mobile-error'
                                   ); hideFormError();"
                               maxlength="10"
                        />
                        <div id="user-mobile-error" class="form-field-error"></div>
                    </div>
                    <div class="form-group">
                        <label> Password</label>
                        <div class="w-100 p-relative">
                            <input type="password" autocomplete="false" name="user-password" id="user-password"
                                   class="w-100 p-relative"
                                   onkeyup="validation.passwordValidation(
                                   document.getElementById('user-password').value,
                                   'user-password-error'
                               ); hideFormError()"
                            />
                            <div onclick="passwordVisibility()" class="password-visibility">
                                <i data-feather="eye-off" id="eyeOff" style="display: none" class="c-gray"> </i>
                                <i data-feather="eye" id="eye" class="c-gray"></i>
                            </div>
                        </div>


                        <div id="user-password-error" class="form-field-error"></div>
                    </div>

                    <div class="form-group">
                        <input type="submit" class="login-btn" value="Login"/>
                    </div>
                    <div id="user-form-error" class="d-none form-response-error t-center pt-5">
                        user mobile or password invalid! please try again.
                    </div>
                    <c:if test="${status != null}">

                        <div class="alert-danger1">
                                ${status}
                        </div>
                        <%--                        <%--%>
                        <%--                            request.removeAttribute("status");--%>
                        <%--                        %>--%>
                    </c:if>
                </form>
            </div>
            <%--    sign-with-option --%>
            <div class="sign-with-option">
                <%--                    sign with google --%>
                <div class="sign-option">
                    <img src="<c:url value="/public/images/signwithIcon/google.png"/>" width="30px"/> Sign with Google
                </div>
                <%--                    or-text--%>
                <div class="or-text">
                    OR
                </div>
                <%--                    sign with facebook--%>
                <div class="sign-option">
                    <img src="<c:url value="/public/images/signwithIcon/facebook.png"/>" width="30px"/> Sign with
                    facebook
                </div>
            </div>
            <%--    footer-text--%>
            <div class="footer-text">
                Feather is a collection of simply beautiful open source icons. Each icon is
                designed on a 24x24 grid with an emphasis on simplicity/
            </div>
        </div>

    </div>

</div>
<script defer>
    let validation = new FormInputValidation();

    function passwordVisibility() {
        let passwordInput = document.getElementById('user-password');
        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            document.getElementById("eyeOff").style.display = "block";
            document.getElementById("eye").style.display = "none";
        } else {
            passwordInput.type = "password";
            document.getElementById("eye").style.display = "block";
            document.getElementById("eyeOff").style.display = "none";
        }
    }

    function hideFormError() {
        document.getElementById('user-form-error').style.display = "none";
    }

    function checkLoginValidation() {

        if (
            validation.mobileValidation(document.getElementById('user-mobile').value, 'user-mobile-error') &&
            validation.passwordValidation(document.getElementById('user-password').value, 'user-password-error')
        ) {
            let url = "/test_war_exploded/user-login-controller?user-mobile=" + document.getElementById("user-mobile").value.substring(1) + "&user-password=" + document.getElementById("user-password").value;
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                let result = JSON.parse(this.response);
                if (result.status === "success") {
                    location.replace("https://www.w3schools.com");
                } else if (result.status === "error") {
                    document.getElementById('user-form-error').style.display = "block";
                    document.getElementById("user-password").value = "";
                    document.getElementById("user-mobile").value = "";
                    setTimeout(() => {
                        document.getElementById('user-form-error').style.display = "none";
                    }, 8000)
                }
            }
            xhttp.open("GET", url, true);
            xhttp.send();
        }
        return false;
    }


</script>
<script>
    feather.replace({width: "16px"})
</script>
</body>
</html>
