<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="head.jsp"%>
<title>Report</title>
<style>
.hide-calender {
	display: none;
}

.show-calender {
	display: block;
}
</style>
</head>
<%@include file="header.jsp"%>
<div class="app-wrapper">
	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container-xl">
			<form>
				<div class="row mb-3">
					<div class="col-3" id="allCalender">
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
							<span> From </span> <input class="form-control" type="date">
							<span> To </span> <input class="form-control" type="date">
						</div>
					</div>
					<div class="col-3"></div>
					<div class="col-2">
						<div class="form-group">
							<select class="form-select" id="reportCategory">
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
			<div class="container"></div>
		</div>
		<div class="displayTransaction"></div>

		<%@include file="footer.jsp"%>
		</body>
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
						let url = "/ExpenseApplication/user/report/getTransactionByWeek/"+date.startDate.getTime()+"/"+date.endDate.getTime();
						console.log(url);
						getTransactionAJAX(url);
					}
				}
				if(parentDiv.is('#monthCalender')){
					console.log('It is yearcalender')
					/* 2021-02 */
					let [year,month] = calenderInputValue.split("-");
					if(year && month){
						console.log("valid");
						let url = "/ExpenseApplication/user/report/getTransactionByMonth/"+month+"/"+year;
						console.log(url);
						getTransactionAJAX(url);
					}
				}
				if(parentDiv.is('#annualCalender')){
					console.log('It is annual calender')
					/* 2021 */
					let year = calenderInputValue;
					if(year) {
						console.log("valid");
						let url = "/ExpenseApplication/user/report/getTransactionByYear/"+year;
						console.log(url);
						getTransactionAJAX(url);
					}
				}
				if(parentDiv.is('#periodCalender')){
					console.log('It is period calender')
					let calenderInputValue2 = calenderInput[1].value;
					let startDate = new Date(calenderInputValue);
					let endDate = new Date(calenderInputValue2);
					console.log(startDate);
					console.log(endDate);
					if(startDate && endDate && (startDate.getTime() < endDate.getTime())){
						console.log("valid");
						let url = "/ExpenseApplication/user/report/getTransactionByPeriod/"+startDate.getTime()+"/"+endDate.getTime();
						console.log(url);
						getTransactionAJAX(url);
					}
				}
				
			})
			
		</script>

		<script
			src="https://raw.githack.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js"></script>

		<script>
	function GeneratePdf() {
		const mainTable = document.getElementById('myTable');
		html2pdf().from(mainTable).save();
	}
</script>

		<script type="text/javascript">
		async function getTransactionAJAX (url) {
	        let response  = await fetch(url).then(data => data.text())
	            $('.displayTransaction')[0].innerHTML = response;
	            console.log(response);
	    }
		</script>
</html>