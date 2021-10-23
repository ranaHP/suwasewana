news = [{
    title:"Covid-19 Confirmed Death",
    postedDate:"2021/08/23",
    more:"erisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa. Fusce luctus vestibulum augue ut aliquet. Nunc sagittis dictum nisi, sed ullamcorper ipsum dignissim ac. In at libero sed nunc venenatis imperdiet sed ornare turpis. Donec vitae dui eget tellus gravida venenatis. Integer fringilla congue eros non fermentum. Sed dapibus pulvinar nibh tempor porta",
    description:"he process of writing a job description requires having a clear understanding he process of writing a job description requires of the job’s duties and responsibilitie",
},
    {
        title:"Covid-19 Confirmed Death",
        postedDate:"2021/08/23",
        more:"erisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa. Fusce luctus vestibulum augue ut aliquet. Nunc sagittis dictum nisi, sed ullamcorper ipsum dignissim ac. In at libero sed nunc venenatis imperdiet sed ornare turpis. Donec vitae dui eget tellus gravida venenatis. Integer fringilla congue eros non fermentum. Sed dapibus pulvinar nibh tempor porta",
        description:"he process of writing a job description requires having a clear understanding he process of writing a job description requires of the job’s duties and responsibilitie",
    },
    {
        title:"Covid-19 Confirmed Death",
        postedDate:"2021/08/23",
        more:"erisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa. Fusce luctus vestibulum augue ut aliquet. Nunc sagittis dictum nisi, sed ullamcorper ipsum dignissim ac. In at libero sed nunc venenatis imperdiet sed ornare turpis. Donec vitae dui eget tellus gravida venenatis. Integer fringilla congue eros non fermentum. Sed dapibus pulvinar nibh tempor porta",
        description:"he process of writing a job description requires having a clear understanding he process of writing a job description requires of the job’s duties and responsibilitie",
    },
    {
        title:"Covid-19 Confirmed Death",
        postedDate:"2021/08/23",
        more:"erisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa. Fusce luctus vestibulum augue ut aliquet. Nunc sagittis dictum nisi, sed ullamcorper ipsum dignissim ac. In at libero sed nunc venenatis imperdiet sed ornare turpis. Donec vitae dui eget tellus gravida venenatis. Integer fringilla congue eros non fermentum. Sed dapibus pulvinar nibh tempor porta",
        description:"he process of writing a job description requires having a clear understanding he process of writing a job description requires of the job’s duties and responsibilitie",
    }
]



let container=document.getElementById('announcements-container')
let i=0;
news.map((item=>{
    let announcement = document.createElement("div")
    announcement.classList.add("announcement")
    announcement.id=i
    announcement.innerHTML=`
<div class="left">
                <div class="image-container">
                    <img src="image3.png" width="270px">
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
    i++;
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