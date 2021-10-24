complaints=[{
    Title:"Unbearable stench from Heaven fame",
    Date:"9/16/2021",
    description:"The Roman withdrawal from Africa in 255 BC was the attempt by the Roman Republic to  the survivors of their expeditionary force to Carthaginia  Africa (in what is now eastern Tunisia) during the First Punic War force to  Africa (what is now eastern Tunisia) during the session.",
    Type:"Animal issue",
    Action:"No Action",
},
    {
        Title:"Unbearable stench from Heaven fame",
        Date:"9/16/2021",
        description:"The Roman withdrawal from Africa in 255 BC was the attempt by the Roman Republic to  the survivors of their expeditionary force to Carthaginia  Africa (in what is now eastern Tunisia) during the First Punic War force to  Africa (what is now eastern Tunisia) during the session.",
        Type:"Animal issue",
        Action:"No Action",
    },
    {
        Title:"Unbearable stench from Heaven fame",
        Date:"9/16/2021",
        description:"The Roman withdrawal from Africa in 255 BC was the attempt by the Roman Republic to  the survivors of their expeditionary force to Carthaginia  Africa (in what is now eastern Tunisia) during the First Punic War force to  Africa (what is now eastern Tunisia) during the session.",
        Type:"Animal issue",
        Action:"No Action",
    },
    {
        Title:"Unbearable stench from Heaven fame",
        Date:"9/16/2021",
        description:"The Roman withdrawal from Africa in 255 BC was the attempt by the Roman Republic to  the survivors of their expeditionary force to Carthaginia  Africa (in what is now eastern Tunisia) during the First Punic War force to  Africa (what is now eastern Tunisia) during the session.",
        Type:"Animal issue",
        Action:"No Action",
    }
]

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
                <p class="f-4">User details</p>
                <p class="f-3"><a style="color: blue;" href="">view</a></p>
            </div>
        </div>
        <div class="images-button-section">
            <!-- images of complaint -->
            <div class="img">
            <div class="pre-button"><object data="${Url}/public/images/icons/chevron-left.svg" width="12" height="12"> </object></i></div>
            <div class="images"><img src="${Url}/public/images/uploadedImages/animal-complaint.jpg" width="120px" height="80px"/></div>
            <div class="next-button"><object data="${Url}/public/images/icons/chevron-right.svg" width="12" height="12"> </object></div>
            </div>
            <!-- action buttons -->
            <div class="buttons">
                <div class="to-be-progress">
                    <button class="f-4">To be progress</button>
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