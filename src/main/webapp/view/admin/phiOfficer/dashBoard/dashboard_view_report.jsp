<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Suwasewana</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/public/css/partials/phiOfficer/dashBoard/_phi_dashboard-view_report.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/> "/>
    <script src="https://unpkg.com/feather-icons"></script>
<%--    <link rel="stylesheet" href="<c:url value="/public/css/PHI/PHI_Dashboard.css"/>">--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script defer src="<c:url value="/public/js/PHIOfficer/view_report.js"/> "></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js" integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <%--    side-nav-bar--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<body id="mainContent">
<c:import url="/view/admin/partials/PHIOfficerSideNavbar.jsp" />
<!-- suwasewana header -->
<div class="header">
    <div class="upper-title">SUWASEWANA </div>
    <div class="dashboard-name">PHI/Dashboard/Complain reports</div>
</div>
<div class="container">
    <div class="content">
        <div class="select-date"></div>
        <!-- progress show -->
        <div class="progress-boxes">
            <div class="card">
                <div class="card-content">
                    <div class="card-icon">
                        <img  src="<c:url value="/public/images/icons/View%20complain/mail.svg "/>" alt="" srcset="">
                    </div>
                    <div class="card-details">
                        <h5 id="new">200</h5>
                        <div class="precentage">
                            <div class="p-lable" id="precentage"><label >2.345%</label></div>
                            <div class="arrow" style="display: none" id="complain-arrow-up"><i data-feather="arrow-up" ></i></div>
                            <div class="arrow" style="display: none" id="complain-arrow-down"><i data-feather="arrow-down"></i></div>
                        </div>
                    </div>
                </div>
                <label>New</label>
            </div>
            <div class="card" style="display: flex">
                <div class="card-content">
                    <div class="card-icon">
                        <img  src="<c:url value="/public/images/icons/View%20complain/loader.svg "/>" alt="" srcset="">
                    </div>
                    <div class="card-details">
                        <h5 id="progress">200</h5>
                        <div class="precentage">
<%--                            <div class="p-lable" id="appoinment-precentage"><label >2.345%</label></div>--%>
<%--                            <div class="arrow" style="display: none" id="app-complain-arrow-up"><i data-feather="arrow-up" ></i></div>--%>
<%--                            <div class="arrow" style="display: none" id="app-complain-arrow-down"><i data-feather="arrow-down"></i></div>--%>
                        </div>
                    </div>
                </div>
                <label>In progress</label>
            </div>
            <div class="card">
                <div class="card-content">
                    <div class="card-icon">
                        <img  src="<c:url value="/public/images/icons/View%20complain/check-circle.svg "/>" alt="" srcset="">
                    </div>
                    <div class="card-details">
                        <h5 id="done">200</h5>
                        <div class="precentage">
