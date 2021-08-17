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
<title>Transaction</title>
<link href="<c:url value="/resources/css/transaction.css"/>"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

</head>
<%@include file="header.jsp"%>
<div class="app-wrapper">
	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container-xl">
			<!-- Button trigger modal -->

			<!-- Modal for category -->
			<div class="modal fade" id="categoryExpenseModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Add Catgory</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>

						<form action="/ExpenseApplication/user/addExpenseCategory"
							method="POST">
							<div class="modal-body">
								<div class="mb-3">
									<label for="categoryInput" class="form-label">Catgory </label>
									<input type="text" class="form-control" id="categoryInput"
										name="categoryInput" placeholder="Enter Category Name"
										required />
								</div>
								<div class="mb-3">
									<label for="subCategoryInput" class="form-label">Sub
										Catgory </label> <input type="text" class="form-control"
										id="subCategoryInput" name="subCategoryInput"
										placeholder="Enter Sub Category Name">
								</div>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Cancel</button>
								<button type="submit" class="btn btn-primary">Add</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- Modal for category -->
			<div class="modal fade" id="categoryIncomeModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Add Catgory</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>

						<form action="/ExpenseApplication/user/addIncomeCategory"
							method="POST">
							<div class="modal-body">
								<div class="mb-3">
									<label for="categoryInput" class="form-label">Catgory </label>
									<input type="text" class="form-control" id="categoryInput"
										name="categoryInput" placeholder="Enter Category Name"
										required />
								</div>
								<div class="mb-3">
									<label for="subCategoryInput" class="form-label">Sub
										Catgory </label> <input type="text" class="form-control"
										id="subCategoryInput" name="subCategoryInput"
										placeholder="Enter Sub Category Name">
								</div>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Cancel</button>
								<button type="submit" class="btn btn-primary">Add</button>
							</div>
						</form>
					</div>
				</div>
			</div>


			<!-- Modal for sub category for expense-->
			<div class="modal fade" id="subCategoryModalForExpense" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Add Sub
								Catgory</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>

						<form action="/ExpenseApplication/user/addUserSubCategory"
							method="POST">
							<div class="modal-body">
								<div class="mb-3">
									<label for="modalCategory" class="form-label">Sub
										Catgory </label> <select class="form-select"
										aria-label="Default select example" id="modalSelectCategoryForExpense"
										name="categoryId">
										<c:forEach items="${expense_category_list}"
											var="category_list">
											<option value="${category_list.category_id}">${category_list.category_name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="mb-3">
									<label for="subCategoryInputInModal" class="form-label">Sub
										Catgory </label> <input type="text" class="form-control"
										id="subCategoryInputInModal" name="subCategoryInput"
										placeholder="Enter Sub Category Name" required>
								</div>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Cancel</button>
								<button type="submit" class="btn btn-primary">Add</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- Modal for sub category for income-->
			<div class="modal fade" id="subCategoryModalForIncome" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Add Sub
								Catgory</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>

						<form action="/ExpenseApplication/user/addUserSubCategory"
							method="POST">
							<div class="modal-body">
								<div class="mb-3">
									<label for="modalCategory" class="form-label">Sub
										Catgory </label> <select class="form-select"
										aria-label="Default select example" id="modalSelectCategoryForIncome"
										name="categoryId">
										<c:forEach items="${income_category_list}" var="category_list">
											<option value="${category_list.category_id}">${category_list.category_name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="mb-3">
									<label for="subCategoryInputInModal" class="form-label">Sub
										Catgory </label> <input type="text" class="form-control"
										id="subCategoryInputInModal" name="subCategoryInput"
										placeholder="Enter Sub Category Name" required>
								</div>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Cancel</button>
								<button type="submit" class="btn btn-primary">Add</button>
							</div>
						</form>
					</div>
				</div>
			</div>


			<div class="form">
				<nav id="orders-table-tab"
					class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
					<a class="flex-sm-fill text-sm-center nav-link active"
						id="transaction-all-tab" data-bs-toggle="tab" href="#orders-all"
						role="tab" aria-controls="orders-all" aria-selected="true">Expense</a>
					<a class="flex-sm-fill text-sm-center nav-link"
						id="orders-paid-tab" data-bs-toggle="tab" href="#orders-paid"
						role="tab" aria-controls="orders-paid" aria-selected="false">Income</a>
				</nav>

				<div class="tab-content" id="orders-table-tab-content">
					<div class="tab-pane fade show active" id="orders-all"
						role="tabpanel" aria-labelledby="transaction-all-tab">
						<div class="app-card-orders-table mb-5">
						<h1>Add Expense</h1>

						<f:form modelAttribute="tbean"
							action="/ExpenseApplication/user/addExpenseTransaction"
							method="Post">
							<div class="row mb-3">
								<label for="trnas_date" class="col-sm-4 col-form-label">Date</label>
								<div class="col-sm-7">
									<f:input path="trans_date" type="datetime-local"
										class="form-control" id="trans_date_for_expense" />
								</div>
							</div>
							<div class="row mb-3">
								<label for="inputPassword3" class="col-sm-4 col-form-label">Account</label>
								<div class="col-sm-7">
									<f:select path="trans_account_id" class="form-select"
										aria-label="Default select example">
										<c:forEach items="${account_list}" var="account_list">
											<option value="${account_list.account_id}">${account_list.account_name}</option>
										</c:forEach>
									</f:select>
								</div>
							</div>
							<div class="row mb-3">
								<label for="trans_category_id" class="col-sm-4 col-form-label">Category</label>
								<div class="col-sm-7">
									<f:select path="trans_category_id" class="form-select"
										aria-label="Default select example"
										id="trans_category_for_expense">
										<c:forEach items="${expense_category_list}"
											var="category_list">
											<option value="${category_list.category_id}">${category_list.category_name}</option>
										</c:forEach>
									</f:select>
								</div>
								<div class="mt-1 col-sm-1 ">
									<!-- <button type="button" > -->
									<i class="fas fa-plus h3 bg-success rounded-circle"
										style="color: white; padding: 3px; cursor: pointer;"
										data-bs-toggle="modal" data-bs-target="#categoryExpenseModal"></i>
									<!-- </button> -->
								</div>


							</div>
							<div class="row mb-3">
								<label for="trans_sub_category" class="col-sm-4 col-form-label">Sub
									Category</label>
								<div class="col-sm-7">
									<f:select class="form-select" path="trans_sub_category_id"
										aria-label="Default select example"
										id="trans_sub_category_for_expense">
									</f:select>
								</div>
								<div class="mt-1 col-sm-1 ">
									<i class="fas fa-plus h3 bg-success rounded-circle"
										style="color: white; padding: 3px; cursor: pointer;"
										data-bs-toggle="modal" onclick="callModal()"
										data-bs-target="#subCategoryModalForExpense"
										id="addSubCategoryBtn"></i>
								</div>
							</div>
							<div class="row mb-3">
								<label for="trans_amount" class="col-sm-4 col-form-label">Amount</label>
								<div class="col-sm-7">
									<f:input type="text" path="trans_amount" class="form-control"
										id="trans_amount" />
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
										id="trans_note" />
								</div>
							</div>
							<div class="row mb-3">
								<label for="trans_description" class="col-sm-4 col-form-label">Description</label>
								<div class="col-sm-7">
									<f:input type="text" path="trans_description"
										class="form-control" id="trans_description" />
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
									<button type="submit" class="btn btn-primary">Add</button>
								</div>
							</div>
						</f:form>
						</div>
					</div>

					<div class="tab-pane fade" id="orders-paid" role="tabpanel"
						aria-labelledby="orders-paid-tab">
						<div class="app-card-orders-table mb-5">
							<h1>Add Income</h1>

							<f:form modelAttribute="tbean"
								action="/ExpenseApplication/user/addIncomeTransaction"
								method="Post">
								<div class="row mb-3">
									<label for="trnas_date" class="col-sm-4 col-form-label">Date</label>
									<div class="col-sm-7">
										<f:input path="trans_date" type="datetime-local"
											class="form-control" id="trans_date_for_income" />
									</div>
								</div>
								<div class="row mb-3">
									<label for="inputPassword3" class="col-sm-4 col-form-label">Account</label>
									<div class="col-sm-7">
										<f:select path="trans_account_id" class="form-select"
											aria-label="Default select example">
											<c:forEach items="${account_list}" var="account_list">
												<option value="${account_list.account_id}">${account_list.account_name}</option>
											</c:forEach>
										</f:select>
									</div>
								</div>
								<div class="row mb-3">
									<label for="trans_category_id" class="col-sm-4 col-form-label">Category</label>
									<div class="col-sm-7">
										<f:select path="trans_category_id" class="form-select"
											aria-label="Default select example"
											id="trans_category_for_income">
											<c:forEach items="${income_category_list}"
												var="category_list">
												<option value="${category_list.category_id}">${category_list.category_name}</option>
											</c:forEach>
										</f:select>
									</div>
									<div class="mt-1 col-sm-1 ">
										<!-- <button type="button" > -->
										<i class="fas fa-plus h3 bg-success rounded-circle"
											style="color: white; padding: 3px; cursor: pointer;"
											data-bs-toggle="modal" data-bs-target="#categoryIncomeModal"></i>
										<!-- </button> -->
									</div>


								</div>
								<div class="row mb-3">
									<label for="trans_sub_category" class="col-sm-4 col-form-label">Sub
										Category</label>
									<div class="col-sm-7">
										<f:select class="form-select" path="trans_sub_category_id"
											aria-label="Default select example"
											id="trans_sub_category_for_income">
										</f:select>
									</div>
									<div class="mt-1 col-sm-1 ">
										<i class="fas fa-plus h3 bg-success rounded-circle"
											style="color: white; padding: 3px; cursor: pointer;"
											data-bs-toggle="modal" onclick="callModal()"
											data-bs-target="#subCategoryModalForIncome"
											id="addSubCategoryBtn"></i>
									</div>
								</div>
								<div class="row mb-3">
									<label for="trans_amount" class="col-sm-4 col-form-label">Amount</label>
									<div class="col-sm-7">
										<f:input type="text" path="trans_amount" class="form-control"
											id="trans_amount" />
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
											id="trans_note" />
									</div>
								</div>
								<div class="row mb-3">
									<label for="trans_description" class="col-sm-4 col-form-label">Description</label>
									<div class="col-sm-7">
										<f:input type="text" path="trans_description"
											class="form-control" id="trans_description" />
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
										<button type="submit" class="btn btn-primary">Add</button>
									</div>
								</div>
							</f:form>
						</div>
					</div>
				</div>
			</div>
			<!-- tab-content -->

		</div>
		<!-- /form -->

		<%@include file="transactionDisplay.jsp"%>

	</div>
</div>
</div>
<script type="text/javascript">

function callModal(){
		document.getElementById('modalSelectCategoryForExpense').value = document.getElementById('trans_category_for_expense').value;
		document.getElementById('modalSelectCategoryForIncome').value = document.getElementById('trans_category_for_income').value;
		console.log('function called');	
}
</script>
<script>

	$('.form').find('input, textarea').on('keyup blur focus', function(e) {

		var $this = $(this), label = $this.prev('label');

		if (e.type === 'keyup') {
			if ($this.val() === '') {
				label.removeClass('active highlight');
			} else {
				label.addClass('active highlight');
			}
		} else if (e.type === 'blur') {
			if ($this.val() === '') {
				label.removeClass('active highlight');
			} else {
				label.removeClass('highlight');
			}
		} else if (e.type === 'focus') {

			if ($this.val() === '') {
				label.removeClass('highlight');
			} else if ($this.val() !== '') {
				label.addClass('highlight');
			}
		}

	});

	$('.tab a').on('click', function(e) {

		e.preventDefault();

		$(this).parent().addClass('active');
		$(this).parent().siblings().removeClass('active');

		target = $(this).attr('href');

		$('.tab-content > div').not(target).hide();

		$(target).fadeIn(600);

	});
</script>
<script>
	
	function formatting(target) {
	  return target < 10 ? '0' + target : target;
	}
	var dt = new Date()
	var dateStr = "";
	dateStr += dt.getFullYear() + "-";
	dateStr += formatting(dt.getMonth()) + "-";
	dateStr += formatting(dt.getDate()) + "T";
	dateStr += formatting(dt.getHours()) + ":";
	dateStr += formatting(dt.getMinutes());
	document.getElementById('trans_date_for_expense').value = dateStr
	document.getElementById('trans_date_for_income').value = dateStr
</script>
<script>
let categoryDropdownForIncome = document.getElementById("trans_category_for_income")
let subCategoryDropdownForIncome = document.getElementById("trans_sub_category_for_income")
categoryDropdownForIncome.addEventListener('change',() => {
    console.log("changed");
    console.log(categoryDropdownForIncome.value);
    (async () => {
        let response  = await fetch('/ExpenseApplication/user/getUserSubCategory?categoryId='+categoryDropdownForIncome.value).then(data => data.text())
             subCategoryDropdownForIncome.innerHTML = response;
            console.log(response);
    })()
})
let categoryDropdownForExpense = document.getElementById("trans_category_for_expense")
let subCategoryDropdownForExpense = document.getElementById("trans_sub_category_for_expense")
categoryDropdownForExpense.addEventListener('change',() => {
    console.log("changed");
    console.log(categoryDropdownForExpense.value);
    (async () => {
        let response  = await fetch('/ExpenseApplication/user/getUserSubCategory?categoryId='+categoryDropdownForExpense.value).then(data => data.text())
             subCategoryDropdownForExpense.innerHTML = response;
            console.log(response);
    })()
})
</script>
</body>
<%@include file="footer.jsp"%>
</html>