// 첫번째 차트
var ctx = document.getElementById('canvas1').getContext('2d');
var chart = new Chart(ctx, {
    data: {
        datasets: [{
            type: 'bar',
            label: '구직자수',
            data: [0, 766, 3911, 2583, 2783, 3343, 2183]
        }, {
            type: 'line',
            label: '취업자수',
            data: [0, 593, 4001, 2274, 2101, 2506, 1549],
        }],
        labels: ['14세이하', '15~19세', '20대', '30대', '40대', '50대', '60~64세'],

    },   
    
    options: {
    },
});

// 두번째 차트
let ctx2 = document.getElementById('canvas2').getContext('2d');
var chart2 = new Chart(ctx2, {
    type: 'pie',
    data: {
        labels: ['초졸', '중졸', '고졸', '대졸', '미분류'],
        datasets: [{
            label: '학력별',
            data: [596, 1392, 6285, 2736, 9],
            borderWidth: 1,
            backgroundColor: ['#4a148c', '#3e2723', '#263238', '#f57f17', '#fff9c4'],
        }]
    },
    options: {
        maintainAspectRatio: false,
        plugins: {
            legend: {}
        }
    }
});
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