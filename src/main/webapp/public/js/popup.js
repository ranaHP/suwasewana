class SuwasewanaPopup{
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
    createCalenderEvent(event){
        let eventsContaier = document.createElement('div');
        event[0].events.map(eventitem => {
            let eventDiv = document.createElement('div');
            eventDiv.innerHTML = "<br> <br> Event Title : <h2> " + eventitem.title + "</h2>";
            eventDiv.innerHTML = "Event Desc : <h3> " + eventitem.desc + "</h3>";
            eventsContaier.appendChild(eventDiv);
            // popupMessage.classList.add('popup-message');
        });
        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
    }

    showCalenderEnvetPopup(event) {
        this.createCalenderEvent(event);
        this.container.style.display = "block";
    }

    showPatientDetails(data) {
        let eventsContaier = document.createElement('div');
        console.log(data.name);
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = "<br><h4> Patient Details </h4>";
        eventDiv.innerHTML += "<h5> Name -  " + data.name + " </h5>";
        eventDiv.innerHTML += "<h5> Age - " + data.age + " </h5>";
        eventDiv.classList.add('popup-title');
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }

    showRegistrationSuccessMessage(data) {
        let eventsContaier = document.createElement('div');
        console.log(data.name);
        let eventDiv = document.createElement('div');
        if (data.status === "success") {
            eventDiv.innerHTML = `
            <div class="popup-title"> Citizen Registration Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
                <button class="submitBtn" onclick="popup.gotoLogin('login')"> Go to Login  </button>
            </div>`;
        } else if (data.status === "fail") {
            eventDiv.innerHTML = `
            <div class="popup-title"> Citizen Registration Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
                <div class="error-message"> Reason :  ${data.data}</div>
                <button class="submitBtn"  onclick="popup.gotoLogin('register')">  Reregister </button>
            </div>`;
        }
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
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

    Register(data) {
        let eventsContaier = document.createElement('div');
        console.log(data.name);
        let eventDiv = document.createElement('div');
        if(data.status === "success"){
            eventDiv.innerHTML = `
            <div class="popup-title"> Officer Registration Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
            </div>
                <div class="row" >
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px" 
                        onclick="popup.hidePopup()"> Close</button>
                    </div>
                </div>`;
        }else if(data.status === "fail"){
            eventDiv.innerHTML = `
            <div class="popup-title">Officer Registration Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
                <div class="error-message"> Reason :  ${(data.data.includes("Duplicate entry") ? "This Vaccine type is already exist" : data.data)} </div>
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

    RegisterVaccine(data) {
        let eventsContaier = document.createElement('div');
        console.log(data.name);
        let eventDiv = document.createElement('div');
        if(data.status === "success"){
            eventDiv.innerHTML = `
            <div class="popup-title"> Vaccine Registration Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
            </div>
                <div class="row" >
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px" 
                        onclick="popup.hidePopup()"> Close</button>
                    </div>
                </div>`;
        }else if(data.status === "fail"){
            eventDiv.innerHTML = `
            <div class="popup-title">Vaccine Registration Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
                <div class="error-message"> Reason :  ${(data.data.includes("Duplicate entry") ? "This Vaccine is already exist" : data.data)} </div>
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

    RegisterMOH(data) {
        let eventsContaier = document.createElement('div');
        console.log(data.name);
        let eventDiv = document.createElement('div');
        if(data.status === "success"){
            eventDiv.innerHTML = `
            <div class="popup-title"> MOH Registration Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
            </div>
                <div class="row" >
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px" 
                        onclick="popup.hidePopup()"> Close</button>
                    </div>
                </div>`;
        }else if(data.status === "fail"){
            eventDiv.innerHTML = `
            <div class="popup-title">MOH Registration Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
                <div class="error-message"> Reason :  ${(data.data.includes("Duplicate entry") ? "This Account is already exist" : data.data)} </div>
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

    showDeleteAlertMessage(data) {
        let appointmentId = data;
        data = {data: "if you want to delete this Appointment. Please type 'Delete' in the below input details."}
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-title">User Appointment Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container " style="color: #d9534f!important;"> 
                ${data.data}!
                <div class="row" style="padding-top: 20px;padding-bottom: 10px">
                    <div class="form-group">
                        <input type="text"  id="delete_input" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
                    </div>
                   
                </div>  
                 <div class="error-message" id="deleteAuthErrorMessage" style="display: none" > Your Input is not matched with "Delete" ! </div>
                <div class="row" >
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px" 
                        onclick="deleteCheckInputVsUserInput('${appointmentId}')"> Delete Appointment</button>
                    </div>
                </div>
            </div>`;
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
    // showCreateClinicSuccessMessage(data){
    //     let eventsContaier = document.createElement('div');
    //     console.log(data.name);
    //     let eventDiv = document.createElement('div');
    //     if(data.status === "success"){
    //         eventDiv.innerHTML = `
    //         <div class="popup-title"> Create clinic portral </div>
    //
    //         <div class="popup-desc">  SUWASEWANA.LK</div>
    //         <div class="popup-message-container">
    //             ${data.message}!
    //         </div>`;
    //     }else if(data.status === "fail"){
    //         eventDiv.innerHTML = `
    //         <div class="popup-title">Create clinic Portal </div>
    //
    //         <div class="popup-desc">  SUWASEWANA.LK</div>
    //         <div class="popup-message-container">
    //             ${data.message}!
    //             <div class="error-message"> Reason :  ${data.data}</div>
    //         </div>`;
    //     }
    //     eventsContaier.appendChild(eventDiv);
    //
    //     document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
    //     document.getElementById("popupMessageContainer").appendChild(eventsContaier);
    //     this.showPopup()
    // }
    showClinicDeleteSuccessMessage(data){
        let eventsContaier = document.createElement('div');
        console.log(data.name);
        let eventDiv = document.createElement('div');
        if(data.status === "success"){
            eventDiv.innerHTML = `
            <div class="popup-title">  Clinic view Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
            </div>`;
        }else if(data.status === "fail"){
            eventDiv.innerHTML = `
            <div class="popup-title">Clinic view Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
                <div class="error-message"> Reason :  ${data.data}</div>
            </div>`;
        }
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }
    showDeleteClinicAlertMessage(data) {
        // alert(data)
        let clinicID = data;
        data = {data: "if you want to delete this Clinic. Please type 'Delete' in the below input details."}
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-title">View clinic Portal </div>

            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container " style="color: #d9534f!important;">
                ${data.data}!
                <div class="row" style="padding-top: 20px;padding-bottom: 10px">
                    <div class="form-group">
                        <input type="text"  id="delete_input" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
                    </div>

                </div>
                 <div class="error-message" id="deleteAuthErrorMessage" style="display: none" > Your Input is not matched with "Delete" ! </div>
                <div class="row" >
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px"
                        onclick="deleteCheckInputVsUserInput('${clinicID}')"> Delete Clinic</button>
                    </div>
                </div>
            </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }
    showCreateClinicSuccessMessage(data){
        let eventsContaier = document.createElement('div');
        console.log(data.name);
        let eventDiv = document.createElement('div');
        if(data.status === "success"){
            eventDiv.innerHTML = `
            <div class="popup-title"> Create clinic portral </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
            </div>`;
        }else if(data.status === "fail"){
            eventDiv.innerHTML = `
            <div class="popup-title">User Appointment Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
                <div class="error-message"> Reason :  ${data.data}</div>
            </div>`;
        }
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }

}