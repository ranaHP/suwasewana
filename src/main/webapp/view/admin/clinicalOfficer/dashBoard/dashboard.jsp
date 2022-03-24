
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Suwasewana</title>
    <script src="<c:url value="/public/js/popup.js"></c:url> "></script>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/c-dashboard.css "/>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"
            integrity="sha512-Wt1bJGtlnMtGP0dqNFH1xlkLBNpEodaiQ8ZN5JLA5wpc1sUlk/O5uuOMNgvzddzkpvZ9GLyYNa8w2s7rqiTk5Q=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <%--    for side navbar style--%>
    <script src="<c:url value="/public/js/ClinicalOfficer/dashboard_clinic_summary.js"/>"></script>
    <script src="<c:url value="/public/js/ClinicalOfficer/dashboard_Vclinic_summary.js"/>"></script>
    <script src="<c:url value="/public/js/ClinicalOfficer/dashboard_clinic_disease_summary.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <script src="<c:url value="/public/js/Calander/CalanderScript.js"/>"></script>
<%--    <script src="<c:url value="/public/js/popup.js"/>"></script>--%>
    <link rel="stylesheet" href="<c:url value="/public/css/calander/calander.css "/>">
    <link rel="stylesheet" href="<c:url value="/public/css/popup/popup.css "/>">

</head>
<body id="mainContent">
<c:import url="/view/admin/partials/ClinicalOfficerSideNavbar.jsp"/>
<div class="header">
    <div class="upper-title">SUWASEWANA </div>
    <div class="dashboard-name">Clinic/Dashboard/Home</div>
</div>

<div  class="c-db-container ">
    <div class="c-container-left">
        <div class="upcomin-clinic">
            <p class="h4">This Month Normal Clinics</p>

            <div class="clinic-list" id="clinic-list">

            </div>
            <p class="h4">This Month Vaccine Clinics</p>
            <div class="clinic-list" id="clinic-list1">

            </div>


        </div>
        <div class="growth-calander">
            <div class="charts">
                <div class="chart" id="chart1">
                    <p class="h4">Clinic growth</p>
                    <div class="g-chart" style="width: 100%;">
                        <canvas id="myChart" height="50" width="100" style="margin-left: 20px"></canvas>
                    </div>
                </div>
                <div class="chart" id="chart2">
                    <p class="h4">Patient count </p>
                    <div class="g-chart" style="width: 100%">
                        <canvas id="myChart2" height="50" width="100" style="margin-left: 20px"></canvas>
                    </div>
                </div>
            </div>
            <div class="calander">
                <p class="h4">Calander</p>
                <div class="calander-body">
                    <div class="calender-container" id="calender" ></div>
                    <div class="mypopup" id="popup" style="display: none;position: fixed; top: 0; left: 0;"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="c-container-right">
        <p class="h4">All Scheduled Clinic Summary</p>
        <div class="c-right-container">
            <div class="noclinic">
                <div class="ncimg">
                    <img src="<c:url value="/public/images/PHI_Dashboard/appointmnet_banner.png"/>" alt="" srcset="" width="70%">
                </div>
               <div style="display: flex">
                   <div class="nc-amount">
                       <span class="nc-count" id="vc-count">0</span><br>
                       <span>Vaccine clinics</span>
                   </div>
                   <div class="nc-amount">
                       <span class="nc-count" id="nc-count">0</span><br>
                       <span>Normal clinics</span>
                   </div>
               </div>
            </div>

<%--            <div class="noclinic">--%>
<%--                <div class="ncimg">--%>
<%--                    <img src="<c:url value="/public/images/svg/login/image1.svg "/>" alt="" srcset=""--%>
<%--                         width=100% height=100%>--%>
<%--                </div>--%>
<%--&lt;%&ndash;                <div class="nc-amount">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <span class="nc-count" id="nc-count">0</span><br>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <span>No. of normal clinics</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--            </div>--%>
            <div class="pendingclinc">
                <div class="pctitle">No of clinics according to diseases</div>

                <div class="diseases" id="diseases">
                </div>
            </div>
        </div>
    </div>
