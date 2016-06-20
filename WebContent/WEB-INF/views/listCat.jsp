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
				<h2>Manage Categories</h2>
				<a href="fillCat"><button type="button" class="btn btn-success">Fill Cat</button></a>
				<c:forEach items="${categories}" var="cat">
				<c:set var="i" value="${cat.id}" />	
				<table class="table table-striped">
				<thead>
				<th class="col-md-8" colspan="2">
					<h5><strong><span class="${cat.icon }" style="color:${cat.color};" aria-hidden="true"></span> ${cat.name}</strong></h5>
					
				</th>
				<th class="col-md-2">
					<a href="addCat"><button type="button" class="btn btn-sm btn-success">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>SubCategorie</button></a>
				</th>
				</thead>
				<tbody>
				<c:forEach items="${subcategories}" var="subcat">
				<c:if test="${subcat.maincat == i }">		
					<tr>
						<td class="col-md-2"><span class="${subcat.icon }" style="color:${subcat.color};" aria-hidden="true" ></span> ${subcat.name}</td>
						<td class="col-md-6">${subcat.description}</td>
						<td class="col-md-2">
							<a href="editC?id=${subcat.id}">
							<button type="button" class="btn btn-xs btn-success">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							Edit</button></a>
							<a href="deleteCat?id=${subcat.id}">
							<button type="button" class="btn btn-xs btn-danger">
							<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
							Delete</button></a>
						</td>
					</tr>				
				</c:if>
				</c:forEach>
				</tbody>
				</c:forEach>
				</table>
				<div class="col-md-10"></div>	
			</div>
		<!--  list all categories ----------------------------------------------------------- -->
	</div>
	<!--  end of container -->
	<%@include file="includes/bootstrapJs.js"%>
</body>
</html>
