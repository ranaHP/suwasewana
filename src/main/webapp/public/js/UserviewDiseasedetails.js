
// let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
class diseasedetailsList {
    diseaseListArray = [
        {
            active_cases:" ",
            death_cases:" ",
            recovered_cases:" ",
            name:"",
            description:""

        }
    ];


    container;

    constructor(container) {
        this.container = document.getElementById(container);
    }
    setData(data) {
        if(!data) return;
        this.diseaseListArray = data;
        console.log(data);
        this.diseaseListArray.map((item) => {
            this.container.innerHTML += `

            <div class="diseases-card">
                <div class="left-container">
                    <img src="<c:url value="/public/images/disease-banner.png "/>" width="100%">
                </div>
                <div class="right-container">
                    <div class="count-container">
                        <div class="count-card">
                            <div class="header">
                                ${item.active_cases}
                            </div>
                            <div class="desc">
                                Active Cases
                            </div>
                        </div>
                        <div class="count-card">
                            <div class="header">
                                ${item.death_cases}
                            </div>
                            <div class="desc">
                                Death Cases
                            </div>
                        </div>
                        <div class="count-card">
                            <div class="header">
                                ${item.recovered_cases}
                            </div>
                            <div class="desc">
                                Recovered Cases
                            </div>
                        </div>
                    </div>
                    <div class="main-title">
                        ${item.name}
                    </div>
                    <div class="desc">
                    ${item.description}
        
                    </div>
                    <div class="syntoms">
                        <ul>
                            <li> Fever 99%</li>
                            <li>Fatigue 70%</li>
                            <li>Cough 59%</li>
                            <br>
                                <li>Lack of appetite 40%</li>
                                <li>Body aches 35%</li>
                                <li>Shortness of breath 31%</li>
                                <li>Mucus/phlegm 27%</li>
                        </ul>
                    </div>
                </div>
            </div>

            `
            ;
            console.log("map")
        })
    }
}