let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

class view_disease_details{
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
    setData(data,id) {
        let a = id;
        let i = 0;
        // console.log(data)
        if (!data) return;
        this.diseasearrayy = data;
        if(id == null || id == "" || id == undefined) {
            [data[0]].map((item) => {

                    if (a == data[i].d_id ||a==null) {


                        console.log("mp id" + data[i].d_id)
                        // let a = item.name


                        this.container.innerHTML += `


                 <div class="dashboard-page-sub-title d-title" id="disease_name">
                        <div class="dd-name" id="dd-name">Diseas : ${item.name}</div>
                        <button class="submitBtn" onclick="RegisterCheckForDisease('` + item.name + `','`+item.d_id+`')"> Register as Patient </button>
                    </div>
                    <div class="row1">
                        <div class="summary">
                            <img src="${myUrl}/public/images/uploadimage/${JSON.parse(item.description).banner}" width="10%" >
                            <div class="summary-desc">
                                <ul>
                                    <li>Coronavirus disease (COVID-19) is an
                                        infectious disease caused by a
                                        newly discovered coronavirus.</li>
                                    <li>
                                        <img src="${myUrl}/public/images/uploadimage/${JSON.parse(item.description).banner}" width="15px" >

                                        <div>535,529</div>
                                        Coronavirus Cases:
                                    </li>
                                    <li>
                                        <img src="<c:url value="/public/images/icons/alert-circle.svg"/>" width="15px" />
                                        <div> 13,593 </div>
                                         Deaths: ${JSON.parse(item.description).name}
                                    </li>
                                    <li>
                                        <img src="${myUrl}/public/images/uploadimage/disease.png" width="80px" height="80px" />
                                        <div> 503,090 </div>
                                        Recovered:
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="history-what-is-container">
                            <div class="history">
                                <div class="d-s-title">
                                    History
                                </div>
                                ${JSON.parse(item.description).History}
<!--                                -->
<!--                                Coronavirus disease 2019 (COVID-19) is a contagious disease caused by severe acute-->
<!--                                respiratory syndrome coronavirus 2 (SARS-CoV-2). The first known case was identified-->
<!--                                in Wuhan, China, in December 2019.[7] The disease has since spread worldwide,-->
<!--                                leading to an ongoing pandemic.[8]-->

<!--                                Symptoms of COVID-19 are variable, <br />but often include fever,[9] cough,-->
<!--                                headache,[10] fatigue, breathing difficulties, and loss of smell and taste.<br />-->
<!--                                Symptoms may begin one to fourteen days after exposure to the virus. At least a-->
<!--                                third of people who are infected do not develop noticeable symptoms.[14] Of those-->
<!--                                people who develop symptoms noticeable enough to be classed as patients, most (81%)-->
<!--                                develop mild to moderate symptoms (up to mild pneumonia), while 14% develop severe-->
<!--                                symptoms (dyspnea, hypoxia, or more than 50% lung involvement on imaging), and 5%-->
<!--                                suffer critical symptoms (respiratory failure, shock, or multiorgan-->
<!--                                dysfunction).[15] Older people are at a higher risk of developing severe symptoms.-->
<!--                                Some people continue to experience a range of effects (long COVID) for months after-->
<!--                                recovery, and damage to organs has been observed.[16] Multi-year studies are-->
<!--                                underway to further investigate the long-term effects of the disease.[16]-->
<!--                                <br />-->
<!--                                COVID-19 transmits when people breathe in air contaminated by droplets and small-->
<!--                                airborne particles containing the virus. The risk of breathing these in is highest-->
<!--                                when people are in close proximity, but they can be inhaled over longer distances,-->
<!--                                particularly indoors. Transmission can also occur if splashed or sprayed with-->
<!--                                contaminated fluids in the eyes, nose or mouth, and, rarely, via contaminated-->
<!--                                surfaces. People remain contagious for up to 20 days, and can spread the virus even-->
<!--                                if they do not develop symptoms.[17][18]-->
<!--                                <br />-->
<!--                                Several testing methods have been developed to diagnose the disease. The standard-->
<!--                                diagnostic method is by detection of the virus' nucleic acid by real-time reverse-->
<!--                                transcription polymerase chain reaction (rRT-PCR), transcription-mediated-->
<!--                                amplification (TMA), or by reverse transcription loop-mediated isothermal-->
<!--                                amplification (RT-LAMP) from a nasopharyngeal swab.-->
                            </div>
                            <div class="what-is">
                                <div class="d-s-title">
                                    What Is ${item.name}
                                </div>
                                ${JSON.parse(item.description).WhatIs}
<!--                                A coronavirus is a kind of common virus that causes an infection in your nose,-->
<!--                                sinuses, or upper throat. Most coronaviruses aren't dangerous.-->

<!--                                In early 2020, after a December 2019 outbreak in China, the World Health-->
<!--                                Organization identified SARS-CoV-2 as a new type of coronavirus. The outbreak-->
<!--                                quickly spread around the world.-->
                            </div>
                        </div>
                    </div>
                    <div class="row1" style="padding-top: 30px;display: flex;flex-direction: column;">
                        <div class="d-s-title">
                            How Spread ${item.name}
                        </div>
                        <div class="row">
                            <div class="prevention">

                                <div class="desc">
                                
                                ${JSON.parse(item.description).Spread.desc}
<!--                                    According to researchers in China, these were the most common symptoms among-->
<!--                                    people who had COVID-19:-->
                                </div>
                                <div class="prevention-list">
                                
                                 ${createSpreadCard(JSON.parse(item.description).Spread.item)}
                                
<!--                                    <div class="s-item">-->
<!--                                        Droplets or aerosols-->
<!--                                    </div>-->
<!--                                    <div class="s-item">-->
<!--                                        Airborne transmission-->
<!--                                    </div>-->
<!--                                    <div class="s-item">-->
<!--                                        Surface transmission-->
<!--                                    </div>-->
<!--                                    <div class="s-item">-->
<!--                                        Fecal-oral-->
<!--                                    </div>-->

                                </div>
                            </div>
                            <div class="banner5">
                                <img src="${myUrl}/public/images/uploadimage/${JSON.parse(item.description).Spread.banner}" width="300px" class="m-auto" >
                            </div>
                        </div>
                    </div>
                    <div class="row1" style="padding-top: 30px;display: flex;flex-direction: column;">
                        <div class="d-s-title" style="text-align: center;">
                            Symptoms of ${item.name}
                        </div>
                        <div class="row1"
                             style="flex-direction: column;justify-content: center;align-items: center;">
                            <div class="symptopms">
                                <div class="desc">
                                ${JSON.parse(item.description).Symptoms.desc}
<!--                                    According to researchers in China, these were the most common symptoms among-->
<!--                                    people who had COVID-19:-->
                                </div>

                                <div class="d-s-s-titel">
                                    Most common symptoms:
                                </div>
                                
                                
                                <div class="symptopms-list">
                                ${createmostcommonSymptomsCard(JSON.parse(item.description).Symptoms.Most)}
                                </div>


                                <div class="d-s-s-titel">
                                    Less common symptoms:
                                </div>
                                
                                
                                <div class="symptopms-list">
                                
                                ${createlesscommonSymptomsCard(JSON.parse(item.description).Symptoms.Less)}

                                </div>
                                
                                
                            </div>

                            <div class="d-s-s-titel">
                                Serious symptoms:
                            </div>
                            
                            
                            <div class="symptopms-list">
                               ${createseriouscommonSymptomsCard(JSON.parse(item.description).Symptoms.Serious)}
                            </div>
                            
                            
                            <div class="banner1">
                                <img src="${myUrl}/public/images/uploadimage/${JSON.parse(item.description).Symptoms.Banner}" width="100%" >
                            </div>
                        </div>
                    </div>
                    <div class="row1" style="padding-top: 30px;display: flex;flex-direction: column;">
                        <div class="d-s-title">
                            Prevention of ${item.name}
                        </div>
                        <div class="row">
                            <div class="prevention">

                                <div class="desc">
                                ${JSON.parse(item.description).Prevention.desc}
<!--                                    According to researchers in China, these were the most common symptoms among-->
<!--                                    people who had COVID-19:-->
                                </div>
                                
                                
                                
                                <div class="prevention-list" id="prevention-list">
                                
                                
                                    ${createPreventionCard(JSON.parse(item.description).Prevention.item)}
                                    
                                    
                                    
                                    
                                    <div class="row" style="padding-top: 20px;">
                                        <div class="image-set">
                                            <img src="<c:url value="/public/images/diseases/p1.svg"/> " height="70px" class="m-auto" />
                                            <img src="<c:url value="/public/images/diseases/p2.svg"/> " height="70px" class="m-auto" />
                                            <img src="<c:url value="/public/images/diseases/p5.svg"/>" height="70px" class="m-auto" />
                                            <img src="<c:url value="/public/images/diseases/p4.svg"/>" height="70px" class="m-auto" />
                                            <img src="<c:url value="/public/images/diseases/p6.svg"/>" height="70px" class="m-auto" />
                                            <img src="<c:url value="/public/images/diseases/p7.svg"/>" height="70px" class="m-auto" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="banner2">
                                <img src="${myUrl}/public/images/uploadimage/${JSON.parse(item.description).Prevention.banner}" width="300px" class="m-auto" >
                            </div>
                        </div>
                    </div>
                    <div class="row1" style="padding-top: 30px;display: flex;flex-direction: column;">
                        <div class="d-s-title">
                            Treatments of ${item.name}
                        </div>
                        <div class="d-s-s-titel">
                            Self care
                        </div>
                        <div class="row">
                            <div class="treatments">

                                <div class="desc" style="padding-bottom: 10px;">
                                
                                ${JSON.parse(item.description).Treatment.SelfCare.desc}
<!--                                    According to researchers in China, these were the most common symptoms among-->
<!--                                    people who had COVID-19:-->
                                </div>
                                <div class="treatments-list" id="treatments-list">
                                
                                
                                    ${createreatmentSelfCareCard(JSON.parse(item.description).Treatment.SelfCare.item)}


                                </div>
                            </div>
                            <div class="banner6">
                               <img src="${myUrl}/public/images/uploadimage/${JSON.parse(item.description).Treatment.SelfCare.banner}" width="300px" class="m-auto" >
                            </div>
                        </div>
                        <div class="d-s-s-titel">
                            Medical treatments
                        </div>
                        <div class="row">

                            <div class="treatments">

                                <div class="desc" style="padding-bottom: 10px;">
                                
                                ${JSON.parse(item.description).Treatment.MedicalTreatments.desc}
                                
                   
<!--                                    According to researchers in China, these were the most common symptoms among-->
<!--                                    people who had COVID-19:-->
                                </div>
                                <div class="treatments-list">
                                
                                
                                  ${createTreatmentMedicalTreatmentsCard(JSON.parse(item.description).Treatment.MedicalTreatments.item)}
                                    


                                </div>
                            </div>
                            <div class="banner8">
                                <img src="${myUrl}/public/images/uploadimage/${JSON.parse(item.description).Treatment.MedicalTreatments.banner}" width="300px" class="m-auto" >
                            </div>
                        </div>
                    </div>
                    <div class="row1" style="padding-top: 30px;display: flex;flex-direction: column;">
                        <div class="d-s-title">
                            Emergency contact number for ${item.name}
                        </div>
                        <div class="row">
                            <div class="emergency-contanat-container">

                                <div class="desc">
                                ${JSON.parse(item.description).EmergencyContact.desc}
<!--                                    According to researchers in China, these were the most common symptoms among-->
<!--                                    people who had COVID-19:-->
                                </div>
                                <div class="emergency-contanat-cards">
                                
                                
                         
                                    <div class="emg-card">
                                    
                                        <div class="emd-card-title">
<!--                                            Response Alert-->
                                            ${JSON.parse(item.description).EmergencyContact.item[0].title}
                                        </div>
                                        
                                        
                                        <div class="emg-card-number">
<!--                                            1999-->
                                            ${JSON.parse(item.description).EmergencyContact.item[0].CNumber}
                                        </div>
                                    </div>
                                    <div class="emg-card">
                                        <div class="emd-card-title">
<!--                                            Response Alert-->
                                             ${JSON.parse(item.description).EmergencyContact.item[0].title}
                                        </div>
                                        <div class="emg-card-number">
<!--                                            1999-->
                                            ${JSON.parse(item.description).EmergencyContact.item[0].CNumber}
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
<!--                    <div class="row1" style="padding-top: 30px;display: flex;flex-direction: column;">-->
<!--                        <div class="d-s-title">-->
<!--                            Current Status of Covid 19-->
<!--                        </div>-->
<!--                        <div class="row">-->
<!--                            <div class="chart-contanat-container">-->

<!--                                <div class="desc">-->
<!--                                    According to researchers in China, these were the most common symptoms among-->
<!--                                    people who had COVID-19:-->
<!--                                </div>-->
<!--                                <div class="chart-contanat-cards">-->
<!--                                    <div class="chart-card">-->
<!--                                        <canvas  id="myChart" width="100" height="30"></canvas>-->
<!--                                    </div>-->

<!--                                </div>-->
<!--                            </div>-->
<!--                        </div>-->

<!--                    </div>-->


            `

                        // console.log("map")
                    }
                    i++;

                }
            )
        }else{
            data.map((item) => {

                    if (a == data[i].d_id ||a==null) {


                        console.log("mp id" + data[i].d_id)
                        // let a = item.name


                        this.container.innerHTML += `


                 <div class="dashboard-page-sub-title d-title" id="disease_name">
                        <div class="dd-name" id="dd-name">Diseas : ${item.name}</div>
                        <button class="submitBtn" onclick="RegisterCheckForDisease('` + item.name + `','`+item.d_id+`')"> Register as Patient </button>
                    </div>
                    <div class="row1">
                        <div class="summary">
                            <img src="<c:url value="/public/images/diseases/covidBanner.jpg"/>" alt="" srcset="" width="100%" />
                            <div class="summary-desc">
                                <ul>
                                    <li>Coronavirus disease (COVID-19) is an
                                        infectious disease caused by a
                                        newly discovered coronavirus.</li>
                                    <li>
                                        <img src="<c:url value="/public/images/icons/trending-up.svg"/>" width="15px" />

                                        <div>535,529</div>
                                        Coronavirus Cases:
                                    </li>
                                    <li>
                                        <img src="<c:url value="/public/images/icons/alert-circle.svg"/>" width="15px" />
                                        <div> 13,593 </div>
                                         Deaths: ${JSON.parse(item.description).name}
                                    </li>
                                    <li>
                                        <img src="<c:url value="/public/images/icons/users.svg"/>" width="15px" />
                                        <div> 503,090 </div>
                                        Recovered:
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="history-what-is-container">
                            <div class="history">
                                <div class="d-s-title">
                                    History
                                </div>
                                ${JSON.parse(item.description).History}
<!--                                -->
<!--                                Coronavirus disease 2019 (COVID-19) is a contagious disease caused by severe acute-->
<!--                                respiratory syndrome coronavirus 2 (SARS-CoV-2). The first known case was identified-->
<!--                                in Wuhan, China, in December 2019.[7] The disease has since spread worldwide,-->
<!--                                leading to an ongoing pandemic.[8]-->

<!--                                Symptoms of COVID-19 are variable, <br />but often include fever,[9] cough,-->
<!--                                headache,[10] fatigue, breathing difficulties, and loss of smell and taste.<br />-->
<!--                                Symptoms may begin one to fourteen days after exposure to the virus. At least a-->
<!--                                third of people who are infected do not develop noticeable symptoms.[14] Of those-->
<!--                                people who develop symptoms noticeable enough to be classed as patients, most (81%)-->
<!--                                develop mild to moderate symptoms (up to mild pneumonia), while 14% develop severe-->
<!--                                symptoms (dyspnea, hypoxia, or more than 50% lung involvement on imaging), and 5%-->
<!--                                suffer critical symptoms (respiratory failure, shock, or multiorgan-->
<!--                                dysfunction).[15] Older people are at a higher risk of developing severe symptoms.-->
<!--                                Some people continue to experience a range of effects (long COVID) for months after-->
<!--                                recovery, and damage to organs has been observed.[16] Multi-year studies are-->
<!--                                underway to further investigate the long-term effects of the disease.[16]-->
<!--                                <br />-->
<!--                                COVID-19 transmits when people breathe in air contaminated by droplets and small-->
<!--                                airborne particles containing the virus. The risk of breathing these in is highest-->
<!--                                when people are in close proximity, but they can be inhaled over longer distances,-->
<!--                                particularly indoors. Transmission can also occur if splashed or sprayed with-->
<!--                                contaminated fluids in the eyes, nose or mouth, and, rarely, via contaminated-->
<!--                                surfaces. People remain contagious for up to 20 days, and can spread the virus even-->
<!--                                if they do not develop symptoms.[17][18]-->
<!--                                <br />-->
<!--                                Several testing methods have been developed to diagnose the disease. The standard-->
<!--                                diagnostic method is by detection of the virus' nucleic acid by real-time reverse-->
<!--                                transcription polymerase chain reaction (rRT-PCR), transcription-mediated-->
<!--                                amplification (TMA), or by reverse transcription loop-mediated isothermal-->
<!--                                amplification (RT-LAMP) from a nasopharyngeal swab.-->
                            </div>
                            <div class="what-is">
                                <div class="d-s-title">
                                    What Is ${item.name}
                                </div>
                                ${JSON.parse(item.description).WhatIs}
<!--                                A coronavirus is a kind of common virus that causes an infection in your nose,-->
<!--                                sinuses, or upper throat. Most coronaviruses aren't dangerous.-->

<!--                                In early 2020, after a December 2019 outbreak in China, the World Health-->
<!--                                Organization identified SARS-CoV-2 as a new type of coronavirus. The outbreak-->
<!--                                quickly spread around the world.-->
                            </div>
                        </div>
                    </div>
                    <div class="row1" style="padding-top: 30px;display: flex;flex-direction: column;">
                        <div class="d-s-title">
                            How Spread ${item.name}
                        </div>
                        <div class="row">
                            <div class="prevention">

                                <div class="desc">
                                
                                ${JSON.parse(item.description).Spread.desc}
<!--                                    According to researchers in China, these were the most common symptoms among-->
<!--                                    people who had COVID-19:-->
                                </div>
                                <div class="prevention-list">
                                
                                 ${createSpreadCard(JSON.parse(item.description).Spread.item)}
                                
<!--                                    <div class="s-item">-->
<!--                                        Droplets or aerosols-->
<!--                                    </div>-->
<!--                                    <div class="s-item">-->
<!--                                        Airborne transmission-->
<!--                                    </div>-->
<!--                                    <div class="s-item">-->
<!--                                        Surface transmission-->
<!--                                    </div>-->
<!--                                    <div class="s-item">-->
<!--                                        Fecal-oral-->
<!--                                    </div>-->

                                </div>
                            </div>
                            <div class="banner5">
                                <img src="<c:url value="/public/images/diseases/4.jpg"/> " height="300px" class="m-auto" />
                            </div>
                        </div>
                    </div>
                    <div class="row1" style="padding-top: 30px;display: flex;flex-direction: column;">
                        <div class="d-s-title" style="text-align: center;">
                            Symptoms of ${item.name}
                        </div>
                        <div class="row1"
                             style="flex-direction: column;justify-content: center;align-items: center;">
                            <div class="symptopms">
                                <div class="desc">
                                ${JSON.parse(item.description).Symptoms.desc}
<!--                                    According to researchers in China, these were the most common symptoms among-->
<!--                                    people who had COVID-19:-->
                                </div>

                                <div class="d-s-s-titel">
                                    Most common symptoms:
                                </div>
                                
                                
                                <div class="symptopms-list">
                                ${createmostcommonSymptomsCard(JSON.parse(item.description).Symptoms.Most)}
                                </div>


                                <div class="d-s-s-titel">
                                    Less common symptoms:
                                </div>
                                
                                
                                <div class="symptopms-list">
                                
                                ${createlesscommonSymptomsCard(JSON.parse(item.description).Symptoms.Less)}

                                </div>
                                
                                
                            </div>

                            <div class="d-s-s-titel">
                                Serious symptoms:
                            </div>
                            
                            
                            <div class="symptopms-list">
                               ${createseriouscommonSymptomsCard(JSON.parse(item.description).Symptoms.Serious)}
                            </div>
                            
                            
                            <div class="banner1">
                                <img src="<c:url value="/public/images/diseases/syntoms.png"/>" width="100%" />
                            </div>
                        </div>
                    </div>
                    <div class="row1" style="padding-top: 30px;display: flex;flex-direction: column;">
                        <div class="d-s-title">
                            Prevention of ${item.name}
                        </div>
                        <div class="row">
                            <div class="prevention">

                                <div class="desc">
                                ${JSON.parse(item.description).Prevention.desc}
<!--                                    According to researchers in China, these were the most common symptoms among-->
<!--                                    people who had COVID-19:-->
                                </div>
                                
                                
                                
                                <div class="prevention-list" id="prevention-list">
                                
                                
                                    ${createPreventionCard(JSON.parse(item.description).Prevention.item)}
                                    
                                    
                                    
                                    
                                    <div class="row" style="padding-top: 20px;">
                                        <div class="image-set">
                                            <img src="<c:url value="/public/images/diseases/p1.svg"/> " height="70px" class="m-auto" />
                                            <img src="<c:url value="/public/images/diseases/p2.svg"/> " height="70px" class="m-auto" />
                                            <img src="<c:url value="/public/images/diseases/p5.svg"/>" height="70px" class="m-auto" />
                                            <img src="<c:url value="/public/images/diseases/p4.svg"/>" height="70px" class="m-auto" />
                                            <img src="<c:url value="/public/images/diseases/p6.svg"/>" height="70px" class="m-auto" />
                                            <img src="<c:url value="/public/images/diseases/p7.svg"/>" height="70px" class="m-auto" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="banner2">
                                <img src="<c:url value="/public/images/diseases/4.jpg"/> " height="300px" class="m-auto" />
                            </div>
                        </div>
                    </div>
                    <div class="row1" style="padding-top: 30px;display: flex;flex-direction: column;">
                        <div class="d-s-title">
                            Treatments of ${item.name}
                        </div>
                        <div class="d-s-s-titel">
                            Self care
                        </div>
                        <div class="row">
                            <div class="treatments">

                                <div class="desc" style="padding-bottom: 10px;">
                                
                                ${JSON.parse(item.description).Treatment.SelfCare.desc}
<!--                                    According to researchers in China, these were the most common symptoms among-->
<!--                                    people who had COVID-19:-->
                                </div>
                                <div class="treatments-list" id="treatments-list">
                                
                                
                                    ${createreatmentSelfCareCard(JSON.parse(item.description).Treatment.SelfCare.item)}


                                </div>
                            </div>
                            <div class="banner6">
                                <img src="<c:url value="/public/images/diseases/4.jpg"/> " height="300px" class="m-auto" />
                            </div>
                        </div>
                        <div class="d-s-s-titel">
                            Medical treatments
                        </div>
                        <div class="row">

                            <div class="treatments">

                                <div class="desc" style="padding-bottom: 10px;">
                                
                                ${JSON.parse(item.description).Treatment.MedicalTreatments.desc}
                                
                   
<!--                                    According to researchers in China, these were the most common symptoms among-->
<!--                                    people who had COVID-19:-->
                                </div>
                                <div class="treatments-list">
                                
                                
                                  ${createTreatmentMedicalTreatmentsCard(JSON.parse(item.description).Treatment.MedicalTreatments.item)}
                                    


                                </div>
                            </div>
                            <div class="banner8">
                                <img src="<c:url value="/public/images/diseases/4.jpg"/> " height="300px" class="m-auto" />
                            </div>
                        </div>
                    </div>
                    <div class="row1" style="padding-top: 30px;display: flex;flex-direction: column;">
                        <div class="d-s-title">
                            Emergency contact number for ${item.name}
                        </div>
                        <div class="row">
                            <div class="emergency-contanat-container">

                                <div class="desc">
                                ${JSON.parse(item.description).EmergencyContact.desc}
<!--                                    According to researchers in China, these were the most common symptoms among-->
<!--                                    people who had COVID-19:-->
                                </div>
                                <div class="emergency-contanat-cards">
                                
                                
                         
                                    <div class="emg-card">
                                    
                                        <div class="emd-card-title">
<!--                                            Response Alert-->
                                            ${JSON.parse(item.description).EmergencyContact.item[0].title}
                                        </div>
                                        
                                        
                                        <div class="emg-card-number">
<!--                                            1999-->
                                            ${JSON.parse(item.description).EmergencyContact.item[0].CNumber}
                                        </div>
                                    </div>
                                    <div class="emg-card">
                                        <div class="emd-card-title">
<!--                                            Response Alert-->
                                             ${JSON.parse(item.description).EmergencyContact.item[0].title}
                                        </div>
                                        <div class="emg-card-number">
<!--                                            1999-->
                                            ${JSON.parse(item.description).EmergencyContact.item[0].CNumber}
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="row1" style="padding-top: 30px;display: flex;flex-direction: column;">
                        <div class="d-s-title">
                            Current Status of Covid 19
                        </div>
                        <div class="row">
                            <div class="chart-contanat-container">

                                <div class="desc">
                                    According to researchers in China, these were the most common symptoms among
                                    people who had COVID-19:
                                </div>
                                <div class="chart-contanat-cards">
                                    <div class="chart-card">
                                        <canvas  id="myChart" width="100" height="30"></canvas>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>


            `

                        // console.log("map")
                    }
                    i++;

                }
            )
        }
        console.log( "aaaa " +id)


        console.log("jspid " + a)
        // for (let i = 0; i < data.length; i++) {
        //



        // }
    // }
    }

}
// function card(){
//
// }

