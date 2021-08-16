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
<script>
	var myModal = document.getElementById('myModal')
	var myInput = document.getElementById('myInput')
</script>
<link href="<c:url value=" /resources/css/profile.css" />"
	rel="stylesheet"></link>
</head>
<%@include file="header.jsp"%>
<div class="app-wrapper">

	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container-xl">

			<h1 class="app-page-title">My Account</h1>
			<div class="container">
				<f:form action="updateProfile" method="POST" modelAttribute="user">
					<div class="row gy-4">
						<div class="col-12 col-lg-12">
							<div
								class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">
								<div class="app-card-header p-3 border-bottom-0">
									<div class="row align-items-center gx-3">
										<div class="col-auto">
											<div class="app-icon-holder">
												<svg width="1em" height="1em" viewBox="0 0 16 16"
													class="bi bi-person" fill="currentColor"
													xmlns="http://www.w3.org/2000/svg">
																	<path fill-rule="evenodd"
														d="M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z">
																	</path>
																</svg>
											</div>
											<!--//icon-holder-->

										</div>
										<!--//col-->
										<div class="col-auto">
											<h4 class="app-card-title">Profile</h4>
										</div>
										<!--//col-->
									</div>
									<!--//row-->
								</div>
								<!--//app-card-header-->
								<div class="app-card-body px-4 w-100">
									<div class="item py-3">
										<div class="row justify-content-between align-items-center">
											<div class="col-auto">

												<div class="item-data">
													<img class="profile-image"
														onerror="this.src='<c:url value="/resources/images/male.png"></c:url>'"
														src="">
												</div>
											</div>
											<!--//col-->
											<!--//col-->
										</div>
										<!--//row-->
									</div>
									<!--//item-->

<%-- 									<div class="item border-bottom py-6 mt-3">
										<div class="row justify-content-between align-items-center">
											<div class="col-lg-6">
												<div class="item-label">
													<strong>ID</strong>
												</div>
												<div class="item-data">
													<f:input type="text" path="user_id"
														cssStyle="border:none;margin-bottom:1px;"
														cssClass="form-control" />
													<f:errors class="error" path="user_id"></f:errors>
												</div>
											</div>
											<!--//col-->

										</div> --%>
										<div class="item border-bottom py-6 mt-3">
											<div class="row justify-content-between align-items-center">
												<div class="col-lg-6">
													<div class="item-label">
														<strong>Name</strong>
													</div>
													<div class="item-data">
														<f:input type="text" path="user_name"
															cssStyle="border:none;margin-bottom:1px;"
															cssClass="form-control" />
														<f:errors class="error" path="user_name"></f:errors>
													</div>
												</div>
												<!--//col-->

											</div>
											<!--//row-->
										</div>
										<!--//item-->
										<div class="item border-bottom py-6 mt-3">
											<div class="row justify-content-between align-items-center">
												<div class="col-lg-6">
													<div class="item-label">
														<strong>Email</strong>
													</div>
													<div class="item-data">
														<f:input readonly="true" type="email" path="user_email"
															cssStyle="border:none;margin-bottom:1px;"
															cssClass="form-control" />
														<f:errors class="error" path="user_email"></f:errors>
													</div>
												</div>
												<!--//col-->

											</div>
											<!--//row-->
										</div>
										<!--//item-->
										<div class="item border-bottom py-6 mt-3">
											<div class="row justify-content-between align-items-center">
												<div class="col-lg-6">
													<div class="item-label">
														<strong>Contact Number</strong>
													</div>
													<div class="item-data">
														<f:input type="text" path="user_phone"
															cssStyle="border:none;margin-bottom:1px;"
															cssClass="form-control" />
														<f:errors class="error" path="user_phone"></f:errors>
													</div>
												</div>
											</div>
											<!--//row-->
										</div>
										<!--//item-->
										<div class="item border-bottom py-6 mt-3">
											<div class="row justify-content-between align-items-center">
												<div class="col-auto">
													<div class="item-label">
														<strong>Gender</strong>
													</div>
													<div class="item-data mt-3 mb-3">
														<!-- /////////////////////////////////////////////////// -->

														<!-- ////////////////////////////////////////////////// -->
														<span style="text-shadow: 1px 4px 3px #9ebadb"> <f:radiobutton
																path="user_gender" value="Male" /> Male
														</span> <span style="text-shadow: 1px 4px 3px #c59edb"> <f:radiobutton
																path="user_gender" value="Female" /> Female
														</span>
														<f:errors class="error" path="user_gender"></f:errors>
													</div>
												</div>
												<!--//col-->

											</div>
											<!--//row-->
										</div>
										<div class="item border-bottom py-3">
											<div class="row justify-content-between align-items-center">
												<div class="col-auto">
													<div class="item-label">
														<strong>Password</strong>
													</div>
													<div class="item-data">
														<f:input type="password" path="user_password"
															cssStyle="border:none;margin-bottom:1px;"
															cssClass="form-control" />
														<f:errors class="error" path="user_password"></f:errors>
													</div>
												</div>
												<!--//col-->
											</div>
											<!--//row-->
										</div>
										<!--//item-->
										<button type="submit" class="btn btn-success mt-3 mb-3">Update</button>
									</div>
									<!--//app-card-body-->
									<!--//app-card-footer-->

								</div>
								<!--//app-card-->
							</div>
							<!--//col-->

							<!--//col-->

						</div>
						<!--//row-->
				</f:form>
			</div>
		</div>
		<!--//container-fluid-->
	</div>
	<!--//app-content-->



</div>
<%@include file="footer.jsp"%>
</body>

</html>