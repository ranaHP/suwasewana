const monthNames = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
];
var disease_growth = document.getElementById('disease_growth').getContext('2d');
var disease_growth = new Chart(disease_growth, {
    type: 'bar',
    data: {
        labels: ['Covid19', 'Dengue Fever', 'ALRI', 'Typhoid Fever', 'Meningitis', 'Tuberculosis' , 'Cholera', 'Yellow Fever', 'Chicken pox', 'Malaria'],
        datasets: [{
            label:"From : 1 of " +   monthNames[new Date().getMonth()] + " |  To : " + new Date().getDate() +  " of " + monthNames[new Date().getMonth()],
            data: [1211, 841, 841, 641, 531, 350, 333, 203, 201, 101],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 0.3)',
                'rgba(54, 162, 235, 0.3)',
                'rgba(255, 206, 86, 0.3)',
                'rgba(75, 192, 192, 0.3)',
                'rgba(153, 102, 255, 0.3)',
                'rgba(255, 159, 64, 0.3)'
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

var patient_Growth = document.getElementById('patient_Growth').getContext('2d');
var patient_Growth = new Chart(patient_Growth, {
    type: 'line',
    data: {
        labels: ['Eastern', 'North Central', 'Uva', 'Western', 'Southern', 'Northern' , 'Central' , 'Sabaragamuwa' , 'North Western'],
        datasets: [{
            label: "From : 1 of " +   monthNames[new Date().getMonth()] + " |  To : " + new Date().getDate() +  " of " + monthNames[new Date().getMonth()],
            data: [120, 109, 83, 73, 61, 58 ,50,20,15],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [

                'rgba(75, 192, 192, 1)'
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



mapboxgl.accessToken = 'pk.eyJ1IjoiaGFuc2FuYTg3NiIsImEiOiJja3UwMWtrb3ExNjd2Mm9xaDh2MjdjM2FoIn0.6rDLn-mL41GbBUIW3B8MIA';
const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v11',
    center: [80.4771, 8.0994334],
    zoom: 6.2
});

map.on('load', () => {
    // Add a GeoJSON source with 3 points.
    map.addSource('points', {
        'type': 'geojson',
        'data': {
            'type': 'FeatureCollection',
            'features': [
                {
                    'type': 'Feature',
                    'properties': {},
                    'geometry': {
                        'type': 'Point',
                        'coordinates': [80.4771, 7.2394334]
                    }
                },
                {
                    'type': 'Feature',
                    'properties': {},
                    'geometry': {
                        'type': 'Point',
                        'coordinates': [80.9771, 8.0994334]
                    }
                },
                {
                    'type': 'Feature',
                    'properties': {},
                    'geometry': {
                        'type': 'Point',
                        'coordinates': [80.4771, 9.0994334]
                    }
                },
                {
                    'type': 'Feature',
                    'properties': {},
                    'geometry': {
                        'type': 'Point',
                        'coordinates': [80.4771, 6.5394334]
                    }
                },
                {
                    'type': 'Feature',
                    'properties': {},
                    'geometry': {
                        'type': 'Point',
                        'coordinates': [81.0771, 6.0994334]
                    }
                },
                {
                    'type': 'Feature',
                    'properties': {},
                    'geometry': {
                        'type': 'Point',
                        'coordinates': [80.4771, 6.1994334]
                    }
                }
            ]
        }
    });
    // Add a circle layer
    map.addLayer({
        'id': 'circle',
        'type': 'circle',
        'source': 'points',
        'paint': {
            'circle-color': '#4264fb',
            'circle-radius': 8,
            'circle-stroke-width': 2,
            'circle-stroke-color': '#ffffff'
        }
    });

    // Center the map on the coordinates of any clicked circle from the 'circle' layer.
    map.on('click', 'circle', (e) => {
        map.flyTo({
            center: e.features[0].geometry.coordinates
        });
    });

    // Change the cursor to a pointer when the it enters a feature in the 'circle' layer.
    map.on('mouseenter', 'circle', () => {
        map.getCanvas().style.cursor = 'pointer';
    });

    // Change it back to a pointer when it leaves.
    map.on('mouseleave', 'circle', () => {
        map.getCanvas().style.cursor = '';
    });
});