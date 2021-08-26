<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="head.jsp"%>
<title>Category</title>
<script type="text/javascript">
	$(document).ready(function() {

		$('#categoryExpenseTable').DataTable();
		$('#categoryIncomeTable').DataTable();
	});
</script>
</head>
<%@include file="header.jsp"%>
<div class="app-wrapper">
	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container-xl">
			<div class="container">
				<div class="row py-2 border-bottom mb-3">
					<h5 class="h5">
						<i class="fas fa-chevron-right"></i> Categories
					</h5>
				</div>
				<div class="row">
					<nav id="orders-table-tab"
						class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
						<a class="flex-sm-fill text-sm-center nav-link"
							id="category-expense-tab" data-bs-toggle="tab"
							href="#category-expense" role="tab"
							aria-controls="category-expense" aria-selected="false">Expense
							Categories</a> <a class="flex-sm-fill text-sm-center nav-link"
							id="category-income-tab" data-bs-toggle="tab"
							href="#category-income" role="tab"
							aria-controls="category-income" aria-selected="false">Income
							Categories</a>
					</nav>
					<div class="tab-content" id="orders-table-tab-content">
						<div class="tab-pane fade show active" id="category-expense"
							role="tabpanel" aria-labelledby="transaction-all-tab">
							<div class="table-responsive">
								<table class="table table-hover  text-center"
									id="categoryExpenseTable">
									<thead class="table-secondary">
										<tr>
											<th>Sr.No.</th>
											<th style="display: none">Category Id</th>
											<th>Category Name</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<%
										int i = 1;
										%>
										<c:forEach items="${categoryExpenseList}" var="bean">
											<tr>
												<td><%=i%></td>
												<td style="display: none">${bean.category_id }</td>
												<td>${bean.category_name}</td>
												<td>
													<button type="submit" class="edit btn btn-warning"
														data-bs-toggle="modal" data-bs-target="#categoryModal"
														id="${bean.category_id}"
														onclick="loadCategoryModal('${bean.category_id}','${bean.category_name}')">Update</button>
													<a href="category/delete/${bean.category_id}"><button
															type="submit" class="btn btn-danger"
															onclick="return confirmDelete()">Delete</button></a>

												</td>
											</tr>
											<%
											i = i + 1;
											%>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

						<div class="tab-pane fade " id="category-income" role="tabpanel"
							aria-labelledby="transaction-all-tab">
							<div class="table-responsive">
								<table class="table table-hover  text-center"
									id="categoryIncomeTable">
									<thead class="table-secondary">
										<tr>
											<th>Sr.No.</th>
											<th style="display: none">Category Id</th>
											<th>Category Name</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<%
										int j = 1;
										%>
										<c:forEach items="${categoryIncomeList}" var="bean">
											<tr>
												<td><%=j%></td>
												<td style="display: none">${bean.category_id }</td>
												<td>${bean.category_name}</td>
												<td>
													<button type="submit" class="edit btn btn-warning"
														data-bs-toggle="modal" data-bs-target="#categoryModal"
														id="${bean.category_id}">Update</button> <a
													href="category/delete/${bean.category_id}"><button
															type="submit" class="btn btn-danger"
															onclick="return confirmDelete()">Delete</button></a>

												</td>
											</tr>
											<%
											j = j + 1;
											%>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="modal fade" id="categoryModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Update
										Catgory</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>

								<form action="/ExpenseApplication/user/category/update"
									method="POST">
									<div class="modal-body">
										<div class="mb-3">
											<input type="hidden" class="form-control" id="category_id"
												name="category_id" /> <label for="categoryInput"
												class="form-label">Catgory </label> <input type="text"
												class="form-control" id="category_name" name="category_name"
												placeholder="Enter Category Name" required />
										</div>
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Cancel</button>
										<button type="submit" class="btn btn-primary">Update</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function loadCategoryModal(categoryId, categoryName) {

			$('#category_id').val(categoryId)
			$('#category_name').val(categoryName)
		}
	</script>
	</body>
	<%@include file="footer.jsp"%>
</html>
