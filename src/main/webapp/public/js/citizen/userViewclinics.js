let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
class clinicList {

    clinicListArray = [
        {
            ncs_id:"",
            title:" ",
            disease:"",
            location:" ",
            MOH:" ",
            datetime:" ",
            time:" ",
            // duration:" ",
            maxpatient:" ",
            Avail_seats:" ",
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

        // console.log("today : "+current_day+" "+"exp_day : "+expday);

        this.clinicListArray.map((item) => {
            let expday = new Date(item.datetime)
            let current_day=new Date();
            console.log(current_day)
            let a = document.getElementById("register-btn");
            if(current_day<=expday){
            this.container.innerHTML += `
                <div class="clinic-card-container">
                            <div class="clinic-card">
                                <div class="title" id="moh">
                                    ${item.disease} Awareness Session
                                    <p> ${item.datetime}</p>
                                     <p> ${item.time}</p>
                                    
                                </div>
                                <div class="desc">
                                   ${item.description}
                                </div>
                                <div class="properties">
                                    <ul>
                                        <li>
                                            <span></span>
                                              <object data="${Url}/public/images/icons/book-open.svg" width="8" height="8"> </object>
                                            Available seats : ${item.Avail_seats}
                                        </li>
                                    
                                        <li>
                                            <span></span>
                                            <object data="${Url}/public/images/icons/book-open.svg" width="8" height="8"> </object>
                                            Location : ${item.location}
                                        </li>
                                        <li>
                                      
                                           <object data="${Url}/public/images/icons/book-open.svg" width="8" height="8"> </object>
                                            Conduct : ${item.conduct}
                                        </li>
                                        <li>
                                            <object data="${Url}/public/images/icons/book-open.svg" width="8" height="8"> </object>
                                            Max participant limit : ${item.maxpatient}
                                        </li>
                                         <li>
                                            <object data="${Url}/public/images/icons/book-open.svg" width="8" height="8"> </object>
                                            Disease :${item.disease}
                                        </li>
                                      
                                        <li>
                                            <object data="${Url}/public/images/icons/book-open.svg" width="8" height="8"> </object>
                                            Target participant :${item.Target}
                                        </li>
                                    </ul>
                                </div>
                                <div class="footer">
                                    <div class="current-registered-count">
                                       
                                    </div>
                                    <div class="register-btn" id="register-btn" onclick="checkAvailbale(`+item.ncs_id+`,`+item.maxpatient+`,`+item.Avail_seats+`)">
                                        Register
                                    </div>
                             
                                   
                                  
                                </div>
                            </div>
                      </div>
            `
            }

            ;
            console.log("map")

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