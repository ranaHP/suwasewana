
//     // chart 1
//     var ctx = document.getElementById('myChart');
//     var myChart = new Chart(ctx, {
//         type: 'doughnut',
//         data: {
//             labels: [ 'Fever','Eye diseases'],
//             datasets: [{
//                 label: '# of Votes',
//                 data: [2, 3],
//                 backgroundColor: [
//                     'rgba(255, 99, 132, 0.2)',
//                     'rgba(54, 162, 235, 0.2)',
//                     'rgba(255, 206, 86, 0.2)',
//                     'rgba(75, 192, 192, 0.2)',
//                     'rgba(153, 102, 255, 0.2)',
//                     'rgba(255, 159, 64, 0.2)'
//                 ],
//                 borderColor: [
//                     'rgba(255, 99, 132, 1)',
//                     'rgba(54, 162, 235, 1)',
//                     'rgba(255, 206, 86, 1)',
//                     'rgba(75, 192, 192, 1)',
//                     'rgba(153, 102, 255, 1)',
//                     'rgba(255, 159, 64, 1)'
//                 ],
//                 borderWidth: 1
//             }]
//         },
//         options: {
//             scales: {
//                 y: {
//                     beginAtZero: true
//                 }
//             }
//         }
//     });
//
// // chart2
//
//     var ctx = document.getElementById('myChart1');
//     var myChart = new Chart(ctx, {
//         type: 'doughnut',
//         data: {
//             labels: [ 'Fever','Eye diseases'],
//             datasets: [{
//                 label: '# of Votes',
//                 data: [2, 3],
//                 backgroundColor: [
//                     'rgba(255, 99, 132, 0.2)',
//                     'rgba(54, 162, 235, 0.2)',
//                     'rgba(255, 206, 86, 0.2)',
//                     'rgba(75, 192, 192, 0.2)',
//                     'rgba(153, 102, 255, 0.2)',
//                     'rgba(255, 159, 64, 0.2)'
//                 ],
//                 borderColor: [
//                     'rgba(255, 99, 132, 1)',
//                     'rgba(54, 162, 235, 1)',
//                     'rgba(255, 206, 86, 1)',
//                     'rgba(75, 192, 192, 1)',
//                     'rgba(153, 102, 255, 1)',
//                     'rgba(255, 159, 64, 1)'
//                 ],
//                 borderWidth: 1
//             }]
//         },
//         options: {
//             scales: {
//                 y: {
//                     beginAtZero: true
//                 }
//             }
//         }
//     });
//
//
//
// // chart3
//
//     var ctx = document.getElementById('myChart2');
//     var myChart = new Chart(ctx, {
//         type: 'doughnut',
//         data: {
//             labels: [ 'Fever','Eye diseases'],
//             datasets: [{
//                 label: '# of Votes',
//                 data: [2, 3],
//                 backgroundColor: [
//                     'rgba(255, 99, 132, 0.2)',
//                     'rgba(54, 162, 235, 0.2)',
//                     'rgba(255, 206, 86, 0.2)',
//                     'rgba(75, 192, 192, 0.2)',
//                     'rgba(153, 102, 255, 0.2)',
//                     'rgba(255, 159, 64, 0.2)'
//                 ],
//                 borderColor: [
//                     'rgba(255, 99, 132, 1)',
//                     'rgba(54, 162, 235, 1)',
//                     'rgba(255, 206, 86, 1)',
//                     'rgba(75, 192, 192, 1)',
//                     'rgba(153, 102, 255, 1)',
//                     'rgba(255, 159, 64, 1)'
//                 ],
//                 borderWidth: 1
//             }]
//         },
//         options: {
//             scales: {
//                 y: {
//                     beginAtZero: true
//                 }
//             }
//         }
//     });


