class TodoList {

    TodolistArray={};
    container;

    constructor(container) {
        this.container = document.getElementById(container);
    }

   setDataForPHI(data){
        if (!data) {
            return;
        }
        this.container.innerHTML = " ";
        this.TodolistArray = data;
        this.showAssignTaskDataForPHI(this.TodolistArray);
    }

    FilterTask(){
        let type = document.getElementById('select_taks').value.replace(" ", "");;
        let date1 =document.getElementById('date1').value;
        let date2 =document.getElementById('date2').value;

        let  day1;

        if(date1==""){
            day1="";
        }
        else{
            day1 = new Date(date1)
        }

        if(date2==""){

            let today = new Date();
            date2=today.getDate();
        }

        let day2 = new Date(date2);

        if(type === "All"){
            type = ""
        }

        let filterdData = this.TodolistArray.filter( (app) => {
            let cday = new Date(app.expire_date)

            if(day1!=""){
                if(
                    app.status.toLowerCase().includes(type.toLowerCase()) &&
                    ( ((day1<=cday)&&(day2>=cday))|| day1=="")
                ){
                    return app;
                }
            }
            else{
                if(
                    app.status.toLowerCase().includes(type.toLowerCase())
                ){

                    return app;
                }
            }

        });
        this.container.innerHTML = "";
        this.showAssignTaskDataForPHI(filterdData);

    }

    showAssignTaskDataForPHI(data) {
        let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
        let url = myUrl+"/public/";


        if(data.length ==0 || !data){
            this.container.innerHTML = "";
            return;
        }
        this.container.innerHTML = " ";
        data.map((item) => {
            this.container.innerHTML+=`
                        <tr>
                            <td data-label="Name">${item.full_name}</td>
                            <td data-label="Task">${item.title}</td>
                            <td data-label="Note">${item.message}</td>
                            <td data-label="Date">${item.expire_date}</td>
                            <td data-label="status">${item.status}</td>
                        </tr>
                    `;

        })
    }


    setAllData(){
        this.setData(this.AppointmentArray);
    }
}