function createSpreadCard(data){
    var temp = "";
    data.forEach( item => {
        temp +=`    <div class="s-item">
                                    ${item}    
                                    </div>`
    })

    // console.log("temp")
    // console.log(temp)
    // console.log("temp")
    return temp
}

function createmostcommonSymptomsCard(data){
    var temp = "";
    data.forEach( item => {
        temp +=`    <div class="s-item">

                        ${item}
                     </div>`
    })
    // console.log("temp")
    // console.log(temp)
    // console.log("temp")
    return temp
}

function createlesscommonSymptomsCard(data){
    var temp = "";
    data.forEach( item => {
        temp +=`    <div class="s-item">

                        ${item}
                     </div>`
    })
    // console.log("temp")
    // console.log(temp)
    // console.log("temp")
    return temp
}

function createseriouscommonSymptomsCard(data){
    var temp = "";
    data.forEach( item => {
        temp +=`    <div class="s-item">

                        ${item}
                     </div>`
    })
    // console.log("temp")
    // console.log(temp)
    // console.log("temp")
    return temp
}


function createPreventionCard(data){
    var temp = "";
    data.forEach( item => {
        temp +=` 
                   <div class="p-item">
                    ${item}
<!--                                        Wear a mask properly-->
                    </div>`
    })
    // console.log("temp")
    // console.log(temp)
    // console.log("temp")
    return temp
}

