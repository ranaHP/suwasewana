
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<div class="sidebar close">
    <div class="close-btn">
        x
    </div>
    <div class="logo-details">
        <!-- <i class='bx bxl-c-plus-plus'></i> -->
        <img src="<c:url value="/public/images/logo/logo.png"/>"   class="logoImage" alt="logo"/>
        <span class="logo_name">Suwasewana</span>
    </div>
    <ul class="nav-links">
        <li>
            <a href="#">
                <i class='bx bx-grid-alt'></i>
                <span class="link_name">Dashboard</span>
            </a>
            <ul class="sub-menu blank">
                <li><a href="/test_war_exploded/s/PHI-dashboard">Home</a></li>
            </ul>
        </li>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-compass'></i>
                    <span class="link_name">Manage to do list</span>
                </a>
                <i class='bx bxs-chevron-down arrow'></i>
            </div>
            <ul class="sub-menu">
                <%--                <li><a class="link_name" href="#">verify-patients</a></li>--%>
                <li><a href="/test_war_exploded/s/manage-toDO">Manage to do list</a></li>
            </ul>
        </li>
<%--        <li>--%>
<%--            <div class="iocn-link">--%>
<%--                <a href="#">--%>
<%--                    <i class='bx bx-plug'></i>--%>
<%--                    <span class="link_name">Register patients</span>--%>
<%--                </a>--%>
<%--                <i class='bx bxs-chevron-down arrow'></i>--%>
<%--            </div>--%>
<%--            <ul class="sub-menu">--%>
<%--                &lt;%&ndash;                <li><a class="link_name" href="#">verify-patients</a></li>&ndash;%&gt;--%>
<%--                <li><a href="/test_war_exploded/s/Register-patients">Register patients</a></li>--%>
<%--            </ul>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <div class="iocn-link">--%>
<%--                <a href="#">--%>
<%--                    <i class='bx bx-plus-medical'></i>--%>
<%--                    <span class="link_name">Verify patients</span>--%>
<%--                </a>--%>
<%--                <i class='bx bxs-chevron-down arrow'></i>--%>
<%--            </div>--%>
<%--            <ul class="sub-menu">--%>
<%--&lt;%&ndash;                <li><a class="link_name" href="#">verify-patients</a></li>&ndash;%&gt;--%>
<%--                <li><a href="/test_war_exploded/s/verify-patients">Verify patients</a></li>--%>
<%--            </ul>--%>
<%--        </li>--%>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bxs-time'></i>
                    <span class="link_name">View appointments</span>
                </a>
                <i class='bx bxs-chevron-down arrow'></i>
            </div>
            <ul class="sub-menu">
<%--                <li><a class="link_name" href="#">View appointments</a></li>--%>
                <li><a href="/test_war_exploded/s/view-appointments">View appointments</a></li>
            </ul>
        </li>

        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-book-alt'></i>
                    <span class="link_name">View RPHI's Announcements</span>
                </a>
                <i class='bx bxs-chevron-down arrow'></i>
            </div>
            <ul class="sub-menu">
                <%--                <li><a class="link_name" href="#">View appointments</a></li>--%>
                <li><a href="/test_war_exploded/s/view-RPHI-announcement">View RPHI's Announcements</a></li>
            </ul>
        </li>


<%--        <li>--%>
<%--            <a href="#">--%>
<%--                <i class='bx bx-pie-chart-alt-2'></i>--%>
<%--                <span class="link_name">Analytics</span>--%>
<%--            </a>--%>
<%--            <ul class="sub-menu blank">--%>
<%--                <li><a class="link_name" href="#">Analytics</a></li>--%>
<%--            </ul>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <a href="#">--%>
<%--                <i class='bx bx-line-chart'></i>--%>
<%--                <span class="link_name">Chart</span>--%>
<%--            </a>--%>
<%--            <ul class="sub-menu blank">--%>
<%--                <li><a href="/test_war_exploded/s/viewClinic-announcements">Chart</a></li>--%>
<%--            </ul>--%>
<%--        </li>--%>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-error-circle'></i>
                    <span class="link_name">View-complaints</span>
                </a>
                <i class='bx bxs-chevron-down arrow'></i>
            </div>
            <ul class="sub-menu">
                <li><a href="/test_war_exploded/s/view-complaints">View complaints</a></li>
            </ul>
        </li>
        <li>
            <a href="#">
                <i class='bx bxs-bar-chart-alt-2'></i>
                <span class="link_name">View Complaint Reports</span>
            </a>
            <ul class="sub-menu blank">
                <li><a href="/test_war_exploded/s/PHI-view-report">View Complaint Reports</a></li>
            </ul>
        </li>
<%--        <li>--%>
<%--            <a href="#">--%>
<%--                <i class='bx bx-history'></i>--%>
<%--                <span class="link_name">History</span>--%>
<%--            </a>--%>
<%--            <ul class="sub-menu blank">--%>
<%--                <li><a class="link_name" href="#">History</a></li>--%>
<%--            </ul>--%>
<%--        </li>--%>
<%--        <li>--%>
<%--            <a href="#">--%>
<%--                <i class='bx bx-cog'></i>--%>
<%--                <span class="link_name">Setting</span>--%>
<%--            </a>--%>
<%--            <ul class="sub-menu blank">--%>
<%--                <li><a class="link_name" href="#">Setting</a></li>--%>
<%--            </ul>--%>
<%--        </li>--%>
        <li>
            <div class="profile-details">
                <div class="profile-content">
                    <img src="<c:url value="/public/images/avatar.png"/>" src="image/profile.jpg" alt="profileImg">
                </div>
                <div class="name-job">
                    <div class="profile_name">Hansana</div>
                    <div class="job">PHI</div>
                </div>
                <i class='bx bx-log-out'></i>
            </div>
        </li>
    </ul>
</div>
<%--<script src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>--%>
<%--</body>--%>
<%--</html>--%>
