class Delete{
    constructor(popupContaienr){
        
        this.container = document.getElementById(popupContaienr);
        this.init();
    }
    init(){
        let popup=document.createElement('div');
        popup.classList.add('popup' ,'zoomIn');
        this.container.appendChild(popup);
        

        //title row
        let title=document.createElement('div');
        title.classList.add('title');
        popup.appendChild(title);

        let titletext=document.createElement('span');
        title.classList.add('ml5');
        title.classList.add('mb10');
        titletext.innerHTML='Are you Sure ?';
        title.appendChild(titletext);

       

        //btn row
        let btn_row=document.createElement('div');
        btn_row.classList.add('btn-row');
        popup.appendChild(btn_row);

        let not_btn=document.createElement('button');
        not_btn.innerText="Yes";
        not_btn.classList.add('not-btn');
        btn_row.appendChild(not_btn);

        let done_btn=document.createElement('button');
        done_btn.innerText="No";
        done_btn.classList.add('warning-btn');
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