class PHIAppointmnetPopup {
    title = '';
    desc = '';
    message = '';
    type = "0";
    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

    constructor(popupContaienr, title, desc, message, type) {
        this.title = title;
        this.desc = desc;
        this.message = message;
        this.type = type;
        this.container = document.getElementById(popupContaienr);
        this.init();
    }

    init() {

        // popup contaienr
        let popupContaienr = document.createElement('div');
        popupContaienr.classList.add('popup-container');

        // popup
        let popup = document.createElement('div');
        popup.classList.add('popup', 'zoomIn');

        // close btn
        let closeBTN = document.createElement('div');
        closeBTN.classList.add('close-btn');
        closeBTN.innerHTML = 'X';
        closeBTN.setAttribute("onclick", "popup.hidePopup()");
        popup.appendChild(closeBTN);

        // icon
        let popupIcon = document.createElement('div');
        popupIcon.classList.add('popup-icon');
        popupIcon.innerHTML = '<i class="feather-16" data-feather="list"  ></i>';

        popup.appendChild(popupIcon);

        // title
        // let popupTitle = document.createElement('div');
        // popupTitle.classList.add('popup-title');
        // popupTitle.innerText = this.title;

        // popup.appendChild(popupTitle);

        // desc
        // let popupDesc = document.createElement('div');
        // popupDesc.classList.add('popup-desc');
        // popupDesc.innerHTML = this.desc;

        // popup.appendChild(popupDesc);

        // message
        let popupMessage = document.createElement('div');
        popupMessage.classList.add('popup-message');
        popupMessage.id = "popupMessageContainer";

        popup.appendChild(popupMessage);

        popupContaienr.appendChild(popup);
        this.container.appendChild(popupContaienr);

    }


    showAppointmentSuccessMessage(data) {
        let eventsContaier = document.createElement('div');
        console.log(data.name);
        let eventDiv = document.createElement('div');
        if (data.status === "success") {
            eventDiv.innerHTML = `
            <div class="popup-title"> User Appointment Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
            </div>
                <div class="row" >
                <div class="form-group" style="padding: 0;">
                        <label >
                            User NIC
                        </label>
                        <input type="text" autofocus autocomplete="off" name="user-nic" id="user-nic"
                               maxlength="13" onkeyup="appointmentObj.searchAppointment()"
                        />
                        <div id="user-nic-error" class="form-field-error"></div>
                    </div>
                    
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px" 
                        onclick="popup.hidePopup()"> Close</button>
                    </div>
                </div>`;
        } else if (data.status === "fail") {
            eventDiv.innerHTML = `
            <div class="popup-title">User Appointment Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
                <div class="error-message"> Reason :  ${data.data}</div>
                <div class="row" >
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px" 
                        onclick="popup.hidePopup()"> Close</button>
                    </div>
                </div>
            </div>`;
        }
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }

