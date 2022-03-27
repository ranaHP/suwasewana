<%--
  Created by IntelliJ IDEA.
  User: hansana
  Date: 10/15/2021
  Time: 3:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="<c:url value="/public/js/inputValidation.js"/>"></script>

    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/>"/>

    <!-- for style sheet link  -->
    <link href="<c:url value="/public/css/user/_dashboard-diseases.css"/>" rel="stylesheet"/>

    <!-- for commen style  sheet link  -->
    <link href="<c:url value="/public/css/user/_commen.css"/>" rel="stylesheet"/>

    <!-- for feather icon -->
    <script src="https://unpkg.com/feather-icons"></script>

    <!-- location js -->
    <script src="<c:url value="/public/js/locationSelectGenarator.js"/>"></script>

    <!-- moh list  -->
    <script src="<c:url value="/public/js/MOHSelectGenarator.js"/>"></script>

    <%--    for popup style--%>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <%--    for popup script--%>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
    <script src="<c:url value="/public/js/navbar.js"/>"></script>
    <script src="<c:url value="/public/js/loginLogout.js"/>"></script>
    <script src="<c:url value="/public/js/citizen/UserViewDiseasedetails.js"/>"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js" integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


    <title>Complain</title>
</head>
<body>
<div class="mypopup" id="popup" style="display: none;"></div>
<!-- main container -->
<div class="container"
     style="display: flex;flex-direction: column; justify-content: space-between;min-height: 100vh;">
    <!-- hero banner -->
    <section class="hero-banner-main-header-container">
        <!-- for header -->
        <div class="user-main-header-container">
            <div class="main-header">
                <div class="logo">
                    <img src="<c:url value="/public/images/logo.png "/>" alt="logo" width="100%"/>

                </div>
                <div class="navbar-container">
                    <ul class="navbar">
                        <script> let navs =  new Navbar(); navs.showHeaderNavItems("navbar"); </script>
                    </ul>
                </div>
                <div class="login-register-container">
                    <div class="language">
                        <span> සිංහල </span>
                        <img src="<c:url value="/public/images/sri-lanka.png "/>" alt="sri lanakan flag" width="100%">
                    </div>
                    <script>
                        let loginRegsiter = new LoginLogout(); loginRegsiter.showLoginLogoutItems("login-register-container")
                    </script>
                </div>
            </div>
        </div>
        <!-- register form -->
    </section>
    <!-- this for latest announcements -->

    <section>
        <div class="dashboard-container">
            <div class="left-dashboard">
                <div class="dashboard-profile-details">
                    <img src="<c:url value="/public/images/avatar.png"/>" width="90px" />
                    <div class="profile-name">
                        Hansana Ranaweera
                    </div>
                    <div class="profile-location">
                        Akuressa
                    </div>
                    <div class="moh-area">
                        Matara MOH
                    </div>
                </div>
                <div class="dashboard-icon-set">

                    <div class="dash-tab">
                        <div class="dash-icon" onclick="dashboard()">

                            <img src="<c:url value="/public/images/icons/grid.svg"/>" width="20px" />
                            <!-- <object data="images/icons/grid.svg" width="20px" height="20px" style="color: brown;"> </object> -->
                        </div>
                        <div class="dash-title">
                            Dashboard
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="Diseases()">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Diseases
                        </div>
                    </div>
                    <div class="dash-tab" >
                        <div class="dash-icon" onclick="Announcement()">
                            <img src="<c:url value="/public/images/icons/volume-2.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Announcement
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="Clinic()">
                            <img src="<c:url value="/public/images/icons/layers.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Clinic
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="Complainss()">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Complain
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="Appoiment()">
                            <img src="<c:url value="/public/images/icons/calendar.svg"/>" width="20px" />
                        </div>
                        <div class="dash-title">
                            Appoiment
                        </div>
                    </div>
                    <div class="dash-tab">
                        <div class="dash-icon" onclick="vaccine()">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
                        </div>

                        <div class="dash-title">
                            vaccine
                        </div>
                    </div>

                    <div class="dash-tab">
                        <div class="dash-icon" onclick="vaccinetypesView()">
                            <img src="<c:url value="/public/images/icons/activity.svg"/>" width="20px" />
                        </div>

                        <div class="dash-title">
                            vaccine types view
                        </div>
                    </div>

                </div>
            </div>
            <div class="right-dashboard">
                <div class="dashboard-page-title">
                    Diseases Information
                    <div class="dashboard-sub-title">
                        SUWASEWANA/CLINICS
                    </div>
                </div>

                <div class="dashboard-container">
                    <div class="dashboard-page-sub-title">
                        Diseases Information Search
                    </div>
                    <form class="previous-form"   style="display: flex;" onsubmit="return searchDisease();">

                        <div class="form-group">
                            <label >
                                Diseases Name
                            </label>
                            <input id="appointmentType" type="text" list="allappointmentType" name="appointmentType"
                                   autocomplete="off"      >
                            <datalist id="allappointmentType">

                            </datalist>
                        </div>

                        <div class="form-group d-flex-a-i-end">
                            <label >
                                &nbsp;
                            </label>
                            <button type="submit" class="submitBtn "> Search Disease</button>
                        </div>
                    </form>
                </div>

                <div class="dashboard-container" id="dashboard-container">