</div>
<script defer>
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    let calender = new Calender("calender" ,"clinicEvents");
    let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    // calender.reangeSelect(2021, 9, 10, 6, 8);
    view();
    viewV()
    viewd()
    choose()
    let eventA=[]
    let event=[]

    //take data from database for the calendar

    function choose(){
        let clinicListArray=[]
        $.post(myUrl+"/create-clinic-controller/viewcount",
            // reqData,
            function(data,status){
            console.log(data)
                clinicListArray=JSON.parse(data)
                clinicListArray.map(item=>{
                    let date=item.date
                    console.log("date")
                    console.log(date)
                    let cday = new Date(item.date)
                    let cmonth= cday.getMonth()+1;
                    let cyear=cday.getFullYear()
                    let cdata=cday.getDate()
                    let reqData={
                          date:date
                    };
                    $.post(myUrl+"/create-clinic-controller/clinicsEvents",
                         reqData,
                        function (data,status){
                            let EventArray =JSON.parse(data)
                            console.log(EventArray)
                            console.log("events")
                            event.push(EventArray)
                            let object2 = { year: cyear
                                , month: cmonth, date: cdata ,events: event[0]};
                            eventA.push(object2)
                            event=[]
                            calender.setEventData(eventA)
                            console.log("event arrray")
                            console.log(eventA)
                        });
                })
            }
        );
    }



    let today = new Date();
    let clinicList4 = new clinicListd("diseases");
    //categorize clinic according to diseases
    function viewd(){
        let clinicListArray=[]
        $.post(myUrl+"/create-clinic-controller/viewdisease",
            // reqData,
            function(data,status){
                console.log("disease")
                console.log(data)
                clinicListArray=JSON.parse(data)
                chart(clinicListArray,today)
                clinicList4.setData(clinicListArray);
            }
        );
    }
