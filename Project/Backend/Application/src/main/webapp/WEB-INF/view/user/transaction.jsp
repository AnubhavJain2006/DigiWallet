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


</head>
<%@include file="header.jsp"%>
<div class="app-wrapper">
	<div class="app-content pt-3 p-md-3 p-lg-4">
		<c:choose>
			<c:when test="${empty account_list}">

				<div class="alert alert-danger" role="alert">
					<h4 class="alert-heading text-center">Sorry</h4>
					<p class="text-center">
						You don't have any account.Please add one account. <a
							href="account">Add Accounts</a>
					</p>
					<hr>

				</div>

			</c:when>
			<c:otherwise>

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
											<label for="categoryInput" class="form-label">Catgory
											</label> <input type="text" class="form-control" id="categoryInput"
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
											<label for="categoryInput" class="form-label">Catgory
											</label> <input type="text" class="form-control" id="categoryInput"
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
					<div class="modal fade" id="subCategoryModalForExpense"
						tabindex="-1" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
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
												aria-label="Default select example"
												id="modalSelectCategoryForExpense" name="categoryId">
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
					<div class="modal fade" id="subCategoryModalForIncome"
						tabindex="-1" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
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
												aria-label="Default select example"
												id="modalSelectCategoryForIncome" name="categoryId">
												<c:forEach items="${income_category_list}"
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
												<f:select path="trans_account_id" id="trans_account_expense"
													class="form-select" aria-label="Default select example">
													<c:forEach items="${account_list}" var="account_list">
														<option value="${account_list.account_id}">${account_list.account_name}</option>
													</c:forEach>
												</f:select>
												<p style="margin: 0px 10px; font-size: 80%; color: #5CB377;">
													Your <a href="account" style="text-decoration: underline;"><span
														class="span_account_name_expense">Account Name</span></a>
													balance is <span class="span_account_amount_expense"></span>
												</p>
											</div>
										</div>
										<div class="row mb-3">
											<label for="trans_category_id"
												class="col-sm-4 col-form-label">Category</label>
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
													data-bs-toggle="modal"
													data-bs-target="#categoryExpenseModal"></i>
												<!-- </button> -->
											</div>


										</div>
										<div class="row mb-3">
											<label for="trans_sub_category"
												class="col-sm-4 col-form-label">Sub Category</label>
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

										<!-- payee input for expense div start -->

										<div class="row mb-3">

											<label for="browser" class="col-sm-4 col-form-label">Pay
												To</label>
											<div class="col-sm-7">
												<input list="payee_for_expense" name="payee_name"
													id="payee_name" class="form-control" autocomplete="off">

												<datalist id="payee_for_expense">
													<!-- <option value="Edge"> -->

												</datalist>
											</div>
										</div>

										<!-- payee input for expense div end -->


										<div class="row mb-3">
											<label for="trans_amount" class="col-sm-4 col-form-label">Amount</label>
											<div class="col-sm-7">
												<f:input type="text" path="trans_amount"
													class="form-control" id="trans_amount" />
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
											<label for="trans_description"
												class="col-sm-4 col-form-label">Description</label>
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
												<p style="margin: 0px 10px; font-size: 80%; color: #5CB377;">
													Your <a href="account" style="text-decoration: underline;"><span
														class="span_account_name_income">Account Name</span></a>
													balance is <span class="span_account_amount_income"></span>
												</p>
											</div>
										</div>
										<div class="row mb-3">
											<label for="trans_category_id"
												class="col-sm-4 col-form-label">Category</label>
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
													data-bs-toggle="modal"
													data-bs-target="#categoryIncomeModal"></i>
												<!-- </button> -->
											</div>


										</div>
										<div class="row mb-3">
											<label for="trans_sub_category"
												class="col-sm-4 col-form-label">Sub Category</label>
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

										<!-- payee input for income div start -->

										<div class="row mb-3">

											<label for="payee" class="col-sm-4 col-form-label">Pay
												By</label>
											<div class="col-sm-7">
												<input list="payee_for_income" name="payee_name"
													id="payee_name" class="form-control">

												<datalist id="payee_for_income">
													<!-- <option value="Edge"> -->

												</datalist>
											</div>
										</div>

										<!-- payee input for income div end -->

										<div class="row mb-3">
											<label for="trans_amount" class="col-sm-4 col-form-label">Amount</label>
											<div class="col-sm-7">
												<f:input type="text" path="trans_amount"
													class="form-control" id="trans_amount" />
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
											<label for="trans_description"
												class="col-sm-4 col-form-label">Description</label>
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
			</c:otherwise>
		</c:choose>
		<!-- /form -->

		<%@include file="transactionDisplay.jsp"%>

	</div>