<%--                    <div class="dashboard-page-sub-title d-title" id="disease_name">--%>
<%--                        Diseas : Covid19--%>
<%--                        <button class="submitBtn"> Register as Patient </button>--%>
<%--                    </div>--%>
<%--                    <div class="row1">--%>
<%--                        <div class="summary">--%>
<%--                            <img src="<c:url value="/public/images/diseases/covidBanner.jpg"/>" alt="" srcset="" width="100%" />--%>
<%--                            <div class="summary-desc">--%>
<%--                                <ul>--%>
<%--                                    <li>Coronavirus disease (COVID-19) is an--%>
<%--                                        infectious disease caused by a--%>
<%--                                        newly discovered coronavirus.</li>--%>
<%--                                    <li>--%>
<%--                                        <img src="<c:url value="/public/images/icons/trending-up.svg"/>" width="15px" />--%>

<%--                                        <div>535,529</div>--%>
<%--                                        Coronavirus Cases:--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <img src="<c:url value="/public/images/icons/alert-circle.svg"/>" width="15px" />--%>
<%--                                        <div> 13,593 </div>--%>
<%--                                        Deaths:--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <img src="<c:url value="/public/images/icons/users.svg"/>" width="15px" />--%>
<%--                                        <div> 503,090 </div>--%>
<%--                                        Recovered:--%>
<%--                                    </li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="history-what-is-container">--%>
<%--                            <div class="history">--%>
<%--                                <div class="d-s-title">--%>
<%--                                    History--%>
<%--                                </div>--%>
<%--                                Coronavirus disease 2019 (COVID-19) is a contagious disease caused by severe acute--%>
<%--                                respiratory syndrome coronavirus 2 (SARS-CoV-2). The first known case was identified--%>
<%--                                in Wuhan, China, in December 2019.[7] The disease has since spread worldwide,--%>
<%--                                leading to an ongoing pandemic.[8]--%>

<%--                                Symptoms of COVID-19 are variable, <br />but often include fever,[9] cough,--%>
<%--                                headache,[10] fatigue, breathing difficulties, and loss of smell and taste.<br />--%>
<%--                                Symptoms may begin one to fourteen days after exposure to the virus. At least a--%>
<%--                                third of people who are infected do not develop noticeable symptoms.[14] Of those--%>
<%--                                people who develop symptoms noticeable enough to be classed as patients, most (81%)--%>
<%--                                develop mild to moderate symptoms (up to mild pneumonia), while 14% develop severe--%>
<%--                                symptoms (dyspnea, hypoxia, or more than 50% lung involvement on imaging), and 5%--%>
<%--                                suffer critical symptoms (respiratory failure, shock, or multiorgan--%>
<%--                                dysfunction).[15] Older people are at a higher risk of developing severe symptoms.--%>
<%--                                Some people continue to experience a range of effects (long COVID) for months after--%>
<%--                                recovery, and damage to organs has been observed.[16] Multi-year studies are--%>
<%--                                underway to further investigate the long-term effects of the disease.[16]--%>
<%--                                <br />--%>
<%--                                COVID-19 transmits when people breathe in air contaminated by droplets and small--%>
<%--                                airborne particles containing the virus. The risk of breathing these in is highest--%>
<%--                                when people are in close proximity, but they can be inhaled over longer distances,--%>
<%--                                particularly indoors. Transmission can also occur if splashed or sprayed with--%>
<%--                                contaminated fluids in the eyes, nose or mouth, and, rarely, via contaminated--%>
<%--                                surfaces. People remain contagious for up to 20 days, and can spread the virus even--%>
<%--                                if they do not develop symptoms.[17][18]--%>
<%--                                <br />--%>
<%--                                Several testing methods have been developed to diagnose the disease. The standard--%>
<%--                                diagnostic method is by detection of the virus' nucleic acid by real-time reverse--%>
<%--                                transcription polymerase chain reaction (rRT-PCR), transcription-mediated--%>
<%--                                amplification (TMA), or by reverse transcription loop-mediated isothermal--%>
<%--                                amplification (RT-LAMP) from a nasopharyngeal swab.--%>
<%--                            </div>--%>
<%--                            <div class="what-is">--%>
<%--                                <div class="d-s-title">--%>
<%--                                    What Is COVID-19?--%>
<%--                                </div>--%>
<%--                                A coronavirus is a kind of common virus that causes an infection in your nose,--%>
<%--                                sinuses, or upper throat. Most coronaviruses aren't dangerous.--%>

