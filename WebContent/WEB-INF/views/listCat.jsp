<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="includes/head.jsp"></jsp:include>
</head>
<body>
<div id="wrapper">

	<!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <!-- navbar-header -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="list">F4U - finance for you</a>
        </div>
        <!-- navbar-header -->
		<!-- navbar-top-links -->
        <ul class="nav navbar-top-links navbar-right">
        	<li>
            	<a href="editUser"><i class="fa fa-user fa-fw"></i> ${user.username}</a>
            </li>
            <li>
            	<c:url value="/logout" var="logoutUrl" />
				<form action="${logoutUrl }" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<button class="btn btn-xs btn-danger" type="submit" value="Logout">
					<span class="glyphicon glyphicon-log-out"></span> Logout
					</button>
				</form>
            </li>
        </ul>
        <!-- navbar-top-links -->
		<!-- navbar-static-sidebar -->
        <div class="navbar-default sidebar" role="navigation">
        	<!-- sidebar-collapse -->
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="list"><i class="fa fa-eye fa-fw"></i> Finance Overview</a>
                    </li>
                    <li>
                        <a href="listCat"><i class="fa fa-table fa-fw"></i> Manage Categories</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-edit fa-fw"></i> Reports</a>
                    </li>
                </ul>
            </div>
            <!-- sidebar-collapse -->
        </div>
        <!-- navbar-static-side -->
    </nav>
    <!-- Navigation -->
    <div id="page-wrapper">
    	<div class="row">
                <div class="col-lg-10">
                    <h1 class="page-header">Manage Categories</h1>
                    <a href="fillCat"><button type="button" class="btn btn-success">Fill Cat</button></a>
                </div>
                <div class="col-lg-10">
                	<jsp:include page="includes/errors.jsp"></jsp:include>
                </div>
            </div>
		<!--  list all categories ----------------------------------------------------------- -->
		<div class="row">
			<div class="col-lg-10">
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
	</div>
	<!--  END page-wrapper -->
</div>
<!-- END wrapper -->
<!-- java scripts -->
<jsp:include page="includes/scripts.jsp"></jsp:include>
</body>
</html>
