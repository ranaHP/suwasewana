class TaskList {

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

        console.log("data come to js to set complain for phi")
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
            let today=new Date();
            let exp_date = new Date(item.expire_date);
            if(today.getDate()===exp_date.getDate() &&(item.status!='complete')){
                this.container.innerHTML += `
                    <div class="TodoListItem Complin" onclick="JumpToTasklist()">
                    <div class="Tapp-left">
                        <label>${item.title}</label>
                        <br>
                        <div>
                            <span class="Tdate" style="margin-top: 100px;">${item.expire_date}</span>
                        </div>

                    </div>
                    <div class="Tapp-right">
                        <div class="todo_from">
                            <span>From - ${(item.from==="RPHI")? 'RPHI' : 'you'}</span>
                        </div>

                        <div class="contact_no">
                            <button class="todoDone" onclick="CompleteTask('`+item.Taskid+`')">Done</button>
                        </div>
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