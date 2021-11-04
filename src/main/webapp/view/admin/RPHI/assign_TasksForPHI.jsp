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
                    <tbody>
                    <tr>
                        <td data-label="Name">Akila Anjana Dissanayaka</td>
                        <td data-label="Task">To check somthi about Animal problem</td>
                        <td data-label="Note">To check somthi about Animal problem</td>
                        <td data-label="Date">03/01/2016</td>
                        <td data-label="status">Pending</td>
                    </tr>
                    <tr>
                        <td scope="row" data-label="Account">Visa - 6076</td>
                        <td data-label="Due Date">03/01/2016</td>
                        <td data-label="Amount">$2,443</td>
                        <td data-label="Period">02/01/2016 - 02/29/2016</td>
                        <td data-label="Period">03/01/2016 - 03/31/2016</td>
                    </tr>
                    <tr>
                        <td scope="row" data-label="Account">Corporate AMEX</td>
                        <td data-label="Due Date">03/01/2016</td>
                        <td data-label="Amount">$1,181</td>
                        <td data-label="Period">02/01/2016 - 02/29/2016</td>
                        <td data-label="Period">03/01/2016 - 03/31/2016</td>
                    </tr>
                    <tr>
                        <td scope="row" data-label="Acount">Visa - 3412</td>
                        <td data-label="Due Date">02/01/2016</td>
                        <td data-label="Amount">$842</td>
                        <td data-label="Period">01/01/2016 - 01/31/2016</td>
                        <td data-label="Period">03/01/2016 - 03/31/2016</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>



<script defer >
    let todo = new TodoList("pending-list" , "overdue-list" , "completed-list", "inprogess-list");

    feather.replace({ width : "22px"})


</script>
<script >

</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
