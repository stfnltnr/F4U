<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="includes/bootstrapMeta.jsp" />
<title>finance4you</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<div class="row"></div> 
	<div class="container" role="main">
	<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel">
					<center><strong><h1>finance 4 you</h1></strong></center>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Create new user</h3>
                    </div>
                    <div class="panel-body">
						<form id="login" class="form-horizontal" method="post"	action="addUser" onsubmit="return checkForm(this);">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<fieldset>
								<!-- username -->
								<div class="form-group">
									<label for="inputUsername" class="col-md-2 control-label">Username</label>
									<div class="col-md-10">
										<input class="form-control" id="inputUsername" type="text"
											placeholder="username" name="username"
											value="<c:out value="${user.username}"/>" autofocus>
									</div>
								</div>
		
								<!-- email -->
								<div class="form-group">
									<label for="inputEmail" class="col-md-2 control-label">E-Mail</label>
									<div class="col-md-10">
										<input class="form-control" id="inputEmail" type="text"
											placeholder="eMail" name="eMail"
											value="<c:out value="${user.eMail}"/>"}>
									</div>
								</div>
								<!-- password -->
								<div class="form-group">
									<label for="inputPassword" class="col-md-2 control-label">Password</label>
									<div class="col-md-10">
										<input class="form-control" id="inputPassword" type="password"
											placeholder="password" name="pwd1" required>
									</div>
								</div>
		
								<!-- password control -->
								<div class="form-group">
									<label for="matchingPassword" class="col-md-2 control-label">Confirm
										Password:</label>
									<div class="col-md-10">
										<input class="form-control" id="matchingPassword" name="pwd2"
											placeholder="retype password" type="password">
									</div>
								</div>
								<!-- buttons -->
								<div class="form-group">
									<div class="col-md-10 col-md-offset-2">
										<button type="submit" class="btn btn-primary">Submit</button>
										<a href="login">
											<button type="button" class="btn btn-default">Cancel</button>
										</a>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  End of container -->
<jsp:include page="includes/bootstrapJs.jsp" />
</body>
</html>