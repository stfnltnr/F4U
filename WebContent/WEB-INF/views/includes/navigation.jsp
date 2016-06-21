<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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