<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!-- Modal -->
<div class="modal fade" id="EditModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<f:form class="auth-form auth-signup-form" action="updateUser"
					modelAttribute="user" method="post">
					<div class="email mb-3">
						<label class="sr-only" for="userId">UserID</label>
						<f:input id="idUser" path="user_id" name="idUser" type="text"
							class="form-control signup-name" placeholder="Full name"
							required="required" />
						<f:errors path="user_id" cssClass="error"></f:errors>
					</div>
					
					<div class="email mb-3">
						<label class="sr-only" for="signup-name">User Name</label>
						<f:input id="nameUser" path="user_name" name="nameUser" type="text"
							class="form-control signup-name" placeholder="Full name"
							required="required" />
						<f:errors path="user_name" cssClass="error"></f:errors>
					</div>
					<div class="email mb-3">
						<label class="sr-only" for="signup-email">User Email</label>
						<f:input id="emailUser" path="user_email" name="emailUser" type="email"
							class="form-control signup-email" placeholder="Email"
							required="required" />
						<f:errors path="user_email" cssClass="error"></f:errors>
					</div>
					<div class="email mb-3">
						<label class="sr-only" for="signup-email">Status</label>
						<f:select path="user_status" id="statusUser" class="form-select" name="statusUser"
							aria-label="Default select example">
							<option selected>Status of User</option>
							<option value="ACTIVE">Active</option>
							<option value="DEACTIVE">Deactive</option>
						</f:select>
						<f:errors path="user_status" cssClass="error"></f:errors>
					</div>
					<!--//extra-->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Update User</button>
					</div>
				</f:form>
			</div>
		</div>
	</div>
</div>