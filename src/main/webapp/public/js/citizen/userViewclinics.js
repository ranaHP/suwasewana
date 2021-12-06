let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
class clinicList {

    clinicListArray = [
        {
            title:" ",
            disease:"",
            location:" ",
            MOH:" ",
            datetime:" ",
            // duration:" ",
            maxpatient:" ",
            Target:"",
            conduct:" ",
            description:" "


        }
    ];

    container;

    constructor(container) {
        this.container = document.getElementById(container);
    }
    setData(data) {
        if(!data) return;
        this.clinicListArray = data;
        console.log("set data");
        console.log(data);
        this.clinicListArray.map((item) => {
            this.container.innerHTML += `
                <div class="clinic-card-container">
                            <div class="clinic-card">
                                <div class="title" id="moh">
                                    ${item.disease} Awareness Session
                                    <p> ${item.datetime}</p>
                                </div>
                                <div class="desc">
                                   ${item.description}
                                </div>
                                <div class="properties">
                                    <ul>
                                        <li>
                                            <span></span>
                                            <object data="${Url}/public/images/icons/map-pin.svg" width="8" height="8"> </object>
                                            Location : ${item.location}
                                        </li>
                                        <li>
                                      
                                           <object data="${Url}/public/images/icons/user.svg" width="8" height="8"> </object>
                                            Conduct : ${item.conduct}
                                        </li>
                                        <li>
                                            <object data="${Url}/public/images/icons/users.svg" width="8" height="8"> </object>
                                            Max participant limit : ${item.maxpatient}
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />
                                            MOH Area :${item.MOH}
                                        </li>
                                        <li>
                                            <img src="<c:url value="/public/images/icons/list.svg"/>" width="15px" />
                                            Target participant :${item.Target}
                                        </li>
                                    </ul>
                                </div>
                                <div class="footer">
                                    <div class="current-registered-count">
                                        <img src="<c:url value="/public/images/icons/users.svg"/>" width="18px" />
                                        120,22
                                    </div>
                                    <div class="register-btn">
                                        Register
                                    </div>
                                </div>
                            </div>
                      </div>
            `
            ;
            console.log("map")
            console.log("finish")
        })
    }

}

//
// function searchD(){
//     let count=0
//     const input = document.getElementById('clinicID').value;
//     const cardContainor = document.getElementById('card-containor');
//     const card = cardContainor.getElementsByClassName('live-card')
//     for(let i=0 ; i<card.length ;i++){
//         let title = card[i].querySelector('#date');
//         // alert(title)
//
//         if(title.innerHTML.indexOf(input) > -1){
//             card[i].style.display=""
//         }else{
//             card[i].style.display="none"
//         }
//     }
// }
//
function search(){
    let count=0
    const input = document.getElementById('diseases').value.toUpperCase();
    const cardContainor = document.getElementById('clinic-card-list');
    const card = cardContainor.getElementsByClassName('clinic-card-container')
    for(let i=0 ; i<card.length ;i++){
        let title = card[i].querySelector('#moh');

        if(title.innerHTML.toUpperCase().indexOf(input) > -1){
            card[i].style.display=""
        }else{
            card[i].style.display="none"
        }
    }
}