<%--                                In early 2020, after a December 2019 outbreak in China, the World Health--%>
<%--                                Organization identified SARS-CoV-2 as a new type of coronavirus. The outbreak--%>
<%--                                quickly spread around the world.--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="row1" style="padding-top: 30px;display: flex;flex-direction: column;">--%>
<%--                        <div class="d-s-title">--%>
<%--                            How Spread COVID-19--%>
<%--                        </div>--%>
<%--                        <div class="row">--%>
<%--                            <div class="prevention">--%>

<%--                                <div class="desc">--%>
<%--                                    According to researchers in China, these were the most common symptoms among--%>
<%--                                    people who had COVID-19:--%>
<%--                                </div>--%>
<%--                                <div class="prevention-list">--%>
<%--                                    <div class="s-item">--%>
<%--                                        Droplets or aerosols--%>
<%--                                    </div>--%>
<%--                                    <div class="s-item">--%>
<%--                                        Airborne transmission--%>
<%--                                    </div>--%>
<%--                                    <div class="s-item">--%>
<%--                                        Surface transmission--%>
<%--                                    </div>--%>
<%--                                    <div class="s-item">--%>
<%--                                        Fecal-oral--%>
<%--                                    </div>--%>

<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="banner5">--%>
<%--                                <img src="<c:url value="/public/images/diseases/4.jpg"/> " height="300px" class="m-auto" />--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="row1" style="padding-top: 30px;display: flex;flex-direction: column;">--%>
<%--                        <div class="d-s-title" style="text-align: center;">--%>
<%--                            Symptoms of COVID-19--%>
<%--                        </div>--%>
<%--                        <div class="row1"--%>
<%--                             style="flex-direction: column;justify-content: center;align-items: center;">--%>
<%--                            <div class="symptopms">--%>
<%--                                <div class="desc">--%>
<%--                                    According to researchers in China, these were the most common symptoms among--%>
<%--                                    people who had COVID-19:--%>
<%--                                </div>--%>

<%--                                <div class="d-s-s-titel">--%>
<%--                                    Most common symptoms:--%>
<%--                                </div>--%>
<%--                                <div class="symptopms-list">--%>
<%--                                    <div class="s-item">--%>
<%--                                        Fever--%>
<%--                                    </div>--%>
<%--                                    <div class="s-item">--%>
<%--                                        cough--%>
<%--                                    </div>--%>
<%--                                    <div class="s-item">--%>
<%--                                        tiredness--%>
<%--                                    </div>--%>
<%--                                    <div class="s-item">--%>
<%--                                        loss of taste or smell--%>
<%--                                    </div>--%>

<%--                                </div>--%>

