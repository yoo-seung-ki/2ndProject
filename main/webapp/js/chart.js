var ctx = document.getElementById('canvas1').getContext('2d');
var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'line',

    // The data for our dataset
    data: {
        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
        datasets: [{
            label: 'My First dataset',
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: [0, 10, 50, 2, 20, 30, 45]
        }]
    },
    // Configuration options go here
    options: {}
});


// let ctx = document.getElementById('canvas2').getContext('2d');
// var chart = new Chart(ctx, {
//     type: 'pie',
//     data: {
//         labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
//         datasets: [{
//             label: '# of Votes',
//             data: [12, 19, 3, 5, 2, 3],
//             borderWidth: 1,
//             backgroundColor: ['#CB4335', '#1F618D', '#F1C40F', '#27AE60', '#884EA0', '#D35400'],
//         }]
//     },
//     options: {
//         maintainAspectRatio: false,
//         plugins: {
//             legend: {
//                 onHover: handleHover,
//                 onLeave: handleLeave
//             }
//         }
//     }
// });
    function handleHover(evt, item, legend) {
        legend.chart.data.datasets[0].backgroundColor.forEach((color, index, colors) => {
            colors[index] = index === item.index || color.length === 9 ? color : color + '4D';
        });
        legend.chart.update();
}
    function handleLeave(evt, item, legend) {
        legend.chart.data.datasets[0].backgroundColor.forEach((color, index, colors) => {
            colors[index] = color.length === 9 ? color.slice(0, -2) : color;
        });
        legend.chart.update();
}