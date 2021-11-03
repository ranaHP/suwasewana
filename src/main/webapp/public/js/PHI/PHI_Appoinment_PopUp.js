class PHIAppointmnetPopup{
    title= '';
    desc = '';
    message = '';
    type= "0";
    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

    constructor(popupContaienr, title, desc, message, type ){
        this.title = title;
        this.desc = desc;
        this.message = message;
        this.type = type;
        this.container = document.getElementById(popupContaienr);
        this.init();
    }

    init(){

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
        if(data.status === "success"){
            eventDiv.innerHTML = `
            <div class="popup-title"> User Appointment Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
            </div>
                <div class="row" >
                <div class="form-group" style="padding: 0;">
                        <label for="user-nic">
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
        }else if(data.status === "fail"){
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
        if(data.round === "0"){
            eventDiv.innerHTML = `
            <div class="popup-title">   Appointment Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
                <h3> Appointment Title : <br/>` + data.title+ `</h3>
                <div class="row" style="display:flex;flex-direction: column;padding-top: 10px" >
                 <label for="user-nic">
                            Time Slot 1
                        </label>
                   <div class="row">
                   <div class="form-group" style="padding: 0 30px;">
                        <label for="user-nic">
                            Start Date & Time
                        </label>
                        <input type="datetime-local" autofocus autocomplete="off" name="user-nic" id="user-nic"
                               maxlength="13" 
                        />
                        <div id="user-nic-error" class="form-field-error"></div>
                    </div>
                   <div class="form-group" style="padding: 0 30px;">
                        <label for="user-nic">
                              End Time
                        </label>
                        <input type="time" autofocus autocomplete="off" name="user-nic" id="user-nic"
                               maxlength="13" 
                        />
                        <div id="user-nic-error" class="form-field-error"></div>
                    </div>
                    
                    </div>
                    <label for="user-nic">
                            Time Slot 2
                        </label>
                   <div class="row">
                   <div class="form-group" style="padding: 0 30px;">
                        <label for="user-nic">
                            Start Date & Time
                        </label>
                        <input type="datetime-local" autofocus autocomplete="off" name="user-nic" id="user-nic"
                               maxlength="13" 
                        />
                        <div id="user-nic-error" class="form-field-error"></div>
                    </div>
                   <div class="form-group" style="padding: 0 30px;">
                        <label for="user-nic">
                              End Time
                        </label>
                        <input type="time" autofocus autocomplete="off" name="user-nic" id="user-nic"
                               maxlength="13"
                        />
                        <div id="user-nic-error" class="form-field-error"></div>
                    </div>
                    
                    </div>
                    <div class="form-group" style="padding: 0 30px;">
                        <label for="user-nic">
                            Location
                        </label>
                        <input type="text" autofocus autocomplete="off" name="user-nic" id="user-nic"
                               minlength="3" 
                        />
                        <div id="user-nic-error" class="form-field-error"></div>
                    </div>
                    <div class="form-group" style="padding: 0 30px;">
                        <label for="user-nic">
                            Special Notice
                        </label>
                        <textarea As="textarea" autofocus autocomplete="off" name="user-nic" id="user-nic"
                          
                        ></textarea>
                        <div id="user-nic-error" class="form-field-error"></div>
                    </div>
                </div>
                <div class="row" >
                
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #223580!important;margin-top: 10px" 
                        onclick="popup.hidePopup()"> Save </button>
                    </div>
                </div>`;
        }else if(data.round === "1"){
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
    showPopup(){
        this.container.style.display = "block";
    }
    hidePopup(){
        this.container.style.display = "none";
    }

    gotoLogin(route){
        switch (route){
            case "login" :
                location.replace(this.myUrl+"/s/login");
                break;
            case "register" :
                location.replace(this.myUrl+"/s/register");
                break;
            default:
                break;

        }
    }


}