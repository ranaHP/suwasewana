
class view_home_disease_details{
    diseasearrayy=[
        {
            d_id:"",
            name:"",
            description:""
            // EmergencyContact

        }
    ];


    container;

    constructor(container) {
        this.container = document.getElementById(container);

    }

        setData(data){

            if(!data) return;
            this. diseasearrayy = data;
            console.log("kkkkkkkkkkkkkkkkkkk")
            console.log(data);
            this. diseasearrayy.map((item) => {

                    this.container.innerHTML += `

                    <div class="diseases-card-container">
                    <div class="diseases-card">
                        <div class="left-container">
                            <img src="${myUrl}/public/images/uploadimage/diseases1.png" width="80px" height="80px" />
                        </div>
                        <div class="right-container">
                           
                            <div class="main-title">
                                ${item.name}
                            </div>
                            <div class="desc">
                                ${JSON.parse(item.description).Symptoms.desc}

                            </div>
                            <div class="syntoms">
                                <ul>
                                    <li>${JSON.parse(item.description).Symptoms.Most[0]}</li>
                                    <li>${JSON.parse(item.description).Symptoms.Most[1]}</li>
                                    <li>${JSON.parse(item.description).Symptoms.Most[2]}</li>
                                    <br>
                                    <li>${JSON.parse(item.description).Symptoms.Serious[0]}</li>
                                    <li>${JSON.parse(item.description).Symptoms.Serious[1]}</li>
                                    <li>S${JSON.parse(item.description).Symptoms.Serious[2]}</li>
                                    <li>${JSON.parse(item.description).Symptoms.Less[0]}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            `

                    ;
                console.log("map")
            })
    }




    }

