class Complain {

    ComplainArray={};


    container;



    constructor(container) {
        this.container = document.getElementById(container);
    }
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
        console.log("constructor call url "+url);
        console.log("data      "+data);
        if (!data) return;
        this.container.innerHTML = " ";
       data.map((item) => {
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
                                            <img src="${this.url}images/icons/usertype.svg" width="22px" />
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
                                            <img src="${this.url}images/icons/status.svg" width="22px" />
                                            Status : ${item.Status}
                                        </li>
                                        <li>
                                            <img src="${this.url}images/icons/proof.svg" width="22px" />
                                            proofs :
                                        </li>
                                    </ul>
                                </div>
                                <div class="row">
                                    <div class="proofs-images " style="justify-content: unset; margin-left: 3px">
                                    ${item.img1!=" "?
                                        `<img src=\"${this.url}images/uploadimage/${item.img1}\" width=\"80px\" height=\"80px\" />`:""
                                        }
                                    ${item.img2!=" "?
                                        `<img src=\"${this.url}images/uploadimage/${item.img2}\" width=\"80px\" height=\"80px\"/>`:""
                                        }
                                    ${item.img3!=" "?
                                        `<img src=\"${this.url}images/uploadimage/${item.img3}\" width=\"80px\" height=\"80px\"/>`:""
                                    }
                                    
                                
                                    </div>
                                </div>
                                <div class="footer">
                                    <div class="current-registered-count">
                                        <img src="${this.url}images/icons/user.svg" width="25px"  />
                                        ${item.PHIName}
                                    </div>
                                </div>
                                <div class="footer d-flex-j-c-flex-end">

                                    <div class="accept-btn bg-danger">
                                        Cancel
                                    </div>
                                </div>
                            </div>
                        </div>
            `;
        })
    }

    setDataForPHI(data){
        if (!data) {
            return;
        }
        console.log("data come to js")
        this.container.innerHTML = " ";
        this.ComplainArray = data;
        this.showCardDataForPHI(this.ComplainArray);
    }
    showCardDataForPHI(data) {
        let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
        let url = myUrl+"/public/";
        console.log("constructor call url "+url);
        console.log("data      "+data);
        if (!data) return;
        this.container.innerHTML = " ";
        data.map((item) => {
            console.log("img 1 "+item.complainModel.img1)
            console.log("img 2 "+item.complainModel.img2)
            console.log("img 3 "+item.complainModel.img3)
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
                                    ${item.uNic? '<button>View complainer</button>':""}
                              </div>

                          </div>
                      </div>
                      <div class="complain_card_right">

                          <div class="complain_card_right_content">
                              <div class="complain_card_right_full_img">
                                  <img id=\"${item.complainModel.UType}\" src=\"${url}images/uploadimage/${item.complainModel.img1}\" alt="" srcset="">
                              </div>
                              <div class="complain_card_right_all_img">
                              ` + (item.complainModel.img2!=' ' ? 'asd' : 'aaaeee') + 333 + (item.complainModel.img1!=' ' ? 'asd' : 'aaaeee') + `
                         
                              </div>
                              <div class="complain_card_right_button_row">
                                  <button class="in_progree_btn">In Progress</button>
                                  <button class="Done">Done</button>
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