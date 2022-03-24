<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/public/css/partials/phiOfficer/dashBoard/_phi-dashboard-viewComplaints.css"/> "/>
<%--    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/> "/>--%>
    <script src="https://unpkg.com/feather-icons"></script>
    <title>Suwasewana</title>
    <%--    side nav bar styles--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <script src="<c:url value="/public/js/complain.js"/>"></script>
    <%--    for popup style--%>
    <link href="<c:url value="/public/css/popup/popup.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/public/css/popup/Appintmentpopup.css"/>" rel="stylesheet"/>
    <%--    for popup script--%>
    <script src="<c:url value="/public/js/popup.js"/>"></script>

</head>
<body id="mainContent">
  <c:import url="/view/admin/partials/PHIOfficerSideNavbar.jsp" />

  <div class="mypopup" id="popup" style="display: none;"></div>
  <div class="main-container">
      <div class="header">
          <div class="upper-title">SUWASEWANA</div>
          <div class="dashboard-name">PHI/Dashboard/Verify patient</div>
      </div>
      <div class="complain_view_container">
          <div class="C_container_left">

              <div class="search_row">
                  <div class="search_row_row1">
                      <div class="row1_col1">
                          <input type="text" id="Complain_title" placeholder="Search By Title"
                                 onclick="document.getElementById('Complain_title').value='';"
                          />

                      </div>
                      <div class="row1_col2">
                          <input class="SelectCType" id="ComplainType" type="text" style="outline: none;" list="AllComplainType" name="AllMArea" placeholder="Search by Type"
                                 onclick="document.getElementById('ComplainType').value=''"
                          />
                          <datalist id="AllComplainType">

                          </datalist>
                      </div>

                  </div>
                  <div class="search_row_row2">
                      <div class="row2_col1">
                          <span>From</span>
                          <input type="date" id="date1"/>
                      </div>
                      <div class="row2_col2">
                          <span>To</span>
                          <input type="date" id="date2" />
                      </div>
                      <div class="row1_col3" id="searchByDate" style="margin-top: 5px;">
                          <button onclick="complain.searchComplain();">search</button>
                      </div>
                  </div>
              </div>

              <div class="complain_container" id="previous_complain_list">


<%--                  <div class="complain_card">--%>
<%--                      <div class="complain_card_left">--%>
<%--                          <p class="card_title">Unbearable stench from Heaven fame</p>--%>
<%--                          <p class="date">2021/02/02</p><br>--%>
<%--                          <span class="complain_text">The Roman withdrawal f by the Roman Republic--%>
<%--                                to the survivors of their expeditionary force to Carthaginia Africa f by the Roman Republic--%>
<%--                                to the survivors of their expeditionary force to Carthaginia Africa (in what is nowrom Africa in 255 BC was the attempt eastern--%>
<%--                                Tunisia) during the First Punic War force to Africa (what is now eastern Tunisia) during--%>
<%--                                the session. The Roman withdrawal from Africa in 255 BC was the attempt by the Roman--%>
<%--                                to the survivors of their expeditionary force to Carthaginia Africa (in what is now eastern--%>
<%--                                Tunisia) during the First Punic War force to Africa (what is now eastern Tunisia) during--%>
<%--                                The Roman withdrawal from Africa in 255 BC was the attempt by the Roman Republic during--%>
<%--                                </span>--%>
<%--                          <div class="card_bottom_row">--%>
<%--                              <div class="card_bottom_row_col">--%>
<%--                                  Action : Pending--%>
<%--                              </div>--%>
<%--                              <div class="card_bottom_row_col">--%>
<%--                                  Type : Animal issue--%>
<%--                              </div>--%>
<%--                              <div class="card_bottom_row_col">--%>
<%--                                  <button>View complainer</button>--%>
<%--                              </div>--%>

<%--                          </div>--%>
<%--                      </div>--%>
<%--                      <div class="complain_card_right">--%>