function createreatmentSelfCareCard(data){
    var temp = "";
    data.forEach( item => {
        temp +=` 
                  <div class="t-item" id="t-item">
                                    ${item}
<!--                                        Call your health care provider or COVID-19 hotline to find out where and when to get a test.-->
                                    </div>`
    })
    // console.log("temp")
    // console.log(temp)
    // console.log("temp")
    return temp
}


function createTreatmentMedicalTreatmentsCard(data){
    var temp = "";
    data.forEach( item => {

        temp +=` 
                   <div class="t-item">
                                    ${item}
<!--                                        Optimal supportive care includes oxygen for severely ill patients and those who are at risk for severe disease and more advanced respiratory support such as ventilation for patients who are critically ill.-->
                                    </div>`
    })
    // console.log("temp")
    // console.log(temp)
    // console.log("temp")
    return temp
}


// function serach(){
//
//     const input = document.getElementById('appointmentType').value.toUpperCase();
//
//     const cardContainor = document.getElementById('dashboard-container');
//     const card = cardContainor.getElementsByClassName('dashboard-page-sub-title')
//
//     for(let i=0 ; i<card.length ;i++){
//         let title = card[i].querySelector('#dd-name');
//
//         if(title.innerHTML.toUpperCase().indexOf(input) > -1){
//             card[i].style.display=""
//         }else{
//             card[i].style.display="none"
//         }
//     }
//
// }

// function searchDiseases(data,id){
//
//     const input = document.getElementById('appointmentType').value.toUpperCase();
//     const cardContainor = document.getElementById('dashboard-container');
//     const card = cardContainor.getElementsByClassName('dashboard-page-sub-title')
//     for (let i=0; i<data.length;++i){
//         if(id==3){
//             card[i].style.display=""
//         }
//         else{
//             card[i].style.display="none"
//         }
//     }
//
// }





// function createEmergencyContactCard(data){
//     var temp = "";
//     data.forEach( item => {
//         temp +=`
//                    <div class="emd-card-title">
//                       ${item}
//                    </div>
//                    <div class="emg-card-number">
//                        ${item}
//                     </div>`
//     })
//     console.log("temp")
//     console.log(temp)
//     console.log("temp")
//     return temp
// }
