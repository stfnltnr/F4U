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
<%@include file="includes/bootstrapMeta.inc"%>
<title>finance4you</title>
<%@include file="includes/bootstrapCss.css"%>
<%@include file="includes/treeView.css"%>
<link
	href="http://www.malot.fr/bootstrap-datetimepicker/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css"
	rel="stylesheet">
</head>
<body>
	<div class="container" role="main">
		<!-- Navigation -->
		<jsp:include page="includes/nav.jsp"></jsp:include>

		<!--  add or edit?  ----------------------------------------------------------- -->
		<c:choose>
			<c:when test="${not empty user}">
				<c:set var="legend">Change User ${user.username}</c:set>
				<c:set var="formAction">changeUser</c:set>
				<c:set var="readonly">readonly</c:set>
				<c:set var="shown">hidden</c:set>
			</c:when>
			<c:otherwise>
				<c:set var="legend">New User</c:set>
				<c:set var="formAction">addUser</c:set>
				<c:set var="readonly"></c:set>
				<c:set var="shown">text</c:set>
			</c:otherwise>
		</c:choose>
		<!--  add or edit?  ----------------------------------------------------------- -->

		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<form id="login" class="form-horizontal" method="post"
					action="changePWD" onsubmit="return checkForm(this);">
					<legend>${legend}</legend>
					<fieldset>
						<! ----------------  username ---------------- -->
						<div class="form-group">
							<label for="inputUsername" class="col-md-2 control-label">Username</label>
							<div class="col-md-10">
								<input class="form-control" id="inputUsername" type="text"
									placeholder="username" name="username"
									value="<c:out value="${user.username}"/>" ${readonly} autofocus>
							</div>
						</div>

						<! ----------------  E-Mail ---------------- -->
						<c:if test="${empty user}">
						<div class="form-group">
							<label for="inputEmail" class="col-md-2 control-label">E-Mail</label>
							<div class="col-md-10">
								<input class="form-control" id="inputEmail" type="text"
									placeholder="eMail" name="eMail"
									value="<c:out value="${user.eMail}"/>" autofocus}>
							</div>
						</div>
						</c:if>
						<! ----------------  password ---------------- -->
						<div class="form-group">
							<label for="inputPassword" class="col-md-2 control-label">Password</label>
							<div class="col-md-10">
								<input class="form-control" id="inputPassword" type="password"
									placeholder="password" name="pwd1" required>
							</div>
						</div>

						<! ----------------  confirm password ---------------- -->
						<div class="form-group">
							<label for="matchingPassword" class="col-md-2 control-label">Confirm
								Password:</label>
							<div class="col-md-10">
								<input class="form-control" id="matchingPassword" name="pwd2"
									placeholder="retype password" type="password">
							</div>
						</div>
						<! ----------------  buttons ---------------- -->
						<div class="form-group">
							<div class="col-md-10 col-md-offset-2">
								<button type="submit" class="btn btn-primary">Submit</button>
								<a href="login">
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
	<!--  End of container -->


	<!-- JS for Bootstrap -->
	<%@include file="includes/bootstrapJs.js"%>
	<!-- JS for Bootstrap -->

	<script type="text/javascript">
		function checkForm(form) {
			if (form.username.value == "") {
				alert("Error: Username cannot be blank!");
				form.username.focus();
				return false;
			}
			re = /^\w+$/;
			if (!re.test(form.username.value)) {
				alert("Error: Username must contain only letters, numbers and underscores!");
				form.username.focus();
				return false;
			}

			if (form.pwd1.value != "" && form.pwd1.value == form.pwd2.value) {
				if (form.pwd1.value.length < 8) {
					alert("Error: Password must contain at least eight characters!");
					form.pwd1.focus();
					return false;
				}
				if (form.pwd1.value == form.username.value) {
					alert("Error: Password must be different from Username!");
					form.pwd1.focus();
					return false;
				}
				re = /[0-9]/;
				if (!re.test(form.pwd1.value)) {
					alert("Error: password must contain at least one number (0-9)!");
					form.pwd1.focus();
					return false;
				}
				re = /[a-z]/;
				if (!re.test(form.pwd1.value)) {
					alert("Error: password must contain at least one lowercase letter (a-z)!");
					form.pwd1.focus();
					return false;
				}
				re = /[A-Z]/;
				if (!re.test(form.pwd1.value)) {
					alert("Error: password must contain at least one uppercase letter (A-Z)!");
					form.pwd1.focus();
					return false;
				}
			} else {
				alert("Error: Please check that you've entered and confirmed your password!");
				form.pwd1.focus();
				return false;
			}

			alert("You entered valid credentials!"); /* + form.pwd1.value */
			return true;
		}
	</script>

</body>
</html>