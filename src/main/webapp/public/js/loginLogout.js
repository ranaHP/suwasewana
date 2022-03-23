class LoginLogout{
    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    showLoginLogoutItems(div){
        // console.log(this.myUrl);
        // console.log( "----------------");
        // console.log( this.getCookie("uDetails"));
        // console.log( "----------------");
       if(this.getCookie("uDetails") != ""){
           document.querySelector("."+div).innerHTML +=
           `<div class="register-btn" onclick="window.location='${this.myUrl}/s/register';" >
                Hi ${this.getCookie("uDetails").split("/")[0]}
            </div>
            <div class="login-btn" onclick="loginRegsiter.logout()">
                Logout
            </div>`
       }else{
           document.querySelector("."+div).innerHTML +=
               `<div class="register-btn" onclick="window.location='${this.myUrl}/s/register';" >
                Register
            </div>
            <div class="login-btn" onclick="window.location='${this.myUrl}/s/login  ';">
                Login
            </div>`
       }
    }

    showLoginLogoutItemsLogin(div){
        if(this.getCookie('uDetails') != ""){
            window.location='/test_war_exploded/s/';
        }else{
            document.querySelector("."+div).innerHTML +=
                `
            <div class="register-btn">
               
            </div>
            <div class="login-btn" onclick="window.location='${this.myUrl}/s/register  ';">
                Register
            </div>`
        }
    }
    showLoginLogoutItemsRegister(div){
        document.querySelector("."+div).innerHTML +=
            `
            <div class="register-btn"  >
                
            </div>
            <div class="login-btn" onclick="window.location='${this.myUrl}/s/login  ';">
                Login
            </div>`
    }
    getCookie(cname) {
        let name = cname + "=";
        let decodedCookie = decodeURIComponent(document.cookie);
        let ca = decodedCookie.split(';');
        for(let i = 0; i <ca.length; i++) {
            let c = ca[i];
            while (c.charAt(0) == ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "";
    }
    logout(){

        // window.location='${this.myUrl}/s/';
        const xhttp = new XMLHttpRequest();
        xhttp.onload = function () {
            console.log(this.response);
            // document.cookie = "unic" + "=" + "" + ";" + (1*24*60*60*1000) + ";path=/";
            var pathBits = location.pathname.split('/');
            var pathCurrent = ' path=';

            // do a simple pathless delete first.
            document.cookie = 'uDetails' + '=; expires=Thu, 01-Jan-1970 00:00:01 GMT;';

            for (var i = 0; i < pathBits.length; i++) {
                pathCurrent += ((pathCurrent.substr(-1) != '/') ? '/' : '') + pathBits[i];
                document.cookie = 'uDetails' + '=; expires=Thu, 01-Jan-1970 00:00:01 GMT;' + pathCurrent + ';';
            }
            location.replace( "/test_war_exploded/s/login")

        }
        xhttp.open("GET", this.myUrl+"/user-login-controller/logout?unic="+this.getCookie("uDetails").split("/")[1], true);
        xhttp.send();
    }

}