<%--                            <div class="p-lable" id="appoinment-precentage"><label >2.345%</label></div>--%>
<%--                            <div class="arrow" style="display: none" id="app-complain-arrow-up"><i data-feather="arrow-up" ></i></div>--%>
<%--                            <div class="arrow" style="display: none" id="app-complain-arrow-down"><i data-feather="arrow-down"></i></div>--%>
                        </div>
                    </div>
                </div>
                <label>Done</label>
            </div>
        </div>
        <!-- show complain distribution -->
        <div class="complain-distribution f-3">
            <div class="complain-chart">
                <canvas id="donat-chart" class="mychart" width="250" height="250"></canvas>
            </div>
            <div class="complain-des" id="complain-des">
                <div class="diff-types">
                    <ul>
                        <li id="i1">Animal issue - <span id="one"></span> <span> %</span></li>
                        <li id="i2">Environment issue - <span id="two"></span> <span> %</span></li>
                        <li id="i3">Unhealthy food issues - <span id="three"></span> <span> %</span></li>
                        <li id="i4">Land issue - <span id="four"></span> <span> %</span></li>
                        <li id="i5">Noise issue - <span id="five"></span> <span> %</span></li>
                        <li id="i6">Other - <span id="six"></span> <span> %</span></li>
                    </ul>
                </div>


            </div>
        </div>
        <!-- complaint variations -->
        <div class="complain-variations">
            <p class="f-2">Variation of complaints</p>
            <div class="variations">
                <div class="line gray">
                    <div class="var-chart">
                        <div class="chart">
                            <canvas id="myChart3" class="mychart" width="300" height="300"></canvas>
                        </div>
                        <div>Environmental issues</div>
                    </div>
                    <div class="var-chart">
                        <div class="chart">
                            <canvas id="myChart4" class="mychart" width="300" height="300"></canvas>
                        </div>
                        <div>Animal issues</div>
                    </div>
                </div>
                <div class="line gray">
                    <div class="var-chart">
                        <div class="chart">
                            <canvas id="myChart5" class="mychart" width="300" height="300"></canvas>
                        </div>
                        <div>Water related issues</div>
                    </div>
                    <div class="var-chart">
                        <div class="chart">
                            <canvas id="myChart6" class="mychart" width="300" height="300"></canvas>
                        </div>
                        <div>Unhealthy foods related issues</div>
                    </div>
                </div>
                <div class="line gray">
                    <div class="var-chart">
                        <div class="chart">
                            <canvas id="myChart7" class="mychart" width="300" height="300"></canvas>
                        </div>
                        <div>Land issues </div>
                    </div>
                    <div class="var-chart">
                        <div class="chart">
                            <canvas id="myChart8" class="mychart" width="300" height="300"></canvas>
                        </div>
                        <div>Other</div>
                    </div>
                </div>
            </div>
        </div>
        <hr>
    </div>
