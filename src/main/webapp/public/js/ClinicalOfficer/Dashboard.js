
function chart(data,today){
    feather.replace()
    var ctx = document.getElementById('myChart').getContext('2d');
    let lables=[];
    let count=[];
    data.map(item=>{

        lables.push(item.disease)
        count.push(item.clinicID)
    })

    console.log("a")
    console.log(data)
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: lables,
            datasets: [{
                label:"up to " + today.getFullYear()+" / "+ (today.getMonth()+1) +" / "+ today.getDate(),
                data: count,
                backgroundColor: [
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(64,255,204,0.2)',
                    'rgba(255,223,64,0.2)',
                    'rgba(64,160,255,0.2)',
                    'rgba(220,66,66,0.85)',
                    'rgba(255,0,0,0.85)'
                ],
                borderColor: [
                    'rgba(54, 162, 235, 1)',
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}

function chart1(data,today){
    feather.replace()
    var ctx = document.getElementById('myChart2').getContext('2d');
    let lables=[];
    let count=[];
    data.map(item=>{

        lables.push(item.uname)
        count.push(item.uMobile)
    })

    console.log("a")
    console.log(data)
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: lables,
            datasets: [{
                label:"up to " + today.getFullYear()+" / "+ (today.getMonth()+1) +" / "+ today.getDate(),
                data: count,
                backgroundColor: [
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(64,255,204,0.2)',
                    'rgba(255,223,64,0.2)',
                    'rgba(64,160,255,0.2)',
                    'rgba(220,66,66,0.85)',
                    'rgba(255,0,0,0.85)'
                ],
                borderColor: [
                    'rgba(54, 162, 235, 1)',
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}
//
// var ctx2 = document.getElementById('myChart2').getContext('2d');
// var myChart2 = new Chart(ctx2, {
//     type: 'line',
//     data: {
//         labels: ['Covid 19', 'Malaria ', 'Dengue', 'Thyroxine ', 'Diabetes', 'Cholesterol'],
//         datasets: [{
//             label: '2021/10/26',
//             data: [12, 19, 3, 5, 2, 13],
//             backgroundColor: [
//                 'rgba(255, 99, 132, 0.2)',
//             ],
//             borderColor: [
//                 'rgba(255, 99, 132, 1)',
//                 'rgba(54, 162, 235, 1)',
//                 'rgba(255, 206, 86, 1)',
//                 'rgba(75, 192, 192, 1)',
//                 'rgba(153, 102, 255, 1)',
//                 'rgba(255, 159, 64, 1)'
//             ],
//             borderWidth: 1
//         }]
//     },
//     options: {
//         scales: {
//             y: {
//                 beginAtZero: true
//             }
//         }
//     }
// });
//

// card
class card{
    constructor(containername){
        this.container=document.getElementsByClassName(containername);
        this.init();
    }
    init(){
        let left=document.createElement('div');
        left.classList.add('card-left');

        let right=document.createElement('div');
        left.classList.add('card-right');

        this.container.appendChild
    }

}