<%--                                <div class="d-s-s-titel">--%>
<%--                                    Less common symptoms:--%>
<%--                                </div>--%>
<%--                                <div class="symptopms-list">--%>
<%--                                    <div class="s-item">--%>
<%--                                        sore throat--%>
<%--                                    </div>--%>
<%--                                    <div class="s-item">--%>
<%--                                        headache--%>
<%--                                    </div>--%>
<%--                                    <div class="s-item">--%>
<%--                                        aches and pains--%>
<%--                                    </div>--%>
<%--                                    <div class="s-item">--%>
<%--                                        diarrhoea--%>
<%--                                    </div>--%>
<%--                                    <div class="s-item">--%>
<%--                                        a rash on skin--%>
<%--                                    </div>--%>
<%--                                    <div class="s-item">--%>
<%--                                        red or irritated eyes--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="d-s-s-titel">--%>
<%--                                Serious symptoms:--%>
<%--                            </div>--%>
<%--                            <div class="symptopms-list">--%>
<%--                                <div class="s-item">--%>
<%--                                    difficulty breathing or shortness of breath--%>
<%--                                </div>--%>
<%--                                <div class="s-item">--%>
<%--                                    loss of speech or mobility, or confusion--%>
<%--                                </div>--%>
<%--                                <div class="s-item">--%>
<%--                                    chest pain--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="banner1">--%>
<%--                                <img src="<c:url value="/public/images/diseases/syntoms.png"/>" width="100%" />--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="row1" style="padding-top: 30px;display: flex;flex-direction: column;">--%>
<%--                        <div class="d-s-title">--%>
<%--                            Prevention of COVID-19--%>
<%--                        </div>--%>
<%--                        <div class="row">--%>
<%--                            <div class="prevention">--%>

<%--                                <div class="desc">--%>
<%--                                    According to researchers in China, these were the most common symptoms among--%>
<%--                                    people who had COVID-19:--%>
<%--                                </div>--%>
<%--                                <div class="prevention-list">--%>
<%--                                    <div class="p-item">--%>
<%--                                        Wear a mask properly--%>
<%--                                    </div>--%>
<%--                                    <div class="p-item">--%>
<%--                                        Make your environment safer--%>
<%--                                    </div>--%>
<%--                                    <div class="p-item">--%>
<%--                                        Clean your hands frequently with alcohol-based hand rub or soap and water.--%>
<%--                                    </div>--%>
<%--                                    <div class="p-item">--%>
<%--                                        Get vaccinated as soon as it’s your turn and follow local guidance on vaccination.--%>
<%--                                    </div>--%>
<%--                                    <div class="p-item">--%>
<%--                                        Keep physical distance of at least 1 metre from others, even if they don’t appear to be sick. Avoid crowds and close contact.--%>
<%--                                    </div>--%>
<%--                                    <div class="p-item">--%>
<%--                                        Cover your mouth and nose with a bent elbow or tissue when you cough or sneeze. Dispose of used tissues immediately and clean hands regularly.--%>
<%--                                    </div>--%>
<%--                                    <div class="p-item">--%>
<%--                                        If you develop symptoms or test positive for COVID-19, self-isolate until you recover.--%>
<%--                                    </div>--%>
<%--                                    <div class="row" style="padding-top: 20px;">--%>
<%--                                        <div class="image-set">--%>
<%--                                            <img src="<c:url value="/public/images/diseases/p1.svg"/> " height="70px" class="m-auto" />--%>
<%--                                            <img src="<c:url value="/public/images/diseases/p2.svg"/> " height="70px" class="m-auto" />--%>
<%--                                            <img src="<c:url value="/public/images/diseases/p5.svg"/>" height="70px" class="m-auto" />--%>
<%--                                            <img src="<c:url value="/public/images/diseases/p4.svg"/>" height="70px" class="m-auto" />--%>
<%--                                            <img src="<c:url value="/public/images/diseases/p6.svg"/>" height="70px" class="m-auto" />--%>
<%--                                            <img src="<c:url value="/public/images/diseases/p7.svg"/>" height="70px" class="m-auto" />--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="banner2">--%>
<%--                                <img src="<c:url value="/public/images/diseases/4.jpg"/> " height="300px" class="m-auto" />--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="row1" style="padding-top: 30px;display: flex;flex-direction: column;">--%>
<%--                        <div class="d-s-title">--%>
<%--                            Treatments of COVID-19--%>
<%--                        </div>--%>
<%--                        <div class="d-s-s-titel">--%>
<%--                            Self care--%>
<%--                        </div>--%>
<%--                        <div class="row">--%>
<%--                            <div class="treatments">--%>

