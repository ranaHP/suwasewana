class Complain {

    ComplainArray={};


    container;



    constructor(container) {
        this.container = document.getElementById(container);
    }




    // set data for PHI #######################################################################################3
    setDataForPHI(data){
        if (!data) {
            // console.log("set data walinma empty")
            return;
        }

        // console.log("data come to js to set complain for phi")
        this.container.innerHTML = " ";
        this.ComplainArray = data;
        this.showCardDataForPHI(this.ComplainArray);
    }


    showCardDataForPHI(data) {
        let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
        let url = myUrl+"/public/";
        // console.log("constructor call url "+url);
        // console.log("data      "+data);
        if(data.length ==0 || !data){
            this.container.innerHTML = `No data found`
            return;
        }
        this.container.innerHTML = " ";

        data.map((item) => {
            if(item.complainModel.Status=='Pending'){
                let user=item.user.uNic? item.user.uNic: "empty";
                let title=item.complainModel.CTitle
                let ctype=item.ComplainType
                let pdate=item.complainModel.Posted_Date.split(" ")[0];
                let cmessage=item.complainModel.CMessage
                let mobile=item.user.uMobile
                let uname=item.user.uname
                this.container.innerHTML += `
                    <div class="complain" onclick="viewComplainDetail('`+title+`','`+ctype+`','`+pdate+`','`+cmessage+`','`+user+`','`+mobile+`','`+uname+`')">
                        
                        <div class="content">
                            <span>${item.complainModel.CTitle}</span>
                            <label >${item.complainModel.Posted_Date.split(" ")[0]}</label>
                        </div>
                    </div>
                `;
            }
        })
    }


    setAllData(){
        this.setData(this.AppointmentArray);
    }
}