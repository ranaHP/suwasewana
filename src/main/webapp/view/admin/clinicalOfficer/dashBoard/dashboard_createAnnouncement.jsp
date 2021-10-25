<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Chathuranga
  Date: 9/27/2021
  Time: 10:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Suwasewana</title>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/createAnnouncement/create-announcement.css"/> "/>
    <script src="https://unpkg.com/feather-icons"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
<div class="container">
    <div class="form-container">
        <div class="search-container">
            <div class="search-text">
                <input class="search-text" type="text" placeholder="Search and select clinic">
            </div>
            <div class="search-icon">
                <i class="icon" data-feather="search"></i>
            </div>

        </div>
        <div class="text-container">
            <div class="text-left-container">
                <div class="announcemet-form-container">
                    <div class="announcemet-form-title">
                        <input class="announcemet-form-title-inpt" type="text" placeholder="Title">
                    </div>
                    <div class="announcemet-form-description">
                        <input class="announcemet-form-description-inpt" type="text" placeholder="Description">
                    </div>
                </div>


                <div class="announcemet-form-text">
                    <form action="">

                        <div class="announcement-form-text-container">

                            <div class="text">
                                <i class="icon" data-feather="map-pin"></i>
                                Location
                            </div>
                            <div class="inpt">
                                <input class="form-text" type="text" name = "announcementtitle" required>
                            </div>

                        </div>
                        <div class="announcement-form-text-container">
                            <div class="text">
                                <i class="icon" data-feather="clock"></i>
                                Date and Time
                            </div>
                            <div class="inpt">
                                <input class="form-text" type="text" name="mohcode" required>
                            </div>
                        </div>
                        <div class="announcement-form-text-container">
                            <div class="text">
                                <i class="icon" data-feather="bell"></i>
                                Duration
                            </div>
                            <div class="inpt">
                                <input class="form-text" type="text" name="moharea" required>
                            </div>
                        </div>
                        <div class="announcement-form-text-container">
                            <div class="text">
                                <i class="icon" data-feather="award"></i>
                                Conducted by
                            </div>
                            <div class="inpt">
                                <input class="form-text" type="text" name="date" required>
                            </div>
                        </div>
                        <div class="announcement-form-text-container">
                            <div class="text">
                                <i class="icon" data-feather="check-circle"></i>
                                Max limit
                            </div>
                            <div class="inpt">
                                <input class="form-text" type="text" name="expiredate" required>
                            </div>
                        </div>


                    </form>
                </div>
            </div>
            <div class="text-right-container">
                <div class="Target-participants">
                    <div class="Target-participants-for">
                        For
                    </div>

                    <div class="target-participants-container">
                        <input class="target-prticiapnts-inpt" type="text" placeholder="Target Participants">
                    </div>
                </div>

                <div class="announcement-image">
                    <div class="announcement-image-container">

                    </div>
                </div>
            </div>

        </div>


        <div class="make-announcement-btn">
            <button class="create-announcement-btn" type="submit">Create Announcement</button>
        </div>

    </div>

</div>
<script>
    feather.replace()
</script>
</body>
</html>
