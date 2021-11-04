class require_message_popup{
    constructor(popupContaienr,title){
        
        this.Title=title;
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
        // logo_img.setAttribute("src","../logo.png")
        // logo.appendChild(logo_img);

        //title row
        let title=document.createElement('div');
        title.classList.add('title');
        popup.appendChild(title);

        let titletext=document.createElement('span');
        titletext.innerHTML=this.Title;
        title.appendChild(titletext);

        //message row
        let message=document.createElement('div');
        message.classList.add('row');
        popup.appendChild(message);

        let messagetext=document.createElement('span');
        messagetext.innerText="Message";
        message.appendChild(messagetext);
        
        //text area
        let textarea=document.createElement('textarea')
        textarea.setAttribute("rows","10");
        textarea.setAttribute("cols","30");
        popup.appendChild(textarea);

        //btn row
        let btn_row=document.createElement('div');
        btn_row.classList.add('btn-row');
        popup.appendChild(btn_row);

        let not_btn=document.createElement('button');
        not_btn.innerText="Not Now";
        not_btn.classList.add('not-btn');
        btn_row.appendChild(not_btn);

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
        closebtn.setAttribute("onclick", "popup.hidePopup1()" );
        popup.appendChild(closebtn);



    }

    showPopup1(){
        this.container.style.display = "block";
    }
    hidePopup1(){
        this.container.style.display = "none"; 
    }

}