<%--                                <div class="desc" style="padding-bottom: 10px;">--%>
<%--                                    According to researchers in China, these were the most common symptoms among--%>
<%--                                    people who had COVID-19:--%>
<%--                                </div>--%>
<%--                                <div class="treatments-list">--%>
<%--                                    <div class="t-item">--%>
<%--                                        Call your health care provider or COVID-19 hotline to find out where and when to get a test.--%>
<%--                                    </div>--%>
<%--                                    <div class="t-item">--%>
<%--                                        Cooperate with contact-tracing procedures to stop the spread of the virus.--%>
<%--                                    </div>--%>
<%--                                    <div class="t-item">--%>
<%--                                        If testing is not available, stay home and away from others for 14 days.--%>
<%--                                    </div>--%>
<%--                                    <div class="t-item">--%>
<%--                                        While you are in quarantine, do not go to work, to school or to public places. Ask someone to bring you supplies.--%>
<%--                                    </div>--%>
<%--                                    <div class="t-item">--%>
<%--                                        Keep at least a 1-metre distance from others, even from your family members.--%>
<%--                                    </div>--%>
<%--                                    <div class="t-item">--%>
<%--                                        Wear a medical mask to protect others, including if/when you need to seek medical care--%>
<%--                                    </div>--%>
<%--                                    <div class="t-item">--%>
<%--                                        Stay in a separate room from other family members, and if not possible, wear a medical mask.--%>
<%--                                    </div>--%>

<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="banner6">--%>
<%--                                <img src="<c:url value="/public/images/diseases/4.jpg"/> " height="300px" class="m-auto" />--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="d-s-s-titel">--%>
<%--                            Medical treatments--%>
<%--                        </div>--%>
<%--                        <div class="row">--%>

<%--                            <div class="treatments">--%>

<%--                                <div class="desc" style="padding-bottom: 10px;">--%>
<%--                                    According to researchers in China, these were the most common symptoms among--%>
<%--                                    people who had COVID-19:--%>
<%--                                </div>--%>
<%--                                <div class="treatments-list">--%>
<%--                                    <div class="t-item">--%>
<%--                                        Optimal supportive care includes oxygen for severely ill patients and those who are at risk for severe disease and more advanced respiratory support such as ventilation for patients who are critically ill.--%>
<%--                                    </div>--%>
<%--                                    <div class="t-item">--%>
<%--                                        Dexamethasone is a corticosteroid that can help reduce the length of time on a ventilator and save lives of patients with severe and critical illness.--%>
<%--                                    </div>--%>


<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="banner8">--%>
<%--                                <img src="<c:url value="/public/images/diseases/4.jpg"/> " height="300px" class="m-auto" />--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="row1" style="padding-top: 30px;display: flex;flex-direction: column;">--%>
<%--                        <div class="d-s-title">--%>
<%--                            Emergency contact number for COVID-19--%>
<%--                        </div>--%>
<%--                        <div class="row">--%>
<%--                            <div class="emergency-contanat-container">--%>

<%--                                <div class="desc">--%>
<%--                                    According to researchers in China, these were the most common symptoms among--%>
<%--                                    people who had COVID-19:--%>
<%--                                </div>--%>
<%--                                <div class="emergency-contanat-cards">--%>
<%--                                    <div class="emg-card">--%>
<%--                                        <div class="emd-card-title">--%>
<%--                                            Response Alert--%>
<%--                                        </div>--%>
<%--                                        <div class="emg-card-number">--%>
<%--                                            1999--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="emg-card">--%>
<%--                                        <div class="emd-card-title">--%>
<%--                                            Response Alert--%>
<%--                                        </div>--%>
<%--                                        <div class="emg-card-number">--%>
<%--                                            1999--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="row1" style="padding-top: 30px;display: flex;flex-direction: column;">--%>
<%--                        <div class="d-s-title">--%>
<%--                            Current Status of Covid 19--%>
<%--                        </div>--%>
<%--                        <div class="row">--%>
<%--                            <div class="chart-contanat-container">--%>

<%--                                <div class="desc">--%>
<%--                                    According to researchers in China, these were the most common symptoms among--%>
<%--                                    people who had COVID-19:--%>
<%--                                </div>--%>
<%--                                <div class="chart-contanat-cards">--%>
<%--                                    <div class="chart-card">--%>
<%--                                        <canvas  id="myChart" width="100" height="30"></canvas>--%>
<%--                                    </div>--%>

