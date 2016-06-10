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
	<!--  Navigation ----------------------------------------------------------- -->
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<jsp:include page="includes/nav.jsp" />
		<ul class="nav navbar-nav navbar-right">		
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<!-- Logout -->
			<li>
			<p>
				<c:url value="/logout" var="logoutUrl" />
				<form action="${logoutUrl }" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<button class="btn btn-sm btn-danger" type="submit" value="Logout">
					<span class="glyphicon glyphicon-log-out"></span> Logout
					</button>
				</form>
			</p>
			</li>
		</ul>
		</div>
	</div>
	</nav>
	<!--  Navigation ----------------------------------------------------------- -->
	<div class="container">
		<!--  list all categories ----------------------------------------------------------- -->
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<h1>Manage Categories</h1>
				<table data-toggle="table" class="table table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Description</th>
							<th>Icon</th>
							<th>Color</th>
							<th>Action <a href="fillCat"><button type="button"
										class="btn btn-success">Fill Cat</button></a>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${categories}" var="cat">
							<tr>
								<td>${cat.id}</td>
								<td>${cat.name}</td>
								<td>${cat.description}</td>
								<td>${cat.icon}</td>
								<td>${cat.color}</td>
								<td></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!--  list all categories ----------------------------------------------------------- -->
	</div>
	<!--  end of container -->
	<%@include file="includes/bootstrapJs.js"%>
</body>
</html>
