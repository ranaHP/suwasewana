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

<%--    <script src="<c:url value="/public/js/PHIOfficer/dashboard_todolist.js"/> "></script>--%>

    <title>Suwasewana</title>
    <%--    side nav bar styles--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<body id="mainContent">
<c:import url="/view/admin/partials/RPHIOfficerSideNavbar.jsp" />
    <div class="TaskAsignComtainer">
        <div class="header">
            <div class="upper-title">SUWASEWANA</div>
            <div class="dashboard-name">PHI/Dashboard/Verify patient</div>
        </div>
        <div class="bodyContainer">
            <div class="taskAssign">
                <div class="taskAssignRow">
                    <div class="taskAssignRowCol">
                        Title of Task
                        <input id="title" type="text">
                    </div>
                    <div class="taskAssignRowCol">
                        Exp_date
                        <input id="expdate" type="text">
                    </div>
                </div>
                <div class="taskAssignRow">
                    <div class="taskAssignRowCol">
                        Special Note
                        <textarea name="" id="specialNote" cols="30" rows="5"></textarea>
                    </div>
                    <div class="taskAssignRowCol">

                        PHI
                        <input class="SelectPHI" id="PHIList" type="text" style="outline: none;" list="AllColors" />
                        <datalist id="AllColors">
                            <option class="city_option" label="Akuressa" value="Akuressa">
                            <option class="city_option" label="Galgamuwa" value="Galgamuwa">
                            <option class="city_option" label="Ahangama" value="Ahangama">
                            <option class="city_option" label="Matara" value="Matara">
                            <option class="city_option" label="Akuressa" value="Akuressa">
                            <option class="city_option" label="Galgamuwa" value="Galgamuwa">
                            <option class="city_option" label="Ahangama" value="Ahangama">
                            <option class="city_option" label="Matara" value="Matara">
                            <option class="city_option" label="Akuressa" value="Akuressa">
                            <option class="city_option" label="Galgamuwa" value="Galgamuwa">
                            <option class="city_option" label="Ahangama" value="Ahangama">
                            <option class="city_option" label="Matara" value="Matara">
                        </datalist>

                    </div>
                </div>
                <div class="taskAssignRow">
                    <button class="button2">Send</button>
                </div>

            </div>
            <hr style="margin-top: 50px; border: none; border-top: 0.1px solid rgba(255, 0, 0, 0.219);">
            <div class="filter" style="width: 300px;">
                <div class="date1" >
                    From
                    <input type="date" id="date1" style="margin-left: 10px;" onchange="chechDate1_with_Date2();"><br>
                    <span id="date1error" style="font-size: 12px; color: rgba(255, 0, 0, 0.781);"></span>
                </div>
                <div class="date2" style="margin-top: 10px;">
                    To
                    <input type="date" id="date2" style="margin-left: 30px;margin-left: 10px;" onchange="chechDate2_with_Date1();" ><br>
                    <span id="date2error" style="font-size: 12px; color: rgba(255, 0, 0, 0.781);">sssssss</span>
                </div>
            </div>
            <select id="select_taks" >
                <option>All</option>
                <option>Complete</option>
                <option>Pending</option>
                <option>In Progress</option>
            </select>

            <button onclick="Tasklist.FilterTask();">filter </button>

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
    function chechDate1_with_Date2(){
        let date1=document.getElementById("date1").value;
        let date2=document.getElementById("date2").value;

        let day1=(!date1)? " ":new Date(date1);
        let day2=(!date2)? " ":new Date(date2);




    }
    function chechDate2_with_Date1(){
        let date1=document.getElementById("date1").value;
        let date2=document.getElementById("date2").value;

        let day1=(!date1)? " ":new Date(date1);
        let day2=(!date2)? " ":new Date(date2);


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

</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
