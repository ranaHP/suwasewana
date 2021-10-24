news = [{
    title:"Granting facilities for rural hospitals",
    postedDate:"2021/08/23",
    more:"erisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa. Fusce luctus vestibulum augue ut aliquet. Nunc sagittis dictum nisi, sed ullamcorper ipsum dignissim ac. In at libero sed nunc venenatis imperdiet sed ornare turpis. Donec vitae dui eget tellus gravida venenatis. Integer fringilla congue eros non fermentum. Sed dapibus pulvinar nibh tempor porta",
    description:"he process of writing a job description requires having a clear understanding he process of writing a job description requires of the job’s duties and responsibilitie",
},
    {
        title:"Granting facilities for rural hospitals",
        postedDate:"2021/08/23",
        more:"erisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa. Fusce luctus vestibulum augue ut aliquet. Nunc sagittis dictum nisi, sed ullamcorper ipsum dignissim ac. In at libero sed nunc venenatis imperdiet sed ornare turpis. Donec vitae dui eget tellus gravida venenatis. Integer fringilla congue eros non fermentum. Sed dapibus pulvinar nibh tempor porta",
        description:"he process of writing a job description requires having a clear understanding he process of writing a job description requires of the job’s duties and responsibilitie",
    },
    {
        title:"Granting facilities for rural hospitals",
        postedDate:"2021/08/23",
        more:"erisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa. Fusce luctus vestibulum augue ut aliquet. Nunc sagittis dictum nisi, sed ullamcorper ipsum dignissim ac. In at libero sed nunc venenatis imperdiet sed ornare turpis. Donec vitae dui eget tellus gravida venenatis. Integer fringilla congue eros non fermentum. Sed dapibus pulvinar nibh tempor porta",
        description:"he process of writing a job description requires having a clear understanding he process of writing a job description requires of the job’s duties and responsibilitie",
    },
    {
        title:"Granting facilities for rural hospitals",
        postedDate:"2021/08/23",
        more:"erisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa. Fusce luctus vestibulum augue ut aliquet. Nunc sagittis dictum nisi, sed ullamcorper ipsum dignissim ac. In at libero sed nunc venenatis imperdiet sed ornare turpis. Donec vitae dui eget tellus gravida venenatis. Integer fringilla congue eros non fermentum. Sed dapibus pulvinar nibh tempor porta",
        description:"he process of writing a job description requires having a clear understanding he process of writing a job description requires of the job’s duties and responsibilitie",
    }
]



let container=document.getElementById('announcements-container')
let j=0;
let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
news.map((item=>{
    let announcement = document.createElement("div")
    announcement.classList.add("announcement")
    announcement.id=j
    announcement.innerHTML=`
<div class="left">
                <div class="image-container">
                    <img src="${Url}/public/images/c2.jpg" width="250px" height="150px">
                </div>
            </div>
            <div class="right">
                <div class="up">
                    <div class="announe-title">${item.title}</div>
                    <div class="post-date">posted date -: ${item.postedDate}</div>
                </div>
                <div class="down">
                    <div class="description">${item.description}  <span id="dots">...</span><span id="more" style="display: none;">${item.more}</span></div>
                    <div class="view-buttion"><button onclick="myFunction()" id="myBtn">View more</button></div> 
                </div>
            </div>
`
    container.appendChild(announcement)
    j++;
    console.log(announcement.id)
}))


function myFunction() {
    var dots = document.getElementById("dots");
    var moreText = document.getElementById("more");
    var btnText = document.getElementById("myBtn");

    if (dots.style.display === "none") {
        dots.style.display = "inline";
        btnText.innerHTML = "View more";
        moreText.style.display = "none";
    } else {
        dots.style.display = "none";
        btnText.innerHTML = "View less";
        moreText.style.display = "inline";
    }
}