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
				<c:set var="readonly">readonly</c:set>
				<c:set var="shown">text</c:set>
			</c:otherwise>
		</c:choose>
		<!--  add or edit?  ----------------------------------------------------------- -->

		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<form id="login" class="form-horizontal" method="post"
					action="${formAction}">
					<legend>${legend}</legend>
					<fieldset>
						<! ----------------  username ---------------- -->
						<div class="form-group">
							<label for="inputUsername" class="col-md-2 control-label">Username</label>
							<div class="col-md-10">
								<input class="form-control" id="inputUsername" type="text"
									placeholder="username" name="username"
									value="<c:out value="${user.username}"/>" autofocus ${readonly}>
							</div>
						</div>
						
						<! ----------------  E-Mail ---------------- -->
						<div class="form-group">
							<label for="inputEmail" class="col-md-2 control-label">E-Mail</label>
							<div class="col-md-10">
								<input class="form-control" id="inputEmail" type="text"
									placeholder="eMail" name="eMail"
									value="<c:out value="${user.eMail}"/>" autofocus >
							</div>
						</div>
						
						<! ----------------  upload picture ---------------- -->
						<div class="form-group">
						<td><c:choose>
								<c:when test="${not empty user.picture}">
									<%-- <a href="download?documentId=${user.picture.id}"
										target="_blank">${user.picture.filename}</a> --%>
											<td> <img src="${user.picture.filename}"></td>						
								</c:when>
								<c:otherwise>
												-- no Picture available ---
											</c:otherwise>
							</c:choose></td>
						<%-- <td><a href="upload?username=${user.username}">
								<button type="button" class="btn btn-xs btn-success">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									Upload
								</button>
						</a></td> --%>
						<td><a href="upload">
								<button type="button" class="btn btn-xs btn-success">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									Upload
								</button>
						</a></td>
						</div>
						
						<! ----------------  change pwd ---------------- -->
						<div class="form-group">
						<td><a href="editPassword">
								<button type="button" class="btn btn-xs btn-success">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									Change Password
								</button>
						</a></td>
						</div>
						<! ----------------  buttons ---------------- -->
						<div class="form-group">
							<div class="col-md-10 col-md-offset-2">
								<button type="submit" class="btn btn-primary">Submit</button>
								<a href="index">
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
	
</body>
</html>