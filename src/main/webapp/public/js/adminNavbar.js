class Navbar{
    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    showHeaderNavItems(div){
        // console.log(this.myUrl);
        document.querySelector("."+div).innerHTML =
            `<a href="${this.myUrl}/s/">
                            <li class="nav-item"> Home</li>
                        </a>
                        <a href="${this.myUrl}/s/">
                            <li class="nav-item"> Diseases</li>
                        </a>
                        <a href="${this.myUrl}/s/announcement">
                            <li class="nav-item"> Announcement</li>
                        </a>
                        <a href="${this.myUrl}/s/clinic">
                            <li class="nav-item"> Clinik</li>
                        </a>
                        <a href="${this.myUrl}/s/appointment">
                            <li class="nav-item"> Appointment</li>
                        </a>
                        <a href="${this.myUrl}/s/">
                            <li class="nav-item special-nav"> PHI Details</li>
                        </a>`
    }
}