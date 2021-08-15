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

<title>Account</title>
<style>
a:active {
	color: #15a362;
	background: #edfdf6;
	border-left: 3px solid #15a362;
	font-weight: 500;
}
</style>
<script>
	var myModal = document.getElementById('myModal')
	var myInput = document.getElementById('myInput')
	
</script>
</head>
<%@include file="header.jsp"%>
<div class="app-wrapper">



	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container-xl">
			<!-- Write code here -->
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Update
								Account</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<f:form action="updateAccount" method="post"
								modelAttribute="abean">

								<div class="row mb-3">
									<label for="account_id" class="col-sm-2 col-form-label">Account
										Id</label>
									<div class="col-sm-10">
										<f:input readonly="readonly" path="account_id"
											cssClass="form-control" id="account_id1" required="required" />
									</div>
								</div>


								<div class="row mb-3">
									<label for="account_group_id" class="col-sm-2 col-form-label">Account
										Group</label>
									<div class="col-sm-10">
										<f:select path="account_group_id" id="account_group1"
											class="form-select">
											<c:forEach items="${account_grp_list}" var="g_name">
												<option value="${g_name.account_group_id}">${g_name.account_group_name}</option>
											</c:forEach>
										</f:select>
									</div>
								</div>
								<div class="row mb-3">
									<label for="account_name" class="col-sm-2 col-form-label">Account
										Name</label>
									<div class="col-sm-10">
										<f:input path="account_name" cssClass="form-control"
											id="account_name1" required="required" />
									</div>
								</div>


								<div class="row mb-3">
									<label for="account_amount" class="col-sm-2 col-form-label">Account
										Amount</label>
									<div class="col-sm-10">
										<f:input path="account_amount" cssClass="form-control"
											id="account_amount1" required="required" />
										<f:errors cssClass="error"></f:errors>
									</div>
								</div>


								<div class="row mb-3">
									<label for="account_description"
										class="col-sm-2 col-form-label">Account Description</label>
									<div Class="col-sm-10">
										<f:textarea path="account_description" cssClass="form-control"
											cssStyle="height:200px;" id="account_description1"
											required="required" />
									</div>
								</div>
								<button type="submit" class="btn"
									style="background: green; float: right; color: white">Submit</button>
							</f:form>
						</div>

					</div>
				</div>
			</div>
			<c:choose>
				<c:when test="${flag==true}">
					<div class="alert alert-success alert-dismissible fade show"
						role="alert">
						<strong>Congratulations...!!!</strong>Data Successfully added.
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:when>
				<c:when test="${flag==false}">
					<div class="alert alert-success alert-dismissible fade show"
						role="alert">
						<strong>Opps...!!!</strong>We are facing some technical
						issue.Please Try again later.
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:when>
			</c:choose>
			<div class="container">
				<f:form action="saveAccount" method="post" modelAttribute="abean">
					<%-- <div class="row mb-3">
						<div class="col-sm-10">
							<input type="hidden" readonly="readonly" name="account_user_id"
								class="form-control" id="account_user_id"
								value="<%=((UserBean) session.getAttribute("user")).getUser_id()%>" />
						</div>
					</div> --%>


					<div class="row mb-3">
						<label for="account_name" class="col-sm-2 col-form-label">Account
							Group</label>
						<div class="col-sm-10">
							<f:select path="account_group_id" class="form-select">
								<c:forEach items="${account_grp_list}" var="g_name">
									<option value="${g_name.account_group_id}">${g_name.account_group_name}</option>
								</c:forEach>
							</f:select>
						</div>
					</div>
					<div class="row mb-3">
						<label for="account_name" class="col-sm-2 col-form-label">Account
							Name</label>
						<div class="col-sm-10">
							<f:input path="account_name" cssClass="form-control"
								id="account_name" required="required" />
						</div>
					</div>


					<div class="row mb-3">
						<label for="account_amount" class="col-sm-2 col-form-label">Account
							Amount</label>
						<div class="col-sm-10">
							<f:input path="account_amount" cssClass="form-control"
								id="account_amount" required="required" />
							<f:errors cssClass="error"></f:errors>
						</div>
					</div>


					<div class="row mb-3">
						<label for="account_description" class="col-sm-2 col-form-label">Account
							Description</label>
						<div Class="col-sm-10">
							<f:textarea path="account_description" cssClass="form-control"
								cssStyle="height:200px;" id="account_description"
								required="required" />
						</div>
					</div>

					<button type="submit" class="btn"
						style="background: green; float: right; color: white">Submit</button>
				</f:form>
			</div>
			<div class="container mt-5">
				<div class="py-2 border-bottom">
					<h5 class="h5">
						<i class="fas fa-chevron-right"></i> Account Overview
					</h5>
				</div>

				<div class=" mx-2 mt-4 bg-white shadow rounded ">
					<div class="table-responsive">
						<table class="table table-hover  text-center" id="myTable">
							<thead class="table-secondary">
								<tr>
									<th>Sr.No.</th>
									<th style="display:none">Account Group Id</th>
									<th>Group Name</th>
									<th>Account Name</th>
									<th>Amount</th>
									<th>Description</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								int i = 1;
								%>
								<c:forEach items="${account_bean_list}" var="bean">
									<tr>
										<td><%=i%></td>
										<td style="display:none">${bean.account_group_id }</td>
										<td>${bean.account_group_name}</td>

										<td>${bean.account_name}</td>
										<td>${bean.account_amount}</td>
										<td>${bean.account_description}</td>
										<td><button type="submit" class="edit btn btn-warning"
												data-bs-toggle="modal" data-bs-target="#exampleModal"
												id="${bean.account_id}">Update</button> <a
											href="delete/${bean.account_id}"><button type="submit"
													class="btn btn-danger" onclick="return confirmDelete()">Delete</button></a>

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
<%@include file="footer.jsp"%>
<script>
	function confirmDelete() {
		var confirmation = confirm("Are you sure.... ?")
		return confirmation;
	}
			edit = document.getElementsByClassName('edit');
        	Array.from(edit).forEach((Element) => {
            Element.addEventListener("click", (e) => {
                tr = e.target.parentNode.parentNode;
                account_group=tr.getElementsByTagName("td")[1].innerText
				account_name=tr.getElementsByTagName("td")[3].innerText;
				account_amount=tr.getElementsByTagName("td")[4].innerText;
				account_description=tr.getElementsByTagName("td")[5].innerText;
				account_id1.value=e.target.id
				account_group1.value=account_group;
				account_name1.value=account_name
				account_amount1.value=account_amount
				account_description1.value=account_description
				$('#exampleModal').modal('toggle');
            })
        })	
</script>
</body>
</html>