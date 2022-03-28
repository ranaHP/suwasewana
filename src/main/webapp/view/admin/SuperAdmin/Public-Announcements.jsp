
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Suwasewana</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/public_Announcements.css"/> "/>
    <link rel="stylesheet" href="<c:url value="/public/css/Admin/announcementCard.css"/> "/>
    <script src="<c:url value="/public/js/Admin/InputValidation.js "/>"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script defer src="<c:url value="/public/js/Admin/public_Announcements.js"></c:url> "></script>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <script src="<c:url value="/public/js/popup.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/easymde/dist/easymde.min.css">
    <script src="https://cdn.jsdelivr.net/npm/easymde/dist/easymde.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

</head>
<body id="mainContent" onload="checkP()">
<c:import url="/view/admin/partials/AdminOfficerSideNavbar.jsp"></c:import>
<div class="mypopup" id="popup" style="display: none;"></div>
<div class="container">

    <div class="header">
        <div class="upper-title">SUWASEWANA </div>
        <div class="dashboard-name">Admin/Dashboard/Make announcements</div>
    </div>
<%--    <h1 style="text-align: center ; margin: 20px 0; color: #4b4b4b"> Public Announcements Form  </h1>--%>
<%--    <span style="text-align: center ; margin: -10px 0; color: #4b4b4b;"> Suwasewana public announcement portal  </span>--%>



    <h1 style="text-align: center ; margin: 20px 0; color: #4b4b4b"> Public Announcements Form  </h1>
    <span style="text-align: center ; margin: -10px 0; color: #4b4b4b;"> Suwasewana public announcement portal  </span>


    <div class="make-announcement-container" >
        <div class="left">
            <!-- form container -->
            <div class="form-container" style="">
                <div class="form">
                    <div class=""  id="input-title">
                        <label for="title">Title</label> <br>
                        <input style="width: 100%!important;" type="text" id="title" autocomplete="off" class="a" onkeyup="card()" required>
                    </div>
                    <div class="form-item1" id="expire-date">
                        <label for="title">Expire date</label>
                        <input style="font-size: .7em" type="date" class="a" id="expire_date"></input>
                    </div>
                    <div class="form-item">
                        <label for="description" >Description</label>
                        <textarea id="description" name="content" rows="10" cols="30" row="5" onkeyup="card()"></textarea>
                    </div>


                    <div id="search-section" style="width: 100%">
                      <div style="display: flex; align-items: center; ">
                          <label for="switch">                          </label>

                          All island &nbsp;&nbsp; <input type="checkbox" id="switch" onclick="change()">
                      </div>

                        <div style="display: flex ;margin-bottom: 10px;flex-direction: column" id="province_selected" >
                            <div class="selected-options-container" id="selected-options-container">
                            </div>
                            <div style="display: flex;flex-direction: row;align-items: center">
                                <input class="a" autocomplete="off" placeholder="Select Province" class="SelectColordiv" id="PArea" type="text" style="outline: none;" list="AllPArea" name="AllPArea" required
                                       onclick="document.getElementById('PArea').value='';"
                                       onblur="validation.SearchSelect(
                                    document.getElementById('PArea').value,
                                    'LPArea'
                                );"
                                >
                                <datalist id="AllPArea">
                                    <option label="All" value="All" id=All1></option>
                                </datalist>
                                <br>
                                <button class="publish-button1 btn-shadow" onclick="AddValue(document.getElementById('AllPArea').value, document.getElementById('AllPArea').text);SelectDistricts()">add</button>
                            </div>
                            <span class="error" id="LPArea" style="margin-left: 5px" ></span>
                        </div>
                        <div style="display: flex;flex-direction: column" id="district_selected">
                            <div class="selected-options-container" id="selected-options-container1">
                            </div>
                            <div style="display: flex;flex-direction: row;align-items: center">
                                <input class="a" autocomplete="off" placeholder="Select Districts" class="SelectColordiv" id="DArea" type="text" style="outline: none;" list="AllDArea" name="AllDArea" required
                                       onclick="document.getElementById('DArea').value='';"
                                       onblur="validation.SearchSelect(
                                    document.getElementById('DArea').value,
                                    'LDArea'
                                );"
                                >
                                <datalist id="AllDArea">
                                    <option label="All" value="All" id=All></option>
                                </datalist>
                                <br>
                                <button class="publish-button1 btn-shadow"  onclick="AddDValue1(document.getElementById('AllDArea').value, document.getElementById('AllDArea').text);">add</button>
                            </div>
                            <span class="error" id="LDArea" style="margin-left: 5px" ></span>
                        </div>
                    </div>

                </div>

            </div>
            <!-- image upload and publish button section -->
        </div>



        <div class="right">
            <div class="live-card-container" >
                <p> Live Announcement  Preview  </p>
                <div class="announcement" id="announcement">

                </div>


            <div style="display:flex;justify-content: center;width: 100%">
                <div class="img-publish-button" style="margin-top: 10px;">
                    <div class="image-upload-card">
                        <img id="proof1" width="100%" />
                        <input type="file" accept="image/*" name="file" id="proof1input"
                               onchange="loadFile(event , 'proof1')" style="display: none;">

                        <label for="proof1input" class="upload btn-shadow" style="cursor: pointer;">Upload Image</label>
                    </div>

                    <button class="publish-button btn-shadow" onclick="return imageUpload()">Publish</button>
                </div>
            </div>
            </div>
        </div>

    </div>

    <div class="make-announcement-container">

        <div style="width: 100%;min-height: 300px;">
            <textarea id="my-text-area" ></textarea>
        </div>


    </div>


    <script>
        var easymde = new EasyMDE({
            autoDownloadFontAwesome: true,
            showIcons: ['strikethrough', 'code', 'table', 'redo', 'heading', 'undo', 'heading-bigger', 'heading-smaller', 'heading-1', 'heading-2', 'heading-3', 'clean-block', 'horizontal-rule'],
            element: document.getElementById('my-text-area'),
            initialValue: '## Toolbar \nHere you can see all the buttons available for the toolbar.'
        });

        easymde.codemirror.on("change", () => {
            console.log(easymde.value());
        });
    </script>
