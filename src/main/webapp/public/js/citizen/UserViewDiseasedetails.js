let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];

class view_disease_details{
    diseasearray=[
        {
            name :"",
            descrition: "",

        }
    ];
    container;
    constructor(container) {
        this.container = document.getElementById(container);
    }
    setData(data){
        if (!data)return;
        this.diseasearray = data;
        this. diseasearray.map((item) => {
                this.container.innerHTML += `
            
            
            
            `

                console.log("map")
            }
        )
    }
}