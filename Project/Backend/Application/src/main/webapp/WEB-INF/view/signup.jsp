
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE jsp>
<html lang="en">
<head>
<%@include file="main.jsp"%>
<title>Signup</title>
<style>
	.error{
	color:red;
	}
</style>
</head>

<body class="app app-signup p-0">
	<div class="row g-0 app-auth-wrapper">
		<div class="col-12 col-md-7 col-lg-6 auth-main-col text-center p-5">
			<div class="d-flex flex-column align-content-end">
				<div class="app-auth-body mx-auto">
					<div class="app-auth-branding mb-4">
						<a class="app-logo" href="<c:url value="/resources/views/home"/>"><img
							class="logo-icon me-2"
							src="<c:url value="/resources/images/app-logo.svg"/>"></a>
					</div>
					<h2 class="auth-heading text-center mb-4">Sign up to Portal</h2>

					<div class="auth-form-container text-start mx-auto">
						<f:form class="auth-form auth-signup-form" action="saveuser" modelAttribute="user" method="post">
							<div class="email mb-3">
								<label class="sr-only" for="signup-name">Your Name</label> <f:input
									id="signup-name" path="user_name" type="text"
									class="form-control signup-name" placeholder="Full name"
									required="required"/>
									<f:errors path="user_name" cssClass="error"></f:errors>
							</div>
							<div class="email mb-3">
								<label class="sr-only" for="signup-email">Your Email</label> <f:input
									id="signup-email" path="user_email" type="email"
									class="form-control signup-email" placeholder="Email"
									required="required"/>
									<f:errors path="user_email" cssClass="error"></f:errors>
							</div>
							<div class="password mb-3">
								<label class="sr-only" for="signup-password">Password</label> <f:password
									id="signup-password" path="user_password"
									cssClass="form-control signup-password"
									placeholder="Create a password" required="required"/> 
									<f:errors path="user_password" cssClass="error"></f:errors>
									<input type="checkbox" id="eye" class="d-inline form-check-label fas fa-eye" onclick="myFunction()">Show Password
							</div>
					
							<!--//extra-->

							<div class="text-center">
								<button type="submit"
									class="btn app-btn-primary w-100 theme-btn mx-auto">Sign
									Up</button>
							</div>
						</f:form>
						<!--//auth-form-->

						<div class="auth-option text-center pt-5">
							Already have an account? <a class="text-link" href="login">Log
								in</a>
						</div>
					</div>
					<!--//auth-form-container-->



				</div>
				<!--//auth-body-->

				<footer class="app-auth-footer">
					<div class="container text-center py-3">
						<!--/* This template is free as long as you keep the footer attribution link. If you'd like to use the template without the attribution link, you can buy the commercial license via our website: themes.3rdwavemedia.com Thank you for your support. :) */-->
						<small class="copyright"> &copy; All rights are reserved </small>
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
	
	<script>
	function myFunction() {
		  var eye=document.getElementById("eye");
		  var x = document.getElementById("signup-password");
		  if (x.type === "password") {
		    x.type = "text";
		    eye.classList.add("fa-eye-slash")
		    eye.classList.remove("fas fa-eye")
		  } else {
		    x.type = "password";
		    eye.classList.remove("fa-eye-slash")
		    eye.classList.add("fa-eye")
		  }
		}
	
	</script>
</body>
</html>

