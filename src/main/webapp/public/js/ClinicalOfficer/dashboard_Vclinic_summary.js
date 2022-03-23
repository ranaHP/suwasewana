let Url1 = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
class clinicListv {
    clinicListArray1 = [
        {
            vcs_id:" ",
            tittle:" ",
            start_date_time:" ",
            duration:" ",
            limit_sheats:" ",
            description:" ",
            max_patient:" ",
            target_moh:" ",
            target_people:" ",
            target_age_limit:" ",
            v_id:" ",
            location:"",
            dose_count:""
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
        this.clinicListArray1 = data;
        console.log(data);
        this.clinicListArray1.map((item) => {
            let cday = new Date(item.start_date_time.split(" ")[0])
            let cmonth= cday.getMonth()+1;
            if(cmonth==month){
            this.container.innerHTML += `
                      <div class="clinic-card">
                    <div class="card-left">
                        <p class="h5">${item.tittle}</p>
                        <div class="card-date">${item.start_date_time.split(" ")[0]}</div>
                        <div class="amount" id="amount">${item.limit_sheats}</div>
                        <div class="nop">Available seats</div>
                        <button class="reschdulebtn" onclick="selectReV(${item.vcs_id})">Reschdule</button>
                    </div>
                    <div class="card-right">
                        <img src="${Url1}/public/images/svg/login/image1.svg" alt="" srcset=""
                             width=100% height=100%>
                    </div>
                </div>
            `
            ;}
            console.log("map")
        })
    }
}