<%--                          <div class="complain_card_right_content">--%>
<%--                              <div class="complain_card_right_full_img">--%>
<%--                                  <img id="fullpic" src="<c:url value="/public/images/animal-complaint.jpg "/>" alt="" srcset="">--%>
<%--                              </div>--%>
<%--                              <div class="complain_card_right_all_img">--%>
<%--                                  <img id="pic1" src="<c:url value="/public/images/animal-complaint.jpg "/>" alt="" srcset=""--%>
<%--                                       onclick="document.getElementById('fullpic').src=document.getElementById('pic1').src;"--%>
<%--                                  >--%>
<%--                                  <img id="pic2" src="<c:url value="/public/images/animal-complaint.jpg "/>" alt="" srcset=""--%>
<%--                                       onclick="document.getElementById('fullpic').src=document.getElementById('pic2').src;"--%>
<%--                                  >--%>
<%--                                  <img id="pic3" src="<c:url value="/public/images/animal-complaint.jpg "/>" alt="" srcset=""--%>
<%--                                       onclick="document.getElementById('fullpic').src=document.getElementById('pic3').src;"--%>
<%--                                  >--%>
<%--                              </div>--%>
<%--                              <div class="complain_card_right_button_row">--%>
<%--                                  <button class="in_progree_btn">In Progress</button>--%>
<%--                                  <button class="Done">Done</button>--%>
<%--                              </div>--%>
<%--                          </div>--%>

<%--                      </div>--%>
<%--                  </div>--%>
              </div>
          </div>
          <div class="C_container_right">
              <div class="C_container_right_body">
                  <div class="C_container_right_title"><p>Monthly Progress</p> </div>
                  <div class="C_container_right_card_container">
                      <div class="C_container_right_card">
                          <div class="C_container_right_card_row1">
                              <p>New Complain</p>
                          </div>
                          <div class="C_container_right_card_row2">
                              <div class="C_container_right_card_row2_col1">
                                  <img src="<c:url value="/public/images/icons/View%20complain/mail.svg "/>" alt="" srcset="">
                              </div>
                              <div class="C_container_right_card_row2_col2">
                                  <span id="Pending">21</span>
                              </div>
                          </div>
                      </div>

                      <div class="C_container_right_card">
                          <div class="C_container_right_card_row1">
                              <p>In Progress</p>
                          </div>
                          <div class="C_container_right_card_row2">
                              <div class="C_container_right_card_row2_col1">
                                  <img src="<c:url value="/public/images/icons/View%20complain/loader.svg "/>" alt="" srcset="">
                              </div>
                              <div class="C_container_right_card_row2_col2">
                                  <span id="Progress">21</span>
                              </div>
                          </div>
                      </div>

                      <div class="C_container_right_card">
                          <div class="C_container_right_card_row1">
                              <p>Finish Complain</p>
                          </div>
                          <div class="C_container_right_card_row2">
                              <div class="C_container_right_card_row2_col1">
                                  <img src="<c:url value="/public/images/icons/View%20complain/check-circle.svg "/>" alt="" srcset="">
                              </div>
                              <div class="C_container_right_card_row2_col2">
                                  <span id="done">21</span>
                              </div>
                          </div>
                      </div>

                  </div>
              </div>

          </div>
      </div>
  </div>


  <script defer src="<c:url value="/public/js/common/side-navbar.js"/>" ></script>

