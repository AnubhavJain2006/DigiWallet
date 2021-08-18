<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">

	<div class="row g-3 mb-4 align-items-center justify-content-between">
		<div class="col-auto">
			<h1 class="app-page-title mb-0">Orders</h1>
		</div>

		<!--//table-utilities-->
	</div>
	<!--//col-auto-->
</div>
<!--//row-->

<script>
		
		re='<%=session.getAttribute("rowsAffected")%>';
	var h=re;
	console.log("Value is "+h)
</script>
<nav id="orders-table-tab"
	class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
	<a class="flex-sm-fill text-sm-center nav-link active"
		id="transaction-all-tab" data-bs-toggle="tab" href="#transaction-all"
		role="tab" aria-controls="transaction-all" aria-selected="true">All
		Record</a> <a class="flex-sm-fill text-sm-center nav-link"
		id="transaction-expense-tab" data-bs-toggle="tab"
		href="#transaction-expense" role="tab"
		aria-controls="transaction-expense" aria-selected="false">Expense</a>
	<a class="flex-sm-fill text-sm-center nav-link"
		id="transaction-income-tab" data-bs-toggle="tab"
		href="#transaction-income" role="tab"
		aria-controls="transaction-income" aria-selected="false">Income</a>
</nav>


<div class="tab-content" id="orders-table-tab-content">
	<div class="tab-pane fade show active" id="transaction-all"
		role="tabpanel" aria-labelledby="transaction-all-tab">
		<div class="app-card app-card-orders-table shadow-sm mb-5">
			<div class="app-card-body">
				<div class="table-responsive">
					<table class="table app-table-hover mb-0 text-left" id="myTable">
						<thead>
							<tr>
								<th class="cell">Date</th>
								<th class="cell">Income/Expense</th>

								<th class="cell">Account Name</th>
								<th class="cell">Category Name</th>
								<th class="cell">Sub Category Name</th>
								<th class="cell">Amount</th>
								<th class="cell">Note</th>
								<th class="cell">Action</th>
							</tr>
						</thead>
						<tbody>
							<!-- allRecordsList -->
							<c:forEach items="${allRecordsList}" var="tbean">
								<tr>
									<td class="cell">${tbean.trans_date}</td>
									<c:choose>
										<c:when test="${tbean.trans_type=='EXPENSE'}">
											<td class="cell"><span class="badge bg-danger">${tbean.trans_type}</span></td>
										</c:when>
										<c:when test="${tbean.trans_type=='INCOME'}">
											<td class="cell"><span class="badge bg-success">${tbean.trans_type}</span></td>
										</c:when>
									</c:choose>
									<td class="cell">${tbean.trans_account_name }</td>
									<td class="cell">${tbean.trans_category_name}</td>
									<td class="cell">${tbean.trans_sub_category_name}</td>
									<td class="cell">${tbean.trans_amount}</td>
									<td class="cell">${tbean.trans_note}</td>
									<td class="cell"><a href="transaction/delete/${tbean.trans_id}"
										class="btn btn-danger btn-sm">Delete</a><a
										href="transaction/update/${tbean.trans_id} onclick="confirmDelete()"
										class="btn btn-sm btn-warning">Update</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!--//table-responsive-->

			</div>
			<!--//app-card-body-->
		</div>
		<!--//app-card-->
		<!--//app-pagination-->

	</div>
	<!--//tab-pane-->

	<div class="tab-pane fade" id="transaction-expense" role="tabpanel"
		aria-labelledby="transaction-expense-tab">
		<div class="app-card app-card-orders-table mb-5">
			<div class="app-card-body">
				<div class="table-responsive">
					<table class="table app-table-hover mb-0 text-left" id="myTable1">
						<thead>
							<tr>
								<th class="cell">Date</th>
								<th class="cell">Account Name</th>
								<th class="cell">Category Name</th>
								<th class="cell">Sub Category Name</th>
								<th class="cell">Amount</th>
								<th class="cell">Note</th>
								<th class="cell">Action</th>
							</tr>
						</thead>
						<tbody>
							<!-- allRecordsList -->
							<c:forEach items="${allRecordsList}" var="tbean">
								<c:if test="${tbean.trans_type=='EXPENSE'}">
									<tr>
										<td class="cell">${tbean.trans_date}</td>
										<td class="cell">${tbean.trans_account_name }</td>
										<td class="cell">${tbean.trans_category_name}</td>
										<td class="cell">${tbean.trans_sub_category_name}</td>
										<td class="cell">${tbean.trans_amount}</td>
										<td class="cell">${tbean.trans_note}</td>
										<td class="cell"><a href="transaction/delete/${tbean.trans_id}"
											class="btn btn-danger btn-sm">Delete</a><a
											href="transaction/update/${tbean.trans_id}"
											class="btn btn-sm btn-warning">Update</a></td>
									</tr>

								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!--//table-responsive-->
			</div>
			<!--//app-card-body-->
		</div>
		<!--//app-card-->
	</div>
	<!--//tab-pane-->

	<div class="tab-pane fade" id="transaction-income" role="tabpanel"
		aria-labelledby="transaction-income-tab">
		<div class="app-card app-card-orders-table mb-5">
			<div class="app-card-body">
				<div class="table-responsive">
					<table class="table app-table-hover mb-0 text-left" id="myTable2">
						<thead>
							<tr>
								<th class="cell">Date</th>
								<th class="cell">Account Name</th>
								<th class="cell">Category Name</th>
								<th class="cell">Sub Category Name</th>
								<th class="cell">Amount</th>
								<th class="cell">Note</th>
								<th class="cell">Action</th>
							</tr>
						</thead>
						<tbody>
							<!-- allRecordsList -->
							<c:forEach items="${allRecordsList}" var="tbean">
								<c:if test="${tbean.trans_type=='INCOME'}">
									<tr>
										<td class="cell">${tbean.trans_date}</td>
										<td class="cell">${tbean.trans_account_name }</td>
										<td class="cell">${tbean.trans_category_name}</td>
										<td class="cell">${tbean.trans_sub_category_name}</td>
										<td class="cell">${tbean.trans_amount}</td>
										<td class="cell">${tbean.trans_note}</td>
										<td class="cell"><a href="transaction/delete/${tbean.trans_id}"
											class="btn btn-danger btn-sm">Delete</a><a
											href="transaction/update/${tbean.trans_id}"
											class="btn btn-sm btn-warning">Update</a></td>
									</tr>

								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!--//table-responsive-->
			</div>
			<!--//app-card-body-->
		</div>
		<!--//app-card-->
	</div>
	<!--//tab-pane-->
	<div class="tab-pane fade" id="orders-cancelled" role="tabpanel"
		aria-labelledby="orders-cancelled-tab">
		<div class="app-card app-card-orders-table mb-5">
			<div class="app-card-body">
				<div class="table-responsive">
					<table class="table mb-0 text-left">
						<thead>
							<tr>
								<th class="cell">Order</th>
								<th class="cell">Product</th>
								<th class="cell">Customer</th>
								<th class="cell">Date</th>
								<th class="cell">Status</th>
								<th class="cell">Total</th>
								<th class="cell"></th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td class="cell">#15342</td>
								<td class="cell"><span class="truncate">Justo
										feugiat neque</span></td>
								<td class="cell">Reina Brooks</td>
								<td class="cell"><span class="cell-data">12 Oct</span><span
									class="note">04:23 PM</span></td>
								<td class="cell"><span class="badge bg-danger">Cancelled</span></td>
								<td class="cell">$59.00</td>
								<td class="cell"><a class="btn-sm app-btn-secondary"
									href="#">View</a></td>
							</tr>

						</tbody>
					</table>
				</div>
				<!--//table-responsive-->
			</div>
			<!--//app-card-body-->
		</div>
		<!--//app-card-->
	</div>
	<!--//tab-pane-->
</div>
<!--//tab-content-->


</div>