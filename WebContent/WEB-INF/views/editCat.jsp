<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
			<c:when test="${not empty categorie}">
				<c:set var="legend">Change SubCategorie ${categorie.name}</c:set>
				<c:set var="formAction">editCategorie</c:set>
				<c:set var="readonly">readonly</c:set>
				<c:set var="shown">text</c:set>
			</c:when>
			<c:otherwise>
				<c:set var="legend">Add new SubCategorie</c:set>
				<c:set var="formAction">addCategorie</c:set>
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
						 <!-- id Subcategorie-->
						 <c:if test="${not empty categorie}">
						<div class="form-group">
							<label for="inputID" class="col-md-2 control-label">ID</label>
							<div class="col-md-10">
								<input class="form-control" id="inputID" type="text" name="id"
									${readonly} value="<c:out value="${categorie.id}"/>">
							</div>
						</div> 
						</c:if>
						<!-- Name Subcategorie  -->
						<div class="form-group">
							<label for="inputIncoming" class="col-md-2 control-label">Name</label>
							<div class="col-md-10">
								<input class="form-control" id="inputName" type="text"
									name="name" value="<c:out value="${categorie.name}"/>">
							</div>
						</div>
						<!-- Description Subcategorie  -->
						<div class="form-group">
							<label for="inputOutgoing" class="col-md-2 control-label">Description</label>
							<div class="col-md-10">
								<input class="form-control" id="inputDescription" type="text"
									name="description" value="<c:out value="${categorie.description}"/>">
							</div>
						</div>
						<!-- Icon Subcategorie  -->
						<div class="form-group">
							<label for="inputValue" class="col-md-2 control-label">Icon</label>
							<div class="col-md-10">
								<input class="form-control" id="inputIcon" type="text"
									name="icon" value="<c:out value="${categorie.icon}"/>">
							</div>
						</div>
						<!-- Color Subcategorie  -->
						<div class="form-group">
							<label for="inputNotes" class="col-md-2 control-label">Color</label>
							<div class="col-md-10">
								<input class="form-control" id="inputColor" type="text"
									name="color" value="<c:out value="${categorie.color}"/>">
							</div>
						</div>
						
						<!-- MainCategorie -->
						<div class="form-group">
							<label for="inputNotes" class="col-md-2 control-label">Main Categorie</label>
							<div class="col-md-10">
 							<select name="maincat" size="5" value="<c:out value="${categorie.maincat}" />">
	 							<c:forEach items="${cats}" var="cat">
	 								<option value="${cat.id }"> ${ cat.name}</option>
	 							</c:forEach>
	 						</select>
 							</div>
						</div>

						<!--  buttons -->
						<div class="form-group">
							<div class="col-md-10 col-md-offset-2">
								<button type="submit" class="btn btn-primary">Submit</button>
								<a href="listCat">
									<button type="button" class="btn btn-default">Cancel</button>
								</a>
							</div>
						</div>

					</fieldset>

					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

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