</div>
<script defer>
    let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");
    var loadFile = function(event) {
        var image = document.getElementById('images');
        image.src = URL.createObjectURL(event.target.files[0]);
    };

    function imageUpload() {
        console.log("image upload")
        var fd = new FormData();
        let imageNames = [];

        if ($('#proof1input')[0].files[0]) {
            fd.append('file', $('#proof1input')[0].files[0]);
            let name = new Date().toString().split(" ");
            let url1 = (name[2] + name[3] + name[4] + name[5]).replaceAll(":", "").replaceAll("+", "") +
                Math.floor(10000 + Math.random() * 10000) + "." +
                $('#proof1input')[0].files[0].name.split(".")[$('#proof1input')[0].files[0].name.split(".").length - 1];
            imageNames.push(url1);
        }
        imageNames.map((item, index) => {
            fd.append('ImageName' + (index + 1), item);
        })
        console.log("image neames array "+imageNames);
        if(imageNames.length!=0){
            $.ajax({
                url: myUrl+'/fileuploadservlet1',
                type: 'post',
                data: fd,
                contentType: false,
                processData: false,
                success: function (response) {
                    if (response != 0) {
                        console.log("successfully image uploadedss ---- " +imageNames )
                        PublicAnnouncement(imageNames)
                    } else {
                        console.log('file not uploaded');
                    }
                },
            });
        }
        else {
            console.log("no image selected")
            // registerwithoutimage();
        }

        return false;
    }

    function change() {
        var decider = document.getElementById('switch');
        var q= document.getElementById("search-section");
        let i;
        console.log("change")
        if(!decider.checked){
            document.getElementById('district_selected').style.display = "block";
            document.getElementById('province_selected').style.display = "block";
        } else {
            // alert('unchecked');
            // q.innerHTML=""

            selectedOptionList.push("all")
            selectedOptionList1.push("all")
            document.getElementById('district_selected').style.display = "none";
            document.getElementById('province_selected').style.display = "none";
        }
    }

    function PublicAnnouncement(imagearray){
            let reqData={
                title:document.getElementById("title").value,
                description:document.getElementById("description").value,
                image:imagearray[0],
                expire_date:document.getElementById("expire_date").value
            };
        console.log("reqData");
        console.log(reqData);
        console.log("reqData");
            $.post(myUrl + "/admin-controller/PublicAnnouncement",

                reqData,
                function (data, status) {
                // alert(data)
                    if(data){
                        popup.showCreateAnnouncementSuccessMessage({
                            status: 'success',
                            message: 'Successfully Created!'
                        })
                        AddProvince(data)
                        AddDistricts(data)
                    } else{
                        popup.showCreateAnnouncementSuccessMessage({
                            status: 'fail',
                            message: 'Failed to create !',
                            data: data
                        });
                    }
            }
            );
            return false
    }
