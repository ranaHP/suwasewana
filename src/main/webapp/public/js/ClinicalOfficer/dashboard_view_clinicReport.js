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
                    'rgba(255,159,64,0.62)',
                    // 'rgba(64,255,204,0.2)'
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
// function destroy(array,today){
//     let ar=array
//     let a=today
//     console.log(a)
//     ctx.clear();
//     chart(clinicListArray,today)
//     console.log("hi")
//
// }
function chart1(data,today){
    feather.replace()
    var ctx = document.getElementById('myChart1').getContext('2d');
    let lables=[];
    let count=[];
    data.map(item=>{

        lables.push(item.title)
        count.push(item.clinicID)
    })

    console.log("a")
    console.log(data)
    var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: lables,
            datasets: [{
                label:"up to " + today.getFullYear()+" / "+ (today.getMonth()+1) +" / "+ today.getDate(),
                data: count,
                backgroundColor: [
                    'rgba(255,159,64,0.62)',
                    'rgba(64,255,204,0.2)',
                    'rgba(64,255,131,0.62)',
                    'rgba(255,0,0,0.85)',
                    'rgba(64,160,255,0.2)',
                    'rgba(201,64,255,0.2)'
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

function destroy(data,today){
    console.log("h")
    var a = document.getElementById('myChart');
    let icon="a"
    document.getElementsByTagName("canvas")[0].setAttribute("id", icon);


    console.log(a)
    chart3(clinicListArray,sdate,edate)
}

function chart3(data,start,end){
    feather.replace()
    var ctx = document.getElementById('a').getContext('2d');
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
                label:"from " + start+ " to " +end,
                data: count,
                backgroundColor: [
                    'rgba(255,159,64,0.62)',
                    // 'rgba(64,255,204,0.2)'
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