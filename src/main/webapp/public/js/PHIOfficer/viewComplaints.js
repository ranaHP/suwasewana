class viewcomplain{
    constructor( complain) {
        console.log("asd")
        this.init(complain);

    }
    init(complaints){
        let container = document.getElementById("complain-section")
        let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

        complaints.map((item=>{
            let complaintBox = document.createElement("div")
            complaintBox.classList.add("complaint")
            complaintBox.innerHTML=`
                <div class="description">
                <p class="f-black" id="com-type">${item.Title}</p>
                <p class="f-3">${item.Date}</p>
                <p class="f-4" class="description1" id="des">${item.description} </p>
                </div>
                <div class="action">
                    <div class="details">
                        <div class="Action-taken">
                            <p class="f-4">Action</p>
                            <p class="f-3">${item.Action}</p>
                        </div>
                        <div class="type">
                            <p class="f-4">Type</p>
                            <p class="f-3">${item.Type}</p>
                        </div>
                        <div class="view-details">
                            <p class="f-4"j >User details</p>
                            <p class="f-3"><a style="color: blue; cursor: pointer"  onclick="popup.showPopup()">view</a></p>
                        </div>
                    </div>
                    <div class="images-button-section">
                        <!-- images of complaint -->
                        <div class="img">
                        <div class="pre-button"><object data="${Url}/public/images/icons/chevron-left.svg" width="12" height="12"> </object></i></div>
                        <div class="images"><img src="${Url}/public/images/animal-complaint.jpg" width="120px" height="80px"/></div>
                        <div class="next-button"><object data="${Url}/public/images/icons/chevron-right.svg" width="12" height="12"> </object></div>
                        </div>
                        <!-- action buttons -->
                        <div class="buttons">
                            <div class="to-be-progress">
                                <button class="f-4" onclick="popup.showPopup()">To be progress</button>
                            </div>
                            <div class="done">
                                <button class="f-4">Done</button>
                            </div>
                        </div>
                        
                    </div>
                </div>
                `
            container.appendChild(complaintBox)
        }))

        var select = document.getElementById("select")
        var value = select.options[select.selectedIndex].value;

        complaints.map((item=>{

        }))
    }

}