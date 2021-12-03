class TodoList{
    pending_id = "";
    overdue_id = "";
    complete_id = "";
    inprogess_id = "";
    taskArray = [];
        // {
        //     content: "Hansana ranweera",
        //     startDate: "2021-08-1",
        //     end_date: "2021-07-25",
        //     status: "pending",
        //     type: "phi"
        // },
        // {
        //     content: "Akila",
        //     startDate: "2021-08-1",
        //     end_date: "2021-07-25",
        //     status: "complete",
        //     type: "phi"
        // },
        // {
        //     content: "Hansana ranweera",
        //     startDate: "2021-08-1",
        //     end_date: "2021-07-25",
        //     status: "pending",
        //     type: "phi"
        // },
        // {
        //     content: "Akila",
        //     startDate: "2021-08-1",
        //     end_date: "2021-07-25",
        //     status: "complete",
        //     type: "phi"
        // },
        // {
        //     content: "Hansana ranweera",
        //     startDate: "2021-08-1",
        //     end_date: "2021-07-25",
        //     status: "pending",
        //     type: "phi"
        // },
        // {
        //     content: "Akila",
        //     startDate: "2021-08-1",
        //     end_date: "2021-07-25",
        //     status: "complete",
        //     type: "phi"
        // },
        // {
        //     content: "Manduni",
        //     startDate: "2021-08-1",
        //     end_date: "2021-07-25",
        //     status: "overdue",
        //     type: "phi"
        // },
        // {
        //     content: "lover",
        //     startDate: "2021-08-1",
        //     end_date: "2021-07-25",
        //     status: "inprogess",
        //     type: "phi"
        // }

    constructor(pending_id , overdue_id, complete_id , inprogess_id,taskList){
        this.pending_id = pending_id;
        this.overdue_id = overdue_id;
        this.complete_id = complete_id;
        this.inprogess_id = inprogess_id;
        this.taskArray=taskList;


        this.init( );
    }
    init(){
        document.getElementById(this.pending_id).innerHTML="";
        document.getElementById(this.complete_id).innerHTML="";
        document.getElementById(this.overdue_id).innerHTML="";
        document.getElementById(this.inprogess_id).innerHTML="";

        this.taskArray.map( (task , index) => {
            let item_container;



            var utc = new Date().toJSON().slice(0,10).replace(/-/g,'/');

            let expdate=new Date(task.expire_date);
            let currentDate=new Date(utc)
            // console.log("##########################################")




            switch( task.status ){
                case 'pending':
                    item_container = document.getElementById(this.pending_id);
                    break;
                case 'complete':
                    item_container = document.getElementById(this.complete_id);
                    break;
                case 'overdue':
                    item_container = document.getElementById(this.overdue_id);
                    break;
                case 'inprogress':
                    item_container = document.getElementById(this.inprogess_id);
                    break;
                default:
                    console.log("not found status");
            }
            console.log("task title: "+task.title);
            item_container.innerHTML += `
                        <div class="todo-item ${task.status} " >
                            <div class="row1">
                                 <div class="content">
                                <div class="label">
                                    Content
                                </div>
                                ${task.title}
                            </div>
                            <div class="todo-date-time">
                                <div class="label">
                                    Due date
                                </div>
                                ${(currentDate<=expdate)? `<span>${(task.expire_date).split(' ')[0]}</span> ` : `<span style="color: #e74c3c">${(task.expire_date).split(" ")[0]}</span>` }

                            </div>
                            <div class="todo-action">
                                <div class="label">
                                    Action
                                </div>

                               <div class="action-item-container">
                               
                               ${task.status == 'pending' ?
                                 `   <div class="action-item onprogess" onclick="SetToProgressTask(`+task.Taskid+`)">
                                        <span  title="To OnProgress"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevrons-up"><polyline points="17 11 12 6 7 11"></polyline><polyline points="17 18 12 13 7 18"></polyline></svg>
                                        </span> 
                                    </div>

                                    <div class="action-item completed" onclick="CompleteTask(`+task.Taskid+`)" >
                                        <span  title="Complete"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
                                        </span> 
                                    </div>

                                    ${(task.from!="RPHI")?`
                                    <div class="action-item edit" onclick="EditTask('`+task.Taskid+`' , '`+task.expire_date+`','`+task.title+`')">
                                        <span  title="Edit">    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                                        </span>
                                    </div>`:""}
                                    
                                    ${(task.from!="RPHI")? `<div class="action-item trash" onclick="DeleteTask('`+task.Taskid+`')" >
                                        <span    title="Delete"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
                                        </span>
                                    </div>` : "" }

                                     ` : ""
                            } 

                            ${task.status == 'inprogess' ?
                `  
                                    <div class="action-item completed" onclick="CompleteTask(`+task.Taskid+`)">
                                        <span  title="Complete"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
                                        </span> 
                                    </div>
                                    
                                    ${(task.from!="RPHI")?`
                                    <div class="action-item edit" onclick="EditTask('`+task.Taskid+`' , '`+task.expire_date+`','`+task.title+`')">
                                        <span  title="Edit">    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                                        </span>
                                    </div>`:""}
                                    
                                     ${(task.from!="RPHI")? `<div class="action-item trash" onclick="DeleteTask('`+task.Taskid+`')" >
                                        <span    title="Delete"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
                                        </span>
                                    </div>` : "" }
                                    
                                    ` : ""
                            } 
                            ${task.status == 'overdue' ?
                `                    <div class="action-item onprogess" onclick="SetToProgressTask(`+task.Taskid+`)">
                                        <span  title="To OnProgress"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevrons-up"><polyline points="17 11 12 6 7 11"></polyline><polyline points="17 18 12 13 7 18"></polyline></svg>
                                        </span> 
                                    </div>
            
                                     ${(task.from!="RPHI")? `<div class="action-item trash" onclick="DeleteTask('`+task.Taskid+`')" >
                                        <span    title="Delete"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
                                        </span>
                                    </div>` : "" }
                                    
                                    ` : ""
                            } 

                            ${task.status == 'complete' ?
                `  
                                <div class="action-item trash" onclick="DeleteTask('`+task.Taskid+`')" >
                                    <span  title="Delete"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
                                    </span>
                                </div>` : ""
                            } 
                             
                               </div>
                            </div>  
                            </div>
                            <div class="RPHI_message ">
                                ${(task.RPHIMessage!=" ")? `<span style="color: #7f8c8d">Note : ${(task.RPHIMessage)}</span> ` : "" }

                            </div>
                        </div>
            `
        })
    }



    changeStatus( index , status){
        this.taskArray[index].status = status;
        this.reCreateContainer();
    }

    deleteTask( tasktIndex ){
        let temp = this.taskArray.filter( (task , index) => index != tasktIndex );
        this.taskArray = temp;
        this.reCreateContainer();
    }

    insertTask(formData){
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        var yyyy = today.getFullYear();

        let temp = {
            content: formData.content.value,
            startDate: mm + '/' + dd + '/' + yyyy,
            end_date: formData.taskEndTime.value,
            status: "pending",
            type: "phi"
        }
        this.taskArray.push(temp);
        this.reCreateContainer();
        formData.reset();
        return false;
    }

    reCreateContainer(){
        document.getElementById(this.inprogess_id).innerHTML = "";
        document.getElementById(this.overdue_id).innerHTML = "";
        document.getElementById(this.complete_id).innerHTML = "";
        document.getElementById(this.pending_id).innerHTML = "";
        this.init();
    }

    show(message, state){
        let toastmsg = document.createElement("div");
        let bar = document.createElement('div')
        bar.classList.add("bar")
        toastmsg.className = "toast";
        document.body.appendChild(toastmsg);

        toastmsg.innerText = message;
        toastmsg.className = "toast visible";
        toastmsg.classList.add(`${state}`);
        toastmsg.appendChild(bar)

        setTimeout(() => {
            toastmsg.classList.remove("visible");
        }, 2200);

    };
}