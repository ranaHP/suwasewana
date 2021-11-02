<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/public/css/partials/phiOfficer/dashBoard/_phi-dashboard-viewComplaints.css"/> "/>
<%--    <link rel="stylesheet" href="<c:url value="/public/css/commenStyles.css"/> "/>--%>
    <script src="https://unpkg.com/feather-icons"></script>
<%--    <script  src="<c:url value="/public/js/PHIOfficer/viewComplaints.js"/> "></script>--%>
    <title>Suwasewana</title>
    <%--    side nav bar styles--%>
<%--    <link rel="stylesheet" href="<c:url value="/public/css/partials/commen/side-navbar.css"/> "/>--%>
<%--    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>--%>


</head>
<body id="mainContent">
<%--  <c:import url="/view/admin/partials/PHIOfficerSideNavbar.jsp" />--%>
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
                          <input type="text" placeholder="Search By Title">
                      </div>
                      <div class="row1_col2">
                          <input class="SelectCType" id="ComplainType" type="text" style="outline: none;" list="AllComplainType" name="AllMArea" placeholder="Search by Tytle">
                          <datalist id="AllComplainType">
                              <option   value="' + element.MName +  '" option="' + element.MName +  '" ></option>
                              <option   value="' + element.MName +  '" option="' + element.MName +  '" ></option>
                              <option   value="' + element.MName +  '" option="' + element.MName +  '" ></option>
                              <option   value="' + element.MName +  '" option="' + element.MName +  '" ></option>
                              <option   value="' + element.MName +  '" option="' + element.MName +  '" ></option>
                              <option   value="' + element.MName +  '" option="' + element.MName +  '" ></option>
                          </datalist>
                      </div>
                      <div class="row1_col3">
                          <button>search</button>
                      </div>
                  </div>
                  <div class="search_row_row2">
                      <div class="row2_col1">
                          <span>From</span>
                          <input type="date">
                      </div>
                      <div class="row2_col2">
                          <span>To</span>
                          <input type="date">
                      </div>
                  </div>
              </div>

              <div class="complain_container">


                  <div class="complain_card">
                      <div class="complain_card_left">
                          <p class="card_title">Unbearable stench from Heaven fame</p>
                          <p class="date">2021/02/02</p><br>
                          <span class="complain_text">The Roman withdrawal f by the Roman Republic
                                to the survivors of their expeditionary force to Carthaginia Africa f by the Roman Republic
                                to the survivors of their expeditionary force to Carthaginia Africa (in what is nowrom Africa in 255 BC was the attempt eastern
                                Tunisia) during the First Punic War force to Africa (what is now eastern Tunisia) during
                                the session. The Roman withdrawal from Africa in 255 BC was the attempt by the Roman
                                to the survivors of their expeditionary force to Carthaginia Africa (in what is now eastern
                                Tunisia) during the First Punic War force to Africa (what is now eastern Tunisia) during
                                The Roman withdrawal from Africa in 255 BC was the attempt by the Roman Republic during
                                </span>
                          <div class="card_bottom_row">
                              <div class="card_bottom_row_col">
                                  Action : Pending
                              </div>
                              <div class="card_bottom_row_col">
                                  Type : Animal issue
                              </div>
                              <div class="card_bottom_row_col">
                                  <button>View complainer</button>
                              </div>

                          </div>
                      </div>
                      <div class="complain_card_right">

                          <div class="complain_card_right_content">
                              <div class="complain_card_right_full_img">
                                  <img id="fullpic" src="<c:url value="/public/images/animal-complaint.jpg "/>" alt="" srcset="">
                              </div>
                              <div class="complain_card_right_all_img">
                                  <img id="pic1" src="<c:url value="/public/images/animal-complaint.jpg "/>" alt="" srcset=""
                                       onclick="document.getElementById('fullpic').src=document.getElementById('pic1').src;"
                                  >
                                  <img id="pic2" src="<c:url value="/public/images/animal-complaint.jpg "/>" alt="" srcset=""
                                       onclick="document.getElementById('fullpic').src=document.getElementById('pic2').src;"
                                  >
                                  <img id="pic3" src="<c:url value="/public/images/animal-complaint.jpg "/>" alt="" srcset=""
                                       onclick="document.getElementById('fullpic').src=document.getElementById('pic3').src;"
                                  >
                              </div>
                              <div class="complain_card_right_button_row">
                                  <button class="in_progree_btn">In Progress</button>
                                  <button class="Done">Done</button>
                              </div>
                          </div>

                      </div>
                  </div>
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
                                  <span>21</span>
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
                                  <span>21</span>
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
                                  <span>21</span>
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
    let popup= new require_message_popup('PopupContainer', "Do you need to send a massage <br>to complainer ?")

</script>

</body>
</body>
</html>
