class LoginLogout{
    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    showLoginLogoutItems(div){
        // console.log(this.myUrl);
       console.log( this.getCookie("unic"));
       if(this.getCookie("unic") != ""){
           document.querySelector("."+div).innerHTML +=
           `<div class="register-btn" onclick="window.location='${this.myUrl}/s/register';" >
                ${this.getCookie("unic")}
            </div>
            <div class="login-btn" onclick="window.location='${this.myUrl}/s/  ';">
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
        if(this.getCookie('unic') != ""){
            window.location='${this.myUrl}/s/';
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

}