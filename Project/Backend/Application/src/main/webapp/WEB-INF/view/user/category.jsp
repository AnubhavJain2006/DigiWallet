<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="head.jsp"%>
<title>Category</title>
<link href="<c:url value="/resources/css/dropdown.css"/>"
	rel="stylesheet">
</head>
<%@include file="header.jsp"%>
<div class="app-wrapper">
	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container-xl">
			<div class="container mb-5">
				<div class="row py-2 border-bottom mb-3">
					<h5 class="h5">
						<i class="fas fa-chevron-right"></i> Categories
					</h5>
				</div>
				<div class="row">
					<div class="container">
						<div class="table-responsive">
							<table class="table table-hover  text-center"
								id="categoryExpenseTable">
								<thead class="table-secondary">
									<tr>
										<th>Sr.No.</th>
										<th style="display: none">Category Id</th>
										<th>Category Name</th>
										<th>Category Type</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<%
									int i = 1;
									%>
									<c:forEach items="${categoryList}" var="bean">
										<tr>
											<td><%=i%></td>
											<td style="display: none">${bean.category_id }</td>
											<td>${bean.category_name}</td>
											<c:choose>
												<c:when test="${bean.category_type=='EXPENSE'}">
													<td class="cell"><span class="badge bg-danger">${bean.category_type}</span></td>
												</c:when>
												<c:when test="${bean.category_type=='INCOME'}">
													<td class="cell"><span class="badge bg-success">${bean.category_type}</span></td>
												</c:when>
											</c:choose>
											<td>
												<button type="submit" class="edit btn btn-warning"
													data-bs-toggle="modal" data-bs-target="#categoryModal"
													id="${bean.category_id}"
													onclick="loadCategoryModal('${bean.category_id}','${bean.category_name}')">Update</button>
												<a href="category/delete/${bean.category_id}"><button
														type="submit" class="btn btn-danger"
														onclick="return confirmDelete()">Delete</button></a>

											</td>
										</tr>
										<%
										i = i + 1;
										%>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

					<div class="modal fade" id="categoryModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Update
										Catgory</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>

								<form action="/ExpenseApplication/user/category/update"
									method="POST">
									<div class="modal-body">
										<div class="mb-3">
											<input type="hidden" class="form-control" id="category_id"
												name="category_id" /> <label for="categoryInput"
												class="form-label">Sub Category Name </label> <input type="text"
												class="form-control" id="category_name" name="category_name"
												placeholder="Enter Category Name" required />
										</div>
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Cancel</button>
										<button type="submit" class="btn btn-primary">Update</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row py-2 border-bottom mb-3">
					<h5 class="h5">
						<i class="fas fa-chevron-right"></i> Sub Categories
					</h5>
				</div>
				<div class="row mb-5">
					<div class="col-3">
						<div class="form-group">
							<select class="form-select" id="categoryType">
								<option value="Expense">Expense</option>
								<option value="Income">Income</option>
							</select>
						</div>
					</div>
					<div class="col-4">

						<div class="dropdown">
							<button onclick="myFunction()" class="form-select"
								id="categoryDropDown">All Category</button>
							<div id="myDropdown" class="dropdown-content">
								<input type="text" placeholder="Search.." class="form-control"
									id="categorySearchDropdown" onkeyup="filterFunction()">
								<div id="displayCategoryDiv">
									<!-- here all the category comes through ajax -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row mb-5" id="displaySubCategory"></div>
				<div class="row">
					<div class="modal fade" id="subCategoryModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Update Sub
										Catgory</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>

								
									<div class="modal-body">
										<div class="mb-3">
											<input type="hidden" class="form-control"
												id="sub_category_id" name="sub_category_id" /> <label
												for="categoryInput" class="form-label">Sub Category Name</label> <input
												type="text" class="form-control" id="sub_category_name"
												name="sub_category_name"
												placeholder="Enter Sub Category Name" required />
										</div>
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Cancel</button>
										<button type="button" onclick="updateSubCategory()" class="btn btn-primary" data-bs-dismiss="modal" >Update</button>
									</div>
									
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function loadCategoryModal(categoryId, categoryName) {

		$('#category_id').val(categoryId)
		$('#category_name').val(categoryName)
	}
	function loadSubCategoryModal(categoryId, categoryName) {

		$('#sub_category_id').val(categoryId)
		$('#sub_category_name').val(categoryName)
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('table').DataTable();
	});
</script>
<script type="text/javascript">
function myFunction() {
	  document.getElementById("myDropdown").classList.toggle("show");
	}

	function filterFunction() {
	  var input, filter, ul, li, a, i;
	  input = document.getElementById("categorySearchDropdown");
	  filter = input.value.toUpperCase();
	  div = document.getElementById("displayCategoryDiv");
	  a = div.getElementsByTagName("a");
	  for (i = 0; i < a.length; i++) {
	    txtValue = a[i].textContent || a[i].innerText;
	    if (txtValue.toUpperCase().indexOf(filter) > -1) {
	      a[i].style.display = "";
	    } else {
	      a[i].style.display = "none";
	    }
	  }
	}
</script>
<script type="text/javascript">
	$("#categoryType").on('change click',function (e) {
		setCategoryDropdown(this.value)
	})
	let catIdStore;		
	function setCategoryDropdown(type){
		$('#displayCategoryDiv').empty();
		(async () => {
	        let response  = await fetch('/ExpenseApplication/user/getCategory/'+type).then(data => data.json())
	            console.log(response);
	        	$('#displayCategoryDiv').empty();
	            response.forEach(function(item,index){	
					$('#displayCategoryDiv').append(`<a data='\${item.category_id}'>\${item.category_name}</a>`)
	            })
	            $('#displayCategoryDiv a').on('click',function (e){
	            	catIdStore = $(this).attr('data');
			        $('#categoryDropDown').click();
	    			renderSubCategoryInTable($(this).attr('data'));
	    		})
	    })()
	}
	 
    function renderSubCategoryInTable(catId){
		(async () => {
	        let response  = await fetch('/ExpenseApplication/user/getDisplaySubCategory/'+catId).then(data => data.text())
	        $('#displaySubCategory').empty();
	        $('#displaySubCategory').html(response);
	    })()
	}
    
	function deleteSubCategory(subCategoryId){
		(async () => {
	        let response  = await fetch('/ExpenseApplication/user/subcategory/delete/'+subCategoryId).then(data => data.json())
	        console.log(response);
	        renderSubCategoryInTable(catIdStore);
	    })()
	}
	
	function updateSubCategory(){
		
		(async () => {
	        let response  = await fetch('/ExpenseApplication/user/subcategory/update/'+$("#sub_category_id").val()+'/'+$("#sub_category_name").val()).then(data => data.json())
	        console.log(response);
	        renderSubCategoryInTable(catIdStore);
	    })()		
	}
</script>
</body>
<%@include file="footer.jsp"%>
</html>
