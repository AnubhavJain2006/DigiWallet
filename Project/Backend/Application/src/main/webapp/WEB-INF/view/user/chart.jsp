<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="head.jsp"%>
<title>Chart</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.0/chart.min.js"></script>

<style type="text/css">

</style>
</head>
<%@include file="header.jsp"%>
<div class="app-wrapper">
	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container-xl">
			<canvas id="chartByData" ></canvas>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
		var obj='<%=request.getAttribute("obj")%>';
		const chartData = JSON.parse(obj);
		var chartKeys = [];
		for ( var k in chartData)
			chartKeys.push(k);

		var chartValues = [];
		for ( var k in chartData)
			chartValues.push(chartData[k]);

		console.log(chartValues);
		let chartHandler = document.getElementById('chartByData').getContext(
				'2d');

		let chartCreator = new Chart(chartHandler, {
			type : 'bar',
			data : {
				labels :  chartKeys ,
				datasets : [ {
					label : 'Expenses',
					data : chartValues,
					backgroundColor: [
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
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
		            borderWidth: 2
				} ]
			},
		
		})
	</script>

<%@include file="footer.jsp"%>
</html>
