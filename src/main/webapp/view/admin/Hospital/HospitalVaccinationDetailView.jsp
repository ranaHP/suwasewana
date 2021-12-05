<%--
  Created by IntelliJ IDEA.
  User: Akila
  Date: 12/6/2021
  Time: 1:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="<c:url value="/public/css/HospitalView.css"/>" rel="stylesheet" />
    <title>Title</title>
</head>
<body>
<div class="vaccine-list-container">
    <hr>
    <div class="search-row">

        <div class="nic">
            <span>NIC : </span>
            <input type="text" id="nicval">

        </div>

    </div>
    <hr>
    <div class="search-content">
        <div class="user-details">
            <p>Name : <span>Akila Anjana dissanayaka</span></p>
            <p>Age : <span>23</span></p>
            <p>Dosage : <span>3</span></p>
        </div>

        <table>
            <caption>Vaccine details </caption>
            <thead>
            <tr>
                <th scope="col">Vaccine</th>
                <th scope="col">Date</th>
                <th scope="col">Location</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td data-label="Vaccine">synopham</td>
                <td data-label="Date">04/01/2016</td>
                <td data-label="Location">Galgamuwa</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
