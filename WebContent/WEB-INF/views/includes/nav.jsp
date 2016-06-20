<!-- TagLib -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--  Navigation  -->
<nav class="navbar navbar-inverse">
<div class="container-fluid">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#collapseNav">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	    </button>
		<a class="navbar-brand" href="list">finance4you</a>
	</div>
	<div class="collapse navbar-collapse" id="collapseNav">
	<ul class="nav navbar-nav">
		<li><a href="list">Overview</a></li>
		<li><a href="listCat">Manage Categories</a></li>
	</ul>		
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
<!--  Navigation  -->
<!--  Messages -->
<center>
<!--  Error message ----------------------------------------------------------- -->
<c:if test="${not empty errorMessage}">
	<div class="alert alert-danger" role="alert">${errorMessage}</div>
</c:if>
<!--  Error message ----------------------------------------------------------- -->

<!--  Warning message ----------------------------------------------------------- -->
<c:if test="${not empty warningMessage}">
	<div class="alert alert-warning" role="warning">
		${warningMessage}</div>
</c:if>
<!--  Warning message ----------------------------------------------------------- -->

<!--   message ----------------------------------------------------------- -->
<c:if test="${not empty message}">
	<div class="alert alert-success" role="warning">${message}</div>
</c:if>
<!--   message ----------------------------------------------------------- -->
</center>
<!-- Messages -->


