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
			<!-- <div class="row g-4 mb-4">
				<div class="col-6 col-lg-3">
				</div>
			</div> -->
			<div class="row mt-4">
				<div class="col-2"></div>
				<div class="col-8">
					<div class="app-card app-card-orders-table p-4 shadow-sm mb-5">
						<div class="app-card-body">
							<div class="py-2 mb-3 border-bottom">
								<h5 class="h5">
									<i class="fas fa-chevron-right"></i>All Admin
								</h5>

							</div>
							<div class="table-responsive">
								<%@include file="recordTable.jsp" %>
							</div>

						</div>
					</div>
					<button class="btn btn-primary" style="float: right;"
						data-bs-toggle="modal" data-bs-target="#exampleModal">Add
						User</button>
				</div>

				<div class="col-2"></div>

			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</div>
<script>
		edit = document.getElementsByClassName('edit');
    	Array.from(edit).forEach((Element) => {
    	Element.addEventListener("click", (e) => {
        	tr = Element.parentNode.parentNode;
        	user_id=e.target.closest("a").id;
  		   user_name=tr.getElementsByTagName("td")[1].innerText;
 		 	 user_email=tr.getElementsByTagName("td")[2].innerText;
 		 	user_status=tr.getElementsByTagName("td")[4].innerText;
 		 	emailUser.value=user_email;
 		 	nameUser.value=user_name;
 		 	statusUser.value=user_status
 		 	idUser.value=user_id;
		   $('#EditModal').modal('toggle');
    	    })	
        })
	
</script>
</body>
</html>