
// function myFunction() {
//     var dots = document.getElementById("dots");
//     var moreText = document.getElementById("more");
//     var btnText = document.getElementById("myBtn");
//
//     if (dots.style.display === "none") {
//         dots.style.display = "inline";
//         btnText.innerHTML = "View more";
//         moreText.style.display = "none";
//     } else {
//         dots.style.display = "none";
//         btnText.innerHTML = "View less";
//         moreText.style.display = "inline";
//     }
// }
let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
class View_RPHI_announcement{
    announcementArray=[
        {
            announcement_id:"",
            title:"",
            description:"",
            banner:"",
            target_moh:"",
            posted_date:"",
            phi_officer:"",
            exp_date:""
        }
    ];

    container;
    url = "http://localhost:8080/test_war_exploded/public/";
    constructor(container) {
        this.container = document.getElementById(container);
    }
    setData(data) {
        if(!data) return;
        this.announcementArray = data;
        this.container.innerHTML=" ";

        alert("came")
        this.announcementArray.map((item) => {
            let expday = new Date(item.exp_date)
            let current_day=new Date();
            console.log(current_day)
            // console.log("today : "+current_day+" "+"exp_day : "+expday);
            if(current_day<=expday){
                console.log("bi");
            }

            this.container.innerHTML += `
       <div class="announcement">
                         <div class="left">
                <div class="image-container">
<!--                    <img src="${Url}/images/upoadimage/${item.banner}" width="250px" height="150px">-->
                </div>
            </div>
            <div class="right">
                <div class="up">
                    <div class="announe-title">${item.title}</div>
                    <div class="post-date" id="post-date">posted date -: ${item.posted_date}</div>
                </div>
                <div class="down">
                    <div class="description">${item.description}  </div>
                    
                </div>
            </div>
       </div>
            `;
        })
        // alert("hi")
    }







}

function searchD(){
    let count=0
    const input = document.getElementById('post-date').value;
    const cardContainor = document.getElementById('announcements-container');
    const card = cardContainor.getElementsByClassName('announcement')
    for(let i=0 ; i<card.length ;i++){
        let title = card[i].querySelector('#post-date');
        // alert(title)

        if(title.innerHTML.indexOf(input) > -1){
            card[i].style.display=""
        }else{
            card[i].style.display="none"
        }
    }}