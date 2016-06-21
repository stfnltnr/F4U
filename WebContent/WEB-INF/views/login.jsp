<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="includes/bootstrapMeta.jsp" />
<title>finance4you</title>
<%-- <jsp:include page="includes/bootstrapCss.jsp" /> --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/sb-admin-2.css" type="text/css">
</head>
<body>
	<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <c:url value="/login" var="loginUrl" />
						<form role="form" action="${loginUrl}" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            <fieldset>
                            	<c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message != null}">
								<div class="form-group">
									<div class="alert alert-danger text-center" role="alert">
										<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
									</div>
								</div>
								</c:if>
									<div class="form-group">
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
								</div>
                                <div class="form-group">
                                    <label for="inputEmail" class="sr-only">Email address</label>
									<input type="text" id="username" class="form-control" placeholder="User" required autofocus name="username">
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword" class="sr-only">Password</label>
									<input type="password" id="password" class="form-control" placeholder="Password" required name="password">
                                </div>
                                <button class="btn btn-lg btn-success btn-block" type="submit">Login</button>
                            </fieldset>
                        </form>
                    </div>
                    <div class="text-center">
						<a href="addU">Create new Account</button></a>
					</div>
                </div>
            </div>
        </div>
    </div>
	<!--  End of container -->
	<jsp:include page="includes/bootstrapJs.jsp" />
</body>
</html>
