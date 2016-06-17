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
			<c:when test="${not empty subcategorie}">
				<c:set var="legend">Change SubCategorie ${subcategorie.name}</c:set>
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
						 <c:if test="${not empty subcategorie}">
						
								<input class="form-control" id="inputID" type="${shown }" name="id"
									${readonly} value="<c:out value="${subcategorie.id}"/>">

						</c:if>
						<!-- Name Subcategorie  -->
						<div class="form-group">
							<label for="inputIncoming" class="col-md-2 control-label">Name</label>
							<div class="col-md-10">
								<input class="form-control" id="inputName" type="text"
									name="name" value="<c:out value="${subcategorie.name}"/>">
							</div>
						</div>
						<!-- Description Subcategorie  -->
						<div class="form-group">
							<label for="inputOutgoing" class="col-md-2 control-label">Description</label>
							<div class="col-md-10">
								<input class="form-control" id="inputDescription" type="text"
									name="description"  value="<c:out value="${subcategorie.description}"/>"></textarea>
							</div>
						</div>
						<!-- Icon Subcategorie  -->
						<div class="form-group">
							<label for="inputIcon" class="col-md-2 control-label">Icon</label>
							<div class="col-md-10">
							<select name="icon" id="inputIcon" class="selectpicker show-tick" data-width="fit" data-size="10" title="Choose icon ..." value="<c:out value="${subcategorie.icon }"/>">
							<c:forTokens items="glyphicon glyphicon-euro,glyphicon glyphicon-shopping-cart,glyphicon glyphicon-cutlery,glyphicon glyphicon-glass,glyphicon glyphicon-home,glyphicon glyphicon-piggy-bank,glyphicon glyphicon-user,glyphicon glyphicon-heart,glyphicon glyphicon-globe,glyphicon glyphicon-film,glyphicon glyphicon-ok,glyphicon glyphicon-remove,glyphicon glyphicon-road,glyphicon glyphicon-lock,glyphicon glyphicon-headphones,glyphicon glyphicon-book,glyphicon glyphicon-picture,glyphicon glyphicon-facetime-video,glyphicon glyphicon-exclamation-sign,glyphicon glyphicon-gift,glyphicon glyphicon-plane,glyphicon glyphicon-shopping-cart,glyphicon glyphicon-wrench,glyphicon glyphicon-phone,glyphicon glyphicon-flash,glyphicon glyphicon-phone-alt,glyphicon glyphicon-sunglasses,glyphicon glyphicon-education,glyphicon glyphicon-ice-lolly-tasted,glyphicon glyphicon-ice-lolly,glyphicon glyphicon-cd,glyphicon glyphicon-tree-deciduous,glyphicon glyphicon-cog,glyphicon glyphicon-film,glyphicon glyphicon-pencil,glyphicon glyphicon-music,glyphicon glyphicon-map-marker,glyphicon glyphicon-question-sign,glyphicon glyphicon-baby-formula"
							delims="," var="glyph">
												
												
								<c:choose>
									<c:when test="${glyph == subcategorie.icon }">
										<option data-icon="${glyph}" value="${glyph}" selected="selected" >&zwnj;</option>
									</c:when>
									<c:otherwise>
										<option data-icon="${glyph}"  value="${glyph}"></option>
									</c:otherwise>
								</c:choose>
							</c:forTokens>
							</select>
							</div>
						</div>
						<!-- Color Subcategorie  -->
						<div class="form-group">
							<label for="inputColor" class="col-md-2 control-label">Color</label>
							<div class="col-md-10">
							<select name="color" id="inputColor" title="Choose color ..." class="selectpicker show-tick" data-width="fit" value="<c:out value="${subcategorie.color }"/>">
							<c:forTokens items="#000,#428bca,#5bc0de,#5cb85c,#f0ad4e,#d9534f" delims="," var="hex">
								<c:choose>
									<c:when test="${hex == subcategorie.color }">
										<option selected="selected" style="background: ${hex}; color: ${hex};" value="${hex}">
										<c:if test="${hex == '#000'}">Black</c:if>
										<c:if test="${hex == '#428bca'}">Blue</c:if>
										<c:if test="${hex == '#5bc0de'}">Lightblue</c:if>
										<c:if test="${hex == '#5cb85c'}">Green</c:if>
										<c:if test="${hex == '#f0ad4e'}">Yellow</c:if>
										<c:if test="${hex == '#d9534f'}">Red</c:if>
										</option>
									</c:when>
									<c:otherwise>
										<option style="background: ${hex}; color: ${hex};" value="${hex}">
										<c:if test="${hex == '#000'}">Black</c:if>
										<c:if test="${hex == '#428bca'}">Blue</c:if>
										<c:if test="${hex == '#5bc0de'}">Lightblue</c:if>
										<c:if test="${hex == '#5cb85c'}">Green</c:if>
										<c:if test="${hex == '#f0ad4e'}">Yellow</c:if>
										<c:if test="${hex == '#d9534f'}">Red</c:if>
										</option>
									</c:otherwise>
								</c:choose>
							</c:forTokens>
							</select>
							</div>
						</div>
						
						<!--  MainCategorie  -->
						<div class="form-group">
							<label for="inputNotes" class="col-md-2 control-label">Main Categorie</label>
							<div class="col-md-10">
 							<select name="categorie" size="5" class="selectpicker show-tick" value="<c:out value="${subcategorie.categorie}" />">
 							<c:set var="maincat" value="${subcategorie.maincat }"/>
 							<c:forEach items="${cats}" var="cat">
 							<c:choose>
 								<c:when test="${cat.id == maincat }">
 									<option selected="selected" data-icon="${cat.icon}"value="${cat.id}"> ${cat.name}</option>
 								</c:when>
 								<c:otherwise>
 									<option data-icon="${cat.icon}"value="${cat.id}"> ${cat.name}</option>
 								</c:otherwise>
 							</c:choose>
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