</div>
<script type="text/javascript">
function confirmDelete() {
	var confirmation = confirm("Are you sure.... ?")
	return confirmation;
}
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
	dateStr += formatting(dt.getMonth()+1) + "-";
	dateStr += formatting(dt.getDate()) + "T";
	dateStr += formatting(dt.getHours()) + ":";
	dateStr += formatting(dt.getMinutes());
	document.getElementById('trans_date_for_expense').value = dateStr
	document.getElementById('trans_date_for_income').value = dateStr
	
	function convertJsToDatetimeLocal(strDate){
		var dt = new Date(strDate)
		var dateStr = "";
		dateStr += dt.getFullYear() + "-";
		dateStr += formatting(dt.getMonth()+1) + "-";
		dateStr += formatting(dt.getDate()) + "T";
		dateStr += formatting(dt.getHours()) + ":";
		dateStr += formatting(dt.getMinutes());
		return dateStr;
	}
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
<script type="text/javascript">
function stringToRupees(value){
    let dollarIndianLocale = Intl.NumberFormat('en-IN');
    return "&#8377 "+ dollarIndianLocale.format(value)
}

let accountListJson='<%=request.getAttribute("account_list_json")%>'
let accountObj = JSON.parse(accountListJson);
/* let accountDropDown = document.getElementById('trans_account_expense') ;
accountDropDown.addEventListener('change',() => {
    document.getElementById('span_account_amount_expense').innerText = accountObj[accountDropDown.value]
});
 */
 
 $( document ).ready(function() {
	 	setAccountDisplayString('expense',$('#trans_account_expense').val());
		setAccountDisplayString('income',$('#trans_account_expense').val());
		$('#trans_account_expense').on('load change focus',function(e){
			setAccountDisplayString('expense',this.value);
		});
		$('#trans_account_income').on('load change focus',function(e){
			setAccountDisplayString('income',this.value);
		});
				
});
 
function setAccountDisplayString(type,accountId){
	let accountNameSpan = $('.span_account_name'+'_'+type);
	let accountAmountSpan = $('.span_account_amount'+'_'+type);
	accountObj.forEach(function(item,index) {
		if(item.account_id == accountId){
			accountNameSpan.html(item.account_name);
			accountAmountSpan.html(stringToRupees(item.account_amount));
		}
	})
	
}


</script>
<script type="text/javascript">
	/* Script tag for payee */
	let payeeArray;
	let payeeExpenseNameDiv = $('#payee_for_expense');
	let payeeIncomeNameDiv = $('#payee_for_income');
		
	function setPayeeArray(){
		(async () => {
	       	response = await fetch('/ExpenseApplication/user/payee').then(data => data.json());
	       	console.log(response);
	       	payeeArray = response;
			renderPayeeName(payeeArray);
	    })();
	}	
	setPayeeArray();
	
	
	function renderPayeeName(array){
		payeeExpenseNameDiv.empty();
		payeeIncomeNameDiv.empty();
		array.forEach((item,index) => {
			console.log(item.payee_name);
			payeeExpenseNameDiv.append(`<option payee_id = \${item.payee_id} value = '\${item.payee_name}'></option>`);
		})
		array.forEach((item,index) => {
			payeeIncomeNameDiv.append(`<option payee_id = \${item.payee_id} value = '\${item.payee_name}'></option>`);
		})
	}
	
</script>