<script defer>


    let popup = new SuwasewanaPopup("popup", "Calender Events", "suwasewana message", "", "calenderEvent");

    let complain= new Complain('previous_complain_list');

    let complainlist=[];
    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    getAllComplain();
    // console.log("url "+myUrl+"/phi-complain-controller1/ViewComplainForPHI")
    function getAllComplain() {
        let complainCardList = [];
        let typedatalist=[]
        var date = new Date(), y = date.getFullYear(), m = date.getMonth();
        var firstDay = (new Date(y, m, 1));
        var lastDay = (new Date(y, m + 1, 0));

        let date1=y+"-"+m+"-"+firstDay.getDate();
        let date2=y+"-"+m+"-"+lastDay.getDate();
        let reqData={
            date1:date1,
            date2:date2
        }
        $.post(myUrl+"/phi-complain-controller1/ViewComplainForPHI",
            reqData,
            function (data, status) {
                let complainList = JSON.parse(data);
                complainlist=complainList;
                console.log("comaplain data "+data)
                // fill pending done in progress count
                // let pendin=0;
                // let done=0;
                // let progress=0;
                // complainList.map((element) => {
                //     // console.log("status " +element.complainModel.Status);
                //
                //     if(element.complainModel.Status=="Pending"){
                //         pendin++;
                //     }
                //     else if(element.complainModel.Status=="Done"){
                //         done++;
                //     }
                //     else if(element.complainModel.Status=="In Progress"){
                //         progress++;
                //     }
                //     else {
                //         console.log("Incorrect complain model status check ur database")
                //     }
                //
                // })
                // document.getElementById("Pending").innerText=pendin;
                // document.getElementById("done").innerText=done;
                // document.getElementById("Progress").innerText=progress;


                complain.setDataForPHI(complainList);
                getAllComplainCountForSideBar();


            }
        );

    }
    getAllComplainCountForSideBar();
    function getAllComplainCountForSideBar() {
        console.log("getAllComplainCountForSideBar called")
        let complainCardList = [];
        let typedatalist=[]
        var date = new Date(), y = date.getFullYear(), m = date.getMonth();
        var firstDay = (new Date(y, m, 1));
        var lastDay = (new Date(y, m + 1, 0));

        let date1=y+"-"+(m+1)+"-"+firstDay.getDate();
        let date2=y+"-"+(m+1)+"-"+lastDay.getDate();
        let reqData={
            date1:date1,
            date2:date2
        }
        $.post(myUrl+"/phi-complain-controller1/ComplainForPHIForSideBar",
            reqData,
            function (data, status) {
                let complainList = JSON.parse(data);
                complainlist=complainList;
                // console.log("comming list"+ complainlist);
                // console.log("comming data"+ data);

                // fill pending done in progress count
                let pendin=0;
                let done=0;
                let progress=0;
                complainList.map((element) => {
                    console.log("status " +element.complainModel.Status);

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
                document.getElementById("Pending").innerText=pendin;
                document.getElementById("done").innerText=done;
                document.getElementById("Progress").innerText=progress;


                // complain.setDataForPHI(complainList);

                // fill compalain details


            }
        );

    }

    function ViewPAtientDetails( nic){
        console.log("user nic "+nic);
        complainlist.map((element) =>{
            if(element.user.uNic==nic){
                    let uMobile=element.user.uMobile;
                    let uname=element.user.uname;
                    let uNic=element.user.uNic;
                    let street_no=element.user.street_no;
                    let address_line1=element.user.address_line1;
                popup.viewComplainer({
                    uMobile:uMobile,
                        uname:uname,
                            uNic:uNic,
                                street_no:street_no,
                                    address_line1:address_line1
                });
                    // console.log("User details "+
                    //     uMobile+" "+
                    //     uname+" "+
                    //     uNic+" "+
                    //     street_no+" "+
                    //     address_line1
                    // )
            }
        });

    }

    function SetAsProgress(complainId){
        console.log("complain id "+complainId);
        let reqData={
            complainId:complainId
        }
        $.post(myUrl+"/phi-complain-controller1/SetAsProgress",
            reqData,
            function (data, status) {
                if (data.includes("success")) {
                    getAllComplain();
                    popup.SendResponsePHI({
                        complain_Id: reqData.complainId,
                        message: 'Status Change Failed!'
                    });
                } else {
                    popup.ChangeComplainStatusSuccessMessage({
                        status: 'fail',
                        message: 'Status Change Failed!',
                        data: data
                    });
                }
            }
        );
    }
    function UpdateResponse(cid,massage){
        let message=document.getElementById("myresponse").value;
            // console.log("complain id "+cid)
            // console.log("message "+message)
        let reqData={
                cid:cid,
            message:message
        }
        $.post(myUrl+"/phi-complain-controller1/setResponse",
            reqData,
            function (data, status) {
                if (data.includes("success")) {
                    console.log("Successsss brooo")
                    getAllComplain();
                } else {
                    console.log("unsuccesssss brooo")
                }
            }
        );
    }

    function SetAsDone(complainId){
        // console.log("complain id "+complainId);
        let reqData={
            complainId:complainId
        }
        $.post(myUrl+"/phi-complain-controller1/set_as_done",
            reqData,
            function (data, status) {
                if (data.includes("success")) {
                    getAllComplain();
                } else {
                    console.log("unsuccesssss brooo")
                    popup.ChangeComplainStatusSuccessMessage({
                        status: 'fail',
                        message: 'Status Change Failed!',
                        data: data
                    });
                }
            }
        );
    }










</script>


  <%--script for take complain types--%>
  <script defer>
      $.post(myUrl+"/user-complain-controller/",
          function (data, status) {
              let rs= JSON.parse(data);
              let searchcomplintype=document.getElementById("AllComplainType");
              searchcomplintype.innerHTML='<option   id="0" name="All" value="All" option="All" ></option>';
              rs.map((element) => {
                  searchcomplintype.innerHTML+='<option  id="'+element.CType+'" name="'+element.Type+'" value="' + element.Type +  '" option="' + element.Type +  '"></option>'
              })
          }
      );
  </script>


</body>
</body>
</html>
