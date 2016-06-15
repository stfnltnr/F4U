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
<link href="http://www.malot.fr/bootstrap-datetimepicker/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css"	rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">
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
				<c:set var="shown">hidden</c:set>
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
						
								<input class="form-control" id="inputID" type="${shown }" name="id"
									${readonly} value="<c:out value="${categorie.id}"/>">

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
									name="description"  value="<c:out value="${categorie.description}"/>"></textarea>
							</div>
						</div>
						<!-- Icon Subcategorie  -->
						<div class="form-group">
							<label for="inputIcon" class="col-md-2 control-label">Icon</label>
							<div class="col-md-10">
							<select name="icon" id="inputIcon" class="selectpicker" data-width="fit" data-size="10" title="Choose icon ..." value="<c:out value="${categorie.icon }"/>">
								<option data-icon="glyphicon glyphicon-euro"  value="glyphicon glyphicon-euro"></option>
								<option data-icon="glyphicon glyphicon-glass"  value="glyphicon glyphicon-glass"></option>
								<option data-icon="glyphicon glyphicon-home"  value="glyphicon glyphicon-home"></option>
								<option data-icon="glyphicon glyphicon-heart"  value="glyphicon glyphicon-heart"></option>
								<option data-icon="glyphicon glyphicon-film"  value="glyphicon glyphicon-film"></option>
								<option data-icon="glyphicon glyphicon-ok"  value="glyphicon glyphicon-ok"></option>
								<option data-icon="glyphicon glyphicon-remove"  value="glyphicon glyphicon-remove"></option>
								<option data-icon="glyphicon glyphicon-road"  value="glyphicon glyphicon-road"></option>
								<option data-icon="glyphicon glyphicon-lock"  value="glyphicon glyphicon-lock"></option>
								<option data-icon="glyphicon glyphicon-headphones"  value="glyphicon glyphicon-headphones"></option>
								<option data-icon="glyphicon glyphicon-book"  value="glyphicon glyphicon-book"></option>
								<option data-icon="glyphicon glyphicon-picture"  value="glyphicon glyphicon-picture"></option>
								<option data-icon="glyphicon glyphicon-facetime-video"  value="glyphicon glyphicon-facetime-video"></option>
								<option data-icon="glyphicon glyphicon-exclamation-sign"  value="glyphicon glyphicon-exclamation-sign"></option>
								<option data-icon="glyphicon glyphicon-gift"  value="glyphicon glyphicon-gift"></option>
								<option data-icon="glyphicon glyphicon-plane"  value="glyphicon glyphicon-plane"></option>
								<option data-icon="glyphicon glyphicon-shopping-cart"  value="glyphicon glyphicon-shopping-cart"></option>
								<option data-icon="glyphicon glyphicon-wrench"  value="glyphicon glyphicon-wrench"></option>
								<option data-icon="glyphicon glyphicon-phone"  value="glyphicon glyphicon-phone"></option>
								<option data-icon="glyphicon glyphicon-flash"  value="glyphicon glyphicon-flash"></option>
								<option data-icon="glyphicon glyphicon-cutlery"  value="glyphicon glyphicon-cutlery"></option>
								<option data-icon="glyphicon glyphicon-phone-alt"  value="glyphicon glyphicon-phone-alt"></option>
								<option data-icon="glyphicon glyphicon-piggy-bank"  value="glyphicon glyphicon-piggy-bank"></option>
								<option data-icon="glyphicon glyphicon-sunglasses"  value="glyphicon glyphicon-sunglasses"></option>
								<option data-icon="glyphicon glyphicon-education"  value="glyphicon glyphicon-education"></option>
								<option data-icon="glyphicon glyphicon-ice-lolly-tasted"  value="glyphicon glyphicon-ice-lolly-tasted"></option>
								<option data-icon="glyphicon glyphicon-ice-lolly"  value="glyphicon glyphicon-ice-lolly"></option>
								<option data-icon="glyphicon glyphicon-cd"  value="glyphicon glyphicon-cd"></option>
								<option data-icon="glyphicon glyphicon-tree-deciduous"  value="glyphicon glyphicon-tree-deciduous"></option>
								<option data-icon="glyphicon glyphicon-cog"  value="glyphicon glyphicon-cog"></option>
								<option data-icon="glyphicon glyphicon-user"  value="glyphicon glyphicon-user"></option>
								<option data-icon="glyphicon glyphicon-film"  value="glyphicon glyphicon-film"></option>
								<option data-icon="glyphicon glyphicon-pencil"  value="glyphicon glyphicon-pencil"></option>
								<option data-icon="glyphicon glyphicon-music"  value="glyphicon glyphicon-music"></option>
								<option data-icon="glyphicon glyphicon-map-marker"  value="glyphicon glyphicon-map-marker"></option>
								<option data-icon="glyphicon glyphicon-question-sign"  value="glyphicon glyphicon-question-sign"></option>
								<option data-icon="glyphicon glyphicon-baby-formula"  value="glyphicon glyphicon-baby-formula"></option>
							</select>
							</div>
						</div>
						<!-- Color Subcategorie  -->
						<div class="form-group">
							<label for="inputColor" class="col-md-2 control-label">Color</label>
							<div class="col-md-10">
							<select name="color" id="inputColor" title="Choose color ..." class="selectpicker" data-width="fit" value="<c:out value="${categorie.color }"/>">
							  <option style="background: #000; color: #000;" value="#000">Black</option>
							  <option style="background: #428bca; color: #428bca;" value="#428bca">Blue</option>
							  <option style="background: #5bc0de; color: #5bc0de;" value="#5bc0de">Lightblue</option>
							  <option style="background: #5cb85c; color: #5cb85c;" value="#5cb85c">Green</option>
							  <option style="background: #f0ad4e; color: #f0ad4e;" value="#f0ad4e">Yellow</option>
							  <option style="background: #d9534f; color: #d9534f;" value="#d9534f">Red</option>
							</select>
							</div>
						</div>
						
						<!-- MainCategorie -->
						<div class="form-group">
							<label for="inputNotes" class="col-md-2 control-label">Main Categorie</label>
							<div class="col-md-10">
 							<select name="maincat" size="5" class="selectpicker" value="<c:out value="${categorie.maincat}" />">
	 							<c:forEach items="${cats}" var="cat">
	 							<c:if test="${cat.maincat == 0 }">
	 								<option data-icon="${cat.icon }"value="${cat.id }"> ${ cat.name}</option>
	 							</c:if>
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
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>

	<!-- (Optional) Latest compiled and minified JavaScript translation files -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/i18n/defaults-*.min.js"></script>


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