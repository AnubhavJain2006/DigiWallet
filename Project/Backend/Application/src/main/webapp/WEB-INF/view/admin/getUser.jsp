<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="head.jsp"%>
<title>Admin</title>
</head>
<%@include file="header.jsp"%>
<%@include file="addUser.jsp"%>
<%@include file="editUser.jsp"%>
<div class="app-wrapper">
	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container-xl">
			<div class="row">
				<div class="col-2"></div>
				<div class="col-8 m-5">
					<table class="app-card  table">
						<tr>
							<td>Name</td>
							<td>${user.user_name}</td>
						</tr>
						<tr>
							<td>Gender</td>
							<td>${user.user_gender}</td>
						</tr>
						<tr>
							<td>Email</td>
							<td>${user.user_email}</td>
						</tr>
						<tr>
							<td>Phone Number</td>
							<td>${user.user_phone}</td>
						</tr>
						<tr>
							<td>Account Created</td>
							<td>${user.user_insertDate}</td>
						</tr>
						<tr>
							<td>Update Date</td>
							<td>${user.user_updateDate}</td>
						</tr>
						
						<tr>
							<td>Status
							</td>
							<td>${user.user_status}</td>
						</tr>
					</table>
				</div>
				<div class="col-2"></div>
			</div>
		</div>
	</div>
</div>

<%@include file="footer.jsp"%>

</body>
</html>