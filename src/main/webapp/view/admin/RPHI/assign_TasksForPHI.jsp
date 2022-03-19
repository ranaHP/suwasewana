<%--
  Created by IntelliJ IDEA.
  User: Chathuranga
  Date: 10/23/2021
  Time: 12:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Suwasewana</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/public/css/RPHI/AssignTask.css "/> "/>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="<c:url value="/public/js/PHI/AssignTask.js"/>"></script>
    <script src="<c:url value="/public/js/inputValidation.js"/>"></script>

    <%--    for popup style--%>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <%--    for popup script--%>
    <script src="<c:url value="/public/js/popup.js"/>"></script>

    <title>Suwasewana</title>
    <%--    side nav bar styles--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<body id="mainContent">
    <c:import url="/view/admin/partials/RPHIOfficerSideNavbar.jsp" />
    <div class="mypopup" id="popup" style="display: none;"></div>
    <div class="TaskAsignComtainer">
        <div class="header">
            <div class="upper-title">SUWASEWANA</div>
            <div class="dashboard-name">PHI/Dashboard/Verify patient</div>
        </div>
        <div class="bodyContainer">
            <div class="taskAssign">
                <form onsubmit="return checkValidation();">
                    <div class="taskAssignRow">
                        <div class="taskAssignRowCol">
                            Title of Task
                            <input id="title" type="text" required>
                        </div>
                        <div class="taskAssignRowCol">
                            Exp_date
                            <input id="expdate" type="date" required>
                        </div>
                    </div>
                    <div class="taskAssignRow">
                        <div class="taskAssignRowCol" style="align-items: flex-start">
                            Special Note
                            <textarea name="" id="specialNote" cols="30" rows="5"></textarea>
                        </div>
                        <div class="taskAssignRowCol" style="height: fit-content">

                            PHI

                            <input style="margin-left: 20px" class="SelectPHI" id="phi" type="text" list="allphi" name="allphi" autocomplete="off"
                                   onblur="validation.selectCheck('phi','ephi')";
                                   onchange="validation.selectCheck('phi','ephi')"
                                   onclick="document.getElementById('phi').value=''";
                                   onfocus="document.getElementById('ephi').innerText='';"
                            >
                            <datalist id="allphi">
                                <%--                                        <option value="Plz select Your MOH Area" option="Plz select Your MOH Area" readonly></option>--%>
                            </datalist>
                            <br>
                            <label style="font-size: 12px; color:#e74c3c; margin-top: 8px; margin-left: 10px" id="ephi"></label>

                        </div>
                    </div>
                    <div class="taskAssignRow">
                        <button class="button2" type="submit">Send</button>
                    </div>
                </form>

            </div>
            <hr style="margin-top: 50px; border: none; border-top: 0.1px solid rgba(255, 0, 0, 0.219);">
            <div class="filter" style="width: 300px; margin-top: 30px">
                <div class="date1" >
                    From
<%--                    <input type="date" id="date1" style="margin-left: 10px;" onchange="chechDate1_with_Date2();"><br>--%>
                    <input type="date" id="date1" style="margin-left: 10px;" ><br>
                    <span id="date1error" style="font-size: 12px; color: rgba(255, 0, 0, 0.781);"></span>
                </div>
                <div class="date2" style="margin-top: 10px;">
                    To
<%--                    <input type="date" id="date2" style="margin-left: 30px;margin-left: 10px;" onchange="chechDate2_with_Date1();" ><br>--%>
                    <input type="date" id="date2" style="margin-left: 30px;margin-left: 10px;"  ><br>

                </div>
            </div>
            <div class="taskAssignRowCol" style="height: fit-content">

                PHI

                <input style="margin-left: 20px" class="sSelectPHI" id="sphi" type="text" list="sallphi" name="sallphi" autocomplete="off"
                       onclick="document.getElementById('sphi').value=''";
                >
                <datalist id="sallphi">
                    <%--                                        <option value="Plz select Your MOH Area" option="Plz select Your MOH Area" readonly></option>--%>
                </datalist>
            </div>
            <select id="select_taks" >
                <option>All</option>
                <option>Complete</option>
                <option>Pending</option>
                <option>In Progress</option>
            </select>

            <button style="margin-left: 20px; padding: 3px 10px" onclick="Tasklist.FilterTask();">filter </button>

            <div class="TaskView">
                <table>

                    <thead>
                    <tr>
                        <th scope="col">PHI Name</th>
                        <th scope="col">Task</th>
                        <th scope="col">Special Note</th>
                        <th scope="col">Exp_Date</th>
                        <th scope="col">Status</th>
                    </tr>
                    </thead>
                    <tbody id="Tablebody">
                        <tr>
                            <td data-label="Name">Akila Anjana Dissanayaka</td>
                            <td data-label="Task">To check somthi about Animal problem</td>
                            <td data-label="Note">To check somthi about Animal problem</td>
                            <td data-label="Date">03/01/2016</td>
                            <td data-label="status">Pending</td>
                        </tr>


                    </tbody>
                </table>
            </div>
        </div>
    </div>

