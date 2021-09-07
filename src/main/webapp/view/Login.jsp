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
    <link rel="stylesheet" href="<c:url value="/public/css/partials/_login.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/public/css/alert.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/public/css/validation.css"/>"/>
    <script src="https://unpkg.com/feather-icons"></script>

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
                    <a href="http://localhost:8092/test_war_exploded/dashboard"><span> Government Announcement </span></a>
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
                <form action="/test_war_exploded/user-login-controller" method="post">

                    <div class="form-group">
                        <label> Mobile Number</label>
                        <input type="number"
                               autocomplete="false" name="user-mobile"
                        />
                    </div>
                    <div class="form-group">
                        <label> Password</label>
                        <input type="number" autocomplete="false" name="user-password"/>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="login-btn" value="Login"/>
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
<script>
    feather.replace()
</script>
</body>
</html>
