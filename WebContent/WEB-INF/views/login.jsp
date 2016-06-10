<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="includes/bootstrapMeta.jsp" />
<title>Employees</title>
<jsp:include page="includes/bootstrapCss.jsp" />
</head>
<body>
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

	<jsp:include page="includes/bootstrapJs.jsp" />
</body>
</html>
