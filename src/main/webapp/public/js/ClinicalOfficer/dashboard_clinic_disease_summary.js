// let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

class clinicListd {
    clinicListArray = [
        {
            clinicID:" ",
            disease:" ",
        }
    ];


    container;

    constructor(container) {
        this.container = document.getElementById(container);
    }
    setData(data) {
        if(!data) return;
        this.clinicListArray = data;
        console.log(data);
        this.clinicListArray.map((item) => {
               // chart(item.disease,item.clinicID)
                this.container.innerHTML += `
                  <div class="diseas">
                        <div class="disleft">
                            <h2>${item.disease}</h2>
                        </div>
                        <div class="disright" id="Covid 19">
                            ${item.clinicID}
                        </div>
                    </div>
            `
            ;
            console.log("map")
        })
    }

}