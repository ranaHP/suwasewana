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
<a href="view/Login.jsp" > <h1> login </h1></a>
<a href="view/admin/clinicalOfficer/dashBoard/dashboard.jsp" > <h1> clinical officer home </h1></a>
<a href="view/admin/clinicalOfficer/dashBoard/dashboard_crateClinics.jsp" > <h1> create clinic</h1></a>
<a href="view/admin/clinicalOfficer/dashBoard/dashboard_clinicReports.jsp" > <h1> clinic reports</h1></a>
<a href="view/admin/phiOfficer/dashBoard/dashboard_viewAppointments.jsp" > <h1> view appointments</h1></a>
    </body>
</html>