</div>
<script>
    feather.replace(({width:"12px",height:"12px"}))
    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

    let complainlist=[];
    getAllComplintypes()
    function getAllComplintypes() {
        $.post(myUrl+"/phi-complain-controller1/complain_for_moh",
            {},
            function (data, status) {
                let ComplainList = JSON.parse(data);
                console.log("came")
                console.log(ComplainList)
                let all=0
                let Animal_issue=0;
                let Environment_issues=0;
                let Food_issues=0;
                let Land_issues=0;
                let Noise_issue=0;
                let other=0;

                let Animal_issuep=0;
                let Environment_issuesp=0;
                let Food_issuesp=0;
                let Land_issuesp=0;
                let Noise_issuep=0;
                let otherp=0;
                let today = new Date();
                // console.log("Today : "+cday)
                let month= today.getMonth()+1;
                let premonth=month-1;
                ComplainList.map((element) => {
                    console.log("mapp")

                   console.log(element.complainModel.Posted_Date.split("-")[1])
                    if(element.complainModel.Posted_Date.split("-")[1]==month){
                    if(element.complainModel.CType=="100"){
                        Animal_issue++;
                    }
                    if(element.complainModel.CType=="101"){
                        Environment_issues++;
                    }
                    if(element.complainModel.CType=="102"){
                        Food_issues++;
                    }
                    if(element.complainModel.CType=="103"){
                        Land_issues++;
                    }
                    if(element.complainModel.CType=="104"){
                        Noise_issue++;
                    }
                    if(element.complainModel.CType=="105"){
                        other++;
                    }}else if(element.complainModel.Posted_Date.split("-")[1]==premonth){
                        if(element.complainModel.CType=="100"){
                            Animal_issuep++;
                        }
                        if(element.complainModel.CType=="101"){
                            Environment_issuesp++;
                        }
                        if(element.complainModel.CType=="102"){
                            Food_issuesp++;
                        }
                        if(element.complainModel.CType=="103"){
                            Land_issuesp++;
                        }
                        if(element.complainModel.CType=="104"){
                            Noise_issuep++;
                        }
                        if(element.complainModel.CType=="105"){
                            otherp++;
                        }
                    }
                })
                console.log("issues")
                console.log(Noise_issuep)
                console.log(Environment_issues)
                chart(Animal_issue,Animal_issuep,month,premonth)
                chart1(Environment_issues,Environment_issuesp,month,premonth)
                chart2(Land_issues,Land_issuesp,month,premonth)
                chart3(Noise_issue,Noise_issuep,month,premonth)
                chart4(Food_issues,Food_issuesp,month,premonth)
                chart5(other,otherp,month,premonth)

            }
        );

    }
    getAllComplain();
    function getAllComplain() {
        let complainCardList = [];
        let typedatalist=[]
        $.post(myUrl+"/phi-complain-controller1/ViewCom" +
            "plainForPHI",
            {},
            function (data, status) {
                let complainList = JSON.parse(data);
                complainlist=complainList;


                // fill pending done in progress count
                let pendin=0;
                let done=0;
                let progress=0;
                console.log("complain")
                console.log(complainList)
                complainList.map((element) => {
                    // console.log("status " +element.complainModel.Status);

                    if(element.complainModel.Status=="Pending"){
                        pendin++;
                    }
                    else if(element.complainModel.Status=="Done"){
                        done++;
                    }
                    else if(element.complainModel.Status=="In Progress"){
                        progress++;
                    }
                    else {
                        console.log("Incorrect complain model status check ur database")
                    }

                })

                document.getElementById("new").innerText=pendin;
                document.getElementById("progress").innerText=progress;
                document.getElementById("done").innerText=done;


                // complain.setDataForPHI(complainList);

                // fill compalain details


            }
        );

    }
    function round(value, decimals) {
        return Number(Math.round(value+'e'+decimals)+'e-'+decimals);
    }

    round(1.005, 2); // 1.01
    function getAllComplinMOH() {
        let all=0
        let Animal_issue=0;
        let Environment_issues=0;
        let Food_issues=0;
        let Land_issues=0;
        let Noise_issue=0;
        let other=0;

        $.post(myUrl+"/phi-complain-controller1/complain_for_moh",
            {},
            function (data, status) {
                let ComplainList = JSON.parse(data);
                ComplainList.map((element) => {
                    if(element.complainModel.CType=="100"){
                        Animal_issue++;
                    }
                    if(element.complainModel.CType=="101"){
                        Environment_issues++;
                    }
                    if(element.complainModel.CType=="102"){
                        Food_issues++;
                    }
                    if(element.complainModel.CType=="103"){
                        Land_issues++;
                    }
                    if(element.complainModel.CType=="104"){
                        Noise_issue++;
                    }
                    if(element.complainModel.CType=="105"){
                        other++;
                    }

                })
                all=Animal_issue+Environment_issues+Food_issues+Land_issues+Noise_issue;

                let pAnimalissue=Animal_issue/all*100
                round(pAnimalissue)
                let pEnvironmentissue=Environment_issues/all*100
                let pFoodissue=Food_issues/all*100
                let pLandissue=Land_issues/all*100
                let pNoiseissue=Noise_issue/all*100
                let pother=other/all*100
                document.getElementById("one").innerText=pAnimalissue
                document.getElementById("two").innerText=pEnvironmentissue
                document.getElementById("three").innerText=pFoodissue
                document.getElementById("four").innerText=pLandissue
                document.getElementById("five").innerText=pNoiseissue
                document.getElementById("six").innerText=pother



                complain_distribution_chart(Animal_issue,Environment_issues,Food_issues,Land_issues,Noise_issue,other);







            }
        );

    }

    getComplaintprecentage();
    function getComplaintprecentage() {
        let complainCardList = [];
        let typedatalist=[]
        $.post(myUrl+"/phi-complain-controller1/ViewComplainForPHI",
            {},
            function (data, status) {
                let complainList = JSON.parse(data);
                complainlist=complainList;


                // fill pending done in progress count
                let pendin=0;
                let done=0;
                let progress=0;
                let today = new Date();
                // console.log("Today : "+cday)
                let month= today.getMonth()+1;
                let premonth=month-1;
                let date= today.getDate();

                let preMonthComplain=0;
                let thisMonthCompalin=0;
                let pending=0;
                complainList.map((element) => {
                    // console.log("################################");
                    let cday = new Date(element.complainModel.Posted_Date.split(" ")[0])
                    let cmonth= cday.getMonth()+1;
                    let cdate= cday.getDate();

                    if(cmonth==month && cdate<=date){
                        // console.log("this is this month complain");
                        thisMonthCompalin++;
                    }
                    else if(cmonth==premonth && cdate<=date ){
                        // console.log("this is pre month complain");
                        preMonthComplain++;
                    }
                    else{
                        // console.log("dont care about this compalins")
                    }

                    if(element.complainModel.Status=="Pending"){
                        pending++
                    }


                })
                // console.log("thisMonthCompalin : "+thisMonthCompalin)
                // console.log("preMonthComplain : "+preMonthComplain)
                // console.log("pending : "+pending)
                let complainprecentage=((thisMonthCompalin-preMonthComplain)/preMonthComplain)*100;
                let ComPre=complainprecentage;


                document.getElementById("new").innerText=pending;
                // document.getElementById("precentage").innerText=ComPre+"%";
                console.log(ComPre)
                if(complainprecentage<0){
                    document.getElementById("complain-arrow-down").style.display="block";
                }
                else{
                    document.getElementById("complain-arrow-up").style.display="block";
                }

            }
        );

    }

    getAllComplinMOH();
    function getAllComplinMOH() {
        let all=0
        let Animal_issue=0;
        let Environment_issues=0;
        let Food_issues=0;
        let Land_issues=0;
        let Noise_issue=0;
        let other=0;
        $.post(myUrl+"/phi-complain-controller1/complain_for_moh",
            {},
            function (data, status) {
                let ComplainList = JSON.parse(data);
                ComplainList.map((element) => {
                    if(element.complainModel.CType=="100"){
                        Animal_issue++;
                    }
                    if(element.complainModel.CType=="101"){
                        Environment_issues++;
                    }
                    if(element.complainModel.CType=="102"){
                        Food_issues++;
                    }
                    if(element.complainModel.CType=="103"){
                        Land_issues++;
                    }
                    if(element.complainModel.CType=="104"){
                        Noise_issue++;
                    }
                    if(element.complainModel.CType=="105"){
                        other++;
                    }

                })
                all=Animal_issue+Environment_issues+Food_issues+Land_issues+Noise_issue;

                let pAnimalissue=Animal_issue/all*100
                let pEnvironmentissue=Environment_issues/all*100
                let pFoodissue=Food_issues/all*100
                let pLandissue=Land_issues/all*100
                let pNoiseissue=Noise_issue/all*100
                let pother=other/all*100
                document.getElementById("one").innerText=pAnimalissue
                document.getElementById("two").innerText=pEnvironmentissue
                document.getElementById("three").innerText=pFoodissue
                document.getElementById("four").innerText=pLandissue
                document.getElementById("five").innerText=pNoiseissue
                document.getElementById("six").innerText=pother



                complain_distribution_chart(Animal_issue,Environment_issues,Food_issues,Land_issues,Noise_issue,other);







            }
        );

    }

    function complain_distribution_chart( type1, type2, type3, type4 ,type5,type6){
        var ctx = document.getElementById('donat-chart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                //  labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                datasets: [{
                    label: '',
                    data: [type1, type2, type3, type4, type5,type6],
                    backgroundColor: [
                        '#c0392b',
                        '#3498db',
                        '#f1c40f',
                        '#2ecc71',
                        '#8e44ad',
                        '#273c75'
                    ],
                    borderColor: [
                        '#ecf0f1'
                    ],
                    // borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    title: {
                        display: true,
                        // text: 'Chart.js Doughnut Chart'
                    }
                }
            },
        });
    }
</script>

</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>