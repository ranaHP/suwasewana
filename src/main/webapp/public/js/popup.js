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

    // PHI succesfully change status
    ChangeComplainStatusSuccessMessage(data) {
        let eventsContaier = document.createElement('div');
        console.log(data.name);
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

    showAlertMessage(data) {
        alert(data)
        console.log(data)
        data=JSON.parse(data)
        console.log(data)
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
<!--            <div class="popup-title">User Appointment Portal </div>-->

            <div class="popup-desc">  SUWASEWANA.LK</div>
            <div class="popup-message-container " style="color: #d9534f!important;padding: 0px;">
               
                <div class="row" >
                    <label>Description</label>
                    <div class="form-group" style="margin-bottom: 5px">
                        <textarea  type="text"   id="description" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);height: 50px">${data[0].description}</textarea>
                    </div>
                    <label>Title</label>
                    <div class="form-group" style="margin-bottom: 5px">
                    
                        <input type="text" value="${data[0].title}"  id="clinic-title" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
                    </div>
                    <label>DateandTime</label>
                    <div class="form-group" style="margin-bottom: 5px">
                        
                        <input type="text"  id="date-time" value="${data[0].datetime}" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
                    </div>
                    <label>Duration</label>
                    <div class="form-group" style="margin-bottom: 5px">
                        
                        <input type="text"  id="duration" value="${data[0].duration}" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
                    </div>
                     <label>Max limit</label>
                    <div class="form-group" style="margin-bottom: 5px">
                        
                        <input type="text"  id="max-patient" value="${data[0].maxpatient}" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
                    </div>
                    
                    <label>Target participants</label>
                    <div class="form-group" style="margin-bottom: 5px">
                        
                        <input type="text" value="${data[0].Target}"  id="patient" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
                    </div>
                    
                     <label>Location</label>
                    <div class="form-group" style="margin-bottom: 5px">
                        
                        <input type="text" value="${data[0].location}"  id="location" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
                    </div>
                    
                    <label>Disease</label>
                    <div class="form-group" style="margin-bottom: 5px">
                        
                        <input type="text" value="${data[0].disease}"  id="disease" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
                    </div>
                    
                    <label>Conduct by</label>
                    <div class="form-group" style="margin-bottom: 5px">
                        
                        <input type="text" value="${data[0].disease}"  id="conduct" name="delete_input" placeholder="Delete" required style=" width: 200px; margin: auto;border: 1px solid rgba(0,0,0,0.92);">
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


    viewComplainer(data) {
        let eventsContaier = document.createElement('div');
        let eventDiv = document.createElement('div');
        eventDiv.innerHTML = `
            <div class="popup-title">   Appointment Portal </div>
           
            <div class="popup-desc">  SUWASEWANA.LK</div>
                <h2> Appointment rejection Form</h2>
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
                        <button class="submitBtn " style="margin: auto;margin-bottom: 20px;background-color: #c11711!important;margin-top: 10px" 
                        onclick="popup.hidePopup()"> Close</button>
                    </div>
                </div>`;
        eventsContaier.appendChild(eventDiv);

        document.getElementById("popupMessageContainer").replaceChildren(eventsContaier);
        document.getElementById("popupMessageContainer").appendChild(eventsContaier);
        this.showPopup()
    }

}