patient_growth()
    function patient_growth(){
        let clinicListArray1=[]
        $.post(myUrl+"/user-disease-controller/patientG",
            // reqData,
            function(data,status){
                console.log("patient")
                console.log(data)
                clinicListArray1=JSON.parse(data)
                chart1(clinicListArray1,today)
            }
        );
    }
    let clinicList2 = new clinicList("clinic-list");
    function view(){
        let clinicListArray=[]
        $.post(myUrl+"/create-clinic-controller/view",
            // reqData,
            function(data,status){
            console.log(data)
                clinicListArray=JSON.parse(data)
                clinicList2.setData(clinicListArray);
                console.log(clinicListArray.length)
                document.getElementById("nc-count").innerHTML=clinicListArray.length;
                clinicListArray.map(item=>{
                    let cday = new Date(item.date)
                    let cmonth= cday.getMonth()+1;
                    let cyear=cday.getFullYear()
                    let cdata=cday.getDate()
                    let time=cday.getHours()+" "+cday.getMinutes()
                    console.log(cyear)
                    console.log(cmonth)
                    console.log(time)
                })

            }
        );
    }
    let clinicList3 = new clinicListv("clinic-list1");
    //count the v clinics
    function viewV(){
        let clinicListArray1=[]
        $.post(myUrl+"/create-clinic-controller/VaccineClinicsView",
            // reqData,
            function(data,status){
                clinicListArray1=JSON.parse(data)
                clinicList3.setData(clinicListArray1);
                console.log("ppppppppppp")
                console.log(clinicListArray1)
                document.getElementById("vc-count").innerHTML=clinicListArray1.length;
                // document.getElementById("amount").innerHTML=clinicListArray1.length;

            }
        );
    }
    //get pop up for reschedule n clinics
    function select(id){
        // let selectClinic = new selectClinics("form");
        let clinicList=[]
        let reqData =
            {
                clinicID: id,
            };
        console.log(reqData);
        $.post(myUrl+"/create-clinic-controller/select",
            reqData,
            function(data,status){
                // alert(data)
                console.log(data)
                clinicList=JSON.parse(data)
                // selectClinic.setData(clinicList);
                popup.showClinicResheduleMessage(data)

            }
        );
        return false;
    }
    //get the pop up for edit v clinics
    function selectv(id){
        // let selectClinic = new selectClinics("form");
        let clinicList=[]
        let reqData =
            {
                clinicID: id,
            };
        console.log(reqData);
        $.post(myUrl+"/create-clinic-controller/select-V-Clinics",
            reqData,
            function(data,status){
                // alert(data)
                console.log(data)
                // alert(data)
                clinicList=JSON.parse(data)
                // selectClinic.setData(clinicList);
                popup.showVaccineClinicEditMessage(data)

            }
        );
        return false;
    }
    //get the pop up for rescedule v clincs
    function selectReV(id) {
        // let selectClinic = new selectClinics("form");
        let clinicList = []
        let reqData =
            {
                clinicID: id,
            };
        console.log(reqData);
        $.post(myUrl+"/create-clinic-controller/select-V-Clinics",
            reqData,
            function (data, status) {
                // alert(data)
                console.log(data)
                // alert(data)
                clinicList = JSON.parse(data)
                // selectClinic.setData(clinicList);
                popup.showVaccineClinicResheduleMessage(data)

            }
        );
        return false;
    }

    //update vaccine clinics
    function updatevclinics(data){
        // alert("update")
        let id=data;
        let Lage=document.getElementById("Lage_limit").value;
        let Uage=document.getElementById("Uage_limit").value;
        let maxpatient = document.getElementById("max_patient").value;
        let duration=document.getElementById("duration").value;
        let datetime= document.getElementById("start_date_time").value;
        let clinictitle=document.getElementById("tittle").value;
        let dose=document.getElementById("dose_count").value;
        let location=document.getElementById("location").value;
        // console.log(a)
        // // alert("update")
        let reqData =
            {
                clinicID:id,
                Lage:Lage,
                Uage:Uage,
                title:clinictitle,
                location:location,
                // targetMOH:document.getElementById("target-MOH").value,
                datetime:datetime,
                duration:duration,
                maxpatient:maxpatient,
                dose:dose,
            };
        console.log(reqData)
        // alert(reqData)
        $.post(myUrl+"/create-clinic-controller/updatevclinic",
            reqData,
            function (data,status){
                // alert("wrong")
                // alert(data)
                popup.hidePopup()
                if (data.includes("success")) {
                    popup. showcliniceditsuccessMessage({
                        status: 'success',
                        message: 'Clinic Successfully Edit!'
                    });
                } else {
                    popup. showcliniceditsuccessMessage({
                        status: 'fail',
                        message: 'Clinic Edit Fails !',
                        data: data
                    });
                }
            });

        return false;
    }
    //reschedule vaccine clinics
    function ResheduleVClinics(data){
        // alert("update")
        let id=data;
        let datetime= document.getElementById("start_date_time").value;
        let dateN=datetime.split("T")[0]
        let timeN=datetime.split("T")[1]
        reschdule(dateN,timeN,id)
        let reqData =
            {
                clinicID:id,
                datetime:datetime,
            };
        console.log(datetime.split("T")[1])
        // alert(reqDa


        $.post(myUrl+"/create-clinic-controller/ResheduleVClinics",
            reqData,
            function (data,status){
                // alert("wrong")
                // alert(data)
                popup.hidePopup()
                if (data.includes("success")) {
                    popup. showcliniceditsuccessMessage({
                        status: 'success',
                        message: 'Clinic Successfully rescheduled!'
                    });
                } else {
                    popup. showcliniceditsuccessMessage({
                        status: 'fail',
                        message: 'Clinic reschedule Fails !',
                        data: data
                    });
                }
            });

        return false;
    }
    function timeToMins(time) {
        var b = time.split(':');
        return b[0] * 60 + +b[1];
    };

    function timeFromMins(mins) {
        function z(n) {
            if (n < 0) return ('-0' + (n).toString().slice(1));
            return (n < 10 ? '0' : '') + n;
        };

        var h = (mins / 60 | 0);
        var m = mins % 60;
        return z(h) + ':' + z(m);
    };
    function addTimes(time0, time1) {
        return timeFromMins(timeToMins(time0) + timeToMins(time1));
    };
    //function for send the msg to registered patient in vaccine clinics
    //newslot time should 08:23 format
    //when reschdule time then update it in vaccine_clinic->next_Available_time_slote also
    function reschdule(newslot_Date,newslot_time,clinicid){
        let reqData =
            {
                newslot_Date:newslot_Date,
                newslot_time:newslot_time,
                clinicid:clinicid

            };
        let User_Tp_slot=[]
        $.post(myUrl+"/Vaccine-controller/GetVaccineClinicDetailForReschdule/",
            reqData,
            function (data, status) {
                rs= JSON.parse(data);
                // let registered_clinic_list=document.getElementById("registeredClinicList");
                // registered_clinic_list.innerHTML='';
                let new_next_sloat=newslot_time
                let tpno=""
                rs.map((element) => {
                    let regno=element.reg_No;

                    new_next_sloat=addTimes(newslot_time, '00:05:00');
                    tpno=element.TpNo;
                    User_Tp_slot.push({tpno,new_next_sloat});       //List of useres mobile no and new slot to send message

                    UpdateDateAndTimeWhenRechdule(regno,newslot_Date,newslot_time)
                    newslot_time=new_next_sloat

                })
                resheduleMsgdata(User_Tp_slot,clinicid)
                UpdateLastTimeSlot(new_next_sloat,clinicid)
            }
        );
    }
    function resheduleMsgdata(User_Tp_slot,clinicid){
        let clinicList = []
        let reqData =
            {
                clinicID: clinicid,
            };
        console.log(reqData);
        $.post(myUrl+"/create-clinic-controller/select-V-Clinics",
            reqData,
            function (data, status) {
                clinicList = JSON.parse(data)
                let vaccine_name =clinicList[0].vaccine_name
                let date=clinicList[0].start_date_time.split(" ")[0]
                resheduleMsg(vaccine_name,User_Tp_slot,date)
            }
        );

        return false;
    }
    //vaccine clinic reschedule msg sending
    function resheduleMsg(vaccine_name,User_Tp_slot,date){
        User_Tp_slot.map(element=>{
            let t=element.tpno
            TNo=t.substring(1)
            let TNo11="+94"+TNo
            let msgs="The"+" "+vaccine_name+" "+"vaccine Clinic session that you registered has rescheduled."+" "+
                "Your new time slot is"+" "+element.new_next_sloat +" "+"on"+" "+date
            console.log(msgs)
            let reqData =
                {
                    message:msgs,
                    to:parseInt(TNo11),
                };
            console.log(reqData)
            $.post("https://app.notify.lk/api/v1/send?user_id=15808&api_key=8h4xvxbwtVgXH7dyZnN9&sender_id=NotifyDEMO",
                reqData,

                function(data,status){
                    console.log("data")

                }
            );
        })

        return false;
    }
    function UpdateLastTimeSlot(new_next_sloat,clinicid){
        let reqData =
            {
                clinic_id:clinicid,
                newslot_Date:new_next_sloat
            };
        $.post(myUrl+"/Vaccine-controller/updateTimeSlotsOfClinicTable",
            reqData,
            function (data, status) {

                if (data.includes("success")) {
                    console.log("success broooooooo")

                } else {
                    console.log("unsuccess broooooooo")
                }
            }
        );
    }
    function UpdateDateAndTimeWhenRechdule(clinic_id,newslot_Date,newslot_time){
        // console.log("clinic id "+clinic_id+" || newslot_Date "+newslot_Date+" || newslot_time "+newslot_time)

        let reqData =
            {
                clinic_id:clinic_id,
                newslot_Date:newslot_Date,
                newslot_time:newslot_time
            };

        $.post(myUrl+"/Vaccine-controller/updateTimeSlotsOfUsers",
            reqData,
            function (data, status) {

                if (data.includes("success")) {
                    // console.log("success broooooooo")

                } else {
                    // console.log("unsuccess broooooooo")
                }
            }
        );
    }
    //rechedule normal clinics
    function resheduleclinics(data){
        let duration=document.getElementById("duration").value;
        let datetime= document.getElementById("date").value;
        let time= document.getElementById("time").value;
        // // alert("update")
        let reqData =
            {
                clinicID:data,
                date:datetime,
                time:time,
                duration:duration,
            };
        console.log(reqData)
        $.post(myUrl+"/create-clinic-controller/resheduleclinic",
            reqData,
            function (data,status){
                if (data.includes("success")) {
                    popup. showcliniceditsuccessMessage({
                        status: 'success',
                        message: 'Clinic Successfully rescheduled!'
                    });
                } else {
                    popup. showcliniceditsuccessMessage({
                        status: 'fail',
                        message: 'Clinic reschedule Fails !',
                        data: data
                    });
                }
                // alert("wrong")
                // alert(data)
            });

        return false;
    }
    //function for update normal clinics
    function updateclinics(data){
        // alert("update")
        // let id=data;
        let a=document.getElementById("disease").value;
        let patient=document.getElementById("patient").value;
        let maxpatient = document.getElementById("max-patient").value;
        let duration=document.getElementById("duration").value;
        let datetime= document.getElementById("date").value;
        let time= document.getElementById("time").value;
        let clinictitle=document.getElementById("clinic-title").value;
        let description=document.getElementById("description").value;
        let conduct=document.getElementById("conduct").value;
        let location=document.getElementById("location").value;
        console.log(a)
        // // alert("update")
        let reqData =
            {
                clinicID:data,
                disease:a,
                title:clinictitle,
                location:location,
                // targetMOH:document.getElementById("target-MOH").value,
                date:datetime,
                time:time,
                duration:duration,
                maxpatient:maxpatient,
                patient:patient,
                conduct:conduct,
                description:description
            };
        console.log(reqData)
        $.post(myUrl+"/create-clinic-controller/updateclinic",
            reqData,
            function (data,status){
                // alert("wrong")
                // alert(data)
                if (data.includes("success")) {
                    popup. showcliniceditsuccessMessage({
                        status: 'success',
                        message: 'Clinic Successfully Edit!'
                    });
                } else {
                    popup. showcliniceditsuccessMessage({
                        status: 'fail',
                        message: 'Clinic Edit Fails !',
                        data: data
                    });
                }
            });

        return false;
    }
</script>
<script src="<c:url value="/public/js/ClinicalOfficer/Dashboard.js"/>"></script>
<script>
    let mycard = new card("")
</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>"></script>

</body>
</html>
