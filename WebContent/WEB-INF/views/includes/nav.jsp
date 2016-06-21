<!-- TagLib -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <!-- Navbar header -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">F4U - Finance for you</a>
            </div>
            <!-- Top-right -->
            <ul class="nav navbar-top-links navbar-right">
		         <li><a href="editUser">${user.username}</a></li>
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
            <!-- Left-Sidebar -->
            <div class="navbar-default sidebar" role="navigation">
            	<div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                    	<li><a href="list">Overview Finances</a></li>
						<li><a href="listCat">Manage Categories</a></li>
						<li><a href="#">Create Categories</a></li>
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


