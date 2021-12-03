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
            maxpatient:" ",
            Target:""
        }
    ];


    container;

    constructor(container) {
        this.container = document.getElementById(container);
    }
    setData(data) {
        let today = new Date();
        let month= today.getMonth()+1;
        if(!data) return;
        this.clinicListArray = data;
        console.log(data);
        this.clinicListArray.map((item) => {
            let cday = new Date(item.datetime.split(" ")[0])
            let cmonth= cday.getMonth()+1;
            if(cmonth==month){
                this.container.innerHTML += `
                      <div class="clinic-card">
                    <div class="card-left">
                        <h5>${item.title}</h5>
                        <div class="card-date">${item.datetime}</div>
                        <div class="amount"></div>
                        <div class="nop">No of patients</div>
                        <button class="reschdulebtn" onclick="select(${item.clinicID})">Reschdule</button>
                    </div>
                    <div class="card-right">
                        <img src="${Url}/public/images/svg/login/image1.svg" alt="" srcset=""
                             width=100% height=100%>
                    </div>
                </div>
            `
            }
            ;
            console.log("map")
        })
    }

}