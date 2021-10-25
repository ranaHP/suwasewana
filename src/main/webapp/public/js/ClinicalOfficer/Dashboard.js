feather.replace()
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['Covid 19', 'Malaria ', 'Dengue', 'Thyroxine ', 'Diabetes', 'Cholesterol'],
        datasets: [{
            label: '2021/10/26',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
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

var ctx2 = document.getElementById('myChart2').getContext('2d');
var myChart2 = new Chart(ctx2, {
    type: 'line',
    data: {
        labels: ['Covid 19', 'Malaria ', 'Dengue', 'Thyroxine ', 'Diabetes', 'Cholesterol'],
        datasets: [{
            label: '2021/10/26',
            data: [12, 19, 3, 5, 2, 13],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
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