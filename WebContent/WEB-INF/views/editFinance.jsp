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

		<!--  add or edit?  ----------------------------------------------------------- -->
		<c:choose>
			<c:when test="${not empty finance}">
				<c:set var="legend">Change Finance ${finance.id}</c:set>
				<c:set var="formAction">changeFinance</c:set>
				<c:set var="readonly">readonly</c:set>
				<c:set var="shown">text</c:set>
			</c:when>
			<c:otherwise>
				<c:set var="legend">New Finance</c:set>
				<c:set var="formAction">addFinance</c:set>
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
						 <c:if test="${not empty finance}">
						<div class="form-group">
							<label for="inputID" class="col-md-2 control-label">ID</label>
							<div class="col-md-10">
								<input class="form-control" id="inputID" type="text" name="id"
									${readonly} value="<c:out value="${finance.id}"/>">
							</div>
						</div> 
						</c:if>
						<! ----------------  incoming ---------------- -->
						<div class="form-group">
							<label for="inputIncoming" class="col-md-2 control-label">Incoming</label>
							<div class="col-md-10">
								<input class="form-control" id="inputIncoming" type="text"
									name="incoming" value="<c:out value="${finance.incoming}"/>">
							</div>
						</div>
						<! ----------------  outgoing ---------------- -->
						<div class="form-group">
							<label for="inputOutgoing" class="col-md-2 control-label">Outgoing</label>
							<div class="col-md-10">
								<input class="form-control" id="inputOutgoing" type="text"
									name="outgoing" value="<c:out value="${finance.outgoing}"/>">
							</div>
						</div>
<<<<<<< HEAD

=======
						<%-- 
>>>>>>> branch 'master' of https://github.com/loete/F4U.git
						<! ----------------  bookDate ---------------- -->
						<div class="form-group">
							<label for="inputDate" class="col-md-2 control-label">Date</label>
							<div class="col-md-10">
								<input class="form_datetime" id="inputDate" placeholder="Date"
									type="text" readonly name="bookDate"
									value="<fmt:formatDate value="${finance.bookDate}" pattern="dd.MM.yyyy"/>">
							</div>
<<<<<<< HEAD
						</div> 
						
=======
						</div> --%>

>>>>>>> branch 'master' of https://github.com/loete/F4U.git
						<! ----------------  value ---------------- -->
						<div class="form-group">
							<label for="inputValue" class="col-md-2 control-label">Value</label>
							<div class="col-md-10">
								<input class="form-control" id="inputValue" type="text"
									name="value" value="<c:out value="${finance.value}"/>">
							</div>
						</div>

						<! ----------------  notes ---------------- -->
						<div class="form-group">
							<label for="inputNotes" class="col-md-2 control-label">Notes</label>
							<div class="col-md-10">
								<input class="form-control" id="inputNotes" type="text"
									name="notes" value="<c:out value="${finance.notes}"/>">
							</div>
						</div>

						<! ----------------  buttons ---------------- -->
						<div class="form-group">
							<div class="col-md-10 col-md-offset-2">
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