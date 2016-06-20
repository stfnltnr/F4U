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
				<c:set var="legend">Change User ${user.id}</c:set>
				<c:set var="formAction">changeUser</c:set>
				<c:set var="readonly">readonly</c:set>
				<c:set var="shown">text</c:set>
			</c:when>
			<c:otherwise>
				<c:set var="legend">New User</c:set>
				<c:set var="formAction">addUser</c:set>
				<c:set var="readonly">readonly</c:set>
				<c:set var="shown">hidden</c:set>
			</c:otherwise>
		</c:choose>
		<!--  add or edit?  ----------------------------------------------------------- -->

		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<form class="form-horizontal" method="post" action="${formAction}">
					<fieldset>
						<legend>${legend}</legend>
						<! ----------------  id ---------------- -->
						<c:if test="${not empty user}">
							<div class="form-group">
								<label for="inputID" class="col-md-2 control-label">ID</label>
								<div class="col-md-10">
									<input class="form-control" id="inputID" type="text" name="id"
										${readonly} value="<c:out value="${user.id}"/>">
								</div>
							</div>
						</c:if>
						<! ----------------  firstName ---------------- -->
						<div class="form-group">
							<label for="inputFirstName" class="col-md-2 control-label">First
								Name</label>
							<div class="col-md-10">
								<input class="form-control" id="inputFirstName" type="text"
									name="firstName" value="<c:out value="${user.firstName}"/>">
							</div>
						</div>
						<! ----------------  lastName ---------------- -->
						<div class="form-group">
							<label for="inputLastName" class="col-md-2 control-label">Last
								Name</label>
							<div class="col-md-10">
								<input class="form-control" id="inputLastName" type="text"
									name="lastName" value="<c:out value="${user.lastName}"/>">
							</div>
						</div>
						<! ----------------  address ---------------- -->
						<div class="form-group">
							<label for="inputAddress" class="col-md-2 control-label">Address</label>
							<div class="col-md-10">
								<input class="form-control" id="inputAddress" type="text"
									name="address" value="<c:out value="${user.address}"/>">
							</div>
						</div>
						<! ----------------  postCode ---------------- -->
						<div class="form-group">
							<label for="inputPostCode" class="col-md-2 control-label">Post Code</label>
							<div class="col-md-10">
								<input class="form-control" id="inputPostCode" type="text"
									name="postCode" value="<c:out value="${user.postCode}"/>">
							</div>
						</div>
						<! ----------------  place ---------------- -->
						<div class="form-group">
							<label for="inputPlace" class="col-md-2 control-label">Place</label>
							<div class="col-md-10">
								<input class="form-control" id="inputPlace" type="text"
									name="place" value="<c:out value="${user.place}"/>">
							</div>
						</div>
						<! ----------------  phone ---------------- -->
						<div class="form-group">
							<label for="inputPhone" class="col-md-2 control-label">Phone</label>
							<div class="col-md-10">
								<input class="form-control" id="inputPhone" type="text"
									name="phone" value="<c:out value="${user.phone}"/>">
							</div>
						</div>
						<! ----------------  email ---------------- -->
						<div class="form-group">
							<label for="inputEmail" class="col-md-2 control-label">E-Mail</label>
							<div class="col-md-10">
								<input class="form-control" id="inputEmail" type="text"
									name="email" value="<c:out value="${user.email}"/>">
							</div>
						</div>
						<%-- <! ----------------  dayOfBirth ---------------- -->
						<div class="form-group">
							<label for="inputDayOfBirth" class="col-md-2 control-label">Birthday</label>
							<div class="col-md-10">
								<input class="form_datetime" id="inputDayOfBirth" placeholder="Date"
									type="text" readonly name="dayOfBirth"
									value="<fmt:formatDate value="${user.dayOfBirth}" pattern="dd.MM.yyyy"/>">
							</div>
						</div> --%>
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


	<!-- JS for Datetime picker -->

	<script type="text/javascript"
		src="http://www.malot.fr/bootstrap-datetimepicker/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>

	<script>
		$(function() {

			$(".form_datetime").datetimepicker({
				format : "dd.mm.yyyy",
				autoclose : true,
				todayBtn : true,
				pickerPosition : "bottom-left",
				minView : 2
			});

		});
	</script>

</body>
</html>