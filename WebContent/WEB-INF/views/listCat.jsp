<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<!-- navigation -->
	<jsp:include page="includes/nav.jsp"></jsp:include>
	<!-- navigation -->
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
							<th>MainCat</th>
							<th>Action <a href="fillCat"><button type="button"
										class="btn btn-success">Fill Cat</button></a>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="i" value="${1}"></c:set>
						<c:forEach items="${categories}" var="cat">
							<c:if test="${cat.maincat==0}">	
								<tr>
									<td>${cat.id}</td>
									<td>${cat.name}</td>
									<td>${cat.description}</td>
									<td>${cat.icon}</td>
									<td>${cat.color}</td>
									<td>${cat.maincat}</td>
									<td>
										<a href="addCat">
										<button type="button" class="btn btn-xs btn-success">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
										Add SubCategorie</button>
									</td>
								</tr>
							</c:if>	
							<c:forEach items="${categories}" var="cat">
								<c:if test="${cat.maincat == i }">
									<tr>
										<td>${cat.id}</td>
										<td>${cat.name}</td>
										<td>${cat.description}</td>
										<td>${cat.icon}</td>
										<td>${cat.color}</td>
										<td>${cat.maincat}</td>
										<td>
											<a href="editC?id=${cat.id}">
											<button type="button" class="btn btn-xs btn-success">
											<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
											Edit SubCategorie</button></a>
											<a href="deleteCat?id=${cat.id}">
											<button type="button" class="btn btn-xs btn-danger">
											<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
											DeleteSubcategorie</button></a>
										</td>
									<tr>
								</c:if>
							</c:forEach>
							<c:set var="i" value="${i+1}"></c:set>
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
