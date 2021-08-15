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
			<div class="form">

				<ul class="tab-group">
					<li class="tab active"><a href="#signup">Expense</a></li>
					<li class="tab"><a href="#login">Income</a></li>
				</ul>

				<div class="tab-content">
					<div id="signup">
						<h1>Add Expense</h1>

						<form>
							<div class="row mb-3">
								<label for="trnas_date" class="col-sm-4 col-form-label">Date</label>
								<div class="col-sm-8">
									<input type="datetime-local" class="form-control"
										id="trans_date">
								</div>
							</div>
							<div class="row mb-3">
								<label for="inputPassword3" class="col-sm-4 col-form-label">Account</label>
								<div class="col-sm-8">
									<select class="form-select" aria-label="Default select example">
										<c:forEach items="${account_list}" var="account_list">
											<option value="${account_list.account_id}">${account_list.account_name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="row mb-3">
								<label for="trans_category" class="col-sm-4 col-form-label">Category</label>
								<div class="col-sm-8">
									<select class="form-select" aria-label="Default select example"
										id="trans_category">
										<c:forEach items="${category_list}" var="category_list">
											<option value="${category_list.category_id}">${category_list.category_name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="row mb-3">
								<label for="trans_sub_category" class="col-sm-4 col-form-label">Sub
									Category</label>
								<div class="col-sm-8">
									<select class="form-select" aria-label="Default select example"
										id="trans_sub_category">
									</select>
								</div>
							</div>
							<div class="row mb-3">
								<label for="trans_amount" class="col-sm-4 col-form-label">Amount</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="trans_amount">
								</div>
							</div>
							<div class="row mb-3">
								<label for="trans_label" class="col-sm-4 col-form-label">Label</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="trans_label">
								</div>
							</div>
							<div class="row mb-3">
								<label for="trans_note" class="col-sm-4 col-form-label">Note</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="trans_note">
								</div>
							</div>
							<div class="row mb-3">
								<label for="trans_description" class="col-sm-4 col-form-label">Description</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="trans_description">
								</div>
							</div>
							<div class="row mb-3">
								<label for="trans_image" class="col-sm-4 col-form-label">Image</label>
								<div class="col-sm-8">
									<input type="file" class="form-control" id="trans_image">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-10"></div>
								<div class="col-sm-2">
									<button type="submit" class="btn btn-primary">Add</button>
								</div>
							</div>
						</form>
					</div>

					<div id="login">
						<h1>Add Income</h1>

						<form>
							<div class="row mb-3">
								<label for="inputEmail3" class="col-sm-4 col-form-label">Date</label>
								<div class="col-sm-8">
									<input type="email" class="form-control" id="inputEmail3">
								</div>
							</div>
							<div class="row mb-3">
								<label for="inputPassword3" class="col-sm-4 col-form-label">Password</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" id="inputPassword3">
								</div>
							</div>


							<button type="submit" class="btn btn-primary">Sign in</button>
						</form>
					</div>

				</div>
				<!-- tab-content -->

			</div>
			<!-- /form -->

		</div>
	</div>
</div>
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
	document.getElementById('trans_date').value = dateStr
</script>
<script>
let categoryDropdown = document.getElementById("trans_category")
let subCategoryDropdown = document.getElementById("trans_sub_category")
categoryDropdown.addEventListener('change',() => {
    console.log("changed");
    console.log(categoryDropdown.value);
    (async () => {
        let response  = await fetch('/ExpenseApplication/user/getUserSubCategory?categoryId='+categoryDropdown.value).then(data => data.text())
             subCategoryDropdown.innerHTML = response;
            console.log(response);
    })()
})
</script>
</body>
<%@include file="footer.jsp"%>
</html>