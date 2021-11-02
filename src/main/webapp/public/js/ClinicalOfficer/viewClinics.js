
let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
class clinicList {
    clinicListArray = [
        {
            clinicID:" ",
            disease:" ",
            title:" ",
            MOH:" ",
            conduct:" ",
            datetime:" ",
            description:" ",
            duration:" ",
            location:" ",
            maxpatient:" "
        }
    ];


    container;

    constructor(container) {
        this.container = document.getElementById(container);
    }
    setData(data) {
        if(!data) return;
        this.clinicListArray = data;
        console.log(data);
        this.clinicListArray.map((item) => {
            this.container.innerHTML += `
               <div class="live-card">
                    <div class="clinic-title"  id="clinic-title">${item.disease} Awareness clinic</div>
                    <div class="clinic-date">${item.datetime}</div>
                    <div class="clinic-description">${item.description}</div>
                    <div class="clinic-details">
                        <div class="location" id="clinicID"><span><span class="locationimg"><object data="${Url}/public/images/icons/map-pin.svg" width="8" height="8"> </object></span> ID :</span> ${item.clinicID}</div>
                        <div class="location" id="item1"><span><span class="locationimg"><object data="${Url}/public/images/icons/map-pin.svg" width="8" height="8"> </object></span> Location :</span> ${item.location}</div>
                        <div class="conduct"  id="item2"><span><span><object data="${Url}/public/images/icons/user.svg" width="8" height="8"> </object></span> Conduct :</span> ${item.conduct}</div>
                        <div class="max-limit"  id="item3"><span><span><object data="${Url}/public/images/icons/users.svg" width="8" height="8"> </object></span> Max participant limit :</span>${item.maxpatient}</div>
                        <div class="moh-area"  id="4"><span><span><object data="${Url}/public/images/icons/map-pin.svg" width="8" height="8"> </object> </span> MOH Area :</span>${item.MOH}</div>
                        <div class="target-participants"  id="item5"><span><span><object data="${Url}/public/images/icons/book-open.svg" width="8" height="8"> </object></span> Target participant :</span> ${item.title}</div>
                    </div>
                    <div class="down-box">
                        <div class="current-participant-count">
                            <div class="current-participant-img"><object data="${Url}/public/images/icons/users.svg" width="15" height="15"> </object></div>
                            <div class="count-participants">120, 221</div>
                        </div>
                        <div class="buttons">

                            <div onclick="popup.showDeleteClinicAlertMessage(${item.clinicID})" class="delete-button">Delete</div>
                            <div class="edit-button" onclick="updates((${item.clinicID}),${item.clinicID})">Edit</div>

                        </div>
                    </div>
              </div>
            `
            ;
            console.log("map")
        })
    }

}
function updates(data1,data){
    alert("updates")
    const a=document.getElementById('mainContent')
    a.innerHTML=" "
    a.innerHTML+=`
        <div class="header">
        <div class="upper-title">SUWASEWANA </div>
        <div class="dashboard-name">Clinic/Dashboard/Create clinics</div>
     </div>
         <div class="content" id="content">
        <div class="left">
            <div class="create-clinics-title">Create Clinic Session</div>
            <div class="form-container">
                <!-- form container -->
                <div class="form">
                    <form id="loginForm" onsubmit="return Checkvalidation()" >
                        <div class="form-inputs">
                            <div class="left-inputs">
                                <div class="inputs">
                                    <label> Clinic Title</label>
                                    <input type="text" required autocomplete="off" name="clinic-title" id="clinic-title" value=${data} />
                                </div>
                                <div class="inputs">
                                    <label> Disease</label>
                                    <input type="text" required autocomplete="off" name=" disease" id="disease" value="Covid 19" />
                                </div>
                                <div class="inputs">
                                    <label> Location</label>
                                    <input type="text"  required autocomplete="off" name=" location" id="location" value="At moh"/>
                                </div>
                                <div class="inputs">
                                    <label >MOH Area</label> <br>
                                    <input autocomplete="off" class="SelectColordiv" id="MArea" type="text" style="outline: none;" list="AllMArea" name="AllMArea"
                                           onclick="document.getElementById('MArea').value='';"
                                           onblur="validation.SearchSelect(
                                    document.getElementById('MArea').value,
                                    'LMArea'
                                );"
                                    >
                                    <datalist id="AllMArea">
                                    </datalist>
                                    <br>
                                    <span class="error" id="LMArea" style="margin-left: 5px" ></span>
                                </div>
                                <div class="inputs">
                                    <label> Data & Time</label>
                                    <input type="text"  required autocomplete="off" name="date-time" id="date-time" value="09/08/2021"/>
                                </div>
                                <div class="inputs">
                                    <label>Duration (hours)</label>
                                    <input type="text" required autocomplete="off" name="duration" id="duration" value="5 hours"/>
                                </div>
                            </div>
                            <div class="right-inputs">
                                <div class="inputs">
                                    <label> Max Patient</label>
                                    <input type="number" required autocomplete="off" name="max-patient" id="max-patient" value="50"/>
                                </div>
                                <div class="inputs">
                                    <label>Target participants </label>
                                    <input type="text" required autocomplete="off" name="patient" id="patient" value="FOr public"/>
                                </div>
                                <div class="inputs">
                                    <label> Conduct</label>
                                    <input type="text" required autocomplete="off" name="conduct" id="conduct" value="by dr. dias" />
                                </div>
                                <div class="inputs">
                                    <label>Description</label>
                                    <textarea type="text"  id="description" required autocomplete="off" name="description">Every one should come before 8a.m. to the main hall of the moh</textarea>
                                </div>


                                </div>
                            </div>
                            <!-- create clinic button -->
                            <div class="create-button">
                                <button >Create Clinic</button>

                            </div>

                        </form>
                    </div>
                </div>

            </div>

            <!-- live card section -->
            <div class="right">
                <div class="card-container">
                    <div class="live-card-title"><button class="live"  onclick="card()">Click here to see Clinic Card</button></div>
                    <div class="live-card-border">
                        <div class="live-card" id="live-card">

                        </div>
                            </div>
                        </div>
                    </div>
                </div>
    `
}

//
function search(){
    let count=0
    const input = document.getElementById('filter').value.toUpperCase();
    const cardContainor = document.getElementById('card-containor');
    const card = cardContainor.getElementsByClassName('live-card')
    for(let i=0 ; i<card.length ;i++){
        let title = card[i].querySelector('#clinic-title');

        if(title.innerHTML.toUpperCase().indexOf(input) > -1){
            card[i].style.display=""
        }else{
            card[i].style.display="none"
        }
    }
}