<script>
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    let validation = new FormInputValidation();
    function checkValidation(){

        var phiObj = document.getElementById("phi");
        var datalist = document.getElementById(phiObj.getAttribute("list"));
        if(datalist.options.namedItem(phiObj.value)){
            PId=(datalist.options.namedItem(phiObj.value).id);
        }


        if( validation.selectCheck('phi','ephi')){
            let title=document.getElementById("title").value;
            let exp_date=document.getElementById("expdate").value;
            let note=document.getElementById("specialNote").value;

            // console.log("title "+title);
            // console.log("exp_date "+exp_date);
            // console.log("note "+note);
            // console.log("PId "+PId);

            popup.ConformAssign();

            // console.log("correct");
        }
        else {
            validation.selectCheck('phi','ephi');
            // console.log("incorrect");
        }

        return false;
    }
    function searchPHI(){
        var phiObj = document.getElementById("sphi");
        var datalist = document.getElementById(phiObj.getAttribute("list"));
        if(datalist.options.namedItem(phiObj.value)){
            sPId=(datalist.options.namedItem(phiObj.value).id);
        }
        else{
            sPId=-1;
        }
        //console.log("Phi id = "+sPId )
        return sPId;
    }

    function conformAndDoneTask(){
        let title=document.getElementById("title").value;
        let exp_date=document.getElementById("expdate").value;
        let note=document.getElementById("specialNote").value;
        var phiObj = document.getElementById("phi");
        var datalist = document.getElementById(phiObj.getAttribute("list"));
        if(datalist.options.namedItem(phiObj.value)){
            PId=(datalist.options.namedItem(phiObj.value).id);
        }
        let reqData={
            title:title,
                exp_date:exp_date,
                    note:note,
            PId:PId
        }
        $.post(myUrl+"/phi-Todo-controller/assigntask",
            reqData,
            function (data, status) {
                if (data.includes("success")) {
                    console.log("successsss brooo");
                    getAssignTask("All");
                } else {
                    console.log("unsuccesssss brooo");
                }
            }
        );
    }
</script>

<script defer >

    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];


    let Tasklist= new TodoList('Tablebody');
    let AssignTasklist=[];
    feather.replace({ width : "22px"})
    getAssignTask("All");
    function getAssignTask(item) {
        let selected_item=item;
        $.post(myUrl+"/phi-Todo-controller/checkAssignTask",
            {},
            function (data, status) {
                let taskList = JSON.parse(data);
                AssignTasklist=taskList;
                Tasklist.setDataForPHI(taskList);

            }
        );
    }


</script>
<script >
    ViewPHI('1003',"allphi");
    ViewPHI('1003',"sallphi");
    function ViewPHI(mid,blockId){
        $.post(myUrl+"/user-complain-controller/phi",
            function (data, status) {
                let rs= JSON.parse(data);
                let PNames=document.getElementById(blockId);
                PNames.innerHTML="";
                let i=0;
                rs.map((element) => {

                    if(element.mohId==mid){
                        i=1;
                        PNames.innerHTML+= '<option id="'+element.NIC+'" name="'+ element.full_name +'-'+element.assignCity+'"  value="'+ element.full_name +'-'+element.assignCity+'"   option="'+ element.full_name +' - '+element.assignCity+'" ></option>'
                    }
                })
                if(i==0){
                    PNames.innerHTML="";
                    PNames.innerHTML= '<option id="0" name="No PHI assigned yet" value="No PHI assigned yet" option="No PHI assigned yet"></option>'
                }
            }
        );
    }
</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>



</html>
