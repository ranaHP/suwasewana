class Complain {
   // ComplainArray = [
   //      {
   //          CType: " ",
   //          UType: " ",
   //          User:" ",
   //          Posted_Date: " ",
   //          CTitle: " ",
   //          CMessage: " ",
   //          posted_data: " ",
   //          PHIId:"",
   //          PHIName
   //          Status: " ",
   //          img1: " ",
   //          img2: " ",
   //          img3: " "
   //      }
   //  ];
    ComplainArray={};


    container;
    url = "http://localhost:8080/suwasewana_war/public/";

    constructor(container) {
        console.log("constructor call")
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
        console.log("data      "+data);
        if (!data) return;
        this.container.innerHTML = " ";
       data.map((item) => {
            this.container.innerHTML += `
            <div class="complaint-card-container" style="margin: 2px">
                            <div class="complaint-card">
                                <div class="header">
                                    ${item.CTitle}
                                    <p> ${item.Posted_Date}</p>
                                </div>

                                <div class="properties">
                                    <ul>
                                        <li>
                                            <img src="${this.url}images/icons/usertype.svg" width="22px" />
                                            UserType : ${item.UType==1? "anonymous":"non-anonymous" }
                                        </li>
                                    </ul>
                                </div>
                                <div class="desc">
                                    ${item.CMessage}
                                </div>
                                <div class="properties">
                                    <ul>
                                        <li>
                                            <img src="${this.url}images/icons/status.svg" width="22px" />
                                            Status : ${item.Status}
                                        </li>
                                        <li>
                                            <img src="${this.url}/public/images/icons/proof.svg" width="22px" />
                                            proofs :
                                        </li>
                                    </ul>
                                </div>
                                <div class="row">
                                    <div class="proofs-images d-flex-j-c-space-b">
                                        <img src="${this.url}/public/images/animal-complaint.jpg" alt="" srcset="" width="30%">
                                        <img src="${this.url}/public/images/animal-complaint.jpg" alt="" srcset="" width="30%">
                                        <img src="${this.url}/public/images/animal-complaint.jpg" alt="" srcset="" width="30%">
                                    </div>
                                </div>
                                <div class="footer">
                                    <div class="current-registered-count">
                                        <img src="${this.url}/public/images/icons/user.svg" width="25px" />z
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



    setAllData(){
        this.setData(this.AppointmentArray);
    }
}