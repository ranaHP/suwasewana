<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Suwasewana</title>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_c-dashboard-viewClinics.css"/> "/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="<c:url value="/public/js/ClinicalOfficer/viewVaccineClinics.js"></c:url> "></script>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>

</head>
<body>
<c:import url="/view/admin/partials/ClinicalOfficerSideNavbar.jsp"/>
<div class="containor container" id="mainContent">
    <div class="header">
        <div class="upper-title">SUWASEWANA </div>
        <div class="dashboard-name">Clinical officer/Dashboard/Clinic List</div>
    </div>
<%--     filter section --%>
    <div class="mypopup" id="popup" style="display: none;"></div>
    <div class="cardselect" style="padding:45px">
        <div class="searchbar">
            <input type="text" id ="filter" placeholder="Search clinic by name" required autocomplete="off" name="clinic-title" onkeyup="search()" />

        </div>
        <div class="searchbar">
            <input id="clinicID" placeholder="search by clinic date" list="AllMArea" name="AllMArea" autocomplete="off"

                   onclick="document.getElementById('clinicID').value='';"
            >
            <datalist id="AllMArea">
            </datalist>
            <br>
            <span class="error" id="LMArea" style="margin-left: 5px" ></span>
            <button onclick="searchD()">Search</button>
        </div>

    </div>
    <div class="card-containor" id="card-containor">
<%--          <div id="option" class="live-card"></div>--%>
    </div>
</div>
<script>
    feather.replace()
</script>
<script defer>
    let clinicList1 = new clinicList("card-containor");
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    view();
    function view(){
        let clinicListArray=[]
        $.post(myUrl+"/create-clinic-controller/VaccineClinicsView",
            // reqData,
            function(data,status){
                clinicListArray=JSON.parse(data)
                clinicList1.setData(clinicListArray);
                console.log(data)
            }
        );
    }
    function deleteCheckInputVsUserInput(appointmentId){
        let userInput = document.getElementById("delete_input").value;
        if(userInput === "Delete"){
            document.getElementById("deleteAuthErrorMessage").style.display = "none";
            deleteVClinics(appointmentId);
            // alert("okay")
        }else{
            document.getElementById("deleteAuthErrorMessage").style.display = "block";
        }
    }

    function deleteClinics(clinicID){
        // console.log("deleteclinicfunction")
        let id=clinicID
        cancelClinicmsg(parseInt(id))
        $.post(myUrl+"/create-clinic-controller/deleteV",
            {
                clinicID: clinicID
            },
            function (data, status) {
                if (data.includes("success")) {
                    popup. showClinicDeleteSuccessMessage({
                        status: 'success',
                        message: 'Clinic Successfully Deleted!'
                    });
                } else {
                    popup. showClinicDeleteSuccessMessage({
                        status: 'fail',
                        message: 'Clinic delete Fails !',
                        data: data
                    });
                }
            }
        );
    }

    function cancelClinicmsg(id){
        console.log("came to select function")
        // let selectClinic = new selectClinics("form");
        let clinicList=[]
        let reqData =
            {
                clinicID: id,
            };
        $.post(myUrl+"/create-clinic-controller/select-V-Clinics",
            reqData,
            function(data,status){
                console.log(data)
                clinicList=JSON.parse(data)
                let location=clinicList[0].location
                let title=clinicList[0].tittle
                let date=clinicList[0].start_date_time
                let vaccine=clinicList[0].vaccine_name

                let message="The vaccine clinic at"+" "+ location + " "+ "on"+" "+ date+" "+"for" +" "+ vaccine + " "+"vaccination,"+" " +"is cancelled. visit suwasewana for more details";
                cancelClinic_Nlist(message,id)
                console.log(message)
            }
        );
        return false;
    }

    //taking vaccine clinic registered numbers list
    function cancelClinic_Nlist(message,id){
        //find number list who register for the clinic
        let Nlist=[];
        let reqData =
            {
                clinicID: id,
            };
        $.post(myUrl+"/create-clinic-controller/VclinicRegisterNumList",
            reqData,

            function(data,status){
                console.log("yes")
                Nlist=JSON.parse(data)
                console.log(Nlist)
                console.log("message cancellll")
                let nLIST=[];
                Nlist.map(element=>{
                    let t=element.maxpatient
                    TNo=t.substring(1)
                    let TNo11="+94"+TNo
                    nLIST.push(TNo11)
                })
                sendmsg(nLIST,message)
            }
        );

        return false;

    }
    //final function for sending sms

    function sendmsg(nLIST,msg) {
        let msgs=msg;
        console.log(nLIST)
        nLIST.map(element=>{
            let reqData =
                {
                    message:msgs,
                    to:parseInt(element),
                };
            console.log(reqData)
            $.post("https://app.notify.lk/api/v1/send?user_id=15808&api_key=8h4xvxbwtVgXH7dyZnN9&sender_id=NotifyDEMO",
                reqData,
                function(data,status){
                    // console.log("data")

                }
            );
        })

        return false;
    }
    let mohDetails=[];
    $.post(myUrl+"/create-clinic-controller/VaccineClinicsView",
        function (data, status) {
            // console.log(data);
            let rs= JSON.parse(data);
            this.mohDetails=rs;
            console.log(data);

            let MNames=document.getElementById("AllMArea");
            MNames.innerHTML="";
            rs.map((element,index) => {
                // console.log("moh"+element.MName)
                MNames.innerHTML+= '<option  id="'+element.vcs_id+'"  name="'+element.vcs_id+'" value="'+element.start_date_time +  '" option="' +element.vcs_id +  '" ></option>'
            })
        }
    );


    function select(id){
        // let selectClinic = new selectClinics("form");
        console.log("update")
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
    function selecteditv(id,currentC,available){
        // let selectClinic = new selectClinics("form");
        console.log("edit v")
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
                popup.showVaccineClinicEditMessage(data,currentC,available)

            }
        );
        return false;
    }

    function updatevclinics(data,available,currentC){
        let count=document.getElementById("max_patient").value
        let needCount=count-parseInt(currentC)
        let increaseCount= parseInt(available) + needCount
        let id=data;
        // let Lage=document.getElementById("Lage_limit").value;
        // let Uage=document.getElementById("Uage_limit").value;
        let Limitsheats = document.getElementById("max_patient").value;
        let max_patient=increaseCount;
        // let duration=document.getElementById("duration").value;
        // let datetime= document.getElementById("start_date_time").value;
        let clinictitle=document.getElementById("tittle").value;
        let dose=document.getElementById("dose_count").value;
        // let location=document.getElementById("location").value;
        // console.log(a)
        // // alert("update")
        let reqData =
            {
                clinicID:id,
                title:clinictitle,
                Limitsheats:Limitsheats,
                max_patient:max_patient,
                dose:dose,
            };
        console.log(reqData)
        // alert(reqData)
        $.post(myUrl+"/create-clinic-controller/updatevclinic",
            reqData,
            function (data,status){
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
    function ResheduleVClinics(data){
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
        // alert(reqData)
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

//    for msg
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
            $.post("https://app.notify.lk/api/v1/send?user_id=15299&api_key=yjPuiEKMqfq8k8HKA14d&sender_id=NotifyDEMO",
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
        );}
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

</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
