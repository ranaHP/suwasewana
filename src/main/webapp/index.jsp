<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Suwasewana</title>
        <link rel="stylesheet" href="public/css/main.css" />
    </head>
    <body>
<%--    <%=--%>
<%--        request.getServletPath()--%>
<%--    %>--%>
<%--    <c:if test="${request.getServletPath()}">--%>
<%--        <c:import url="view/Login.jsp"/>--%>
<%--    </c:if>--%>
<%--<a href="view/user/Login.jsp" > <h1> login </h1></a>--%>
    <a href="s/login" > <h1> home </h1></a>
    <a href="s/clinic-dashboard" > <h1> clinic</h1></a>
    <a href="s/PHI-dashboard" > <h1> phi</h1></a>
    <a href="s/admin-dashboard" > <h1> admin</h1></a>
    <a href="s/add-disease" > <h1> add disease</h1></a>
    <a href="s/manage-disease" > <h1> Manage disease</h1></a>

<form  action="/test_war_exploded/user-login-controller" method="post">
    Name:<input type="text" name="name"/><br/>
    Password:<input type="password" name="password"/><br/>

    <input type="submit" value="login">

</form>
<form  onsubmit="return checkLoginValidation()">
    Name:<input type="text" id="user-mobile" name="name"/><br/>
    Password:<input type="password" name="password"/><br/>

    <input type="submit" value="login">

</form>

    </body>
</html>