<script>

	
	function confirmDelete() {
		var confirmation = confirm("Are you sure.... ?")
		return confirmation;
	}
	
	let categoryDropdownForExpense1 = document.getElementById("trans_category_for_expense1")
	let subCategoryDropdownForExpense1 = document.getElementById("trans_sub_category_for_expense1")
	categoryDropdownForExpense1.addEventListener('change',() => {
	    console.log("changed");
	    console.log(categoryDropdownForExpense1.value);
	    (async () => {
	        let response  = await fetch('/ExpenseApplication/user/getUserSubCategory?categoryId='+categoryDropdownForExpense1.value).then(data => data.text())
	             subCategoryDropdownForExpense1.innerHTML = response;
	            console.log(response);
	    })()
	})
	
			editExpence = document.getElementsByClassName('editExpence');
        	Array.from(editExpence).forEach((Element) => {
            Element.addEventListener("click", (e) => {
                tr = e.target.parentNode.parentNode;
                trans_date_for_expense1.value			=	convertJsToDatetimeLocal(tr.getElementsByTagName("td")[0].innerText);
                
                trans_account_expense1.value			=	tr.getElementsByTagName("td")[1].id
                
                $( document ).ready(function() {
        		    console.log( "ready!" );
        			$('#trans_account_expense1').on('load change focus',function(e){
        				document.getElementById('span_account_amount_expense1').innerHTML = stringToRupees(accountObj[this.value]);
        			});
        			document.getElementById('span_account_amount_expense1').innerHTML = stringToRupees(accountObj[document.getElementById('trans_account_expense1').value]);		
        		});
                
                
                trans_category_for_expense1.value		=	tr.getElementsByTagName("td")[2].id
                
                trans_sub_category_for_expense1.value	=	tr.getElementsByTagName("td")[3].id;
                
                (async () => {
        	        let response  = await fetch('/ExpenseApplication/user/getUserSubCategory?categoryId='+categoryDropdownForExpense1.value).then(data => data.text())
        	            subCategoryDropdownForExpense1.innerHTML = response;
        	        	trans_sub_category_for_expense1.value	=	tr.getElementsByTagName("td")[3].id;
        	            console.log(subCategoryDropdownForExpense1.value);
        	            console.log("ho gaya");
        	            
        	    })()
                
                
                trans_amount1.value						=	tr.getElementsByTagName("td")[4].innerText;
                
                trans_note1.value						=	tr.getElementsByTagName("td")[5].innerText;
                
                trans_id1.value							=	e.target.id
                
                console.log(trans_account_expense1)
                console.log("Value "+trans_sub_category_for_expense1)

				
				$('#updateModalForExpense').modal('toggle');
                
           /*  	console.log("e.target.id is "+e) */
            })
        })
        
        
        
        
let categoryDropdownForIncome1 = document.getElementById("trans_category_for_income1")
let subCategoryDropdownForIncome1 = document.getElementById("trans_sub_category_for_income1")
categoryDropdownForIncome1.addEventListener('change',() => {
    console.log("changed");
    console.log(categoryDropdownForIncome1.value);
    (async () => {
        let response  = await fetch('/ExpenseApplication/user/getUserSubCategory?categoryId='+categoryDropdownForIncome1.value).then(data => data.text())
             subCategoryDropdownForIncome1.innerHTML = response;
            console.log(response);
    })()
})
     

editIncome = document.getElementsByClassName('editIncome');
Array.from(editIncome).forEach((Element) => {
	Element.addEventListener("click", (e) => {
 		tr = e.target.parentNode.parentNode;
        trans_date_for_income1.value			=	convertJsToDatetimeLocal(tr.getElementsByTagName("td")[0].innerText);
           
        trans_account_income1.value			=	tr.getElementsByTagName("td")[1].id
           
        $( document ).ready(function() {
    		console.log( "ready!" );
    		$('#trans_account_income1').on('load change focus',function(e){
    			document.getElementById('span_account_amount_income1').innerHTML = stringToRupees(accountObj[this.value]);
    		});
    		document.getElementById('span_account_amount_income1').innerHTML = stringToRupees(accountObj[document.getElementById('trans_account_income1').value]);		
    	});
            
            
        trans_category_for_income1.value		=	tr.getElementsByTagName("td")[2].id
        
        trans_sub_category_for_income1.value	=	tr.getElementsByTagName("td")[3].id;
        
        (async () => {
            let response  = await fetch('/ExpenseApplication/user/getUserSubCategory?categoryId='+categoryDropdownForIncome1.value).then(data => data.text())
                subCategoryDropdownForIncome1.innerHTML = response;
            	trans_sub_category_for_income1.value	=	tr.getElementsByTagName("td")[3].id;
                console.log(response);
        })()
            
            
        trans_amount_income1.value						=	tr.getElementsByTagName("td")[4].innerText;
            
		trans_note_income1.value						=	tr.getElementsByTagName("td")[5].innerText;
            
        trans_id2.value							=	e.target.id
            
        console.log(trans_account_expense1)
        console.log("Value qwe "+e.target.id)


		$('#updateModalForIncome').modal('toggle');
            
       /*  	console.log("e.target.id is "+e) */
	})
})



        	
</script>
</body>
<%@include file="footer.jsp"%>
</html>