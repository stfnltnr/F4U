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

		<!--  list all finances ----------------------------------------------------------- -->
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<h1>Test</h1>
				<table data-toggle="table" class="table table-striped">
					<thead>
						<tr>
							<th>id</th>
							<th>name</th>
							<th>Action 
							<a href="fillTest"><button type="button" class="btn btn-success">Fill List</button></a>
							<a href="test2"><button type="button" class="btn btn-success">Add Test</button></a>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${test}" var="test">
							<tr>
								<td>${test.id}</td>
								<td>${test.name}</td>  
								<td><a href="deleteTest?id=${test.id}">Delete</a>
									<a href="editTest?id=${test.id}">Edit</a>
								
								</td>
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
