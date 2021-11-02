class LoginDetails{
    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    showLoginDetails(div){
        if(this.getCookie("uDetails") != ""){
            document.querySelector("."+div).innerHTML =
                ` <img src="` + this.myUrl +  `/public/images/avatar.png" width="90px"/>
                    <div class="profile-name">
                        ${this.getCookie("uDetails").split("/")[0]}
                    </div>
                    <div class="profile-location">
                        Akuressa
                    </div>
                    <div class="moh-area">
                        Matara MOH
                    </div>`
        }else{
            document.querySelector("."+div).innerHTML =
                ` <img src="` + this.myUrl +  `/public/images/avatar.png" width="90px"/>
                    <div class="profile-name">
                        ${this.getCookie("uDetails").split("/")[0]}
                    </div>
                    <div class="profile-location">
                        Akuressa
                    </div>
                    <div class="moh-area">
                        Matara MOH
                    </div>`
        }

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