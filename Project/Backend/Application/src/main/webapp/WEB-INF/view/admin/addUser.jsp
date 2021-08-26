<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Add User</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<f:form class="auth-form auth-signup-form" action="saveUser"
					modelAttribute="user" method="post">
					<div class="email mb-3">
						<label class="sr-only" for="signup-name">Your Name</label>
						<f:input id="signup-name" path="user_name" type="text"
							class="form-control signup-name" placeholder="Full name"
							required="required" />
						<f:errors path="user_name" cssClass="error"></f:errors>
					</div>
					<div class="email mb-3">
						<label class="sr-only" for="signup-email">Your Email</label>
						<f:input id="signup-email" path="user_email" type="email"
							class="form-control signup-email" placeholder="Email"
							required="required" />
						<f:errors path="user_email" cssClass="error"></f:errors>
					</div>


					<div class="email mb-3">
						<label class="sr-only" for="signup-email">Role</label>
						<f:select id="signup-role" path="user_role" type="email"
							class="form-select" 
							required="required">
								<option selected>Select Role</option>
								<option value="1">Admin</option>
								<option value="2">User</option>
						</f:select>
						<f:errors path="user_role" cssClass="error"></f:errors>
					</div>

					<div class="password mb-3">
						<label class="sr-only" for="signup-password">Password</label>
						<f:password id="signup-password" path="user_password"
							cssClass="form-control signup-password"
							placeholder="Create a password" required="required" />
						<f:errors path="user_password" cssClass="error"></f:errors>
						<br> <input type="checkbox" id="eye"
							class="d-inline form-check-label fas fa-eye"
							onclick="myFunction()">Show Password
					</div>

					<!--//extra-->


					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Add User</button>
					</div>
				</f:form>
			</div>

		</div>
	</div>
</div>