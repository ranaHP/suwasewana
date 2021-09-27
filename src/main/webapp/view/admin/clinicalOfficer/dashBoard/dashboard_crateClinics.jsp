<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create clinics</title>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_c-dashboard-createClinics.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_db-header.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/common/side-navbar.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_live-card.css"/> "/>
    <script src="https://unpkg.com/feather-icons"></script>

    <%--    for side navbar style--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/common/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
<c:import url="/view/admin/partials/ClinicalOfficerSideNavbar.jsp"/>" />

<!-- container without side nav bar -->
<div id="mainContent" class="container ">
    <div class="main-content">
        <!-- suwasewana title -->
        <div class="title">
            <div class="upper-title">SUWASEWANA </div>
            <div class="dashboard-name">Clinic/Dashboard/ClinicList</div>
        </div>
        <!-- content divide to left and right -->
        <div class="content">
            <div class="left">
                <div class="create-clinics-title">Create Clinic Session</div>
                <div class="form-container">
                    <!-- form container -->
                    <div class="form">
                        <form action="">
                            <div class="form-inputs">
                                <div class="left-inputs">
                                    <div class="inputs">
                                        <label> Disease</label>
                                        <input type="text" required autocomplete="false" name=" disease"/>
                                    </div>
                                    <div class="inputs">
                                        <label> Clinic Title</label>
                                        <input type="text" required autocomplete="false" name="clinic-title"/>
                                    </div>
                                    <div class="inputs">
                                        <label> Location</label>
                                        <input type="text" required autocomplete="false" name=" location"/>
                                    </div>
                                    <div class="inputs">
                                        <label>Target MOH</label>
                                        <input type="text" required autocomplete="false" name="target-MOH"/>
                                    </div>
                                    <div class="inputs">
                                        <label> Data & Time</label>
                                        <input type="datetime-local" required autocomplete="false" name="data-time"/>
                                    </div>
                                    <div class="inputs">
                                        <label>Duration (hours)</label>
                                        <input type="time" required autocomplete="false" name="duration"/>
                                    </div>
                                </div>
                                <div class="right-inputs">
                                    <div class="inputs">
                                        <label> Max Patient</label>
                                        <input type="number" required autocomplete="false" name="max-patient"/>
                                    </div>
                                    <div class="inputs">
                                        <label> Conduct</label>
                                        <input type="text" required autocomplete="false" name="conduct"/>
                                    </div>
                                    <div class="inputs">
                                        <label>Description</label>
                                        <input type="text" id="description" required autocomplete="false" name="description"/>
                                    </div>
                                </div>
                            </div>
                            <!-- create clinic button -->
                            <div class="create-button">
                                <button>Create Clinic</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>

            <!-- live card section -->
            <div class="right">
                <div class="card-container">
                    <div class="live-card-title">Live Clinic Card</div>
                    <div class="live-card-border">
                        <div class="live-card">
                            <div class="clinic-title">Covid19 Awareness Session</div>
                            <div class="clinic-date">2022/03/08</div>
                            <div class="clinic-description">he process of writing a job description requires
                                having a clear understanding of the job’s duties
                                and responsibilities. The job posting should also
                                include a concise picture of the skills required for
                                the position to attract qualified job candidates.
                                Organize the job</div>
                            <div class="clinic-details">
                                <div class="location item" id="item1"><span><span class="locationimg"><i data-feather="home" width="10px" height="10px"></i></span>Location :</span> home</div>
                                <div class="conduct item"  id="item2"><span><span><i data-feather="user" width="10px" height="10px"></i></span>Conduct :</span> Akila Lulakshi</div>
                                <div class="max-limit item"  id="item3"><span><span><i data-feather="user-check" width="10px" height="10px"></i></span>Max participant limit :</span>1900</div>
                                <div class="moh-area item"  id="4"><span><span><i data-feather="map-pin" width="10px" height="10px"></i></span>MOH Area :</span></div>
                                <div class="target-participants item"  id="item5"><span><span><i data-feather="users" width="10px" height="10px"></i></span>Target participant :</span> covid patients</div>
                            </div>

                            <div class="down-box">
                                <div class="current-participant-count">
                                    <div class="current-participant-img"><i data-feather="users" width="15px"></i></div>
                                    <div class="count-participants">120, 221</div>
                                </div>
                                <div class="buttons">
                                    <div class="delete-button">Delete</div>
                                    <div class="edit-button">Edit</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script>
    feather.replace()
</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>

</body>
</html>
