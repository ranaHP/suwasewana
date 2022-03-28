
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/Officer_login/Officer_Login.css "/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css "/> "/>
    <script src="<c:url value="/public/js/inputValidation.js"/>"></script>
    <script src="<c:url value="/public/js/officerLogin.js"/>"></script>
    <%--    for popup style--%>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/public/css/popup/Appintmentpopup.css"/>" rel="stylesheet"/>
    <%--    for popup script--%>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
    <script>
        let loginCheck = new OfficerLogin();
        loginCheck.init()
    </script>
    <title>Officer_Login</title>

</head>
<body>
<div class="mypopup" id="popup" style="display: none;"></div>
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
                            <div class="formlable"><label id="user_name_lable" > Mobile Number</label></div>

                            <input type="text" maxlength="10" required autocomplete="off"
                                   name="user-mobile" id="user-mobile"
                                   onkeyup="validation.mobileValidation(
                                        document.getElementById('user-mobile').value,
                                        'user-mobile-error'
                                    ); hideFormError();"
                            />
                            <input type="text"  maxlength="10"
                                   name="admin-code" id="admin-code"
                                   style="display: none"
                            />
                            <div id="user-mobile-error" c-class="form-field-error"></div>
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

                            <select name="officer_types" id="officer_types" onchange="onChangeAdmin()">z
                                <option value="phi">Public Health Officer</option>
                                <option value="rphi">Regional Public Health Officer</option>
                                <option value="co">Clinical Officer</option>
                                <option value="to">Temporary Officer </option>
                                <option value="admin">Admin</option>
                            </select>



                            <div id="user-type-error" class="form-field-error"></div>
                        </div>
                        <div class="loginbtn"><input type="submit" class="login-btn" value="Login" /></div>
                        <div id="user-form-error" class=" form-response-error t-center pt-5" style=" font-size: .9em;float: left">
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
        let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
        function onChangeAdmin(){
            var s_value = document.getElementById('officer_types').value;
            if(s_value == 'admin'){
                document.getElementById('admin-code').style.display = 'block';
                document.getElementById('user-mobile').style.display = 'none';
                document.getElementById('user_name_lable').innerText = 'Admin Code';
            }else{
                document.getElementById('admin-code').style.display = 'none';
                document.getElementById('user-mobile').style.display = 'block';
                document.getElementById('user_name_lable').innerText = 'Mobile Number';
            }
        }
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
        var i=0;
        function checkLoginValidation() {
            var s_value = document.getElementById('officer_types').value;
            if(s_value == 'admin'){
                if (
                    // validation.mobileValidation(document.getElementById('admin-code').value, 'user-mobile-error') &&
                    validation.passwordValidation(document.getElementById('user-password').value, 'user-password-error')
                ) {
                    let url = myUrl+"/officer-login-controller?user_mobile=" +
                        document.getElementById("admin-code").value+ "&user_password=" +
                        document.getElementById("user-password").value + "&Post=" +
                        document.getElementById('officer_types').value;
                    const xhttp = new XMLHttpRequest();
                    // console.log(url)
                    xhttp.onload = function () {

                        let result = JSON.parse(this.response);
                        if (result.status === "success") {




                            switch (document.getElementById('officer_types').value){
                                case  "phi":
                                    location.replace( myUrl +"/s/PHI-dashboard");
                                    break;
                                case  "rphi":
                                    location.replace( myUrl +"/s/PHI-dashboard");
                                    break;
                                case  "co":
                                    location.replace( myUrl +"/s/clinic-dashboard");
                                    break;
                                case  "to":
                                    location.replace( myUrl +"/s/PHI-dashboard");
                                    break;
                                case  "admin":
                                    location.replace( myUrl +"/s/admin-dashboard");
                                    break;
                            }
                        } else if (result.status === "error") {
                            document.getElementById('user-form-error').style.display = "block";
                            document.getElementById('user-form-error').innerText = result.data;
                            document.getElementById("user-password").value = "";
                            document.getElementById("user-mobile").value = "";
                            setTimeout(() => {
                                document.getElementById('user-form-error').style.display = "none";
                            }, 8000)
                        }
                        else{
                            console.log("somthing going wrong");
                        }
                        console.log(this.response)
                    }
                    xhttp.open("GET", url, true);
                    xhttp.send();
                }
            }else{
                if (
                    validation.mobileValidation(document.getElementById('user-mobile').value, 'user-mobile-error') &&
                    validation.passwordValidation(document.getElementById('user-password').value, 'user-password-error')
                ) {
                    let url = myUrl+"/officer-login-controller?user_mobile=" +
                        document.getElementById("user-mobile").value+ "&user_password=" +
                        document.getElementById("user-password").value + "&Post=" +
                        document.getElementById('officer_types').value;
                    const xhttp = new XMLHttpRequest();

                    console.log(url)
                    xhttp.onload = function () {

                        let result = JSON.parse(this.response);
                        if (result.status === "success") {
                            console.log("successfully login")
                            let reqData =
                                {
                                    mobile:document.getElementById("user-mobile").value,
                                    password: document.getElementById("user-password").value
                                };
                                $.post(myUrl+ "/admin-controller/newUser",
                                    reqData,
                                    function (data, status) {

                                        if (data.includes("success")) {
                                            console.log("new user ")
                                            popup.ValidateNewPassword( document.getElementById("user-mobile").value,document.getElementById("user-password").value);
                                        } else {
                                            console.log("old user ")
                                            switch (document.getElementById('officer_types').value){
                                                case  "phi":
                                                    location.replace( myUrl +"/s/PHI-dashboard");
                                                    break;
                                                case  "rphi":
                                                    location.replace( myUrl +"/s/RPHI-dashboard");
                                                    break;
                                                case  "co":
                                                    location.replace( myUrl +"/s/clinic-dashboard");
                                                    break;

                                                case  "admin":
                                                    location.replace( myUrl +"/s/admin-dashboard");
                                                    break;
                                            }
                                        }
                                    }
                                );


                        } else if (result.status === "error") {
                            i++;
                            document.getElementById('user-form-error').style.display = "block";
                            document.getElementById('user-form-error').innerText = result.data;
                            // document.getElementById("user-password").value = "";
                            // document.getElementById("user-mobile").value = "";
                            // setTimeout(() => {
                            //     document.getElementById('user-form-error').style.display = "none";
                            // }, 8000)

                            if(i==3){

                                Blockuser();
                            }
                        }
                        else{
                            i++;

                            console.log("somthing going wrong");
                        }
                        console.log("reesponse "+this.response)
                        console.log("i "+i)
                    }
                    xhttp.open("GET", url, true);
                    xhttp.send();
                }
            }

            return false;
        }
        function Blockuser(){
            let reqData =
                {
                    mobile:document.getElementById("user-mobile").value

                };
            $.post(myUrl+ "/admin-controller/blockUser",
                reqData,
                function (data, status) {
                    document.getElementById('user-form-error').style.display = "block";
                    document.getElementById('user-form-error').innerText = "You're Temporarily blocked";
                });
        }
        function CheckPasswords(u,p){
            pass1=document.getElementById("pass1").value
            pass2=document.getElementById("pass2").value
            if(document.getElementById("pass1").value==document.getElementById("pass2").value){
                popup.hidePopup();
                let reqdata={
                    uname:u,
                    oldpassword:p,
                    newpassword:pass1,

                }
                $.post(myUrl+"/admin-controller/updateToOld",
                    reqdata,
                    function (data, status) {
                        console.log("Update new password ")
                        // switch (document.getElementById('officer_types').value){
                        //     case  "phi":
                        //         location.replace( myUrl +"/s/PHI-dashboard");
                        //         break;
                        //     case  "rphi":
                        //         location.replace( myUrl +"/s/PHI-dashboard");
                        //         break;
                        //     case  "co":
                        //         location.replace( myUrl +"/s/clinic-dashboard");
                        //         break;
                        //     case  "to":
                        //         location.replace( myUrl +"/s/PHI-dashboard");
                        //         break;
                        //     case  "admin":
                        //         location.replace( myUrl +"/s/admin-dashboard");
                        //         break;
                        // }

                    }
                );
            }
            else{
                document.getElementById("error").style.display = "block";
                document.getElementById("pass1").value=""
                document.getElementById("pass2").value=""
            }

            let reqdata={
                newTask:document.getElementById("pass1").value
            }
        }

    </script>
    <script>
        feather.replace({width: "16px"})
        hideFormError();
    </script>
</body>
</html>