<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                    </div>--%>
                </div>
            </div>
        </div>
    </section>
    <div class="main-footer">
        <div class="first-row">
            <img src="<c:url value="/public/images/logo.png "/>" alt="logo" width="45px"/>

            <div class="navbar-container">
                <ul class="navbar navbar1">
                    <script> let navs1 =  new Navbar(); navs.showHeaderNavItems("navbar1"); </script>
                </ul>
            </div>
        </div>
        <div class="second-row">
            © 2021 SUWASEWANA.LK | All Right Reserved
        </div>
    </div>

</div>
<script defer>
    var loadFile = function (event, imgContainerId) {
        var image = document.getElementById(imgContainerId);
        image.src = URL.createObjectURL(event.target.files[0]);
    };
</script>
<script defer>
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

    // var ctx = document.getElementById('myChart').getContext('2d');
    // var myChart = new Chart(ctx, {
    //     type: 'line',
    //     data: {
    //         labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
    //         datasets: [{
    //             label: 'Death Cases',
    //             data: [5,10,20,30,40,50,60,],
    //             backgroundColor: [
    //                 'rgba(255, 99, 132, 0.2)',
    //
    //             ],
    //             borderColor: [
    //                 'rgba(255, 99, 132, 1)',
    //
    //             ],
    //             borderWidth: 1
    //         },
    //             {
    //                 label: 'Active Cases',
    //                 data: [12, 19, 32, 53, 56, 85],
    //                 backgroundColor: [
    //
    //                     'rgba(153, 102, 255, 0.2)',
    //
    //                 ],
    //                 borderColor: [
    //
    //                     'rgba(153, 102, 255, 1)',
    //
    //                 ],
    //                 borderWidth: 1
    //             },
    //             {
    //                 label: 'Recovered Cases',
    //                 data: [10, 9, 23, 52, 22, 3],
    //                 backgroundColor: [
    //
    //                     'rgba(54, 162, 235, 0.2)',
    //
    //                 ],
    //                 borderColor: [
    //
    //                     'rgba(54, 162, 235, 1)',
    //
    //                 ],
    //                 borderWidth: 1
    //             }
    //         ]
    //     },
    //     options: {
    //         scales: {
    //             y: {
    //                 beginAtZero: true
    //             }
    //         }
    //     }
    // });
</script>

<script defer>

    // diseasedetails();
    // // card();
    // function diseasedetails(){
    //     let disease = new view_disease_details("dashboard-container");
    //
    //     let diseasearray=[]
    //     let diseasearrayy = []
    //     let diseasearrayyy=[]
    //
    //     $.post("/test_war_exploded/user-disease-controller/view",
    //
    //         function (data,status){
    //         diseasearray = JSON.parse(data)
    //
    //             diseasearrayy = JSON.parse(diseasearray[0].description)
    //             // diseasearrayy = JSON.parse(diseasearray)
    //             //
    //             //
    //
    //             // console.log(diseasearrayy.Symptoms.Less)
    //             console.log("description")
    //             console.log(diseasearrayy)
    //             console.log(diseasearrayy.Spread.item[0])
    //             console.log(diseasearrayy.Spread.item[1])
    //             console.log("symptoms")
    //
    //             // diseasearrayyy = JSON.parse(diseasearrayy.Treatment)
    //
    //             console.log(diseasearrayy.Treatment.MedicalTreatments.desc)
    //
    //             console.log("start")
    //              console.log(diseasearray[0])
    //             console.log("over")
    //
    //             let dataa = diseasearrayy.Spread.item;
    //             // const card = document.getElementById('treatments-list');
    //         // for(let i=0;i<dataa.length;i++){
    //         //     console.log("ssss")
    //         //     // card[dataa[i]]
    //         //     console.log(dataa[i])
    //         // }
    //
    //
    //
    //
    //
    //         disease.setData(diseasearray)
    //         }
    //
    //
    //
    //     )
    //
    //     // function card(data,status){
    //     //     diseasearray =JSON.parse(data)
    //     //     console.log("dddddd")
    //     //     console.log(diseasearray)
    //     //
    //     // }
    // }

