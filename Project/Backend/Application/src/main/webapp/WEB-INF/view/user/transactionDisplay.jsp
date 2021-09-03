<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<div class="modal fade" id="updateModalForExpense" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content p-4">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Update Expense</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<f:form modelAttribute="tbean" action="updateTransaction"
				method="Post">
				<div class="row mb-3">
					<label for="trans_amount" class="col-sm-4 col-form-label">Id</label>
					<div class="col-sm-7">
						<f:input type="text" path="trans_id" class="form-control"
							id="trans_id1" />
					</div>
				</div>
				<div class="row mb-3">
					<label for="trnas_date" class="col-sm-4 col-form-label">Date</label>
					<div class="col-sm-7">
						<f:input path="trans_date" type="datetime-local"
							class="form-control" id="trans_date_for_expense1" />
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputPassword3" class="col-sm-4 col-form-label">Account</label>
					<div class="col-sm-7">
						<f:select path="trans_account_id" name="trans_account_expense1"
							id="trans_account_expense1" class="form-select"
							aria-label="Default select example">
							<c:forEach items="${account_list}" var="account_list">
								<option value="${account_list.account_id}">${account_list.account_name}</option>
							</c:forEach>
						</f:select>
						<p style="margin: 0px 10px; font-size: 80%; color: #5CB377;">
							Your current balance is <span id="span_account_amount_expense1"></span>
						</p>
					</div>
				</div>
				<div class="row mb-3">
					<label for="trans_category_id" class="col-sm-4 col-form-label">Category</label>
					<div class="col-sm-7">
						<f:select path="trans_category_id" class="form-select"
							aria-label="Default select example"
							id="trans_category_for_expense1">
							<c:forEach items="${expense_category_list}" var="category_list">
								<option value="${category_list.category_id}">${category_list.category_name}</option>
							</c:forEach>
						</f:select>
					</div>
					<!-- <div class="mt-1 col-sm-1 ">
								<button type="button" >
								<i class="fas fa-plus h3 bg-success rounded-circle"
									style="color: white; padding: 3px; cursor: pointer;"
									data-bs-toggle="modal" data-bs-target="#categoryExpenseModal"></i>
								</button>
							</div> -->


				</div>
				<div class="row mb-3">
					<label for="trans_sub_category" class="col-sm-4 col-form-label">Sub
						Category</label>
					<div class="col-sm-7">
						<f:select class="form-select" path="trans_sub_category_id"
							aria-label="Default select example"
							id="trans_sub_category_for_expense1">
						</f:select>
					</div>
					<!-- <div class="mt-1 col-sm-1 ">
								<i class="fas fa-plus h3 bg-success rounded-circle"
									style="color: white; padding: 3px; cursor: pointer;"
									data-bs-toggle="modal" onclick="callModal()"
									data-bs-target="#subCategoryModalForExpense"
									id="addSubCategoryBtn"></i>
							</div> -->
				</div>
				<div class="row mb-3">
					<label for="trans_amount" class="col-sm-4 col-form-label">Amount</label>
					<div class="col-sm-7">
						<f:input type="text" path="trans_amount" class="form-control"
							id="trans_amount1" />
					</div>
				</div>
				<div class="row mb-3">
					<label for="trans_label" class="col-sm-4 col-form-label">Label</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" id="trans_label">
					</div>
				</div>
				<div class="row mb-3">
					<label for="trans_note" class="col-sm-4 col-form-label">Note</label>
					<div class="col-sm-7">
						<f:input type="text" path="trans_note" class="form-control"
							id="trans_note1" />
					</div>
				</div>
				<div class="row mb-3">
					<label for="trans_description" class="col-sm-4 col-form-label">Description</label>
					<div class="col-sm-7">
						<f:input type="text" path="trans_description" class="form-control"
							id="trans_description" />
					</div>
				</div>
				<div class="row mb-3">
					<label for="trans_image" class="col-sm-4 col-form-label">Image</label>
					<div class="col-sm-7">
						<f:input path="trans_image" type="file" class="form-control"
							id="trans_image" />
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-sm-10"></div>
					<div class="col-sm-2">
						<button type="submit" class="edit btn btn-primary">Update</button>
					</div>
				</div>
			</f:form>
		</div>
	</div>
</div>

