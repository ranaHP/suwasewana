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
<%--    <script  src="<c:url value="/public/js/PHIOfficer/viewComplaints.js"/> "></script>--%>
    <title>Suwasewana</title>
    <%--    side nav bar styles--%>
    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <script src="<c:url value="/public/js/complain.js"/>"></script>

</head>
<body id="mainContent">
  <c:import url="/view/admin/partials/PHIOfficerSideNavbar.jsp" />
<%--  <div class="popup-container" id="PopupContainer"></div>--%>
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
                          <input class="SelectCType" id="ComplainType" type="text" style="outline: none;" list="AllComplainType" name="AllMArea" placeholder="Search by Tytle"
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
                  <div class="C_container_right_title"><p>Weekly Progress</p> </div>
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
    // let popup= new require_message_popup('PopupContainer', "Do you need to send a massage <br>to complainer ?")
    let complain= new Complain('previous_complain_list');

    myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
    getAllComplain();
    console.log("url "+myUrl+"/phi-complain-controller1/ViewComplainForPHI")
    function getAllComplain() {
        let complainCardList = [];
        let typedatalist=[]
        $.post(myUrl+"/phi-complain-controller1/ViewComplainForPHI",
            {},
            function (data, status) {
                let complainList = JSON.parse(data);



                // fill pending done in progress count
                let pendin=0;
                let done=0;
                let progress=0;
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
                document.getElementById("Pending").innerText=pendin;
                document.getElementById("done").innerText=done;
                document.getElementById("Progress").innerText=progress;


                complain.setDataForPHI(complainList);

                // fill compalain details


            }
        );

    }
    function search_By_Date(){
        let date1=document.getElementById("date1").value;
        let date2=document.getElementById("date2").value;
        console.log("date1 "+ date1)
        console.log("date2 "+ date2)
        let phiNic='199910910062';
        let searchItem={
            date1:date1,
            date2:date2,
            PHINic:phiNic
        }
        $.post(myUrl+"/phi-complain-controller1/searchbydate",
            searchItem,
            function (data, status) {

                let complainList = JSON.parse(data);



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


                complain.setDataForPHI(complainList);
            }
        );

    }


    // take complaintype

    function search_By_title_And_Type(){

        var CTypeObj = document.getElementById("ComplainType");
        var datalist = document.getElementById(CTypeObj.getAttribute("list"));
        let ComplainType;
        let UserType;
        let PId;
        let MOHId;
        if(datalist.options.namedItem(CTypeObj.value)){
            ComplainType=(datalist.options.namedItem(CTypeObj.value).id);
        }
        let title=document.getElementById("Complain_title").value;
        // console.log("type "+ComplainType);
        // console.log("title"+title)
        let phiNic='199910910062';
        let searchItem={
            PHINic:phiNic,
            title:title,
            Type:ComplainType
        }
        $.post(myUrl+"/phi-complain-controller1/search",
            searchItem,
            function (data, status) {

                let complainList = JSON.parse(data);



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


                complain.setDataForPHI(complainList);
            }
        );



    }

</script>
  <%--script for take complain types--%>
  <script defer>
      let complain_type=[];
      $.post(myUrl+"/user-complain-controller/",
          function (data, status) {
              let rs= JSON.parse(data);
              rs.map((element) => {

              })
          }
      );
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
