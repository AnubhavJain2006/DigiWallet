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
<link href="<c:url value="/resources/css/dropdown.css"/>"
	rel="stylesheet">
</head>
<%@include file="header.jsp"%>
<div class="app-wrapper">
	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container-xl">
			<div class="container mb-5">
				<div class="row py-2 border-bottom mb-3">
					<h5 class="h5">
						<i class="fas fa-chevron-right"></i> Payees
						<button type="button" class="btn"
							style="background: green; float: right; color: white"
							data-bs-toggle="modal" data-bs-target="#exampleModal">Add
							Payee</button>
					</h5>

				</div>
				<div>

					<!-- Add Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">

									<form action="addPayee" method="POST">
										
									<div class="row mb-3">
											<label for="add_payee_name" class="col-sm-2 col-form-label">PayeeName</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="payee_name"
													id="add_payee_name">
											</div>
										</div>
									
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-primary">Add Payee</button>
										</div>
									</form>


								</div>

							</div>
						</div>
					</div>

					<!-- Update Modal -->
					<div class="modal fade" id="updatePayee" tabindex="-1"
						aria-labelledby="updatePayeeLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="updatePayeeLabel">Update Payee</h5>

									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">

									<form action="updatePayee" method="POST">
										<div class="row mb-3">
											<label for="inputEmail3" class="col-sm-2 col-form-label">Payee
												Id</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="payee_id"
													id="payee_id">
											</div>
										</div>
										<div class="row mb-3">
											<label for="inputPassword3" class="col-sm-2 col-form-label">PayeeName</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="payee_name"
													id="payee_name">
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="editPaye btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-primary">Save
												changes</button>
										</div>
									</form>


								</div>

							</div>
						</div>
					</div>

				</div>
				<div class="row">
					<div class="container">
						<div class="table-responsive">
							<table class="table table-hover  text-center" id="myTable">
								<thead class="table-secondary">
									<tr>
										<th>Sr.No</th>
										<th class="d-none">PayeeId</th>
										<th>Payee Name</th>
										<th>Created At</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<%
									int i = 1;
									%>
									<c:forEach items="${payeeList}" var="payee">
										<tr>
											<td><%=i%></td>
											<td style="display: none">${payee.payee_id}</td>
											<td>${payee.payee_name}</td>
											<td>${payee.payee_createdAt }</td>
											<td>
												<button class="btn btn-sm btn-warning editPayee"
													data-bs-toggle="modal" data-bs-target="#updatePayee">Update</button>
												<a href="payeeDelete/${payee.payee_id}"
												class="btn btn-sm btn-danger">Delete</a>
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


				</div>
			</div>

		</div>
	</div>
</div>
<script>

edit = document.getElementsByClassName('editPayee');
Array.from(edit).forEach((Element) => {
Element.addEventListener("click", (e) => {
    tr = e.target.parentNode.parentNode;
    payee_id.value=tr.getElementsByTagName("td")[1].innerText
	payee_name.value=tr.getElementsByTagName("td")[2].innerText;
	$('#updatePayee').modal('toggle');
})
})	
</script>
</body>
<%@include file="footer.jsp"%>
</html>
