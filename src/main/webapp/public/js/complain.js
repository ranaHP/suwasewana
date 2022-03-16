class Complain {

    ComplainArray={};


    container;



    constructor(container) {
        console.log("container id="+container)
        this.container = document.getElementById(container);
    }


    // For user  ######################################################################################################
    setData(data){
        if (!data) {
            return;
        }

        this.container.innerHTML = " ";
        this.ComplainArray = data;
        this.showCardData(this.ComplainArray);
    }
    showCardData(data) {
        let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
        let url = myUrl+"/public/";
        console.log("complain constructor call myurl "+myUrl);
        console.log("complain constructor call url "+url);
        // console.log("data      "+data);

        if(data.length ==0){
            this.container.innerHTML += `No data found`
            this.container.style.fontFamily = "'Nunito', sans-serif";
            this.container.style.fontWeight = "300";
            this.container.style.fontsize = "4vw";
            this.container.style.letterSpacing = "0.2vw";
            this.container.style.color = "#000000ba";
            return;
        }

        this.container.innerHTML = " ";
       data.map((item) => {
           let img1=item.img1!=" "? url+"/images/uploadimage/"+item.img1 : " "
           let img2=item.img2!=" "? url+"/images/uploadimage/"+item.img2 : " "
           let img3=item.img3!=" "? url+"/images/uploadimage/"+item.img3 : " "
           console.log("img1 "+img1)
           console.log("img2 "+img2)
           console.log("img3 "+img3)

            this.container.innerHTML += `
            <div class="complaint-card-container" style="margin-top: 5px; margin-right: 4px">
                            <div class="complaint-card">
                                <div class="header">
                                    ${item.CTitle}
                                    <p> ${(item.Posted_Date).split(" ")[0]}</p>
                                </div>

                                <div class="properties">
                                    <ul>
                                        <li>
                                            <img src="${url}images/icons/usertype.svg" width="22px" />
                                            PHI Response : ${item.PHIResponse==""? "No action":item.PHIResponse }
                                        </li>
                                    </ul>
                                </div>
                                <div class="desc" style="padding:3px 20px; ">
                                    ${item.CMessage}
                                </div>
                                <div class="properties">
                                    <ul>
                                        <li>
                                            <img src="${url}images/icons/status.svg" width="22px" />
                                            Status : ${item.Status}
                                        </li>
                                        <li>
                                            <img src="${url}images/icons/proof.svg" width="22px" />
                                            proofs :
                                        </li>
                                    </ul>
                                </div>
                                <div class="row" >
                                    <div class="proofs-images " style="justify-content: unset; margin-left: 3px">
                                    ${item.img1!=" "?
                                        `<img  onclick="viewImg('`+img1+`')" src=\"${url}images/uploadimage/${item.img1}\" width=\"80px\" height=\"80px\" />`:""
                                        }
                                    ${item.img2!=" "?
                                        `<img onclick="viewImg('`+img2+`')" src=\"${url}images/uploadimage/${item.img2}\" width=\"80px\" height=\"80px\"/>`:""
                                        }
                                    ${item.img3!=" "?
                                        `<img onclick="viewImg('`+img3+`')" src=\"${url}images/uploadimage/${item.img3}\" width=\"80px\" height=\"80px\"/>`:""
                                    }
                                    
                                
                                    </div>
                                </div>
                                <div class="footer">
                                    <div class="current-registered-count">
                                        <img src="${url}images/icons/user.svg" width="25px"  />
                                        ${item.PHIName}
                                    </div>
                                </div>
                                
                            </div>
                        </div>
            `;
        })
    }

// <div className="footer d-flex-j-c-flex-end">
//
// <div className="accept-btn bg-danger">
// Cancel
// </div>
// </div>




    // set data for PHI #######################################################################################3
    setDataForPHI(data){
        if (!data) {
            // console.log("set data walinma empty")
            return;
        }
        // console.log("data come to js to set complain for phi")
        this.container.innerHTML = " ";
        this.ComplainArray = data;
        this.showCardDataForPHI(this.ComplainArray);
    }

    searchComplain(){
        let title = document.getElementById('Complain_title').value;
        let type = document.getElementById('ComplainType').value;
        let date1 =document.getElementById('date1').value;
        let date2 =document.getElementById('date2').value;


        let  day1,day2;
        if(date1==""){
            day1="";
        }
        else{
            day1 = new Date(date1)
        }

        if(date2==""){
            let today = new Date();
            day2=today;
        }
        else {
            day2 = new Date(date2);
        }


        if(type === "All"){
            type = ""
        }
        // console.log("data "+title)
        // console.log("data1 "+day1)
        // console.log("data2 "+day2)
        // console.log("cdata "+day2)
        // console.log("data "+((day1<=cday)&&(day2>=cday))|| day1==cday)

        console.log("###############################################")
        let filterdData = this.ComplainArray.filter( (app) => {
            let cday = new Date(app.complainModel.Posted_Date)



            /*if(((day1<=cday)&&(day2>=cday))||
                (day1.getDay()==cday.getDay()&&
                    day1.getMonth()==cday.getMonth()&&
                    day1.getFullYear()==cday.getFullYear())||
                (day2.getDay()==cday.getDay()&&
                    day2.getMonth()==cday.getMonth()&&
                    day2.getFullYear()==cday.getFullYear())){
                console.log("equal year")
            }
            else{
                console.log("not equal")
                }*/

            console.log("###############################################")
            if(day1!=""){
                if(
                    app.complainModel.CTitle.toLowerCase().includes(title.toLowerCase()) &&
                    app.ComplainType.toLowerCase().includes(type.toLowerCase())&&

                    ( ((day1<=cday)&&(day2>=cday))|| (day1.getDay()==cday.getDay()&&
                        day1.getMonth()==cday.getMonth()&&
                        day1.getFullYear()==cday.getFullYear()) ||(day2.getDay()==cday.getDay()&&
                        day2.getMonth()==cday.getMonth()&&
                        day2.getFullYear()==cday.getFullYear()))
                ){
                    return app;
                }
            }
            else{
                if(
                    app.complainModel.CTitle.toLowerCase().includes(title.toLowerCase()) &&
                    app.ComplainType.toLowerCase().includes(type.toLowerCase())
                ){
                    return app;
                }
            }

        });
        this.container.innerHTML = "";
        this.showCardDataForPHI(filterdData);

    }

    showCardDataForPHI(data) {
        let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
        let url = myUrl+"/public/";
        // console.log("constructor call url "+url);
         console.log("data      "+data);
        if(data.length ==0 || !data){
            this.container.innerHTML = `No data found`
            return;
        }
        this.container.innerHTML = " ";
        data.map((item) => {
            // console.log("img 1 "+item.complainModel.img1)
            // console.log("img 2 "+item.complainModel.img2)
            // console.log("img 3 "+item.complainModel.img3)
            this.container.innerHTML += `
            <div class="complain_card">
                     <div class="complain_card_left">
                          <p class="card_title">${item.complainModel.CTitle}</p>
                          <p class="date">${(item.complainModel.Posted_Date).split(" ")[0]}</p><br>
                          <span class="complain_text">${item.complainModel.CMessage}</span>
                          <div class="card_bottom_row">
                              <div class="card_bottom_row_col">
                                  Action : ${item.complainModel.Status}
                              </div>
                              <div class="card_bottom_row_col">
                                  Type : ${item.ComplainType}
                              </div>
                              <div class="card_bottom_row_col">
                                    ${item.user.uNic? `<button onclick="ViewPAtientDetails(`+item.user.uNic+`)" >View complainer</button>`:""}
                              </div>

                          </div>
                      </div>
                      <div class="complain_card_right">

                          <div class="complain_card_right_content">
                              <div class="complain_card_right_full_img">
                                  ${item.complainModel.img1!=" "?
                                        `<img id="${item.complainModel.UType}`+ "fullpic" +`"   src="${url}images/uploadimage/${item.complainModel.img1}" width=\"80px\" height=\"80px\" />`:""
                                    }
                              </div>
                              <div class="complain_card_right_all_img">
                             
                                
                                ${item.complainModel.img1!=" "?
                                    `<img id="${item.complainModel.UType}`+ "pic1" +`"   src="${url}images/uploadimage/${item.complainModel.img1}" width=\"80px\" height=\"80px\"  onclick="document.getElementById('`+item.complainModel.UType+ "fullpic" +`').src=document.getElementById('`+item.complainModel.UType+ "pic1" +`').src;"  >`:""
                                }
                                ${item.complainModel.img2!=" "?
                                    `<img id="${item.complainModel.UType}`+ "pic2" +`"   src="${url}images/uploadimage/${item.complainModel.img2}" width=\"80px\" height=\"80px\"  onclick="document.getElementById('`+item.complainModel.UType+ "fullpic" +`').src=document.getElementById('`+item.complainModel.UType+ "pic2" +`').src;"  >`:""
                                }
                                ${item.complainModel.img3!=" "?
                                    `<img id="${item.complainModel.UType}`+ "pic3" +`"   src="${url}images/uploadimage/${item.complainModel.img3}" width=\"80px\" height=\"80px\"  onclick="document.getElementById('`+item.complainModel.UType+ "fullpic" +`').src=document.getElementById('`+item.complainModel.UType+ "pic3" +`').src;"  >`:""
                                }
                                
                              </div>
                              <div class="complain_card_right_button_row">
<!--                                  <button class="in_progree_btn">In Progress</button>-->
                                  ${item.complainModel.Status=="In Progress" ? `<button class="in_progree_btn"  onclick="SetAsProgress(`+item.complainModel.UType+`)" disabled style="background: `+"#b2bec3"+`" >In Progress</button>`:`<button class="in_progree_btn"  onclick="SetAsProgress(`+item.complainModel.UType+`)" >In Progress</button>`}
                                  ${item.complainModel.Status=="Done" ? `<button class="Done"  onclick="SetAsDone(`+item.complainModel.UType+`)" disabled style="background: `+"#b2bec3"+`" >Done</button>`:`<button class="Done"  onclick="SetAsDone(`+item.complainModel.UType+`)" >Done</button>`}
                              </div>
                          </div>

                      </div>
                  </div>
            `;
        })
    }


    setAllData(){
        this.setData(this.AppointmentArray);
    }
}