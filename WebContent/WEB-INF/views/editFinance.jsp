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
<link href="http://www.malot.fr/bootstrap-datetimepicker/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">
</head>
<body>
	<div class="container" role="main">
	<!-- Navigation -->
	<jsp:include page="includes/nav.jsp"></jsp:include>

		<!--  add or edit?  ----------------------------------------------------------- -->
		<c:choose>
			<c:when test="${not empty finance}">
				<c:set var="legend">Change finance entry: ${finance.notes}</c:set>
				<c:set var="formAction">changeFinance</c:set>
				<c:set var="readonly">readonly</c:set>
				<c:set var="shown">hidden</c:set>
			</c:when>
			<c:otherwise>
				<c:set var="legend">Add new Finance</c:set>
				<c:set var="formAction">addFinance</c:set>
				<c:set var="readonly">readonly</c:set>
				<c:set var="shown">hidden</c:set>
			</c:otherwise>
		</c:choose>
		<!--  add or edit? -->		
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<form class="form-horizontal" method="post" action="${formAction}">
					<fieldset>
						<legend>${legend}</legend>
						<!--  id  -->
						<c:if test="${not empty finance}">
								<input class="form-control" id="inputID" type="${shown }" name="id"
									${readonly} value="<c:out value="${finance.id}"/>"> 
						</c:if>
						<!--  payment  -->
						<div class="form-group">
							<label for="inputPayment" class="col-md-2 control-label">Payment</label>
							<div class="col-md-10">
								<select name="payment" size="2" value="<c:out value="${finance.payment}"/>">
								<c:if test="${finance.payment == true}">
									<option value="true" selected>Incoming</option>
									<option value="false">Outgoing</option>
								</c:if>
								<c:if test="${finance.payment == false}">
									<option value="true">Incoming</option>
									<option value="false" selected>Outgoing</option>
								</c:if>
								<c:if test="${empty finance.payment}">
									<option value="true" selected>Incoming</option>
									<option value="false">Outgoing</option>
								</c:if>
								</select>
							</div>
						</div>
						
						<!--  bookDate  -->
						<div class="form-group">
							<label for="inputDate" class="col-md-2 control-label">Date</label>
							<div class="col-md-10">
								<input class="form_datetime" id="inputDate" placeholder="Date"
									type="text" readonly name="bookDate"
									value="<fmt:formatDate value="${finance.bookDate}" pattern="dd.MM.yyyy"/>">
							</div>
							</div>

						<!--  value  -->
						<div class="form-group">
							<label for="inputValue" class="col-md-2 control-label">Value</label>
							<div class="col-md-10">
								<input class="form-control" id="inputValue" type="text"
									name="value" value="<c:out value="${finance.value}"/>">
							</div>
						</div>

						<!--  notes  -->
						<div class="form-group">
							<label for="inputNotes" class="col-md-2 control-label">Notes</label>
							<div class="col-md-10">
								<input class="form-control" id="inputNotes" type="text"
									name="notes" value="<c:out value="${finance.notes}"/>">
							</div>
						</div>
						
						<!--  category  -->			
						<div class="form-group">
							<label for="inputCategorie" class="col-md-2 control-label">Categorie</label>
							<div class="col-md-10">
								<select name="categorie" class="selectpicker show-tick" value="<c:out value="${finance.categorie}"/>">
									<c:set var="maincat" value="${finance.categorie.id }"/>
									<c:forEach items="${cats}" var="cat">
									<c:choose>
										<c:when test="${cat.id == maincat}">
											<option data-icon="${cat.icon }" selected="selected" value="${cat.id}">${cat.name}</option>
										</c:when>
										<c:otherwise>
											<option data-icon="${cat.icon }" value="${cat.id}">${cat.name}</option>
										</c:otherwise>
									</c:choose>
									</c:forEach>
								</select>
							</div>
						</div> 						
						<!--  subcategory  -->			
						<div class="form-group">
							<label for="inputCategorie" class="col-md-2 control-label">SubCategory</label>
							<div class="col-md-10">
								<select name="subcategorie" class="selectpicker show-tick" title="Choose SubCategory ..."value="<c:out value="${finance.subcategorie}"/>">
									<c:set var="i" value="${1}"/>
									<c:set var="sc" value="${finance.subcategorie.id }"/>
									<option value="">None</option>
									<c:forEach items="${cats}" var="cat" >
										<optgroup label="${cat.name}">
										<c:forEach items="${subcats}" var="subcat">
										<c:if test="${subcat.maincat == i }">
										<c:choose>
											<c:when test="${subcat.id == sc}">
												<option data-icon="${subcat.icon }" selected="selected" value="${subcat.id}">${subcat.name}</option>
											</c:when>
											<c:otherwise>
												<option data-icon="${subcat.icon }" value="${subcat.id}">${subcat.name}</option>
											</c:otherwise>
										</c:choose>
										</c:if>
										</c:forEach>
										</optgroup>
									<c:set var="i" value="${i+1}"/>
									</c:forEach>
								</select>
							</div>
						</div>
						<!--  buttons  -->
						<div class="form-group">
							<div class="col-md-10 col-md-offset-2">
								<button type="submit" class="btn btn-primary">Submit</button>
								<a href="list">
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