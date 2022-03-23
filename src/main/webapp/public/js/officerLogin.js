class OfficerLogin{
    myUrlmain = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    init(){

        var temp = this.getCookie("sDetails");
        console.log(temp)
        if(temp != ""){
            console.log("temp")

            console.log(temp.split("/")[2])

            console.log("temp")

            switch (temp.split("/")[2].toLowerCase()){
                case  "phi":
                    location.replace( "/test_war_exploded/s/PHI-dashboard");
                    break;
                case  "rphi":
                    location.replace( "/test_war_exploded/s/PHI-dashboard");
                    break;
                case  "co":
                    location.replace( "/test_war_exploded/s/clinic-dashboard");
                    break;
                case  "to":
                    location.replace( "/test_war_exploded/s/PHI-dashboard");
                    break;
                case  "admin":
                    location.replace( "/test_war_exploded/s/admin-dashboard");
                    break;
            }
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