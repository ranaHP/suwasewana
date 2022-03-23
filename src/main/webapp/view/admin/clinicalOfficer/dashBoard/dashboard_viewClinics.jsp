<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Suwasewana</title>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_c-dashboard-viewClinics.css"/> "/>
<%--    <link rel="stylesheet" href="<c:url value="/public/css/partials/clinicalOfficer/dashBoard/_c-dashboard-createClinics.css"/> "/>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="<c:url value="/public/js/ClinicalOfficer/viewClinics.js"></c:url> "></script>
    <script src="<c:url value="/public/js/Admin/InputValidation.js "/>"></script>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>


</head>
<body>
<c:import url="/view/admin/partials/ClinicalOfficerSideNavbar.jsp"/>
<%--<div class="popup-container" id="PopupContainer"></div>--%>
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
    let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    let validation = new FormInputValidation();
    let clinicList1 = new clinicList("card-containor");
    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    view();
    function view(){
        let clinicListArray=[]
        $.post(myUrl+"/create-clinic-controller/view",
            // reqData,
            function(data,status){
                clinicListArray=JSON.parse(data)
                // console.log(clinicListArray)
                clinicList1.setData(clinicListArray);

            }
        );
    }
    function deleteCheckInputVsUserInput(appointmentId){
        let userInput = document.getElementById("delete_input").value;
        if(userInput === "Delete"){
            document.getElementById("deleteAuthErrorMessage").style.display = "none";
            deleteClinics(appointmentId);
            // alert("okay")
        }else{
            document.getElementById("deleteAuthErrorMessage").style.display = "block";
        }
    }

    function deleteClinics(clinicID){
        let id=clinicID
        cancelClinicmsg(parseInt(id))
        $.post(myUrl+"/create-clinic-controller/delete",
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

    function select(id){
        console.log("came to select function")
        // let selectClinic = new selectClinics("form");
        let clinicList=[]
        let reqData =
            {
                clinicID: id,
            };
        $.post(myUrl+"/create-clinic-controller/select",
            reqData,
            function(data,status){
                // alert(data)
                console.log(data)
                clinicList=JSON.parse(data)
                // selectClinic.setData(clinicList);
                popup.showClinicEditMessage(data)

            }
        );
        return false;
    }

    function updateclinics(data){
        // alert("update")
        // let id=data;
        let patient=document.getElementById("patient").value;
        let maxpatient = document.getElementById("max-patient").value;
        // let duration=document.getElementById("duration").value;
        // let date= document.getElementById("date").value;
        // let time= document.getElementById("time").value;
        let clinictitle=document.getElementById("clinic-title").value;
        let description=document.getElementById("description").value;
        // let conduct=document.getElementById("conduct").value;
        // let location=document.getElementById("location").value;
        // console.log(a)
        // // alert("update")
        let reqData =
            {
                clinicID:data,
                // disease:a,
                title:clinictitle,
                // location:location,
                // targetMOH:document.getElementById("target-MOH").value,
                // date:date,
                // time:time,
                // duration:duration,
                maxpatient:maxpatient,
                patient:patient,
                // conduct:conduct,
                description:description
            };
        console.log(reqData)
        $.post(myUrl+"/create-clinic-controller/updateclinic",
            reqData,
            function (data,status){
                // alert("wrong")
                //  alert(data)
            });

        return false;
    }
    function selectRe(id){
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
                // alert("wrong")
                // alert(data)
            });

        return false;
    }
    function checkMOHid(){
        var MTypeObj = document.getElementById('MArea');
        var datalist = document.getElementById(MTypeObj.getAttribute("list"));
        if(datalist.options.namedItem(MTypeObj.value)){

            return (datalist.options.namedItem(MTypeObj.value).id);
        }
        else {
            return  0;
        }
    }


        let Details=[];
        $.post(myUrl+"/create-clinic-controller/view",
        function (data, status) {
        let rs= JSON.parse(data);
        this.Details=rs;
        let MNames=document.getElementById("AllMArea");
        MNames.innerHTML="";
        rs.map((element,index) => {
        // console.log("moh"+element.MName)
        MNames.innerHTML+= '<option  id="'+element.clinicID+'"  name="'+element.clinicID+'" value="'+element.datetime +  '" option="' +element.clinicID +  '" ></option>'
    })
    }
        );


    // }
    //making cancel normal clinic msg- passed through delete clinics function
    function cancelClinicmsg(id){
        console.log("came to select function")
        // let selectClinic = new selectClinics("form");
        let clinicList=[]
        let reqData =
            {
                clinicID: id,
            };
        $.post(myUrl+"/create-clinic-controller/message",
            reqData,
            function(data,status){
                console.log(data)
                clinicList=JSON.parse(data)
                let disease=clinicList[0].disease
                let date=clinicList[0].date
                console.log(disease)
                let message="The awareness clinic for" +" "+ disease + " "+"on"+" "
                    +date+"."+" "+"is cancelled. visit suwasewana for more details";
                cancelClinic_Nlist(message,id)
                console.log(message)
            }
        );
        return false;
    }

    //taking numbers list for send cancel clinic sms
    function cancelClinic_Nlist(message,id){
        //find number list who register for the clinic
        let Nlist=[];
        let reqData =
            {
                clinicID: id,
            };
        $.post(myUrl+"/create-clinic-controller/Numberslist",
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


    // let popup1= new verify_reject_popup('PopupContainer' , {task:"This is a demo task" , date:"2018-07-22"})

</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
