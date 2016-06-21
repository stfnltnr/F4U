<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="apple-touch-icon" sizes="57x57" href="/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">


<!-- <jsp:include page="includes/bootstrapMeta.jsp" /> -->
<title>finance4you</title>
<!-- <jsp:include page="includes/bootstrapCss.jsp" /> -->

    <!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


</head>
<body>
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
	<div class="container" role="main">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<c:url value="/login" var="loginUrl" />
				<form action="${loginUrl}" method="post">
					<h2 class="form-signin-heading">Please sign in</h2>
					<c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message != null}">
						<div class="alert alert-danger" role="alert">
							<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
						</div>
					</c:if>
					<label for="inputEmail" class="sr-only">Email address</label>
					<input type="text" id="username" class="form-control" 
						placeholder="User" required autofocus name="username">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" id="password" class="form-control" 
						placeholder="Password" required name="password">
	
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						
					<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
				</form>
			</div>
		</div>
	</div>
	<!--  End of container -->
<a href="addU"><button type="button" class="btn btn-success">Register User</button></a>
	<jsp:include page="includes/bootstrapJs.jsp" />
</body>
</html>
