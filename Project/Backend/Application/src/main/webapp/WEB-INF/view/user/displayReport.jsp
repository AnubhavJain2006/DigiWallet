<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<c:if test="${display == 'week'}">
		<div class="row g-3 mb-4 align-items-center justify-content-between">
			<div class="col-auto">
				<h1 class="app-page-title mb-0">Weekly Transactions</h1>
			</div>
			<div class="row">
				<div class="col-10"></div>
				<div class="col-2">
					<button type="button" class="btn"
						style="background-color: #51B37F;" id="downloadPdfBtn"
						onclick="GeneratePdf()">Download PDF</button>
				</div>
			</div>
			<!--//table-utilities-->
			<!--//row-->
			<nav id="orders-table-tab"
				class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
				<a class="flex-sm-fill text-sm-center nav-link active"
					id="transaction-all-tab" data-bs-toggle="tab"
					href="#transaction-all" role="tab" aria-controls="transaction-all"
					aria-selected="true">All Record</a> <a
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
				<div class="tab-pane fade show active" id="transaction-all"
					role="tabpanel" aria-labelledby="transaction-all-tab">
					<div class="app-card app-card-orders-table shadow-sm mb-5">
						<div class="app-card-body">
							<div class="table-responsive">
								<div id="myTable">


									<table class="table app-table-hover mb-0 text-left">
										<thead>
											<tr>
												<th class="cell">Date</th>
												<th class="cell">Income/Expense</th>
												<th class="cell">Account Name</th>
												<th class="cell">Category Name</th>
												<th class="cell">Sub Category Name</th>
												<th class="cell">Amount</th>
												<th class="cell">Note</th>
											</tr>
										</thead>
										<tbody>
											<!-- allRecordsList -->

											<c:forEach items="${transactionListByWeek}" var="rbean">
												<c:set var="tbean" value="${rbean.transactionBean}"></c:set>
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
												</tr>
											</c:forEach>
										</tbody>
									</table>

								</div>
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
								<table class="table app-table-hover mb-0 text-left"
									id="myTable1">
									<thead>
										<tr>
											<th class="cell">Date</th>
											<th class="cell">Account Name</th>
											<th class="cell">Category Name</th>
											<th class="cell">Sub Category Name</th>
											<th class="cell">Amount</th>
											<th class="cell">Note</th>
										</tr>
									</thead>
									<tbody>
										<!-- allRecordsList -->
										<c:forEach items="${transactionListByWeek}" var="rbean">
											<c:set var="tbean" value="${rbean.transactionBean}"></c:set>
											<c:if test="${tbean.trans_type=='EXPENSE'}">
												<tr>
													<td class="cell">${tbean.trans_date}</td>
													<td class="cell">${tbean.trans_account_name }</td>
													<td class="cell">${tbean.trans_category_name}</td>
													<td class="cell">${tbean.trans_sub_category_name}</td>
													<td class="cell">${tbean.trans_amount}</td>
													<td class="cell">${tbean.trans_note}</td>
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
								<table class="table app-table-hover mb-0 text-left"
									id="myTable2">
									<thead>
										<tr>
											<th class="cell">Date</th>
											<th class="cell">Account Name</th>
											<th class="cell">Category Name</th>
											<th class="cell">Sub Category Name</th>
											<th class="cell">Amount</th>
											<th class="cell">Note</th>
										</tr>
									</thead>
									<tbody>
										<!-- allRecordsList -->
										<c:forEach items="${transactionListByWeek}" var="rbean">
											<c:set var="tbean" value="${rbean.transactionBean}"></c:set>
											<c:if test="${tbean.trans_type=='INCOME'}">
												<tr>
													<td class="cell">${tbean.trans_date}</td>
													<td class="cell">${tbean.trans_account_name }</td>
													<td class="cell">${tbean.trans_category_name}</td>
													<td class="cell">${tbean.trans_sub_category_name}</td>
													<td class="cell">${tbean.trans_amount}</td>
													<td class="cell">${tbean.trans_note}</td>
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
				<!--//tab-pane-->
			</div>
			<!--//tab-content-->

		</div>
	</c:if>
	<c:if test="${display == 'period'}">
		<div class="row g-3 mb-4 align-items-center justify-content-between">
			<div class="col-auto">
				<h1 class="app-page-title mb-0">From "${startDate}" to
					"${endDate}" Transaction</h1>
			</div>

			<div class="row">
				<div class="col-10"></div>
				<div class="col-2">
					<button type="button" class="btn"
						style="background-color: #51B37F;" id="downloadPdfBtn"
						onclick="GeneratePdf()">Download PDF</button>
				</div>
			</div>
			<!--//table-utilities-->
			<!--//row-->
			<nav id="orders-table-tab"
				class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
				<a class="flex-sm-fill text-sm-center nav-link active"
					id="transaction-all-tab" data-bs-toggle="tab"
					href="#transaction-all" role="tab" aria-controls="transaction-all"
					aria-selected="true">All Record</a> <a
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
										</tr>
									</thead>
									<tbody>
										<!-- allRecordsList -->

										<c:forEach items="${transactionListByPeriod}" var="rbean">
											<c:set var="tbean" value="${rbean.transactionBean}"></c:set>
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
								<table class="table app-table-hover mb-0 text-left"
									id="myTable1">
									<thead>
										<tr>
											<th class="cell">Date</th>
											<th class="cell">Account Name</th>
											<th class="cell">Category Name</th>
											<th class="cell">Sub Category Name</th>
											<th class="cell">Amount</th>
											<th class="cell">Note</th>
										</tr>
									</thead>
									<tbody>
										<!-- allRecordsList -->
										<c:forEach items="${transactionListByPeriod}" var="rbean">
											<c:set var="tbean" value="${rbean.transactionBean}"></c:set>
											<c:if test="${tbean.trans_type=='EXPENSE'}">
												<tr>
													<td class="cell">${tbean.trans_date}</td>
													<td class="cell">${tbean.trans_account_name }</td>
													<td class="cell">${tbean.trans_category_name}</td>
													<td class="cell">${tbean.trans_sub_category_name}</td>
													<td class="cell">${tbean.trans_amount}</td>
													<td class="cell">${tbean.trans_note}</td>
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
								<table class="table app-table-hover mb-0 text-left"
									id="myTable2">
									<thead>
										<tr>
											<th class="cell">Date</th>
											<th class="cell">Account Name</th>
											<th class="cell">Category Name</th>
											<th class="cell">Sub Category Name</th>
											<th class="cell">Amount</th>
											<th class="cell">Note</th>
										</tr>
									</thead>
									<tbody>
										<!-- allRecordsList -->
										<c:forEach items="${transactionListByPeriod}" var="rbean">
											<c:set var="tbean" value="${rbean.transactionBean}"></c:set>
											<c:if test="${tbean.trans_type=='INCOME'}">
												<tr>
													<td class="cell">${tbean.trans_date}</td>
													<td class="cell">${tbean.trans_account_name }</td>
													<td class="cell">${tbean.trans_category_name}</td>
													<td class="cell">${tbean.trans_sub_category_name}</td>
													<td class="cell">${tbean.trans_amount}</td>
													<td class="cell">${tbean.trans_note}</td>
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
				<!--//tab-pane-->
			</div>
			<!--//tab-content-->

		</div>

	</c:if>
	<c:if test="${display == 'month'}">
		<div class="row g-3 mb-4 align-items-center justify-content-between">
			<div class="col-auto">
				<h1 class="app-page-title mb-0">${month},${year}Transaction</h1>
			</div>
			<div class="row">
				<div class="col-10"></div>
				<div class="col-2">
					<button type="button" class="btn"
						style="background-color: #51B37F;" id="downloadPdfBtn"
						onclick="GeneratePdf()">Download PDF</button>
				</div>
			</div>

			<!--//table-utilities-->
			<!--//row-->
			<nav id="orders-table-tab"
				class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
				<a class="flex-sm-fill text-sm-center nav-link active"
					id="transaction-all-tab" data-bs-toggle="tab"
					href="#transaction-all" role="tab" aria-controls="transaction-all"
					aria-selected="true">All Record</a> <a
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
										</tr>
									</thead>
									<tbody>
										<!-- allRecordsList -->
										<c:forEach items="${transactionListByMonth}" var="rbean">
											<c:set var="tbean" value="${rbean.transactionBean}"></c:set>
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
								<table class="table app-table-hover mb-0 text-left"
									id="myTable1">
									<thead>
										<tr>
											<th class="cell">Date</th>
											<th class="cell">Account Name</th>
											<th class="cell">Category Name</th>
											<th class="cell">Sub Category Name</th>
											<th class="cell">Amount</th>
											<th class="cell">Note</th>
										</tr>
									</thead>
									<tbody>
										<!-- allRecordsList -->
										<c:forEach items="${transactionListByMonth}" var="rbean">
											<c:set var="tbean" value="${rbean.transactionBean}"></c:set>
											<c:if test="${tbean.trans_type=='EXPENSE'}">
												<tr>
													<td class="cell">${tbean.trans_date}</td>
													<td class="cell">${tbean.trans_account_name }</td>
													<td class="cell">${tbean.trans_category_name}</td>
													<td class="cell">${tbean.trans_sub_category_name}</td>
													<td class="cell">${tbean.trans_amount}</td>
													<td class="cell">${tbean.trans_note}</td>
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
								<table class="table app-table-hover mb-0 text-left"
									id="myTable2">
									<thead>
										<tr>
											<th class="cell">Date</th>
											<th class="cell">Account Name</th>
											<th class="cell">Category Name</th>
											<th class="cell">Sub Category Name</th>
											<th class="cell">Amount</th>
											<th class="cell">Note</th>
										</tr>
									</thead>
									<tbody>
										<!-- allRecordsList -->
										<c:forEach items="${transactionListByMonth}" var="rbean">
											<c:set var="tbean" value="${rbean.transactionBean}"></c:set>
											<c:if test="${tbean.trans_type=='INCOME'}">
												<tr>
													<td class="cell">${tbean.trans_date}</td>
													<td class="cell">${tbean.trans_account_name }</td>
													<td class="cell">${tbean.trans_category_name}</td>
													<td class="cell">${tbean.trans_sub_category_name}</td>
													<td class="cell">${tbean.trans_amount}</td>
													<td class="cell">${tbean.trans_note}</td>
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
				<!--//tab-pane-->
			</div>
			<!--//tab-content-->

		</div>

	</c:if>
	<c:if test="${display == 'annual'}">
		<div class="row g-3 mb-4 align-items-center justify-content-between">
			<div class="col-auto">
				<h1 class="app-page-title mb-0">Year "${year}" Transaction</h1>
			</div>


			<div class="row">
				<div class="col-10"></div>
				<div class="col-2">
					<button type="button" class="btn"
						style="background-color: #51B37F;" id="downloadPdfBtn"
						onclick="GeneratePdf()">Download PDF</button>
				</div>
			</div>

			<!--//table-utilities-->
			<!--//row-->
			<nav id="orders-table-tab"
				class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
				<a class="flex-sm-fill text-sm-center nav-link active"
					id="transaction-all-tab" data-bs-toggle="tab"
					href="#transaction-all" role="tab" aria-controls="transaction-all"
					aria-selected="true">All Record</a> <a
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
				<div class="tab-pane fade show active" id="transaction-all"
					role="tabpanel" aria-labelledby="transaction-all-tab">
					<div class="app-card app-card-orders-table shadow-sm mb-5">
						<div class="app-card-body">
							<div class="table-responsive">
								<div id="myTable">
									<table class="table app-table-hover mb-0 text-left">
										<thead>
											<tr>
												<th class="cell">Month</th>
												<th class="cell">Date</th>
												<th class="cell">Income/Expense</th>
												<th class="cell">Account Name</th>
												<th class="cell">Category Name</th>
												<th class="cell">Sub Category Name</th>
												<th class="cell">Amount</th>
												<th class="cell">Note</th>
											</tr>
										</thead>
										<tbody>
											<!-- allRecordsList -->
											<c:forEach items="${transactionListByYear}" var="rbean">
												<c:set var="tbean" value="${rbean.transactionBean}"></c:set>
												<tr>
													<td class="cell">${rbean.month}</td>
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
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

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
								<table class="table app-table-hover mb-0 text-left"
									id="myTable1">
									<thead>
										<tr>
											<th class="cell">Month</th>
											<th class="cell">Date</th>
											<th class="cell">Account Name</th>
											<th class="cell">Category Name</th>
											<th class="cell">Sub Category Name</th>
											<th class="cell">Amount</th>
											<th class="cell">Note</th>
										</tr>
									</thead>
									<tbody>
										<!-- allRecordsList -->
										<c:forEach items="${transactionListByYear}" var="rbean">
											<c:set var="tbean" value="${rbean.transactionBean}"></c:set>
											<c:if test="${tbean.trans_type=='EXPENSE'}">
												<tr>
													<td class="cell">${rbean.month}</td>
													<td class="cell">${tbean.trans_date}</td>
													<td class="cell">${tbean.trans_account_name }</td>
													<td class="cell">${tbean.trans_category_name}</td>
													<td class="cell">${tbean.trans_sub_category_name}</td>
													<td class="cell">${tbean.trans_amount}</td>
													<td class="cell">${tbean.trans_note}</td>
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
								<table class="table app-table-hover mb-0 text-left"
									id="myTable2">
									<thead>
										<tr>
											<th class="cell">Month</th>
											<th class="cell">Date</th>
											<th class="cell">Account Name</th>
											<th class="cell">Category Name</th>
											<th class="cell">Sub Category Name</th>
											<th class="cell">Amount</th>
											<th class="cell">Note</th>
										</tr>
									</thead>
									<tbody>
										<!-- allRecordsList -->
										<c:forEach items="${transactionListByYear}" var="rbean">
											<c:set var="tbean" value="${rbean.transactionBean}"></c:set>
											<c:if test="${tbean.trans_type=='INCOME'}">
												<tr>
													<td class="cell">${rbean.month}</td>
													<td class="cell">${tbean.trans_date}</td>
													<td class="cell">${tbean.trans_account_name }</td>
													<td class="cell">${tbean.trans_category_name}</td>
													<td class="cell">${tbean.trans_sub_category_name}</td>
													<td class="cell">${tbean.trans_amount}</td>
													<td class="cell">${tbean.trans_note}</td>
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
				<!--//tab-pane-->
			</div>
			<!--//tab-content-->

		</div>

	</c:if>
	<!--//col-auto-->
</div>




