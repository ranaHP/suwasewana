class verify_patient_detail_popup{
    constructor(popupContaienr ,data){
        this.Data=data;
        this.container = document.getElementById(popupContaienr);
        this.init();
    }
    init(){
        let popup=document.createElement('div');
        popup.classList.add('popup' ,'zoomIn');
        this.container.appendChild(popup);
        //logo row
        let logo= document.createElement('div');
        logo.classList.add('logo');
        popup.appendChild(logo);
        //logo
        let logo_img=document.createElement('img');
        logo_img.setAttribute("src","../logo.png")
        logo.appendChild(logo_img);

        //title row
        let title=document.createElement('div');
        title.classList.add('title');
        popup.appendChild(title);

        let titletext=document.createElement('span');
        titletext.innerText="User Details";
        title.appendChild(titletext);

        //message row
        let name=document.createElement('div');
        name.classList.add('row');
        popup.appendChild(name);
        let nametext=document.createElement('span');
        nametext.innerHTML="<pre>"+"Name       : "+this.Data.name+"<pre>";
        name.appendChild(nametext);

        //message row
        let Age=document.createElement('div');
        Age.classList.add('row');
        popup.appendChild(Age);
        let Agetext=document.createElement('span');
        Agetext.innerHTML="<pre>"+"Age          : "+this.Data.age+"<pre>";
        Age.appendChild(Agetext);

        //message row
        let NIC=document.createElement('div');
        NIC.classList.add('row');
        popup.appendChild(NIC);
        let NICtext=document.createElement('span');
        NICtext.innerHTML="<pre>"+"NIC          : "+this.Data.NIC+"<pre>";
        NIC.appendChild(NICtext);

        //message row
        let Address=document.createElement('div');
        Address.classList.add('divrow');
        popup.appendChild(Address);

        let Addressleft=document.createElement('div');
        let Addlefttext=document.createElement('span');
        Addressleft.innerHTML="<pre>"+"Address   : <pre>";
        Addressleft.appendChild(Addlefttext);
        
        let Addressright=document.createElement('div');
        let add=this.Data.Address.split(',');
        let i=0;
        while(add[i]!=null){
            Addressright.innerHTML+="<span>"+this.Data.Address.split(',')[i]+"</span><br>";
            i++;
        }
        
        Address.appendChild(Addressleft);
        Address.appendChild(Addressright);

        //message row
        let Province=document.createElement('div');
        Province.classList.add('row');
        popup.appendChild(Province);
        let protext=document.createElement('span');
        protext.innerText="Province :"+this.Data.province;
        protext.innerHTML="<pre>"+"NIC          : "+this.Data.NIC+"<pre>";
        Province.appendChild(protext);


        //message row
        let city=document.createElement('div');
        city.classList.add('row');
        popup.appendChild(city);
        let citytext=document.createElement('span');
        citytext.innerHTML="<pre>"+"City          : "+this.Data.city+"<pre>";
        city.appendChild(citytext);

        //disease
        let Diseas=document.createElement('div');
        Diseas.classList.add('divrow');
        popup.appendChild(Diseas);

        let Diseasleft=document.createElement('div');
        let Diseaslefttext=document.createElement('span');
        Diseasleft.innerHTML="<pre>"+"Address   : <pre>";
        Diseasleft.appendChild(Diseaslefttext);
        
        let Diseasright=document.createElement('div');
        let dis=this.Data.diseas;
        i=0;
        while(dis[i]!=null){
            Diseasright.innerHTML+="<span>"+dis[i]+"</span><br>";
            i++;
        }
        
        Diseas.appendChild(Diseasleft);
        Diseas.appendChild(Diseasright);

        // request diseas
        let requestdis=document.createElement('div');
        requestdis.classList.add('row');
        popup.appendChild(requestdis);
        let rdistext=document.createElement('span');
        rdistext.innerHTML="<pre>"+"Request to register for <b> <i>"+this.Data.recdis+"</i> </b><pre>";
        requestdis.appendChild(rdistext);
        
        //btn row
        let btn_row=document.createElement('div');
        btn_row.classList.add('btn-row-center');
        popup.appendChild(btn_row);

        let done_btn=document.createElement('button');
        done_btn.innerText="Done";
        done_btn.classList.add('done-btn');
        btn_row.appendChild(done_btn);

        //close btn
        let closebtn=document.createElement('div');
        closebtn.classList.add('close-btn');

        let close_icon=document.createElement('span');
        close_icon.innerText="x";
        closebtn.appendChild(close_icon);
        closebtn.setAttribute("onclick", "popup.hidePopup()" );
        popup.appendChild(closebtn);

    }

    showPopup(){
        this.container.style.display = "block";
    }
    hidePopup(){
        this.container.style.display = "none"; 
    }

}