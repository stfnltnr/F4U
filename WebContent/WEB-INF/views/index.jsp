<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="includes/bootstrapMeta.inc"%>
<title>finance4you</title>
<%@include file="includes/bootstrapCss.css"%>
<%@include file="includes/treeView.css"%>

</head>
<body>
	<div class="container">
		<center>
			<h1>${type}</h1>
			<br>
			<!--  search by Id ----------------------------------------------------------- -->
			<form action="findById" method="post">
				Find by Id: <input type="text" name="id"> <input
					type="submit" value="Do it">
			</form>
			<hr>

			<!--  paging ----------------------------------------------------------- -->
			<form action="getPage" method="post">
				Paging: Page:<input type="text" name="page" value="0"> 
				Size:<input type="text" name="size" value="10">
				 <input type="submit" value="Do it">
			</form>
			<hr>

			<!--  Search + Fill ----------------------------------------------------------- -->
			<div class="row">
				<form method="post" action="find">
					<label for="searchString">Search:</label> 
					<select name="type">
						<option value="findAll" selected="selected">findAll</option>
						<option value="findByLastName">findByLastName</option>
						<option value="findByFirstName">findByFirstName</option>
						<option value="findByWhateverName">findByWhateverName</option>
						<option value="doALike">doALike</option>
						<option value="countByLastName">countByLastName</option>
						<option value="removeByLastName">removeByLastName</option>
						<option value="removeByCompanyName">removeByCompanyName</option>
						<option value="findByLastNameContainingOrFirstNameContainingAllIgnoreCase">findByName</option>
						<option value="findByOrderByLastNameAsc">orderByLastName</option>
						<option value="findTop10ByOrderByLastNameAsc">orderByLastNameTOP10</option>
						<option value="findByCompanyNameOrderByLastNameAsc">findByCompanyNameOrderByLastNameAsc</option>
						
					</select> <input type="text" name="searchString"> <input
						type="submit" value="Do it">
				</form>
			</div>

			<!--  Search + Fill ----------------------------------------------------------- -->
			<h3>Count: ${count}</h3>
		</center>



		<!--  list all employees ----------------------------------------------------------- -->
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<h1>Employees</h1>
				<table data-toggle="table" class="table table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Company</th>
							<th>DOB</th>
							<th>Action <a href="fill"><button type="button"
										class="btn btn-success">Fill List</button></a>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${employees}" var="employee">
							<tr>
								<td>${employee.id}</td>
								<td>${employee.firstName}</td>
								<td>${employee.lastName}</td>
								<td>${employee.company.name}</td>
								<td><fmt:formatDate value="${employee.dayOfBirth}"
										pattern="dd.MM.yyyy" />
								<td><a href="delete?id=${employee.id}">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!--  list all employees ----------------------------------------------------------- -->
	</div>
	<!--  end of container -->
	<%@include file="includes/bootstrapJs.js"%>
</body>
</html>
