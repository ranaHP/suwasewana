class MOHSelectGenarate{
    MOH = [
        'Addalaichchenai',
        'Akkarepattu',
        'Alayadivembu',
        'Ampara',
        'Damana',
        'Dehiattakandiya',
        'Irakkamam',
        'Kalmunai',
        'Karaitivu',
        'Lahugala',
        'Maha Oya',
        'Navithanveli',
        'Nintavur',
        'Padiyathalawa',
        'Pottuvil',
        'Sainthamaruthu',
        'Sammanthurai',
        'Uhana',
    ];
    mohId;
    constructor(mohId){
        this.mohId = document.getElementById(mohId);
        
        this.init();
    }

    init(){
        this.MOH.map( moh => {
            this.mohId.innerHTML += `<option label="${moh}" value="${moh}">`;
           
        })
    }
    
   
}