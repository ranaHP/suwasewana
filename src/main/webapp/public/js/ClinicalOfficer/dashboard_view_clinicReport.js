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