<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="main.jsp"%>
<title>Insert title here</title>
</head>

<body class="app app-reset-password p-0">    	
    <div class="row g-0 app-auth-wrapper">
	    <div class="col-12 col-md-7 col-lg-6 display auth-main-col text-center p-5">
		    <div class="d-flex flex-column align-content-end">
			    <div class="app-auth-body mx-auto">	
				    <div class="app-auth-branding mb-4"><a class="app-logo" href="/"><img class="logo-icon me-2" src="<c:url value="/resources/images/app-logo.svg"/>" alt="logo"></a></div>
					<h2 class="auth-heading text-center mb-4">Password Reset</h2>

	
					<div class="auth-form-container text-left">
						
						<form class="auth-form resetpass-form" method="post" action="verifyOtp">                
							<div class="email mb-3">
								<label class="sr-only" for="otp">OTP</label>
								<input id="reg-email" name="otp" type="text" class="form-control" placeholder="Your OTP" required="required">
							</div><!--//form-group-->
							<div class="text-center">
								<button type="submit" class="btn app-btn-primary btn-block theme-btn mx-auto">Reset Password</button>
							</div>
						<c:if test="${flag==true}">
							<span class="text-danger h5">*Enter a valid otp</span>
						</c:if>
						</form>
						
						<div class="auth-option text-center pt-5"><a class="app-link" href="login" >Log in</a> <span class="px-2">|</span> <a class="app-link" href="signup" >Sign up</a></div>
					</div><!--//auth-form-container-->


			    </div><!--//auth-body-->
		    
			    <footer class="app-auth-footer">
				    <div class="container text-center py-3">
				         <!--/* This template is free as long as you keep the footer attribution link. If you'd like to use the template without the attribution link, you can buy the commercial license via our website: themes.3rdwavemedia.com Thank you for your support. :) */-->
			        <small class="copyright">&copy; All rights are reserved</small>
				       
				    </div>
			    </footer><!--//app-auth-footer-->	
		    </div><!--//flex-column-->   
	    </div><!--//auth-main-col-->
	    <div class="col-12 col-md-5 col-lg-6 h-100 auth-background-col">
		    <div class="auth-background-holder">
		    </div>
		    <div class="auth-background-mask"></div>
		    <div class="auth-background-overlay p-3 p-lg-5">
			    <div class="d-flex flex-column align-content-end h-100">
				    
				</div>
		    </div><!--//auth-background-overlay-->
	    </div><!--//auth-background-col-->
    
    </div><!--//row-->


</body>

</html>