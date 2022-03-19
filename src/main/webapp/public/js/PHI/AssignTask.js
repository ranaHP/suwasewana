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
        let PID=searchPHI();
        let  day1;

        if(date1==""){
            day1="";
        }
        else{
            day1 = new Date(date1)
        }
        let day2 ="";
        if(date2==""){

            let today = new Date();
            day2=today;
        }
        else {
            day2 = new Date(date2);
        }



        if(type === "All"){
            type = ""
        }
        // console.log("day 1 "+day1)
        // console.log("day 2 "+day2)
        // console.log("today.getDate() "+new Date())
        let filterdData = this.TodolistArray.filter( (app) => {
            let cday = new Date(app.expire_date)

            if(PID==-1){
                if(day1!=""){
                    if(
                        app.status.toLowerCase().includes(type.toLowerCase()) &&
                        ( ((day1<=cday)&&(day2>=cday))|| (day1.getDay()==cday.getDay()&&
                            day1.getMonth()==cday.getMonth()&&
                            day1.getFullYear()==cday.getFullYear()) ||(day2.getDay()==cday.getDay()&&
                            day2.getMonth()==cday.getMonth()&&
                            day2.getFullYear()==cday.getFullYear()))
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
            }
        else{
                if(day1!=""){
                    if(
                        app.status.toLowerCase().includes(type.toLowerCase()) &&
                        ( ((day1<=cday)&&(day2>=cday))|| (day1.getDay()==cday.getDay()&&
                            day1.getMonth()==cday.getMonth()&&
                            day1.getFullYear()==cday.getFullYear()) ||(day2.getDay()==cday.getDay()&&
                            day2.getMonth()==cday.getMonth()&&
                            day2.getFullYear()==cday.getFullYear())) && (app.to_phi==PID)
                    ){
                        return app;
                    }
                }
                else{
                    if(
                        app.status.toLowerCase().includes(type.toLowerCase()) && (app.to_phi==PID)
                    ){

                        return app;
                    }
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