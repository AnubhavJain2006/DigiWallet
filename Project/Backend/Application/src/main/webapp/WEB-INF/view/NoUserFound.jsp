<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE jsp>
<html lang="en">
<head>
<%@include file="main.jsp"%>
<title>No User Found</title>
</head>
<body>
<body class="app app-reset-password p-0">    	
    <div class="row g-0 app-auth-wrapper">
	    <div class="col-12 col-md-7 col-lg-6 auth-main-col text-center p-5" style="display:flex;justify-content:center;flex-direction:column">
		    <div class="d-flex flex-column  align-content-end">
			    <div class="app-auth-body mx-auto">	
				    <div class="app-auth-branding mb-4"><a class="app-logo" href="/"><img class="logo-icon me-2" src="<c:url value="/resources/images/app-logo.svg"/>" alt="logo"></a></div>
					<h2 class="auth-heading text-center text-danger mb-4">Email Address Not Found</h2>

					<div class="auth-intro mb-4 text-center">Please Enter a valid Email Address</div>
	
					<div class="auth-form-container text-left">
						
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