// chart4

    function chart(Animal_issue,Animal_issuep,month,premonth){
        feather.replace()
        var ctx = document.getElementById('myChart3').getContext('2d');
        let lables=["Last month","This month"];
        let count=[];
         count.push(Animal_issue)
        count.push(Animal_issuep)

        console.log("a")
        // console.log(data)
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: lables,
                datasets: [{
                    label:"Comparing according to last month",
                    data: count,
                    backgroundColor: [
                        '#c0392b'
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
function chart1(Environment_issues,Environment_issuesp,month,premonth){
    feather.replace()
    var ctx = document.getElementById('myChart4').getContext('2d');
    let lables=["Last month","This month"];
    let count=[];
    count.push(Environment_issuesp)
    count.push(Environment_issues)
    // lables.push(premonth)
    // lables.push(month)

    console.log("a")
    // console.log(data)
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: lables,
            datasets: [{
                label:"Comparing according to last month",
                data: count,
                backgroundColor: [
                    '#3498db',
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
function chart2(Land_issues,Land_issuesp,month,premonth){
    feather.replace()
    var ctx = document.getElementById('myChart5').getContext('2d');
    let lables=["Last month","This month"];
    let count=[];
    count.push(Land_issuesp)
    count.push(Land_issues)
    // lables.push(premonth)
    // lables.push(month)

    console.log("a")
    // console.log(data)
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: lables,
            datasets: [{
                label:"Comparing according to last month",
                data: count,
                backgroundColor: [
                    '#2ecc71',
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
function chart3(Noise_issue,Noise_issuep,month,premonth){
    feather.replace()
    var ctx = document.getElementById('myChart6').getContext('2d');
    let lables=["Last month","This month"];
    let count=[];
    count.push(Noise_issuep)
    count.push(Noise_issue)
    // lables.push(premonth)
    // lables.push(month)

    console.log("a")
    // console.log(data)
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: lables,
            datasets: [{
                label:"Comparing according to last month",
                data: count,
                backgroundColor: [
                    '#8e44ad',
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
function chart4(Food_issues,Food_issuesp,month,premonth){
    feather.replace()
    var ctx = document.getElementById('myChart7').getContext('2d');
    let lables=["Last month","This month"];
    let count=[];
    count.push(Food_issuesp)
    count.push(Food_issues)
    // lables.push(premonth)
    // lables.push(month)

    console.log("a")
    // console.log(data)
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: lables,
            datasets: [{
                label:"Comparing according to last month",
                data: count,
                backgroundColor: [
                    '#f1c40f',

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
function chart5(other,otherp,month,premonth){
    feather.replace()
    var ctx = document.getElementById('myChart8').getContext('2d');
    let lables=["Last month","This month"];
    let count=[];
    count.push(otherp)
    count.push(other)
    // lables.push(premonth)
    // lables.push(month)

    console.log("a")
    // console.log(data)
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: lables,
            datasets: [{
                label:"Comparing according to last month",
                data: count,
                backgroundColor: [
                    '273c75',
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



//     var ctx = document.getElementById('myChart3');
//     var myChart = new Chart(ctx, {
//         type: 'line',
//
//         data: {
//             labels: [ 'Fever','Eye diseases'],
//             datasets: [{
//                 label: '# of Votes',
//                 data: [2, 3],
//                 backgroundColor: [
//                     'rgba(255, 99, 132, 0.2)',
//                     'rgba(54, 162, 235, 0.2)',
//                     'rgba(255, 206, 86, 0.2)',
//                     'rgba(75, 192, 192, 0.2)',
//                     'rgba(153, 102, 255, 0.2)',
//                     'rgba(255, 159, 64, 0.2)'
//                 ],
//                 borderColor: [
//                     'rgba(255, 99, 132, 1)',
//                     'rgba(54, 162, 235, 1)',
//                     'rgba(255, 206, 86, 1)',
//                     'rgba(75, 192, 192, 1)',
//                     'rgba(153, 102, 255, 1)',
//                     'rgba(255, 159, 64, 1)'
//                 ],
//                 borderWidth: 1
//             }]
//         },
//         options: {
//             scales: {
//                 y: {
//                     beginAtZero: true
//                 }
//             }
//         }
//     });
//
// // chart5
//
//     var ctx = document.getElementById('myChart4');
//     var myChart = new Chart(ctx, {
//         type: 'line',
//         data: {
//             labels: [ 'Fever','Eye diseases'],
//             datasets: [{
//                 label: '# of Votes',
//                 data: [2, 3],
//                 backgroundColor: [
//                     'rgba(255, 99, 132, 0.2)',
//                     'rgba(54, 162, 235, 0.2)',
//                     'rgba(255, 206, 86, 0.2)',
//                     'rgba(75, 192, 192, 0.2)',
//                     'rgba(153, 102, 255, 0.2)',
//                     'rgba(255, 159, 64, 0.2)'
//                 ],
//                 borderColor: [
//                     'rgba(255, 99, 132, 1)',
//                     'rgba(54, 162, 235, 1)',
//                     'rgba(255, 206, 86, 1)',
//                     'rgba(75, 192, 192, 1)',
//                     'rgba(153, 102, 255, 1)',
//                     'rgba(255, 159, 64, 1)'
//                 ],
//                 borderWidth: 1
//             }]
//         },
//         options: {
//             scales: {
//                 y: {
//                     beginAtZero: true
//                 }
//             }
//         }
//     });
//
// // chart6
//
//     var ctx = document.getElementById('myChart5');
//     var myChart = new Chart(ctx, {
//         type: 'line',
//         data: {
//             labels: [ 'Fever','Eye diseases'],
//             datasets: [{
//                 label: '# of Votes',
//                 data: [2, 3],
//                 backgroundColor: [
//                     'rgba(255, 99, 132, 0.2)',
//                     'rgba(54, 162, 235, 0.2)',
//                     'rgba(255, 206, 86, 0.2)',
//                     'rgba(75, 192, 192, 0.2)',
//                     'rgba(153, 102, 255, 0.2)',
//                     'rgba(255, 159, 64, 0.2)'
//                 ],
//                 borderColor: [
//                     'rgba(255, 99, 132, 1)',
//                     'rgba(54, 162, 235, 1)',
//                     'rgba(255, 206, 86, 1)',
//                     'rgba(75, 192, 192, 1)',
//                     'rgba(153, 102, 255, 1)',
//                     'rgba(255, 159, 64, 1)'
//                 ],
//                 borderWidth: 1
//             }]
//         },
//         options: {
//             scales: {
//                 y: {
//                     beginAtZero: true
//                 }
//             }
//         }
//     });
//
//
// // chart7
//
//     var ctx = document.getElementById('myChart6');
//     var myChart = new Chart(ctx, {
//         type: 'line',
//         data: {
//             labels: [ 'Fever','Eye diseases'],
//             datasets: [{
//                 label: '# of Votes',
//                 data: [2, 3],
//                 backgroundColor: [
//                     'rgba(255, 99, 132, 0.2)',
//                     'rgba(54, 162, 235, 0.2)',
//                     'rgba(255, 206, 86, 0.2)',
//                     'rgba(75, 192, 192, 0.2)',
//                     'rgba(153, 102, 255, 0.2)',
//                     'rgba(255, 159, 64, 0.2)'
//                 ],
//                 borderColor: [
//                     'rgba(255, 99, 132, 1)',
//                     'rgba(54, 162, 235, 1)',
//                     'rgba(255, 206, 86, 1)',
//                     'rgba(75, 192, 192, 1)',
//                     'rgba(153, 102, 255, 1)',
//                     'rgba(255, 159, 64, 1)'
//                 ],
//                 borderWidth: 1
//             }]
//         },
//         options: {
//             scales: {
//                 y: {
//                     beginAtZero: true
//                 }
//             }
//         }
//     });
//
// // chart8
//
//     var ctx = document.getElementById('myChart7');
//     var myChart = new Chart(ctx, {
//         type: 'line',
//         data: {
//             labels: [ 'Fever','Eye diseases'],
//             datasets: [{
//                 label: '# of Votes',
//                 data: [2, 3],
//                 backgroundColor: [
//                     'rgba(255, 99, 132, 0.2)',
//                     'rgba(54, 162, 235, 0.2)',
//                     'rgba(255, 206, 86, 0.2)',
//                     'rgba(75, 192, 192, 0.2)',
//                     'rgba(153, 102, 255, 0.2)',
//                     'rgba(255, 159, 64, 0.2)'
//                 ],
//                 borderColor: [
//                     'rgba(255, 99, 132, 1)',
//                     'rgba(54, 162, 235, 1)',
//                     'rgba(255, 206, 86, 1)',
//                     'rgba(75, 192, 192, 1)',
//                     'rgba(153, 102, 255, 1)',
//                     'rgba(255, 159, 64, 1)'
//                 ],
//                 borderWidth: 1
//             }]
//         },
//         options: {
//             scales: {
//                 y: {
//                     beginAtZero: true
//                 }
//             }
//         }
//     });
//
// // chart9
//
//     var ctx = document.getElementById('myChart8');
//     var myChart = new Chart(ctx, {
//         type: 'line',
//         data: {
//             labels: [ 'previous month','this month'],
//             datasets: [{
//                 label: '# of Votes',
//                 data: [2, 3],
//                 backgroundColor: [
//                     'rgba(255, 99, 132, 0.2)',
//                     'rgba(54, 162, 235, 0.2)',
//                     'rgba(255, 206, 86, 0.2)',
//                     'rgba(75, 192, 192, 0.2)',
//                     'rgba(153, 102, 255, 0.2)',
//                     'rgba(255, 159, 64, 0.2)'
//                 ],
//                 borderColor: [
//                     'rgba(255, 99, 132, 1)',
//                     'rgba(54, 162, 235, 1)',
//                     'rgba(255, 206, 86, 1)',
//                     'rgba(75, 192, 192, 1)',
//                     'rgba(153, 102, 255, 1)',
//                     'rgba(255, 159, 64, 1)'
//                 ],
//                 borderWidth: 1
//             }]
//         },
//         options: {
//             scales: {
//                 y: {
//                     beginAtZero: true
//                 }
//             }
//         }
//     });
//
//
// // chart9
//
//     var ctx = document.getElementById('myChart10');
//     var myChart = new Chart(ctx, {
//         type: 'line',
//         data: {
//             labels: [ 'previous month','this month'],
//             datasets: [{
//                 label: '# of Votes',
//                 data: [2, 3],
//                 backgroundColor: [
//                     'rgba(255, 99, 132, 0.2)',
//                     'rgba(54, 162, 235, 0.2)',
//                     'rgba(255, 206, 86, 0.2)',
//                     'rgba(75, 192, 192, 0.2)',
//                     'rgba(153, 102, 255, 0.2)',
//                     'rgba(255, 159, 64, 0.2)'
//                 ],
//                 borderColor: [
//                     'rgba(255, 99, 132, 1)',
//                     'rgba(54, 162, 235, 1)',
//                     'rgba(255, 206, 86, 1)',
//                     'rgba(75, 192, 192, 1)',
//                     'rgba(153, 102, 255, 1)',
//                     'rgba(255, 159, 64, 1)'
//                 ],
//                 borderWidth: 1
//             }]
//         },
//         options: {
//             scales: {
//                 y: {
//                     beginAtZero: true
//                 }
//             }
//         }
//     });
//
// }