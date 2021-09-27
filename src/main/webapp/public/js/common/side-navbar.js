
let arrow = document.querySelectorAll(".arrow");
for (var i = 0; i < arrow.length; i++) {
    arrow[i].addEventListener("click", (e)=>{
        let arrowParent = e.target.parentElement.parentElement;//selecting main parent of arrow
        arrowParent.classList.toggle("showMenu");
    });
}

let sidebar = document.querySelector(".sidebar");
let sidebarBtn = document.querySelector(".logo-details");
let closeBtn = document.querySelector(".close-btn");
console.log(sidebarBtn);
sidebarBtn.addEventListener("click", ()=>{
    sidebar.classList.toggle("close");
    document.getElementById("mainContent").classList.toggle("sidebar-main-show")
});
closeBtn.addEventListener("click", ()=>{
    sidebar.classList.toggle("close");
});
