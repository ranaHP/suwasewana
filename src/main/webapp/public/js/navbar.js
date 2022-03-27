
class Navbar{

    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    showHeaderNavItems(div){
        // console.log(this.myUrl);
        document.querySelector("."+div).innerHTML =
            `<a href="${this.myUrl}/s/" style="text-decoration: none!important;font-size: 1.1em;color: gray;">
                            <li  class="nav-item"> Home</li>
                        </a>
                        <a href="${this.myUrl}/s/diseases" style="text-decoration: none!important;font-size: 1.1em;color: gray;">
                            <li class="nav-item"> Diseases</li>
                        </a>
                        <a href="${this.myUrl}/s/announcement" style="text-decoration: none!important;font-size: 1.1em;color: gray;">
                            <li class="nav-item"> Announcement</li>
                        </a>
                        <a href="${this.myUrl}/s/clinic" style="text-decoration: none!important;font-size: 1.1em;color: gray;">
                            <li class="nav-item"> Clinic</li>
                        </a>
                        <a href="${this.myUrl}/s/appointment" style="text-decoration: none!important;font-size: 1.1em;color: gray;">
                            <li class="nav-item"> Appointment</li>
                        </a>
                         <a href="${this.myUrl}/s/Register-for-vaccine" style="text-decoration: none!important;font-size: 1.1em;color: gray;">
                            <li class="nav-item"> Vaccine</li>
                        </a>
                        <a href="${this.myUrl}/s/complain" style="text-decoration: none!important;font-size: 1.1em;color: gray;">
                            <li class="nav-item special-nav"> Complain</li>
                        </a>`
    }
}