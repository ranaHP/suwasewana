let myUrl = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
class verify_reject_popup{
    constructor(popupContaienr , data){
        this.Data=data;
        this.container = document.getElementById(popupContaienr);
        this.init();
    }
    init(){
        let popup=document.createElement('div');
        popup.classList.add('popup' ,'zoomIn');
        this.container.appendChild(popup);
        // //logo row
        // let logo= document.createElement('div');
        // logo.classList.add('logo');
        // popup.appendChild(logo);
        // //logo
        // let logo_img=document.createElement('img');
        // logo_img.setAttribute("src","logo.png")
        // logo.appendChild(logo_img);
        let popupIcon = document.createElement('div');
        popupIcon.classList.add('popup-icon');
        popupIcon.innerHTML = '<i class="feather-16" data-feather="list"  ></i>';

        popup.appendChild(popupIcon);

        

        //message row
        let message=document.createElement('div');
        message.classList.add('row');
        popup.appendChild(message);

        let messagetext=document.createElement('span');
        messagetext.innerText="Task - "+this.Data.task;
        message.appendChild(messagetext);

        //message row
        let date=document.createElement('div');
        date.classList.add('row');
        popup.appendChild(date);

        let datetext=document.createElement('span');
        datetext.innerText="Date - ";
        let dateinputtext=document.createElement('input');
        dateinputtext.setAttribute('type','date');
        dateinputtext.setAttribute('value',this.Data.date);
        date.appendChild(datetext);
        date.appendChild(dateinputtext);
        
       

         //btn row
         let btn_row=document.createElement('div');
         btn_row.classList.add('btn-row-center');
         popup.appendChild(btn_row);
 
         let done_btn=document.createElement('button');
         done_btn.innerText="Update";
         done_btn.classList.add('update-btn');
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