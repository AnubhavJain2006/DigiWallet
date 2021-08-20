
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.0/chart.min.js"></script>
<link rel="stylsheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">

	<script type="text/javascript">
	</script>
	<div class="container">

		<canvas id="chartByData"></canvas>

	</div>
	<script type="text/javascript">
		var obj='<%=request.getAttribute("obj")%>';
		const chartData = JSON.parse(obj);
		console.log(chartData);
		var chartKeys = [];
		const ordered = Object.keys(chartData).sort().reduce(
				  (obj, key) => { 
				    obj[key] = chartData[key]; 
				    return obj;
				  }, 
				  {}
				);
		for ( var k in ordered) {
			if (k != 'label'){
				chartKeys.push(k);
			}
		}

		var chartValues = [];
		for ( var k in ordered) {
			if (k != 'label') {
				chartValues.push(ordered[k]);
			}
		}
		let chartHandler = document.getElementById('chartByData').getContext('2d');

		let chartCreator = new Chart(chartHandler, {
			type : 'bar',
			data : {
				labels : chartKeys,
				datasets : [ {
					label : ordered['label'],
					data : chartValues
				} ]
			}
		})
	</script>
