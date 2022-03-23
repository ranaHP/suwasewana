
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/Officer_login/Officer_Login.css "/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css "/> "/>
    <script src="<c:url value="/public/js/inputValidation.js"/>"></script>
    <title>Officer_Login</title>

</head>
<body>
    <div class="maincontainer">
        <div class="body-content">
            <div class="body-left">
                <div class="image">
                    <img src=" <c:url value="/public/images/svg/login/image1.svg "/>" alt="" srcset="" style="width: 70%; height: 100%;">

                </div>
            </div>
            <div class="body-right">
                <div class="login-form">
                    <div class="login-title-img">
                        <div class="logo"><img src=" <c:url value="/public/images/logo/logo.png "/> " alt="" srcset="" width="40vw" height="40vh"></div>
                    </div>
                    <div class="title-discription">
                        <div class="login-title">
                             SUWASEWANA Staff Portal
                        </div>
                        <div class="login-description">
                            Feather is a collection of simply beautiful open source icons. Each icon is
                            designed on a 24x24 grid with an emphasis on simplicity/
                        </div>
                    </div>

                    <form  onsubmit="return checkLoginValidation()" id="loginForm">

                        <div class="form-group">
                            <div class="formlable"><label> Mobile Number</label></div>

                            <input type="text" autofocus maxlength="10" required autocomplete="off" name="user-mobile" id="user-mobile"
                                   onkeyup="validation.mobileValidation(
                                        document.getElementById('user-mobile').value,
                                        'user-mobile-error'
                                    ); hideFormError();"
                            />
                            <div id="user-mobile-error" class="form-field-error"></div>
                        </div>
                        <div class="form-group">
                            <div class="formlable"><label> Password</label> </div>

                            <input type="password" required autocomplete="false" name="user-password" id="user-password"
                                   onkeyup="validation.passwordValidation(
                                        document.getElementById('user-password').value,
                                        'user-password-error'
                                    ); hideFormError()"
                            />
                            <div  onclick="passwordVisibility()" class="password-visibility-officer">
                                <i data-feather="eye-off" id="eyeOff" style="display: none" class="c-gray"> </i>
                                <i data-feather="eye" id="eye" class="c-gray"></i>
                            </div>
                            <div id="user-password-error" class="form-field-error"></div>
                        </div>
                        <div class="form-group">
                            <div class="formlable"><label for="officer_types"> Officer Type</label> </div>

                            <select name="officer_types" id="officer_types">
                                <option value="phi">Public Health Officer</option>
                                <option value="co">Clinical Officer</option>
                                <option value="to">Temporary Officer </option>
                                <option value="admin">Admin</option>
                            </select>



                            <div id="user-type-error" class="form-field-error"></div>
                        </div>
                        <div class="loginbtn"><input type="submit" class="login-btn" value="Login" /></div>
                        <div id="user-form-error" class=" form-response-error t-center pt-5" style=" font-size: .6em;">
                            user mobile or password invalid! please try again.
                        </div>
                    </form>
                    <div class="loginfooter-discription">
                        Feather is a collection of simply beautiful open source icons. Each icon is
                        designed on a 24x24 grid with an emphasis on simplicity/
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">Feather is a collection of simply beautiful open source icons. Each icon is
            designed on a <br class="br">24x24 grid with an emphasis on simplicity/</div>
    </div>

    <script defer>
        myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

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
                let url = myUrl+"/officer-login-controller?user_mobile=" + document.getElementById("user-mobile").value+ "&user_password=" + document.getElementById("user-password").value + "&Post=" +document.getElementById('officer_types').value;
                const xhttp = new XMLHttpRequest();
                xhttp.onload = function () {

                    console.log(this.response)
                    // let result = JSON.parse(this.response);
                    // // result=this.response;
                    // console.log(url)
                    // console.log(this.response);
                    // if (result.status === "success") {
                    // //     location.replace("https://www.w3schools.com");
                    // } else if (result.status === "error") {
                    //     document.getElementById('user-form-error').style.display = "block";
                    //     document.getElementById('user-form-error').innerText = result.data;
                    //     document.getElementById("user-password").value = "";
                    //     document.getElementById("user-mobile").value = "";
                    //     setTimeout(() => {
                    //         document.getElementById('user-form-error').style.display = "none";
                    //     }, 8000)
                    // }
                    // else{
                    //     console.log("somthing going wrong");
                    // }
                //     console.log(this.response)
                //
                }
                xhttp.open("GET", url, true);
                xhttp.send();
            }
            return false;
        }

    </script>
    <script>
        feather.replace({width: "16px"})
        hideFormError();
    </script>
</body>
</html>