    giveTimeSlot(data) {
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        console.log("asd")
        eventDiv.innerHTML = `
            <div class="popup-title">   Appointment Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
                ${(data.round  === 1) ? "<h2> Appointment Acceptance Form</h2>": "<h2> Appointment Postponement Form</h2>"}
                <div class="row" style="display:flex;flex-direction: column;padding-top: 10px" >
                 <label >
                            Time Slot 1
                        </label>
                   <div class="row">
                   <div class="form-group" style="padding: 0 30px;">
                        <label >
                            Start Date & Time
                        </label>
                        <input type="datetime-local" autofocus autocomplete="off" name="ts1sd" id="ts1sd1"
                               maxlength="13" 
                        />
                        <div id="app-ts1sd-error" class="form-field-error"></div>
                    </div>
                   <div class="form-group" style="padding: 0 30px;">
                        <label >
                              End Time
                        </label>
                        <input type="time" autofocus autocomplete="off" name="ts1et" id="ts1et2"
                               maxlength="13" 
                        />
                        <div id="app-ts1et-error" class="form-field-error"></div>
                    </div>
                    
                    </div>
                    <label >
                            Time Slot 2
                        </label>
                   <div class="row">
                   <div class="form-group" style="padding: 0 30px;">
                        <label >
                            Start Date & Time
                        </label>
                        <input type="datetime-local" autofocus autocomplete="off" name="ts2sd" id="ts2sd"
                               maxlength="13" 
                        />
                        <div id="app-ts2sd-error" class="form-field-error"></div>
                    </div>
                   <div class="form-group" style="padding: 0 30px;">
                        <label >
                              End Time
                        </label>
                        <input type="time" autofocus autocomplete="off" name="ts2ed" id="ts2ed"
                               maxlength="13"
                        />
                        <div id="app-ts2ed-error" class="form-field-error"></div>
                    </div>
                    
                    </div>
                    <div class="form-group" style="padding: 0 30px;">
                        <label >
                            Location
                        </label>
                        <input type="text" autofocus autocomplete="off" name="app-location" id="app-location"
                               minlength="3" 
                        />
                        <div id="app-location-error" class="form-field-error"></div>
                    </div>
                    <div class="form-group" style="padding: 0 30px;">
                        <label >
                            
                            ${(data.round  === 1) ? "Special Notice": "Reason to postpone"}
                        </label>
                        <textarea As="textarea" class="textarea" autofocus autocomplete="off" name="app-sn" id="app-sn"
                          
                        ></textarea>
                        <div id="app-sn-error" class="form-field-error"></div>
                    </div>
                </div>
                <div class="row" >
                
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #223580!important;margin-top: 10px" 
                        onclick="giveTimeSlot('` + data.id + `' , '` +data.round + `');"> Save </button>
<!--                         <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #223580!important;margin-top: 10px" -->
<!--                        onclick="popup.hidePopup()"> Save </button>-->
                    </div>
                </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }

    rejectAppointment(data) {
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-title">   Appointment Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
                <h2> Appointment rejection Form</h2>
                <div class="row" style="display:flex;flex-direction: column;padding-top: 10px" >
                    <div class="form-group" style="padding: 0 30px;">
                        <label >
                            Reason to reject
                        </label>
                        <textarea As="textarea"  class="textarea" autofocus autocomplete="off" name="app-rr" id="app-rr"
                          
                        ></textarea>
                        <div id="app-rr-error" class="form-field-error"> </div>
                    </div>
                </div>
                <div class="row" >
                
                    <div class="form-group">
                        <button class="submitBtn btn-danger " style="margin: auto;margin-bottom: 20px;margin-top: 10px" 
                        onclick="rejectAppointmentWithReason({ id: '` + data.id + `' , message: '` + data.message + `'})"> Reject Appointment </button>
                    </div>
                </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }

    appointmentActionFail(data) {
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
                <div class="popup-title">   Appointment Portal </div>
               
                <div class="popup-desc">  SUWASEWANA.LK</div>
                    <h2 style="color: red"> Your Action was not successfully completed !</h2>
                    <div class="row" style="display:flex;flex-direction: column;padding-top: 10px" >
                        <div class="form-group" style="padding: 0 30px;">
                           ` + data.data + `
                            <div id="app-rr-error" class="form-field-error"></div>
                        </div>
                    </div>
                    <div class="row" >
                    
                        <div class="form-group">
                            <button class="submitBtn btn-danger " style="margin: auto;margin-bottom: 20px;margin-top: 10px" 
                            onclick="popup.hidePopup()"> Cancel </button>
                        </div>
                    </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }

    showPopup() {
        this.container.style.display = "block";
    }

    hidePopup() {
        this.container.style.display = "none";
    }

    gotoLogin(route) {
        switch (route) {
            case "login" :
                location.replace(this.myUrl + "/s/login");
                break;
            case "register" :
                location.replace(this.myUrl + "/s/register");
                break;
            default:
                break;

        }
    }


}