</script>

<script defer>

    function AddDistricts(data){
        selectedOptionList1.map(i=>{
            if(i=="all"){
                console.log("all")
                takeallDID(data)

            }
            if(i=="All"){
                selectedOptionList.map(j=>{
                    // takeDID(i,data)
                    takeRelevantPID(j,data)
                    // console.log("a")
                })
            }
            else {
                takeDID(i,data)
            }
        })
    }

    function AddProvince(data){
        selectedOptionList.map(i=>{
            if (i=="all"){
                console.log("all")
                takeallPID(data)
            }
            if(i=="All"){
                takeallPID(data)
            }
            else {
                takePID(i,data)
            }
        })
    }

    function addAllDistrictList(){
        $.post(myUrl+"/admin-controller/districtsAll",
            function (data, status) {
                let PDetails=[];
                // console.log(data);
                let rs= JSON.parse(data);
                this.PDetails=rs;
                // console.log(data);
                let DNames=document.getElementById("AllDArea");
                // DNames.innerHTML="";

                rs.map((element,index) => {
                    DNames.innerHTML+= '<option  id="'+element.province_id+'"  name="'+element.name+'" value="' + element.name +  '" option="' + element.name +  '" ></option>'
                })
                document.querySelector('#PArea').value ="";
            }
        );
    }

    function SelectDistricts(){
        selectedOptionList.map(item=> {
            if (item == "All") {
                addAllDistrictList()
            }
        });
                let reqData={
                    province_id:checkid(),
                };
                console.log("a")
                console.log(reqData)
                $.post(myUrl+"/admin-controller/districtsSelect",
                    reqData,
                    function (data, status) {
                        let PDetails=[];
                        // console.log(data);
                        let rs= JSON.parse(data);
                        this.PDetails=rs;
                        // console.log(data);
                        let DNames=document.getElementById("AllDArea");
                        // DNames.innerHTML="";

                        rs.map((element,index) => {
                            DNames.innerHTML+= '<option  id="'+element.province_id+'"  name="'+element.name+'" value="' + element.name +  '" option="' + element.name +  '" ></option>'
                        })
                        document.querySelector('#PArea').value ="";
                    }
                );

                return false


    }

    function takeRelevantDID(id,Pid){
        let id1=id;
        let Pid1=Pid;
        let reqData={
            province_id:Pid1
        };
        console.log("d")
        console.log(reqData)
        $.post(myUrl+"/admin-controller/districtsSelect",
            reqData,
            function (data, status) {
                let PDetails=[];
                console.log(data);
                let rs= JSON.parse(data);
                this.PDetails=rs;
                rs.map(item=>{
                    let Did=item.district_id;
                    addTargetD(id1,Did)
                });
            }
        );
        return false
    }

    function takeRelevantPID(j,data){
        console.log("b")
        let id=data;
        let Pname =j;
        let reqData={
            PName:Pname
        };
        // console.log(reqData)
        $.post(myUrl+"/admin-controller/provinceIdSelect",
            reqData,
            function (data, status) {
                let PDetails=[];
                // console.log(data);
                // console.log(data)
                // console.log("aaaaaaa")
                let rs= JSON.parse(data);
                this.PDetails=rs;
                rs.map(item=>{
                    let Pid=item.province_id
                    takeRelevantDID(id,Pid)
                });
            }
        );

        return false
    }

    let validation = new FormInputValidation();
    function checkP(){
        let PDetails=[];
            $.post(myUrl+"/admin-controller/provinceAll",
            function (data, status) {
                console.log(data);
                let rs= JSON.parse(data);
                this.PDetails=rs;
                // console.log(data);
                let PNames=document.getElementById("AllPArea");
                // PNames.innerHTML="";
                // PNames.innerHTML+= '<option  id="'+"777" +'"  name="'+"777"+'" value="' + "All" +  '" option="' + "777"+  '" ></option>'

                rs.map((element,index) => {
                    PNames.innerHTML+= '<option  id="'+element.province_id+'"  name="'+element.name+'" value="' + element.name +  '" option="' + element.name +  '" ></option>'
                })
            }
        );
    }

    function checkid(){
        // alert("check")
        var MTypeObj = document.getElementById('PArea');
        var datalist = document.getElementById(MTypeObj.getAttribute("list"));
        if(datalist.options.namedItem(MTypeObj.value)){
                // console.log("ooption"+ datalist.options.namedItem(MTypeObj.value).id)
                return (datalist.options.namedItem(MTypeObj.value).id);
        }
        else {
            return  0;
        }

    }

    function addTargetP(id,provinceId){
        let id1 =id;
        let provinceID=provinceId;
        let reqData={
            id:id1,
            province_id:provinceID
        }
        console.log(reqData)
        $.post(myUrl+"/admin-controller/AddProvince",
        reqData,
            function (data,status){
               console.log(data)
            });
    }

    function addTargetD(id,districtId){
        let id2=id;
        let district_id=districtId;
        let reqData={
            id:id2,
            district_id:district_id
        }
        console.log(reqData)
        $.post(myUrl+"/admin-controller/AddDistrict",
        reqData,
            function (data){
                console.log(data)
            });
    }

    function takePID(province,data){
        let id=data;
        let reqData={
            PName:province,
        }
        $.post(myUrl+"/admin-controller/provinceIdSelect",
            reqData,
            function (data){
                let name=JSON.parse(data)
                name.map(item=>{
                    let provinceId=item.province_id
                    addTargetP(id,provinceId)
                })
            });
    }

    function takeallPID(data){
        let id=data;
        let PDetails=[];
        $.post(myUrl+"/admin-controller/provinceAll",
            function (data, status) {
                console.log(data);
                let rs= JSON.parse(data);
                this.PDetails=rs;

                rs.map((element,index) => {
                    let province_id=element.province_id;
                    addTargetP(id,province_id)
                })
            }
        );
    }

    function takeDID(district,data){
        let id=data
        let reqData={
            DName:district,
        }
        $.post(myUrl+"/admin-controller/districtsIdSelect",
            reqData,
            function (data){
             let name=JSON.parse(data)
                name.map(item=>{
                    let districtId=item.district_id
                    addTargetD(id,districtId)
                })
            });
    }

    function takeallDID(data){
        let id=data
        let DDetails=[];
        $.post(myUrl+"/admin-controller/districtsAll",
            function (data, status) {
                console.log(data);
                let rs= JSON.parse(data);
                this.DDetails=rs;

                rs.map((element,index) => {
                    let district_id =element.district_id ;
                    // addTargetP(id,province_id)
                    // alert("h")

                    addTargetD(id,district_id)
                })
            }
        );
        return false
    }

</script>
<script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>
</body>
</html>
