<%@page import="com.bean.UserBean"%>
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
<style>
.hide-calender {
	display: none;
}

.show-calender {
	display: block;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.0/chart.min.js"></script>
<link rel="stylsheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">

</head>
<%@include file="header.jsp"%>
<div class="app-wrapper">
	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container-xl">
			<form>
				<div class="row mb-3">
					<div class="col-4" id="allCalender">
						<div class="" id="weekCalender">
							<input class="form-control" type="week">
						</div>
						<div class="" id="monthCalender">
							<input class="form-control" type="month">
						</div>
						<div class="" id="annualCalender">
							<input class="form-control" type="number" min="1900" max="3000">
						</div>
						<div class="" id="periodCalender">
							<input class="form-control" type="date">
						</div>
					</div>
					<div class="col-3"></div>
					<div class="col-3">
						<div class="form-group">
							<select class="form-control" id="reportCategory">
								<option value="Weekly">Weekly</option>
								<option value="Monthly">Monthly</option>
								<option value="Annually">Annually</option>
								<option value="Period">Period</option>
							</select>
						</div>
					</div>
					<div class="col-2">
						<button type="button" class="btn"
							style="background-color: #51B37F;" id="renderData">Submit</button>
					</div>
				</div>
			</form>
			<hr>
			
			<nav id="orders-table-tab"
			class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
			<a
				class="flex-sm-fill text-sm-center nav-link"
				id="transaction-expense-tab" data-bs-toggle="tab"
				href="#transaction-expense" role="tab"
				aria-controls="transaction-expense" aria-selected="false">Expense</a>
			<a class="flex-sm-fill text-sm-center nav-link"
				id="transaction-income-tab" data-bs-toggle="tab"
				href="#transaction-income" role="tab"
				aria-controls="transaction-income" aria-selected="false">Income</a>
			</nav>
		<div class="tab-content" id="orders-table-tab-content">
			<div class="tab-pane fade show active" id="transaction-expense"
				role="tabpanel" aria-labelledby="transaction-all-tab">
					<div class="container">
						<canvas id="chartByDataForExpense"></canvas>
					</div>
			</div>
			<!--//tab-pane-->

			<div class="tab-pane fade" id="transaction-income" role="tabpanel"
				aria-labelledby="transaction-expense-tab">
					<div class="container">
						<canvas id="chartByDataForIncome"></canvas>
					</div>
			</div>
			<!--//tab-pane-->

		</div>
			
			
		</div>
	</div>
</div>
<script type="text/javascript">
		let chartHandler;

		let chartCreator ;
		function getChart(data){
			if(chartCreator != undefined){
				console.log('chart is being to destroy')
				chartCreator.destroy();
				console.log('chart is destroy')
			}
			var obj= data;
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
			

			chartCreator = new Chart(chartHandler, {
				type : 'bar',
				data : {
					labels : chartKeys,
					datasets : [ {
						label : ordered['label'],
						data : chartValues
					} ]
				}
			})
		}
		
	</script>
<script type="text/javascript">
			$('#reportCategory').change(function() {
				hideAllCalender();
				if (this.value == 'Weekly') {
					$('#weekCalender').addClass('show-calender');
				}

				if (this.value == 'Monthly') {
					$('#monthCalender').addClass('show-calender');
				}

				if (this.value == 'Annually') {
					$('#annualCalender').addClass('show-calender');
				}

				if (this.value == 'Period') {
					$('#periodCalender').addClass('show-calender');
				}
			})

			function hideAllCalender() {
				$('#allCalender').children().each(function(e) {
					$(this).addClass('hide-calender');
					$(this).removeClass('show-calender');
				})
			}
			hideAllCalender();
			$('#weekCalender').addClass('show-calender');

			function getDateOfISOWeek(w, y) {
				var simple = new Date(y, 0, 1 + (w - 1) * 7);
				var dow = simple.getDay();
				var ISOweekStart = simple;
				if (dow <= 4)
					ISOweekStart
							.setDate(simple.getDate() - simple.getDay() + 1);
				else
					ISOweekStart
							.setDate(simple.getDate() + 8 - simple.getDay());
				let date = {
					startDate : ISOweekStart,
					endDate : new Date(ISOweekStart.getTime() + 518400000)
				}
				return date;
			}
			
			$('#renderData').on('click',function(e){
				$('#allCalender').children('.show-calender');
				let parentDiv = $('#allCalender').children('.show-calender');
				let calenderInput = parentDiv.children('input')
				let calenderInputValue = calenderInput[0].value
				console.log(calenderInputValue)
				if(parentDiv.is('#weekCalender')){
					console.log('It is week calender')
					/* 2021-W31 */
					let [year,week] = calenderInputValue.split("-W");
					if(year && week){
						let date = getDateOfISOWeek(week,year);
						console.log(date);
						let urlForExpense = "/ExpenseApplication/user/chart/week/EXPENSE/"+date.startDate.getTime()+"/"+date.endDate.getTime();
						console.log(urlForExpense);
						getChartAJAX(urlForExpense,'EXPENSE');
						let urlForIncome = "/ExpenseApplication/user/chart/week/INCOME/"+date.startDate.getTime()+"/"+date.endDate.getTime();
						console.log(urlForIncome);
						getChartAJAX(urlForIncome,'INCOME');
					}
				}
				if(parentDiv.is('#monthCalender')){
					console.log('It is yearcalender')
					/* 2021-02 */
					let [year,month] = calenderInputValue.split("-");
					if(year && month){
						console.log("valid");
						let urlForExpense = "/ExpenseApplication/user/chart/month/EXPENSE/"+month+"/"+year;
						console.log(urlForExpense);
						getChartAJAX(urlForExpense,'EXPENSE');
						let urlForIncome = "/ExpenseApplication/user/chart/month/INCOME/"+month+"/"+year;
						console.log(urlForIncome);
						getChartAJAX(urlForIncome,'INCOME');
					}
				}
				if(parentDiv.is('#annualCalender')){
					console.log('It is annual calender')
					/* 2021 */
					let year = calenderInputValue;
					if(year <= 3000 && year>=1900) {
						console.log("valid");
						let urlForExpense = "/ExpenseApplication/user/chart/year/EXPENSE/"+year;
						console.log(url);
						getChartAJAX(urlForExpense,'EXPENSE');
						let urlForIncome = "/ExpenseApplication/user/chart/year/INCOME/"+year;
						console.log(urlForIncome);
						getChartAJAX(urlForIncome,'INCOME');
					}
				}
				if(parentDiv.is('#periodCalender')){
					console.log('It is period calender')
					let startDate = new Date(calenderInputValue);
					console.log(startDate);
					if(startDate){
						console.log("valid");
						let urlForExpense = "/ExpenseApplication/user/chart/date/EXPENSE/"+startDate.getTime();
						console.log(urlForExpense);
						getChartAJAX(urlForExpense,'EXPENSE');
						let urlForIncome = "/ExpenseApplication/user/chart/date/INCOME/"+startDate.getTime();
						console.log(urlForIncome);
						getChartAJAX(urlForIncome,'INCOME');
					}
				}
				
			})
			
		</script>

<script type="text/javascript">
		async function getChartAJAX (url,type) {
	        let response  = await fetch(url).then(data => data.text())
	            /* $('.displayChart')[0].innerHTML = response; */
	            console.log(response);
	            if(type=='INCOME'){
	            	
	            	chartHandler = document.getElementById('chartByDataForExpense').getContext('2d')
	            	chartCreator = new Chart(chartHandler, {});
	            }
	            if(type=='EXPENSE'){
	            	
	            	chartHandler = document.getElementById('chartByDataForIncome').getContext('2d')
	            	chartCreator = new Chart(chartHandler, {});
	            }
	            getChart(response);
	    }
		</script>

</body>
<%@include file="footer.jsp"%>
</html>