<div class="modal fade" id="updateModalForIncome" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content p-4">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Update Income</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<f:form modelAttribute="tbean" action="updateTransaction"
				method="Post">
				<div class="row mb-3">
					<label for="trans_amount" class="col-sm-4 col-form-label">Id</label>
					<div class="col-sm-7">
						<f:input type="text" path="trans_id" class="form-control"
							id="trans_id2" />
					</div>
				</div>
				<div class="row mb-3">
					<label for="trnas_date" class="col-sm-4 col-form-label">Date</label>
					<div class="col-sm-7">
						<f:input path="trans_date" type="datetime-local"
							class="form-control" id="trans_date_for_income1" />
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputPassword3" class="col-sm-4 col-form-label">Account</label>
					<div class="col-sm-7">
						<f:select path="trans_account_id" name="trans_account_expense1"
							id="trans_account_income1" class="form-select"
							aria-label="Default select example">
							<c:forEach items="${account_list}" var="account_list">
								<option value="${account_list.account_id}">${account_list.account_name}</option>
							</c:forEach>
						</f:select>
						<p style="margin: 0px 10px; font-size: 80%; color: #5CB377;">
							Your current balance is <span id="span_account_amount_income1"></span>
						</p>
					</div>
				</div>
				<div class="row mb-3">
					<label for="trans_category_id" class="col-sm-4 col-form-label">Category</label>
					<div class="col-sm-7">
						<f:select path="trans_category_id" class="form-select"
							aria-label="Default select example"
							id="trans_category_for_income1">
							<c:forEach items="${income_category_list}" var="category_list">
								<option value="${category_list.category_id}">${category_list.category_name}</option>
							</c:forEach>
						</f:select>
					</div>
					<!-- <div class="mt-1 col-sm-1 ">
								<button type="button" >
								<i class="fas fa-plus h3 bg-success rounded-circle"
									style="color: white; padding: 3px; cursor: pointer;"
									data-bs-toggle="modal" data-bs-target="#categoryExpenseModal"></i>
								</button>
							</div> -->


				</div>
				<div class="row mb-3">
					<label for="trans_sub_category" class="col-sm-4 col-form-label">Sub
						Category</label>
					<div class="col-sm-7">
						<f:select class="form-select" path="trans_sub_category_id"
							aria-label="Default select example"
							id="trans_sub_category_for_income1">
						</f:select>
					</div>
					<!-- <div class="mt-1 col-sm-1 ">
								<i class="fas fa-plus h3 bg-success rounded-circle"
									style="color: white; padding: 3px; cursor: pointer;"
									data-bs-toggle="modal" onclick="callModal()"
									data-bs-target="#subCategoryModalForExpense"
									id="addSubCategoryBtn"></i>
							</div> -->
				</div>
				<div class="row mb-3">
					<label for="trans_amount" class="col-sm-4 col-form-label">Amount</label>
					<div class="col-sm-7">
						<f:input type="text" path="trans_amount" class="form-control"
							id="trans_amount_income1" />
					</div>
				</div>
				<div class="row mb-3">
					<label for="trans_label" class="col-sm-4 col-form-label">Label</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" id="trans_label">
					</div>
				</div>
				<div class="row mb-3">
					<label for="trans_note" class="col-sm-4 col-form-label">Note</label>
					<div class="col-sm-7">
						<f:input type="text" path="trans_note" class="form-control"
							id="trans_note_income1" />
					</div>
				</div>
				<div class="row mb-3">
					<label for="trans_description" class="col-sm-4 col-form-label">Description</label>
					<div class="col-sm-7">
						<f:input type="text" path="trans_description" class="form-control"
							id="trans_description_income" />
					</div>
				</div>
				<div class="row mb-3">
					<label for="trans_image" class="col-sm-4 col-form-label">Image</label>
					<div class="col-sm-7">
						<f:input path="trans_image" type="file" class="form-control"
							id="trans_image" />
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-sm-10"></div>
					<div class="col-sm-2">
						<button type="submit" class="edit btn btn-primary">Update</button>
					</div>
				</div>
			</f:form>
		</div>
	</div>
</div>
<div class="container">

	<div class="row g-3 mb-4 align-items-center justify-content-between">
		<div class="col-auto">
			<h1 class="app-page-title mb-0">Transactions</h1>
		</div>

		<!--//table-utilities-->
	</div>
	<!--//col-auto-->