</script>
<script defer>
    getAllDisease();
    // let a = id;
    let typedatalist={};
    function getAllDisease(Diseaseid) {
        // let id=Diseaseid;
        // Diseaseid=Diseaseid
        let diseasearray = [];
        // let reqData={
        //     d_id:Diseaseid
        // }
        console.log("nameid"+Diseaseid)
        $.post("/test_war_exploded/user-disease-controller/view",
            {},
            function (data, status) {
                diseasearray = JSON.parse(data);
                // console.log("kkkkk")
                // console.log(diseasearray[a])
                // console.log("cccccccc")
                typedatalist=diseasearray;
                document.getElementById("dashboard-container").innerHTML = " ";
                disease.setData(diseasearray,Diseaseid);
                // searchDiseases(diseasearray,Diseaseid);
            }
        );
    }
</script>

<script defer>
    let disease = new view_disease_details("dashboard-container");
    ViewDises();
    function ViewDises(){
        $.post("/test_war_exploded/user-disease-controller/view",
            function (data, status) {
                let rs= JSON.parse(data);
                let PNames=document.getElementById("allappointmentType");
                PNames.innerHTML="";
                let i=0;
                // let id=0
                rs.map((element) => {
                        PNames.innerHTML+= '<option id="'+element.d_id+'" name="'+ element.name +'"  value="'+ element.name +'"   option="'+ element.name +'" ></option>'


                })

            }
        );
    }





    function searchDisease(){
        var CTypeObj = document.getElementById("appointmentType");
        var datalist = document.getElementById(CTypeObj.getAttribute("list"));
        let Diseaseid;

        if(datalist.options.namedItem(CTypeObj.value)){
            Diseaseid=(datalist.options.namedItem(CTypeObj.value).id);
        }
        console.log("disease id= "+Diseaseid)
        getAllDisease(Diseaseid)

        // alert("fdffddfd")
        return false;
    }
</script>



<script defer>


    function RegisterCheckForDisease(name,d_id){

        console.log("function call")

        name=name;
        d_id = d_id;
        let reqData={
            d_id : d_id
        };
        $.post("/test_war_exploded/user-disease-controller/check",
            reqData,
            function (data, status) {
                console.log("function call")
                console.log(data)
                if (JSON.parse(data).length) {

                    console.log("inside")

                    // updateAvailableseats(avalabel_seats,clinic_id)
                    popup.showRegisterDiseaseSuccessMessage({
                        status: 'success',
                        message: 'You Are Already Registered!'
                    })
                } else {
                    // // console.log("unsuccesssss")
                    // popup.showRegisterDiseaseSuccessMessage({
                    //     status: 'success',
                    //     message: 'Registered Failed!'
                    // });
                    console.log("outside")
                    RegisterForDisease(name,d_id);

                }
            }
        );

        // checkdisease(name,d_id)


    }

    // function checkdisease(name,d_id){
    //
    //
    //
    //     $.post("/test_war_exploded/user-disease-controller/check",
    //
    //         function (data, status) {
    //             console.log("cccccccccccc")
    //             console.log(data)
    //         }
    //     );
    //
    // }

    function RegisterForDisease(name,d_id){


        name= name;
        d_id=d_id;
        console.log(d_id)
        // console.log("register")
        // console.log(name)

        let reqData =
            {
                d_id:d_id,
                name: name

            };

        $.post("/test_war_exploded/user-disease-controller/register",
            reqData,
            function (data, status) {

                if (data.includes("success")) {
                    // updateAvailableseats(avalabel_seats,clinic_id)
                    popup.showRegisterDiseaseSuccessMessage({
                        status: 'success',
                        message: 'Successfully Registered!'
                    })
                } else {
                    // console.log("unsuccesssss")
                    popup.showRegisterDiseaseSuccessMessage({
                        status: 'success',
                        message: 'Registered Failed!'
                    });
                }
            }
        );
    }

    function dashboard(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/");
    }

    function Diseases(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"diseases");
    }

    function Announcement(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"announcement");
    }

    function Clinic(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"clinic");
    }

    function Complainss(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"complain");
    }

    function Appoiment(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"appointment");
    }
    function vaccine(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"Register-for-vaccine");
    }

    function Edit(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/");
    }
    function vaccinetypesView(){
        let url=myUrl+"/s/"
        console.log("Url "+url)
        location.href=(myUrl + "/s/"+"ViewVaccinesForUser");
    }
</script>
<script>
    feather.replace({ width: "20px" })
</script>
</body>
</html>
