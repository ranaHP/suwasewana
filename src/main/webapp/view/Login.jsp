<%--
  Created by IntelliJ IDEA.
  User: hansana
  Date: 8/27/2021
  Time: 7:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../public/css/partials/_login.css"/>
    <script src="https://unpkg.com/feather-icons"></script>

</head>
<body>
<div class="login">
    <div class="container">
        <%--left division --%>
        <div class="left">
            <%--logo container--%>
            <div class="logo">
                <img src="../public/images/logo/logo.png" />

            </div>
            <%--logo container--%>
            <div class="features">
                <div class="feature">
                    <i data-feather="check-circle"></i>
                    <span> Government Announcement </span>
                </div>

                <div class="feature">
                    <i data-feather="check-circle"></i>
                    <span> Clinic Schedule </span>
                </div>

                <div class="feature">
                    <i data-feather="check-circle"></i>
                    <span> PHI's  Announcement </span>
                </div>

                <div class="feature">
                    <i data-feather="check-circle"></i>
                    <span> Diseases Information </span>
                </div>

                <div class="feature">
                    <i data-feather="check-circle"></i>
                    <span> Medicine Reminders </span>
                </div>

                <div class="feature">
                    <i data-feather="check-circle"></i>
                    <span> Emergency Ambulance </span>
                </div>
            </div>
            <%--                login svg image comtaienr    --%>
            <div class="login-image">
                <img src="../public/images/svg/login/image1.svg" />
            </div>
        </div>
        <%--                lofin form container--%>
        <div class="right">
            <%--                having-troble container--%>
            <div class="having-trouble">
                Having troubles: <span > Get Help </span>
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
                <form>

                    <div class="form-group">
                        <label> Mobile Number</label>
                        <input type="number" required autocomplete="false" name="user-mobile"/>
                    </div>
                    <div class="form-group">
                        <label> Password</label>
                        <input type="number" required autocomplete="false" name="user-mobile"/>
                    </div>
                    <input type="submit" class="login-btn" value="Login" />
                </form>
            </div>
            <%--    sign-with-option --%>
            <div class="sign-with-option">
                <%--                    sign with google --%>
                <div class="sign-option">
                    <img src="../public/images/signwithIcon/google.png" width="30vw" /> Sign with Google
                </div>
                <%--                    or-text--%>
                <div class="or-text">
                    OR
                </div>
                <%--                    sign with facebook--%>
                <div class="sign-option">
                    <img src="../public/images/signwithIcon/facebook.png" width="30vw"/> Sign with facebook
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