</div>
<!--//row-->
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
								<th class="cell">Account Name</th>
								<th class="cell">Category Name</th>
								<th class="cell">Sub Category Name</th>
								<th class="cell">Amount</th>
								<th class="cell">Note</th>
								<th class="cell">Payee Name</th>
								<th class="cell">Income/Expense</th>
								<th class="cell">Action</th>
							</tr>
						</thead>
						<tbody>
							<!-- allRecordsList -->
							<c:forEach items="${allRecordsList}" var="tbean">
								<tr>
									<td class="cell">${tbean.trans_date}</td>

									<td class="cell" id="${tbean.trans_account_id}">${tbean.trans_account_name }</td>
									<td class="cell" id="${tbean.trans_category_id}">${tbean.trans_category_name}</td>
									<td class="cell" id="${tbean.trans_sub_category_id}">${tbean.trans_sub_category_name}</td>
									<td class="cell">${tbean.trans_amount}</td>
									<td class="cell">${tbean.trans_note}</td>
									<td class="cell">${tbean.trans_payee_name}</td>
									<c:choose>
										<c:when test="${tbean.trans_type=='EXPENSE'}">
											<td class="cell"><span class="badge bg-danger">${tbean.trans_type}</span></td>
										</c:when>
										<c:when test="${tbean.trans_type=='INCOME'}">
											<td class="cell"><span class="badge bg-success">${tbean.trans_type}</span></td>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${tbean.trans_type=='EXPENSE'}">
											<td class="cell">
												<button type="submit" class="editExpence btn btn-warning"
													data-bs-toggle="modal"
													data-bs-target="#updateModalForExpense"
													id="${tbean.trans_id}">Update</button> <a
												href="transaction/delete/${tbean.trans_id}"><button
														type="submit" class="btn btn-danger"
														onclick="return confirmDelete()">Delete</button></a>
											</td>
										</c:when>
										<c:when test="${tbean.trans_type=='INCOME'}">
											<td class="cell">
												<button type="submit" class="editIncome btn btn-warning"
													data-bs-toggle="modal"
													data-bs-target="#updateModalForIncome"
													id="${tbean.trans_id}">Update</button> <a
												href="transaction/delete/${tbean.trans_id}"><button
														type="submit" class="btn btn-danger"
														onclick="return confirmDelete()">Delete</button></a>
											</td>
										</c:when>
									</c:choose>



									<!-- <i class="fas fa-plus h3 bg-success rounded-circle"
											style="color: white; padding: 3px; cursor: pointer;"
											data-bs-toggle="modal" onclick="callModal()"
											data-bs-target="#subCategoryModalForExpense"
											id="addSubCategoryBtn"></i> -->
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
								<th class="cell">Payee Name</th>
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
										<td class="cell" id="${tbean.trans_account_id}">${tbean.trans_account_name }</td>
										<td class="cell" id="${tbean.trans_category_id}">${tbean.trans_category_name}</td>
										<td class="cell" id="${tbean.trans_sub_category_id}">${tbean.trans_sub_category_name}</td>
										<td class="cell">${tbean.trans_amount}</td>
										<td class="cell">${tbean.trans_payee_name}</td>
										<td class="cell">${tbean.trans_note}</td>
										<td class="cell">
											<button type="submit" class="editExpence btn btn-warning"
												data-bs-toggle="modal"
												data-bs-target="#updateModalForExpense"
												id="${tbean.trans_id}">Update</button> <a
											href="transaction/delete/${tbean.trans_id}"><button
													type="submit" class="btn btn-danger"
													onclick="return confirmDelete()">Delete</button></a>
										</td>
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
								<th class="cell">Payee Name</th>
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
										<td class="cell" id="${tbean.trans_account_id}">${tbean.trans_account_name }</td>
										<td class="cell" id="${tbean.trans_category_id}">${tbean.trans_category_name}</td>
										<td class="cell" id="${tbean.trans_sub_category_id}">${tbean.trans_sub_category_name}</td>
										<td class="cell">${tbean.trans_amount}</td>
										<td class="cell">${tbean.trans_payee_name}</td>
										<td class="cell">${tbean.trans_note}</td>
										<td class="cell">
											<button type="submit" class="editIncome btn btn-warning"
												data-bs-toggle="modal"
												data-bs-target="#updateModalForIncome"
												id="${tbean.trans_id}">Update</button> <a
											href="transaction/delete/${tbean.trans_id}"><button
													type="submit" class="btn btn-danger"
													onclick="return confirmDelete()">Delete</button></a>
										</td>
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
