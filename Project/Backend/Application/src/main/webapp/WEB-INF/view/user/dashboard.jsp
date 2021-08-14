<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="head.jsp"%>
<title>Dashboard</title>
</head>
<%@include file="header.jsp"%>
<div class="app-wrapper">
	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container-xl">
			<div class="row g-4 mb-4">
				<div class="col-6 col-lg-3">
					<div
						class="app-card app-card-stat shadow-lg p-3 mb-5 bg-body rounded">
						<div class="app-card-body p-3 p-lg-4">
							<h4 class="stats-type mb-1">Income</h4>
							<div class="stats-figure">25000</div>
						</div>
						<!--//app-card-body-->
					</div>
					<!--//app-card-->
				</div>
				<!--//col-->

				<div class="col-6 col-lg-3">
					<div
						class="app-card app-card-stat shadow-lg p-3 mb-5 bg-body rounded">
						<div class="app-card-body p-3 p-lg-4">
							<h4 class="stats-type mb-1">Expenses</h4>
							<div class="stats-figure">5000</div>
						</div>
						<!--//app-card-body-->
					</div>
					<!--//app-card-->
				</div>
				<!--//col-->
				<div class="col-6 col-lg-3">
					<div
						class="app-card app-card-stat shadow-lg p-3 mb-5 bg-body rounded">
						<div class="app-card-body p-3 p-lg-4">
							<h4 class="stats-type mb-1">Total Expense</h4>
							<div class="stats-figure">10000</div>

						</div>
						<!--//app-card-body-->
					</div>
					<!--//app-card-->
				</div>
				<!--//col-->
				<div class="col-6 col-lg-3">
					<div
						class="app-card app-card-stat shadow-lg p-3 mb-5 bg-body rounded">
						<div class="app-card-body p-3 p-lg-4">
							<h4 class="stats-type mb-1">Number of Transaction</h4>
							<div class="stats-figure">2</div>
						</div>
						<!--//app-card-body-->
					</div>
					<!--//app-card-->
				</div>
				<!--//col-->

				<!-- Write code here -->
				<div class="container">
					<div class="py-2 border-bottom">
						<h5 class="h5">
							<i class="fas fa-chevron-right"></i> Account
						</h5>
					</div>

					<div class=" mx-2 mt-4 bg-white shadow rounded ">
						<div class="table-responsive">
							<table
								class="table table-bordered table-hover rounded text-center">
								<thead class="table-secondary">
									<tr>
										<th>Account Name</th>
										<th>Amount</th>
										<th>Description</th>
									</tr>
								</thead>
								<tbody>
									<tr>

										<td>Cash</td>
										<td>2400</td>
										<td>HELLO JI</td>
									</tr>
									<tr>
										<td>Cash</td>
										<td>2400</td>
										<td>HELLO JI</td>
									</tr>
									<tr>
										<td>Cash</td>
										<td>2400</td>
										<td>HELLO JI</td>
									</tr>
									<tr>
										<td>Cash</td>
										<td>2400</td>
										<td>HELLO JI</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="footer.jsp"%>

		</body>
</html>