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
            console.log(eventitem)
            let eventDiv = document.createElement('div');
            eventDiv.innerHTML = "Title : <h5> "+ eventitem.title + "<br>" + "Location <h5> :" + eventitem.location  ;
            // eventDiv.innerHTML = "Event Desc : <h3> " + eventitem.location + "</h3>";
            eventsContaier.appendChild(eventDiv);
            // popupMessage.classList.add('popup-message');
        });
        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
    }

    showCalenderEnvetPopup(event) {
        console.log("event des")
        console.log(event)
        this.createCalenderEvent(event);
        this.container.style.display = "block";
    }
    showCalenderTaskPopup(event) {
        // console.log("showCalenderTaskPopup call in popup.js")
        this.createCalenderTask(event);
        this.container.style.display = "block";
    }
    createCalenderTask(event){
        // console.log("createCalenderTask")
        let eventsContaier = document.createElement('div');
        event[0].events.map(eventitem => {
            // console.log(eventitem)
            let eventDiv = document.createElement('div');
            eventDiv.innerHTML = "<li style='color: rgba(0, 0, 0, 0.774); margin: 0 10px; margin-bottom: 10px;font-size: 1em;'> "+ eventitem.title + "</li>"   ;
            eventsContaier.appendChild(eventDiv);
            // popupMessage.classList.add('popup-message');
        });
        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
    }
    showPatientDetails(data) {
        let eventsContaier = document.createElement('div');
        // console.log(data.name);
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
    viewImg(url){
        let eventsContaier = document.createElement('div');
        console.log("url in js "+url);
        let eventDiv = document.createElement('div');

            eventDiv.innerHTML = `
            
            <div class="popup-message-container"> 
                <img src="${url}" style="width:100% ; height:70% " 
            </div>`;

        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }
    showRegistrationSuccessMessage(data) {
        let eventsContaier = document.createElement('div');
        // console.log(data.name);
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
    //for vaccine register
    showRegistrationSuccessMessageForVaccine(data) {
        let eventsContaier = document.createElement('div');
        // console.log(data.name);
        let eventDiv = document.createElement('div');

        if(data.status === "success"){
            eventDiv.innerHTML = `
            <div class="popup-title"> Vaccine Register Portal </div>
           
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
        }
        else if(data.status === "fail"){
            eventDiv.innerHTML = `
            <div class="popup-title">Vaccine Register Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
                
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

    // PHI succesfully change status
    ChangeComplainStatusSuccessMessage(data) {
        let eventsContaier = document.createElement('div');
        // console.log(data.name);
        let eventDiv = document.createElement('div');
        if(data.status === "success"){
            eventDiv.innerHTML = `
            <div class="popup-title"> Complain Managing Portal </div>
           
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
            <div class="popup-title">Complain Managing Portal</div>
           
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

    showAppointmentSuccessMessage(data) {
        let eventsContaier = document.createElement('div');
        // console.log(data.name);
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
        }
        else if(data.status === "fail"){
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
    showVaccineTypeUpdateSuccessMessage(data) {
        let eventsContaier = document.createElement('div');

        let eventDiv = document.createElement('div');

        if(data.status === "success"){
            eventDiv.innerHTML = `
            <div class="popup-title"> User Vaccine Portal </div>
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
        }
        else if(data.status === "fail"){
            eventDiv.innerHTML = `
            <div class="popup-title">User Vaccine Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
                <div class="error-message"> Please contact System administrator!! </div>
                <div class="row" >
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px" 
                        onclick="popup.hidePopup()"> Close</button>
                    </div>
                </div>
            </div>`;
        }
        else{

        }
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }
    CancleClinicSuccessMessage(data) {
        let eventsContaier = document.createElement('div');
        // console.log(data.name);
        let eventDiv = document.createElement('div');

        if(data.status === "success"){
            eventDiv.innerHTML = `
            <div class="popup-title"> Vaccination Portal </div>
           
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
        }
        else if(data.status === "fail"){
            eventDiv.innerHTML = `
            <div class="popup-title">Vaccination Portal </div>
           
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

    showUserVaccineRegisterSuccessMessage(data) {
        let eventsContaier = document.createElement('div');
        // console.log(data.name);
        let eventDiv = document.createElement('div');

        if(data.status === "success"){
            eventDiv.innerHTML = `
            <div class="popup-title"> Vaccination Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
                <br><span>See you on ${data.data} at ${data.Set_sloat} </span>
                <br><span>Your Queue No is ${data.Next_Que_no} </span>
                <br><span>Have a nice day! </span>
            </div>
                <div class="row" >
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px" 
                        onclick="popup.hidePopup()"> Close</button>
                    </div>
                </div>`;
        }
        else if(data.status === "fail"){
            eventDiv.innerHTML = `
            <div class="popup-title">Vaccination Portal </div>
           
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

    showUserClinicRegisterSuccessMessage(data) {
        let eventsContaier = document.createElement('div');
        // console.log(data.name);
        let eventDiv = document.createElement('div');

        if(data.status === "success"){
            eventDiv.innerHTML = `
            <div class="popup-title"> Clinic Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
                <br><span>Have a nice day! </span>
            </div>
                <div class="row" >
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px" 
                        onclick="popup.hidePopup()"> Close</button>
                    </div>
                </div>`;
        }
        else if(data.status === "fail"){
            eventDiv.innerHTML = `
            <div class="popup-title">Clinic Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
                <div class="error-message"> Reason :  Exceed seats limit </div>
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
        // console.log(data.name);
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

    RegisterMOH(data) {
        let eventsContaier = document.createElement('div');
        // console.log(data.name);
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
        data = {data: "if you want to delete this Appointment. Please check in the below checkbox."}
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-title">User Appointment Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container " style="color: #d9534f!important;"> 
                ${data.data}!
                <div class="row" style="">
                    <div class="form-group" style="display: flex;width: 100%;flex-direction: row!important;align-items: center">
                   
                        
                    <label for="delete_input"  style="display: flex;align-items: center;justify-content: center;font-size: .8em!important;">
                        <input type="checkbox" onchange="popup.deleteBtnStatus()"  id="delete_input" name="delete_input" 
                         style="width: 20px;height: 20px;margin: 0;padding: 0;border: 1px solid rgba(0,0,0,0.92);"> &nbsp; &nbsp; &nbsp;Are you sure
                    </label>
                    </div>
                   
                </div>  
                 <div class="error-message" id="deleteAuthErrorMessage" style="display: none" > Your Input is not matched with "Delete" ! </div>
                <div class="row" >
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c1c1c1!important;margin-top: 10px" 
                        onclick="deleteCheckInputVsUserInput('${appointmentId}')" disabled  id="deleteAppointmnetBtn"> Delete Appointment</button>
                    </div>
                     
                </div>
            </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()

    }

    requestAnotherTimeSlot(data) {
        let appointmentId = data;

        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-title">User Appointment Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container " style="color: #2b41bd!important;"> 
                If you are unable to accept this time slot. Please click on the "Request Again Button" to request another time slot.
                <div class="row" style="padding-top: 20px;padding-bottom: 10px">
                    <div class="form-group" style="display: flex;width: 100%;flex-direction: row!important;align-items: center">
                   
                        
                    <label for="delete_input"  style="display: flex;align-items: center;justify-content: center;font-size: .8em!important;">
                        <input type="checkbox" onchange="popup.testMy()"  id="delete_input" name="delete_input" 
                         style="width: 20px;height: 20px;margin: 0;padding: 0;border: 1px solid rgba(0,0,0,0.92);"> &nbsp; &nbsp; &nbsp;Are you sure
                    </label>
                    </div>
                   <script>
                       // function  asd(){
                       //     alert('hi hansana')"
                       // }
                    </script>
                </div>  
                 <div class="error-message" id="deleteAuthErrorMessage" style="display: none" >  Your Input is not matched with "Delete" ! </div>
                <div class="row" >
                    <div class="form-group">
                     
                        <button class="submitBtn " id="myBtn"  style="margin: auto;margin-bottom: 20px;background-color: #c1c1c1!important;margin-top: 10px" 
                        onclick="requestAnotherTime({ app_id: '` + data.app_id +`', round: '` + data.round +`' })" disabled> Request Anthoer Appointment</button>
                    </div>
                </div>
            </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }

    testMy(){
        // console.log(document.getElementById("delete_input").checked)
        if(document.getElementById("delete_input").checked){
            document.getElementById("myBtn").disabled = false;
            document.getElementById("myBtn").style.backgroundColor = "#c11711";
        }else{
            document.getElementById("myBtn").disabled = true;
            document.getElementById("myBtn").style.backgroundColor = "#c1c1c1";
        }

    }

    deleteBtnStatus(){
        console.log(document.getElementById("delete_input").checked)
        if(document.getElementById("delete_input").checked){
            document.getElementById("deleteAppointmnetBtn").disabled = false;
            document.getElementById("deleteAppointmnetBtn").style.backgroundColor = "#c11711";
        }else{
            document.getElementById("deleteAppointmnetBtn").disabled = true;
            document.getElementById("deleteAppointmnetBtn").style.backgroundColor = "#c1c1c1";
        }

    }

    approveTime(data) {
        // console.log(data);
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-title">User Appointment Portal </div>
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container " style="color: #d9534f!important;"> 
                ${data.data}!
                <div class="row" style="padding-top: 20px;padding-bottom: 10px; display: flex;justify-content: center;flex-direction: column">
                    <label for="ts1" >   <div class="select_item" >
                    <input type="radio" id="ts1" value="time_slot_1" name="timeSlot" style="border:2px dotted #00f;display:block;background:#ff0000;margin: 10px auto" />
                        Time Slot 1  
                        <br>
                        ${data.ts1.split(" ")[0]}
                        <br>
                        ${data.ts1.split(" ")[1]} - ${data.te1.split(" ")[1]}
                    </div> </label>
                   
                    <label for="ts2" >    <div class="select_item" >
                        <input type="radio" id="ts2" value="time_slot_2" name="timeSlot" style="border:2px dotted #00f;display:block;background:#ff0000;margin: 10px auto" />
                             Time Slot 2
                        <br> 
                        2021-11-11 
                        <br>
                        17:48:00 - 04:47:00                       
                    </div> </label>
<!--                   onclick="chooseTimeSlot({timeSlot:'time_slot_1'})"-->
                </div>  
                 <div class="error-message" id="deleteAuthErrorMessage" style="display: none" > Your Input is not matched with "Delete" ! </div>
                <div class="row" >
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #1143c1!important;margin-top: 10px" 
                       onclick="chooseTimeSlot({timeSlot:'time_slot_1' , app_id: ${data.app_id}})"> Save </button>
                    </div>
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
                       <br>
                     <h3>  Please Contant Technical Team !</h3>
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

    showVaccineClinicEditMessage(data,currentC,available) {
        console.log(count)
        data=JSON.parse(data)
        // console.log(data)
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container " style="color: #d9534f!important;padding: 0px;">
                <div class="row" >
                 
                    
                    <div style="margin-bottom: 5px;display: flex">
                        <label style=" width:150px">Title</label>
                        <input type="text" value="${data[0].tittle}"  id="tittle" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
                    </div>
             
              
                     <div style="margin-bottom: 5px;display: flex">
                        <label style=" width:150px">Limit sheats</label>   
                        <input type="text"  id="max_patient" value="${data[0].limit_sheats}" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
                    </div>
                
                    
                    
                    <div style="margin-bottom: 5px;display: flex">
                         <label style="width:150px">Dose count</label>    
                        <input type="number" value="${data[0].dose_count}"  id="dose_count" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
                    </div>

                </div>
                 <div class="error-message" id="deleteAuthErrorMessage" style="display: none" > Your Input is not matched with "Delete" ! </div>
                <div class="row" >
                   <button onclick="updatevclinics('`+ data[0].vcs_id+`','`+available+`','`+ currentC+`');popup.hidePopup()">update</button>
                </div>
            </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }
    showVaccineClinicResheduleMessage(data){
        data=JSON.parse(data)
        // console.log(data)
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container " style="color: #d9534f!important;padding: 0px;">
                <div class="row" >
                 
                    <div style="margin-bottom: 5px;display: flex">
                        <label style=" width:150px">DateandTime</label>
                        <input type="datetime-local"  id="start_date_time" value="${data[0].start_date_time}" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
                    </div>
                    
       
                </div>
                 <div class="error-message" id="deleteAuthErrorMessage" style="display: none" > Your Input is not matched with "Delete" ! </div>
                <div class="row" >
                   <button onclick="ResheduleVClinics('`+ data[0].vcs_id+`');popup.hidePopup()">update</button>
                </div>
            </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()

    }
    showClinicResheduleMessage(data){
        data=JSON.parse(data)
        // console.log(data)
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container " style="color: #d9534f!important;padding: 0px;">
                <div class="row" >
                    
                    <div style="margin-bottom: 5px;display: flex">
                         <label style=" width:150px">Date</label>     
                        <input type="date"  id="date" value="${data[0].date}" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
                    </div>
                    
                     <div style="margin-bottom: 5px;display: flex">
                         <label style=" width:150px">Date</label>     
                        <input type="time"  id="time" value="${data[0].time}" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
                    </div>
                    
                    <div style="margin-bottom: 5px;display: flex">
                        <label style=" width:150px">Duration</label>
                        <input type="text"  id="duration" value="${data[0].duration}" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
                    </div>
                     
                </div>
                 <div class="error-message" id="deleteAuthErrorMessage" style="display: none" > Your Input is not matched with "Delete" ! </div>
                <div class="row" >
                   <button onclick="resheduleclinics('`+ data[0].clinicID+`');popup.hidePopup()">update</button>
                </div>
            </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }

    showClinicEditMessage(data) {
        data=JSON.parse(data)
        // console.log(data)
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container " style="color: #d9534f!important;padding: 0px;">
                <div class="row" >
                    
                    <div style="margin-bottom: 5px;display: flex">
                        <label style=" width:150px">Description</label>
                        <textarea  type="text"   id="description" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);height: 50px">${data[0].description}</textarea>
                    </div>
                    
                    <div style="margin-bottom: 5px;display: flex">
                        <label style=" width:150px">Title</label>
                        <input type="text" value="${data[0].title}"  id="clinic-title" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
                    </div>
                     
                    <div style="margin-bottom: 5px;display: flex">
                        <label style=" width:150px">Max limit</label>
                        <input type="text"  id="max-patient" value="${data[0].maxpatient}" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
                    </div>
                    
                    
                    <div style="margin-bottom: 5px;display: flex">
                        <label style=" width:150px">Target participants</label>
                        <input type="text" value="${data[0].Target}"  id="patient" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
                    </div>
                   

                </div>
                 <div class="error-message" id="deleteAuthErrorMessage" style="display: none" > Your Input is not matched with "Delete" ! </div>
                <div class="row" >
                   <button onclick="updateclinics('`+ data[0].clinicID+`');popup.hidePopup()">update</button>
                </div>
            </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
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
    showSuccessMessage(data){
        let eventsContaier = document.createElement('div');
        // console.log(data.name);
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
    showClinicDeleteSuccessMessage(data){
        let eventsContaier = document.createElement('div');
        // console.log(data.name);
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
    showBlockSuccessMessage(data){
        let eventsContaier = document.createElement('div');
        // console.log(data.name);
        let eventDiv = document.createElement('div');
        if(data.status === "success"){
            eventDiv.innerHTML = `
            <div class="popup-title">  Admin Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
            </div>`;
        }else if(data.status === "fail"){
            eventDiv.innerHTML = `
            <div class="popup-title">Admin Portal </div>
           
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
    showRemoveSuccessMessage(data){
        let eventsContaier = document.createElement('div');
        // console.log(data.name);
        let eventDiv = document.createElement('div');
        if(data.status === "success"){
            eventDiv.innerHTML = `
            <div class="popup-title">  Admin Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
            </div>`;
        }else if(data.status === "fail"){
            eventDiv.innerHTML = `
            <div class="popup-title">Admin Portal </div>
           
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

    showRenewSuccessMessage(data){
        let eventsContaier = document.createElement('div');
        // console.log(data.name);
        let eventDiv = document.createElement('div');
        if(data.status === "success"){
            eventDiv.innerHTML = `
            <div class="popup-title">  Admin Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
            </div>`;
        }else if(data.status === "fail"){
            eventDiv.innerHTML = `
            <div class="popup-title">Admin Portal </div>
           
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
    AlertMessage(data) {
        // alert(data)
        let clinicID = data;
        data = {data: "Are you sure you want to delete the clinic?"}
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-title">View clinic Portal </div>

            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container " style="color: #d9534f!important;">
                ${data.data}!
                <div class="row" style="padding-top: 20px;padding-bottom: 10px">
                    <div class="form-group">
                        
                    </div>

                </div>
                 <div class="error-message" id="deleteAuthErrorMessage" style="display: none" > Your Input is not matched with "Delete" ! </div>
                <div class="row" >
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px"
                        onclick="cancelClinicmsg('${clinicID}')"> Yes delete</button>
                    </div>
                </div>
            </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }
    showDeleteClinicAlertMessage(data) {
        // alert(data)
        let clinicID = data;
        data = {data: "Are you sure you want to delete the clinic?"}
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-title">View clinic Portal </div>

            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container " style="color: #d9534f!important;">
                ${data.data}!
                <div class="row" style="padding-top: 20px;padding-bottom: 10px">
                    <div class="form-group">
                        
                    </div>

                </div>
                 <div class="error-message" id="deleteAuthErrorMessage" style="display: none" > Your Input is not matched with "Delete" ! </div>
                <div class="row" >
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px"
                        onclick="deleteClinics('${clinicID}')"> Yes delete</button>
                    </div>
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px"
                        onclick="popup.hidePopup()"> Cancel</button>
                    </div>
                </div>
            </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }
    showBlockAlertMessage(data) {
        // alert(data)
        let clinicID = data;
        data = {data: "Are you sure you want to block the PHI officer"}
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-title">View clinic Portal </div>

            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container " style="color: #d9534f!important;">
                ${data.data}!
                <div class="row" style="padding-top: 20px;padding-bottom: 10px">
                    <div class="form-group">
                        
                    </div>

                </div>
                 <div class="error-message" id="deleteAuthErrorMessage" style="display: none" > Your Input is not matched with "Delete" ! </div>
                <div class="row" >
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px"
                        onclick="block('${clinicID}')"> Yes block</button>
                    </div>
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px"
                        onclick="popup.hidePopup()"> Cancel</button>
                    </div>
                </div>
            </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }

    showRemoveAlertMessage(data) {
        // alert(data)
        let clinicID = data;
        data = {data: "Are you sure you want to Remove the officer"}
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-title">View clinic Portal </div>

            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container " style="color: #d9534f!important;">
                ${data.data}!
                <div class="row" style="padding-top: 20px;padding-bottom: 10px">
                    <div class="form-group">
                        
                    </div>

                </div>
                 <div class="error-message" id="deleteAuthErrorMessage" style="display: none" > Your Input is not matched with "Delete" ! </div>
                <div class="row" >
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px"
                        onclick="Remove('${clinicID}')"> Yes Remove</button>
                    </div>
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px"
                        onclick="popup.hidePopup()"> Cancel</button>
                    </div>
                </div>
            </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }
    showRenewAlertMessage(data) {
        // alert(data)
        let clinicID = data;
        data = {data: "Are you sure you want to Renew the MAC"}
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-title">View clinic Portal </div>

            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container " style="color: #d9534f!important;">
                ${data.data}!
                <div class="row" style="padding-top: 20px;padding-bottom: 10px">
                    <div class="form-group">
                        
                    </div>

                </div>
                 <div class="error-message" id="deleteAuthErrorMessage" style="display: none" > Your Input is not matched with "Delete" ! </div>
                <div class="row">
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px"
                        onclick="renew('${clinicID}')"> Yes Renew</button>
                    </div>
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px"
                        onclick="popup.hidePopup()"> Cancel</button>
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
        // console.log(data.name);
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
    showCreateAnnouncementSuccessMessage(data){
        let eventsContaier = document.createElement('div');
        // console.log(data.name);
        let eventDiv = document.createElement('div');
        if(data.status === "success"){
            eventDiv.innerHTML = `
            <div class="popup-title"> Announcement portral </div>
           
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

    showRegisterDiseaseSuccessMessage(data){
        let eventsContaier = document.createElement('div');
        // console.log(data.name);
        let eventDiv = document.createElement('div');
        if(data.status === "success"){
            eventDiv.innerHTML = `
            <div class="popup-title"> Register Disease Portral </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                ${data.message}!
            </div>`;
        }else if(data.status === "fail"){
            eventDiv.innerHTML = `
            <div class="popup-title">Register Disease Portral </div>
           
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


    showDeleteAnnouncementAlertMessage(data) {
        let appointmentId = data;
        data = {data: "Are you sure you want to delete the announcement?"}
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-title">User Announcement Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container " style="color: #d9534f!important;"> 
                ${data.data}!
                <div class="row" style="padding-top: 20px;padding-bottom: 10px">
                    
                   
                </div>  
                 <div class="error-message" id="deleteAuthErrorMessage" style="display: none" > Your Input is not matched with "Delete" ! </div>
                <div class="row" >
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px" 
                        onclick="deleteAnnouncement('${appointmentId}')"> Delete Appointment</button>
                    </div>
                     <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px"
                        onclick="popup.hidePopup()"> Cancel</button>
                    </div>
                </div>
            </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }

    showAnnouncementDeleteSuccessMessage(data){
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


    SendResponsePHI(data) {
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-title">   Appointment Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
                <h2> Do you need to send response for this?</h2>
                <div class="row" style="display:flex;flex-direction: column;padding-top: 10px" >
                    <div class="form-group" style="padding: 0 30px;display:flex; align-items: center; justify-content: center">
                        <label >
                            Response
                        </label>
                        <textarea As="textarea" id="myresponse" style="width: 50%;padding: 5px; min-height: 100px; margin-left: 10px"  class="textarea" autofocus autocomplete="off" name="app-rr" id="app-rr"
                          
                        ></textarea>
                        <div id="app-rr-error" class="form-field-error"></div>
                    </div>
                </div>
                <div class="row" >
                
                    <div class="form-group" style="display: flex; justify-content: space-between">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px" 
                        onclick="UpdateResponse('` + data.complain_Id +`'); popup.hidePopup();"> Send</button>
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #2ed573!important;margin-top: 10px" 
                        onclick="popup.hidePopup()"> Skip</button>
                    </div>
                </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }
    EditTask(data) {
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        let taskid=data.task_Id
        eventDiv.innerHTML = `
            <div class="popup-title">Task Managing Portal</div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
                <h2> Update Task</h2>
                <div class="row" style="display:flex;flex-direction: column;padding-top: 10px" >
                    <div class="form-group" style="padding: 0 30px;display:flex; align-items: center; justify-content: center; margin-top: 10px; margin-bottom: 24px ">
                        <label >
                            Task
                        </label>
                        <textarea As="textarea" id="newTask" style="width: 50%;padding: 5px; min-height: 100px; margin-left: 10px; outline: none "  class="textarea" autofocus autocomplete="off" name="app-rr" id="app-rr"
                          
                        >`+data.title+`</textarea>
                        
                    </div>
                    <div class="form-group" style="padding: 0 30px;display:flex; align-items: center; justify-content: center; padding-bottom: 20px">
                        <label >
                            Date
                        </label>
                        <input id="newDate" type="date" style="margin-left: 20px; padding: 0 30px; outline: none" value="`+data.date+`" />
                        
                    </div>
                </div>
                <div class="row" >
                
                    <div class="form-group" style="display: flex; justify-content: space-between">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px" 
                        onclick="updateTask('`+taskid+`'); popup.hidePopup();"> Update</button>
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #2ed573!important;margin-top: 10px" 
                        onclick="popup.hidePopup()"> Close</button>
                    </div>
                </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }
    ValidateNewPassword(u,p) {
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-title">Update Password</div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
                <div class="row" style="display:flex;flex-direction: column;padding-top: 10px" >
                    
                    <div class="form-group" style="width: unset ; padding: 0 30px;display:flex; align-items: center; justify-content: center; padding-bottom: 20px">
                        
                        <input id="pass1" type="text" style="margin-left: 20px; padding: 0 30px; outline: none"  />
                        <input id="pass2" type="text" style="margin-left: 20px; padding: 0 30px; outline: none"  />
                        <span id="error" style="font-size: 1em; color:#c01c1c;margin-top: 14px; display: none">Please make sure your passwords match</span>
                    </div>
                    
                </div>
                <div class="row" >
                
                    <div class="form-group" style="width: unset;display: flex; justify-content: space-between">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px" 
                        onclick="CheckPasswords('`+u+`','`+p+`'); "> Update</button>
                    </div>
                </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }
    ValidateOTP() {
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
                <h2> Update Task</h2>
                <div class="row" style="display:flex;flex-direction: column;padding-top: 10px" >
                    
                    <div class="form-group" style="width: unset ; padding: 0 30px;display:flex; align-items: center; justify-content: center; padding-bottom: 20px">
                        
                        <input id="pass1" type="text" style="margin-left: 20px; padding: 0 30px; outline: none"  />
                        <input id="pass2" type="text" style="margin-left: 20px; padding: 0 30px; outline: none"  />
                        <span id="error" style="font-size: 1em; color:#c01c1c;margin-top: 14px; display: none">Please make sure your passwords match</span>
                    </div>
                    
                </div>
                <div class="row" >
                
                    <div class="form-group" style="width: unset;display: flex; justify-content: space-between">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px" 
                        onclick="CheckPasswords('`+u+`','`+p+`'); "> Update</button>
                    </div>
                </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }


    viewComplainer(data) {
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-title">   Complain Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
                <h2> Complainer details</h2>
                <style>
                 table {
                    font-family: arial, sans-serif;
                    border-collapse: collapse;
                    width: 100%;
                }

                td, th {
                    border: 1px solid #dddddd;
                    text-align: left;
                    padding: 8px;
                }
                </style>
                <div class="row" style="display:flex;flex-direction: column;padding-top: 10px" >
                    <div class="form-group" style="padding: 0 30px;">
                        
                        <table >
                            <tr>
                                <th> Name</th>
                                <th> NIC</th>
                                <th> Mobile</th>
                                <th> Address</th>
                            </tr>
                            <tr>
                                <td> ${data.uname}</td>
                                <td> ${data.uNic}</td>
                                <td> ${data.uMobile}</td>
                                <td> ${data.address_line1} `+ " "+` ${data.street_no}</td>
                            </tr>
                        </table>
                        
                        <div id="app-rr-error" class="form-field-error"></div>
                    </div>
                </div>
                <div class="row" >
                
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711db!important;margin-top: 10px;width: 69px;height: 24px;border-radius: 2px;font-size: 1em;" 
                        onclick="popup.hidePopup()"> Close</button>
                    </div>
                </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }




    // popup for assign task
    ConformAssign(data) {

        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-title">Task Assign Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container " style="color: #2b41bd!important;"> 
                If you are unable to assign this Task. Please click on the "Close Button" to cancle Assignment
                <div class="row" style="padding-top: 20px;padding-bottom: 10px">
                    <div class="form-group" style="display: flex;width: 100%;flex-direction: row!important;align-items: center">
                   
                        
                    <label for="delete_input"  style="display: flex;align-items: center;justify-content: center;font-size: .8em!important;">
                        <input type="checkbox" onchange="popup.testconformtick()"  id="delete_input" name="delete_input" 
                         style="width: 20px;height: 20px;margin: 0;padding: 0;border: 1px solid rgba(0,0,0,0.92);"> &nbsp; &nbsp; &nbsp;Are you sure
                    </label>
                    </div>
                   <script>
                       // function  asd(){
                       //     alert('hi hansana')"
                       // }
                    </script>
                </div>  
                 <div class="error-message" id="deleteAuthErrorMessage" style="display: none" >  Pending... </div>
                <div class="row" >
                    <div class="form-group">
                     
                        <button class="submitBtn " id="myBtn"  style="margin: auto;margin-bottom: 20px; width: 200px;background-color: #c1c1c1!important;margin-top: 10px" 
                        onclick="conformAndDoneTask();popup.hidePopup()" disabled> Assign Appoinment</button>
                    </div>
                </div>
            </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }

    testconformtick(){
        console.log(document.getElementById("delete_input").checked)
        if(document.getElementById("delete_input").checked){
            document.getElementById("myBtn").disabled = false;
            document.getElementById("myBtn").style.backgroundColor = "#c11711";
        }else{
            document.getElementById("myBtn").disabled = true;
            document.getElementById("myBtn").style.backgroundColor = "#c1c1c1";
        }

    }
    dashboardComplain(data) {
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        if(data.user === "empty"){
            eventDiv.innerHTML = `
            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container"> 
                <h3 style="margin-top:-5px;margin-bottom: 20px;color: #27ae60">${data.title}</h3>
                <p style="color: rgba(0,0,0,0.72);font-size: 15px">complain type : ${data.ctype}</p>
                <span style="color: rgba(0, 0, 0, 0.72);font-size: 15px">Posted date : ${data.pdate} </span>
            </div>
            <div class="popup-message-container" style="; width:80%; margin:-5px auto 0 auto"> 
                <span style="font-size: 13px; margin-top: -21px; color: #524a4a;">
                ${data.message}
                </span>
                </div>
                <div class="row" >
                    <div class="form-group">
                        <button class="submitBtn " style="border-radius:2px;font-size: 14px; margin: auto;margin-bottom: 20px;background-color: #e74c3c!important;margin-top: 10px;width: 97px;height: 24px" 
                        onclick="popup.hidePopup()"> Close</button>
                    </div>
                </div>`;
        }
        else {
            eventDiv.innerHTML = `
            <div class="popup-desc">  SUWASEWANA.LK</div>
           
            
            <div class="popup-message-container"> 
                <h3 style="margin-top:-5px; margin-bottom: 20px; color: #27ae60">${data.title}</h3>
                <p style="color: rgba(0,0,0,0.72);font-size: 15px">complain type : ${data.ctype}</p>
                <span style="color: rgba(0, 0, 0, 0.72);font-size: 15px">Posted date : ${data.pdate} </span>
            </div>
            
            <div class="popup-message-container" style="; width:80%; margin:-5px auto 0 auto"> 
                <span style="font-size: 13px; margin-top: -21px;color: #524a4a;">
                ${data.message}
                </span>
                </div>

                <div class="popup-message-container" style="; width:80%; margin:-5px auto 0 auto"> 
                <span style="font-size: 13px; text-align:right; color: rgba(0, 0, 0, 0.473) ;width:100%">
                Complainer: ${data.uname} <br>
                Mobile: ${data.mobile}
                </span>
                </div>
                <div class="row" >
                    <div class="form-group">
                         <button class="submitBtn " style="border-radius:2px;font-size: 14px; margin: auto;margin-bottom: 20px;background-color: #e74c3c!important;margin-top: 10px;width: 97px;height: 24px" 
                        onclick="popup.hidePopup()"> Close</button>
                    </div>
                </div>`;
        }
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }

    dashboardAppoinmnet(data) {
        let eventsContaier = document.createElement('div');
        // console.log(data.name);
        let eventDiv = document.createElement('div');

        eventDiv.innerHTML = `
            <div class="popup-desc">  SUWASEWANA.LK</div>
           
            
            <div class="popup-message-container"> 
                <h3 style="margin-top:-5px">${data.title}</h3>
                <span style=" color: rgba(0, 0, 0, 0.473); margin-top:-10px">Posted date : ${data.pdate} </span>
            </div>
            
            <div class="popup-message-container" style="; width:80%; margin:-5px auto 0 auto"> 
                <span style="font-size: 13px;">
                ${data.message}
                </span>
                </div>

                <div class="popup-message-container" style="; width:80%; margin:-5px auto 0 auto"> 
                <span style="font-size: 13px; text-align:right; color: rgba(0, 0, 0, 0.473) ;width:100%">
                Complainer: <br>
                Mobile: 0713805000
                </span>
                </div>
                <div class="row" >
                    <div class="form-group">
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px" 
                        onclick="popup.hidePopup()"> Close</button>
                    </div>
                </div>`;

        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }

    showcliniceditsuccessMessage(data){
        let eventsContaier = document.createElement('div');
        // console.log(data.name);
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
}