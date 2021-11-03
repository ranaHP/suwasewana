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
    <title>Title</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/public/css/partials/phiOfficer/dashBoard/_phi-dashboard_todolist.css"/> "/>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="<c:url value="/public/js/PHIOfficer/dashboard_todolist.js"/> "></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <title>Suwasewana</title>
    <%--    side nav bar styles--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<body id="mainContent">
<c:import url="/view/admin/partials/PHIOfficerSideNavbar.jsp" />
<div class="header">
    <div class="upper-title">SUWASEWANA </div>
    <div class="dashboard-name">PHI/Dashboard/Manage todo lIst</div>
</div>

<div class="todo-container">
    <div class="left-container">
        <div class="on-progess-list-container">
            <div class="title">
                On Progess
            </div>
            <div class="on-progess-list" id="inprogess-list">

            </div>
        </div>
        <div class="pending-list-container" >
            <div class="title">
                Pending
            </div>
            <div class="pending-list" id="pending-list">

            </div>
        </div>
        <div class="add-new-task-container">
            <div class="title">
                Create New Task
            </div>
            <div class="add-new-task">
                <form onsubmit="return todo.insertTask(this)">
                    <div class="form-item">
                        <label> Task content:</label>
                        <textarea id="w3review" name="content" rows="4" cols="50" row="5"></textarea>

                    </div>
                    <div class="row">
                        <div class="form-item">
                            <label for="taskStartTime"> End date :</label>
                            <input type="datetime-local"  name="taskEndTime" id="taskStartTime">
                        </div>
                        <div class="form-item">
                            <button type="submit" onclick="todo.show('Task added succesfully','success')" > Add Task  </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="right-container">

        <div class="overdue-list-container">
            <div class="title">
                OverDue Task
            </div>
            <div class="overdue-list"  id="overdue-list">

            </div>
        </div>
        <div class="completed-list-container">
            <div class="title">
                Completed Task
            </div>
            <div class="completed-list" id="completed-list">

            </div>
        </div>
    </div>
</div>

<script defer >

    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

    feather.replace({ width : "22px"})

    getAllTask();
    function getAllTask() {
        $.post(myUrl+"/phi-Todo-controller/TakeTaskList",
            {},
            function (data, status) {
                let taskList = JSON.parse(data);
                let todo = new TodoList("pending-list" , "overdue-list" , "completed-list", "inprogess-list",taskList);

            }
        );

    }


</script>
<script >

</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
