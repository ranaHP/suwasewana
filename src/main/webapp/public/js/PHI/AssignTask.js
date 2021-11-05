class TodoList {

    TodolistArray={};
    container;



    constructor(container) {
        this.container = document.getElementById(container);
    }


   setDataForPHI(data){
        if (!data) {
            console.log("set data walinma empty")
            return;
        }
        console.log("data come to js to set complain for phi")
        this.container.innerHTML = " ";
        this.TodolistArray = data;
        this.showAssignTaskDataForPHI(this.TodolistArray);
    }

    FilterTask(){
        let type = document.getElementById('select_taks').value.replace(" ", "");;
        let date1 =document.getElementById('date1').value;
        let date2 =document.getElementById('date2').value;

        console.log("Day 2 comping from jsp "+ date2);

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
            // console.log("today "+today)
            // console.log("data 2 is empty today "+date2)
        }
        let day2 = new Date(date2);

        if(type === "All"){
            type = ""
        }
        // console.log("data "+title)
        console.log("data1 "+day1)
        console.log("data2 "+day2)
        // console.log("cdata "+day2)
        // console.log("data "+((day1<=cday)&&(day2>=cday))|| day1==cday)


        let filterdData = this.TodolistArray.filter( (app) => {
            let cday = new Date(app.expire_date)


            console.log("###############################################")
            console.log("data1 "+day1)
            console.log("data2 "+day2)
            console.log("cdata "+cday)

            console.log("condition1 "+   ( (day1<=cday))     );
            console.log("condition2 "+   ( (day2>=cday))    );
            console.log("condition3 "+   ( (0)|| day1=="")     );

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
                    console.log("Added")
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
        console.log("constructor call url "+url);
        // console.log("data      "+data);
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