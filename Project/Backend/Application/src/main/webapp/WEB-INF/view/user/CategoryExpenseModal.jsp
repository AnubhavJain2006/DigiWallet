	<!-- Modal for category -->
			<div class="modal fade" id="categoryExpenseModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Add Catgory</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<form action="/ExpenseApplication/user/addExpenseCategory"
							method="POST">
							<div class="modal-body">
								<div class="mb-3">
									<label for="categoryInput" class="form-label">Catgory </label>
									<input type="text" class="form-control" id="categoryInput"
										name="categoryInput" placeholder="Enter Category Name"
										required />
								</div>
								<div class="mb-3">
									<label for="subCategoryInput" class="form-label">Sub
										Catgory </label> <input type="text" class="form-control"
										id="subCategoryInput" name="subCategoryInput"
										placeholder="Enter Sub Category Name">
								</div>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Cancel</button>
								<button type="submit" class="btn btn-primary">Add</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			
			
			
			<!-- Modal for sub category for expense-->
			<div class="modal fade" id="subCategoryModalForExpense" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Add Sub
								Catgory</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>

						<form action="/ExpenseApplication/user/addUserSubCategory"
							method="POST">
							<div class="modal-body">
								<div class="mb-3">
									<label for="modalCategory" class="form-label">Sub
										Catgory </label> <select class="form-select"
										aria-label="Default select example"
										id="modalSelectCategoryForExpense" name="categoryId">
										<c:forEach items="${expense_category_list}"
											var="category_list">
											<option value="${category_list.category_id}">${category_list.category_name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="mb-3">
									<label for="subCategoryInputInModal" class="form-label">Sub
										Catgory </label> <input type="text" class="form-control"
										id="subCategoryInputInModal" name="subCategoryInput"
										placeholder="Enter Sub Category Name" required>
								</div>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Cancel</button>
								<button type="submit" class="btn btn-primary">Add</button>
							</div>
						</form>
					</div>
				</div>
			</div>