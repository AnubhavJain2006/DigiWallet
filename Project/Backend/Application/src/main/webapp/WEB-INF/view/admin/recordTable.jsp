<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-hover" id="myTable">
									<thead>
										<tr>
											<th scope="col">Sr.No</th>
											<th scope="col">User Name</th>
											<th scope="col">User Email</th>
											<th scope="col">Account Created</th>
											<th scope="col">Account Status</th>
											<th scope="col">Action</th>
										</tr>
									</thead>
									<tbody>
										<%
										int i = 1;
										%>
										<c:forEach items="${DataList}" var="ubean">
											<tr>
												<td><%=i%></td>
												<td>${ubean.user_name }</td>
												<td>${ubean.user_email }</td>
												<td>${ubean.user_insertDate }</td>
												<td>${ubean.user_status}
												<c:choose>
												<c:when test="${ubean.user_id != '1' }">
												<td><a href="./deleteUser/${ubean.user_id}"
													onclick="return confirmDelete()"
													class="btn btn-outline-danger "><i class="fas fa-trash"></i></a>

													<a href="" id="${ubean.user_id}" data-bs-toggle="modal"
													data-bs-target="#EditModal"
													class="btn btn-outline-warning edit"><i
														class='fas fa-pen'></i></a> <a href="./getUser/${ubean.user_id}"
													class="btn btn-outline-primary"><i
														class='fas fa-info-circle'></i></a></td>
												</c:when>
												<c:when test="${ubean.user_id==1 }">
												<td class="text-center h3">-</td>
												</c:when>
												</c:choose>
											</tr>
											<%
											i = i + 1;
											%>
										</c:forEach>


									</tbody>
								</table>
