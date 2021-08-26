<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="table-responsive">
		<table class="table table-hover  text-center"
			id="categoryExpenseTable">
			<thead class="table-secondary">
				<tr>
					<th>Sr.No.</th>
					<th style="display: none">Sub Category Id</th>
					<th>Category Name</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				int i = 1;
				%>
				<c:forEach items="${subCategoryList}" var="bean">
					<tr>
						<td><%=i%></td>
						<td style="display: none">${bean.sub_category_id }</td>
						<td>${bean.sub_category_name}</td>
						<td>
							<button type="submit" class="edit btn btn-warning"
								data-bs-toggle="modal" data-bs-target="#subCategoryModal"
								id="${bean.sub_category_id}"
								onclick="loadSubCategoryModal('${bean.sub_category_id}','${bean.sub_category_name}')">Update</button>
							<button
									type="submit" class="btn btn-danger"
									onclick="deleteSubCategory(${bean.sub_category_id})">Delete</button>

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
