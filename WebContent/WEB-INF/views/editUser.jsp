<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="includes/head.jsp"></jsp:include>
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
			<li class="dropdown">
		        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
		            <i class="fa fa-user fa-fw"></i>  ${user.username} <i class="fa fa-caret-down"></i>
		        </a>
	        <ul class="dropdown-menu dropdown-user">
	            <li><a href="editUser"><i class="fa fa-user fa-fw"></i> Edit Profile</a>
	            </li>
	        </ul>
        	<!-- /.dropdown-user -->
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
                        <a href="report"><i class="fa fa-edit fa-fw"></i> Reports</a>
                    </li>
                </ul>
            </div>
            <!-- sidebar-collapse -->
        </div>
        <!-- navbar-static-side -->
    </nav>
    <!-- End Navigation -->
	<div id="page-wrapper" role="main">
		<!--  add or edit? -->
		<c:choose>
			<c:when test="${not empty user}">
				<c:set var="legend">Edit userdetails ${user.username}</c:set>
				<c:set var="formAction">changeUser</c:set>
				<c:set var="readonly">readonly</c:set>
				<c:set var="shown">hidden</c:set>
			</c:when>
			<c:otherwise>
				<c:set var="legend">Create new account</c:set>
				<c:set var="formAction">addUser</c:set>
				<c:set var="readonly">readonly</c:set>
				<c:set var="shown">text</c:set>
			</c:otherwise>
		</c:choose>
		<!--  add or edit?  -->
		<div class="row">
			<div class="col-lg-6">
	    		<h1 class="page-header">${legend}</h1>
			</div>
			<div class="col-lg-6">
              	<jsp:include page="includes/errors.jsp"></jsp:include>
            </div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<form id="login" class="form-horizontal" method="post" action="${formAction}">
					<fieldset>
						<!-- username -->
						<div class="form-group">
							<label for="inputUsername" class="col-lg-3 control-label">Username:</label>
							<div class="col-lg-9">
								<input class="form-control" id="inputUsername" type="text"
									placeholder="username" name="username"
									value="<c:out value="${user.username}"/>" autofocus ${readonly}>
							</div>
						</div>
						
						<!-- email -->
						<div class="form-group">
							<label for="inputEmail" class="col-lg-3 control-label">E-Mail:</label>
							<div class="col-lg-9">
								<input class="form-control" id="inputEmail" type="text"
									placeholder="eMail" name="eMail"
									value="<c:out value="${user.eMail}"/>" autofocus >
							</div>
						</div>
						
						<!-- upload picture -->
<%-- 						<div class="form-group">
							<label for="inputPicture" class="col-lg-3 control-label">Picture:</label>
							<div class="col-lg-9">
							<c:choose>
								<c:when test="${not empty user.picture}">
									<a href="download?documentId=${user.picture.id}" target="_blank">${user.picture.filename}</a>
									<div>
										<img src="${user.picture.filename}">
									</div>						
								</c:when>
								<c:otherwise>
												-- no Picture available ---
											</c:otherwise>
							</c:choose></td>
							<td><a href="upload?username=${user.username}">
									<button type="button" class="btn btn-xs btn-success">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
										Upload
									</button>
							</a></td>
							<a href="upload">
								<button type="button" class="btn btn-xs btn-success disabled">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									Upload
								</button>
							</a>
							</div>
						</div> --%>
						<!-- change pwd -->
						<div class="form-group">
							<label for="editPassword" class="col-lg-3 control-label">Change password:</label>
							<div class="col-lg-9">
							<a href="editPassword">
								<button type="button" class="btn btn-md btn-success">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									Change Password
								</button>
							</a>
							</div>
						</div>
						<!-- buttons -->
						<div class="form-group">
							<label for="buttons" class="col-lg-3 control-label"></label>
							<div class="col-lg-9">
								<button type="submit" class="btn btn-primary">Submit</button>
								<a href="list">
									<button type="button" class="btn btn-default">Cancel</button>
								</a>
							</div>
						</div>

					</fieldset>

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

				</form>
			</div>
		</div>

	</div>
	<!--  End of page-wrapper -->
</div>
<!-- END wrapper -->

<!-- java scripts -->
<jsp:include page="includes/scripts.jsp"></jsp:include>
</body>
</html>