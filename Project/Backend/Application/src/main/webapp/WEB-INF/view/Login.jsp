<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE jsp>
<html lang="en">
<head>
<%@include file="main.jsp"%>
<title>Login</title>
</head>
<body class="app app-login p-0">


	<div class="row g-0 app-auth-wrapper">

		<div class="col-12 col-md-7 col-lg-6 display auth-main-col text-center p-5">
			
			<c:choose>
				<c:when test="${result==1}">
					<div class="alert alert-success alert-dismissible fade show"
						role="alert">
						<strong>Congratulations...!!!</strong>Your account has been
						succesfully created.
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:when>

				<c:when test="${result==0}">
					<div class="alert alert-danger alert-dismissible fade show"
						role="alert">
						<strong>Sorry...</strong>We are facing some technical issue.Try
						again later....!!
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:when>
				
				<c:when test="${result==3}">
					<div class="alert alert-danger alert-dismissible fade show"
						role="alert">
						<strong>Invalid Credentials..</strong>Email or Password is incorrect...
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:when>
				
				<c:when test="${result==4}">
					<div class="alert alert-success alert-dismissible fade show"
						role="alert">
						<strong>Congratulations..</strong>Your Password has been successfully changed.
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:when>
				<c:when test="${result==5}">
					<div class="alert alert-danger alert-dismissible fade show"
						role="alert">
						<strong>Opps..</strong>User Already Exist.
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:when>
				</c:choose>
				<div class="d-flex flex-column align-content-end">
					<div class="app-auth-body mx-auto">
						<div class="app-auth-branding mb-4">
							<a class="app-logo"
								href="<c:url value="/resources/images/index.jsp"/>"><img
								class="logo-icon me-2"
								src="<c:url value="/resources/images/app-logo.svg"/>"></a>
						</div>
						<h2 class="auth-heading text-center mb-5">Log in to Portal</h2>
						<div class="auth-form-container text-start">
							<f:form class="auth-form login-form"
								action="checkUser" method="post" modelAttribute="user">
								<div class="email mb-3">
									<label class="sr-only" for="signin-email">Email</label> <f:input
										id="signin-email" path="user_email" type="email"
										class="form-control signin-email" placeholder="Email address"
										required="required"/>
								</div>
								<!--//form-group-->
								<div class="password mb-3">
									<label class="sr-only" for="signin-password">Password</label> <f:password
										id="signin-password" path="user_password" 
										class="form-control signin-password" placeholder="Password"
										required="required"/>
									<div class="extra mt-3 row justify-content-between">
										<div class="col-6">
											<div class="form-check">
												<!-- 	<input class="form-check-input" type="checkbox" value=""
												id="RememberPassword"> -->
												<!-- <label class="form-check-label" for="RememberPassword">
												Remember me
											</label> -->
											</div>
										</div>
										<!--//col-6-->
										<div class="col-6">
											<div class="forgot-password text-end">
												<a href="<c:url value="forgotpassword"/>">Forgot
													password?</a>
											</div>
										</div>
										<!--//col-6-->
									</div>
									<!--//extra-->
								</div>
								<!--//form-group-->
								<div class="text-center">
									<button type="submit"
										class="btn app-btn-primary w-100 theme-btn mx-auto">Log
										In</button>
								</div>
							</f:form>

							<div class="auth-option text-center pt-5">
								No Account? Sign up <a class="text-link"
									href="<c:url value="signup"/>">here</a>.
							</div>
						</div>
						<!--//auth-form-container-->

					</div>
					<!--//auth-body-->

					<footer class="app-auth-footer">
						<div class="container text-center py-3">
							<!--/* This template is free as long as you keep the footer attribution link. If you'd like to use the template without the attribution link, you can buy the commercial license via our website: themes.3rdwavemedia.com Thank you for your support. :) */-->
							<small class="copyright"> &copy; All rights are reserved
							</small>

						</div>
					</footer>
					<!--//app-auth-footer-->
				</div>
				<!--//flex-column-->
		</div>
		<!--//auth-main-col-->
		<div class="col-12 col-md-5 col-lg-6 h-100 auth-background-col">
			<div class="auth-background-holder"></div>
			<div class="auth-background-mask"></div>
			<div class="auth-background-overlay p-3 p-lg-5">
				<div class="d-flex flex-column align-content-end h-100">
					<div class="h-100"></div>
				</div>
			</div>
			<!--//auth-background-overlay-->
		</div>
		<!--//auth-background-col-->

	</div>
	<!--//row-->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>