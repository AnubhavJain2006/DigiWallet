<%@page import="com.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
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
</head>
<%@include file="header.jsp"%>
<div class="app-wrapper">

	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container-xl">
			<!-- Write code here -->
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
					<div class="row mb-3">
						<div class="col-sm-10">
							<input type="hidden" readonly="readonly" name="account_user_id"
								class="form-control" id="account_user_id"
								value="<%=((UserBean) session.getAttribute("user")).getUser_id()%>" />
						</div>
					</div>


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
								id="account_name" />
						</div>
					</div>


					<div class="row mb-3">
						<label for="account_amount" class="col-sm-2 col-form-label">Account
							Amount</label>
						<div class="col-sm-10">
							<f:input path="account_amount" cssClass="form-control"
								id="account_amount" />
							<f:errors cssClass="error"></f:errors>
						</div>
					</div>


					<div class="row mb-3">
						<label for="account_description" class="col-sm-2 col-form-label">Account
							Description</label>
						<div Class="col-sm-10">
							<f:textarea path="account_description" cssClass="form-control"
								cssStyle="height:200px;" id="account_description" />
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
										<td>${bean.account_group_name}</td>
										<td>${bean.account_name}</td>
										<td>${bean.account_amount}</td>
										<td>${bean.account_description}</td>
										<td>
											<form action="/${bean.account_id }" method="POST">
												<a href=""><button type="submit" class="btn btn-warning">Update</button></a>
												<a href=""><button type="submit" class="btn btn-danger">Delete</button></a>
											</form>
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

</body>
</html>