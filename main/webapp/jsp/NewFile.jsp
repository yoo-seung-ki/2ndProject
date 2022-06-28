<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>

</head>
<body>
	<div class="graphBox">
		<canvas id="barCanvas" width="384" height="210"></canvas>
	</div>
	
<script>
function barChart(){
	var ctx = document.getElementById("barCanvas").getContext("2d");
	var options = { };
	var barChart = new Chart(ctx).Bar(data, options);
	var data = {
			labels: ["09시", "10시", "11시", "12시", "13시", "14시", "15시", "16시", "17시", "18시", "19시", "20시", "21시", "22시"],
			datasets: [
				{
					label: "",
					fillColor: "rgba(150,200,250,0.5)",
					strokeColor: "rgba(150,200,250,0.8)",
					highlightFill: "rgba(150,200,250,0.75)",
					highlightStroke: "rgba(150,200,250,1)",
					data: [65, 59, 80, 81, 56, 55, 30, 100, 120, 50, 11, 40, 70, 120]
				}
			]
		};
}

</script>
</body>
</html>