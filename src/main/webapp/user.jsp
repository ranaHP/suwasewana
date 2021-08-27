<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Ranaweera</h1>

<%--    <%--%>
<%--        PrintWriter out1 = response.getWriter();--%>
<%--        out1.println(request.getParameter("age"));--%>
<%--        String age = request.getParameter("age");--%>
<%--    %>--%>
    <c:out value="${param.age}" />
    <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/phpmvc"
                       user="root"  password="cybertcc123"/>

    <sql:query dataSource="${db}" var="rs">
            SELECT * from Users Where age = ${param.age};
    </sql:query>

    <table border="2" width="100%">
        <tr>
            <th>First Name</th>
            <th>Age</th>
        </tr>
        <c:forEach var="table" items="${rs.rows}">
            <tr>
                <td><c:out value="${table.name}"/></td>
                <td><c:out value="${table.Age}"/></td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>
