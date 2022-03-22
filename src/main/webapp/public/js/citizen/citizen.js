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
    let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

    if (
        validation.mobileValidation(document.getElementById('user-mobile').value, 'user-mobile-error') &&
        validation.passwordValidation(document.getElementById('user-password').value, 'user-password-error')
    ) {
        let url = myUrl+"/user-login-controller?user_mobile=" + document.getElementById("user-mobile").value + "&user_password=" + document.getElementById("user-password").value;
        const xhttp = new XMLHttpRequest();
        xhttp.onload = function () {
            let result = JSON.parse([this.response]);
            if (result.status === "success") {
                location.replace(myUrl + "/s/");
            } else if (result.status === "error") {
                document.getElementById('user-form-error').innerText = result.data;
                document.getElementById('user-form-error').style.color = 'red';
                document.getElementById('user-form-error').style.fontSize = '1.3em';
                document.getElementById('user-form-error').style.display = "block";
                document.getElementById("user-password").value = "";
                document.getElementById("user-mobile").value = "";
                setTimeout(() => {
                    document.getElementById('user-form-error').style.display = "none";
                }, 300000)
            }
        }
        xhttp.open("GET", url, true);
        xhttp.send();
    }
    return false;
}
