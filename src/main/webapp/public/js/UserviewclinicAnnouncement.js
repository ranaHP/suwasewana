
let Url = (window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + window.location.pathname).split("/s/")[0];
class clinicList {
    clinicListArray = [
        {
            title:" ",
            date:" ",
            description:" ",
            max_sheet:" ",
            conduct_by:" ",
            target_moh:" ",
            target_people:" ",
            location:" "

        }
    ];


    container;

    constructor(container) {
        this.container = document.getElementById(container);
    }
    setData(data) {
        if(!data) return;
        this.clinicListArray = data;
        console.log(data);
        this.clinicListArray.map((item) => {
            this.container.innerHTML += `
                    <div class="clinic-card">
                        <div class="header">
                            ${item.title}
                            <p style="font-size: .6em">Posted : ${item.date}</p>
                        </div>
                        <div class="desc">
                            ${item.description}
                        </div>
                        <div class="properties">
                            <ul>
                                <li>
                                    <img src="images/icons/map-pin.svg" width="15px"/>
                                    Location : ${item.location === "" ? "Pending..." : item.location}
                                </li>
                                <li>
                                    <img src="images/icons/list.svg" width="15px"/>
                                    Conduct : ${item.conduct_by === "" ? "Pending..." : item.conduct_by}
                                </li>
                                <li>
                                    <img src="images/icons/list.svg" width="15px"/>
                                    Max patient limit : ${item.max_sheet === "" ? "Pending..." : item.max_sheet}
                                </li>
                                <li>
                                    <img src="images/icons/list.svg" width="15px"/>
                                    MOH area : ${item.target_moh === "" ? "Pending..." : item.target_moh}
                                </li>
                                <li>
                                    <img src="images/icons/list.svg" width="15px"/>
                                    Target participants : ${item.target_people === "" ? "Pending..." : item.target_people}
                                </li>
                            </ul>
                        </div>
                        <div class="footer">
                            <div class="current-registered-count">
                                <img src="images/icons/users.svg" width="18px"/>
                                120,22
                            </div>
                            <div class="register-btn">
                                Register
                            </div>
                        </div>
                    </div>
            `
            ;
            console.log("map")
        })
    }
}

// function search() {
//     let count = 0
//     const input = document.getElementById('filter').value.toUpperCase();
//     const cardContainor = document.getElementById('announcements-container');
//     const card1 = cardContainor.getElementsByClassName('announcement')
//
//     for (let i = 0; i < card1.length; i++) {
//         let title = card1[i].querySelector('#title');
//
//         if (title.innerHTML.toUpperCase().indexOf(input) > -1) {
//             card1[i].style.display = ""
//         } else {
//             card1[i].style.display = "none"
//         }
//     }
//
// }

