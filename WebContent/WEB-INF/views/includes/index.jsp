<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>F4U finance for you</title>
<%@include file="includes/bootstrapCss.css"%>
<link rel="stylesheet" href="css/sb-admin-2.css" type="text/css">
<link href="http://www.malot.fr/bootstrap-datetimepicker/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css"	rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" rel="stylesheet">	
</head>
<body>
<div id="wrapper">
	<!-- navigation -->
	<jsp:include page="includes/nav.jsp"></jsp:include>
	<!-- navigation -->
	<!-- page wrapper  -->
	<div class="page-wrapper" role="main">
		<div class="row">
			<div class="col-lg-12">
	    		<h1 class="page-header">Finaces Overview</h1>
			</div>
		</div>
	
	<hr>
	<div >
	<div class="row">
		<div class="col-md-4">
			<h2>Finances Overview</h2>
		</div>
		<div class="col-md-6">
			<a href="add"><button type="button" class="btn btn-success">Add</button></a>
		</div>
	</div>
	<hr>
	</div>
	<!-- Search&Filter Collapse -->
	<div class = "panel-group col-md-10 col-md-offset-1" id = "accordion">
	  <div class = "panel panel-success">     
	     <div class = "panel-heading">
	        <h4 class = "panel-title">
	           <a data-toggle = "collapse" data-parent = "#accordion" href = "#collapseOne">Search & Filter Finances <span class="glyphicon glyphicon-chevron-down"></span></a>
	        </h4>
	     </div>
	     
	     <div id = "collapseOne" class = "panel-collapse collapse">
	        <div class = "panel-body">
				<!-- Search Panel -->
				<!-- Filter All/Income/Outcome -->	
				<form class="form-horizontal" method="post" action="findBool">
					<div class="form-group">						
						<label class="control-label col-md-2" for="findBool">Filter:</label>
						<div class="col-md-4">
						<fieldset>
							<label class="checkbox-inline"><input type="radio" name="type" value="findAll" />All</label>
							<label class="checkbox-inline"><input type="radio" name="type" value="findIncome" />Income</label>
							<label class="checkbox-inline"><input type="radio" name="type" value="findOutcome" />Outcome</label>
							</div>
							<div class="col-md-6">
							<button class="btn btn-default" type="submit" value="Filter">Filter</button>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							</div>
						</fieldset>
					</div>
				</form>
				<!-- Filter All/Income/Outcome -->					
				<hr>
				<!-- Search Values -->
				<form class="form-horizontal" method="post" action="findValue">
					<div class="form-group">
						<label class="control-label col-md-2" for="searchValue">Search Value:</label>
							<div class="col-md-4">
								<input class="form-control" type="text" name="searchValue">
							</div>
							<div class="col-md-6">
								<select class="selectpicker" data-width="fit" name="type">
									<option value="findByValue">exact Value</option>
<!--								<option value="findByValueBetween">von bis</option> -->
									<option value="findByValueGreaterThanEqual">greater than</option>
									<option value="findByValueLessThanEqual">less than</option>
								</select>
								<button class="btn btn-default" type="submit">Search</button>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
							</div>
						</div>
				</form>
				<!-- Search Values -->
				<hr>
				<!--  Search Notes -->
				<form class="form-horizontal" method="post" action="searchNotes">
					<div class="form-group">
						<label class="control-label col-md-2" for="searchValue">Search Notes:</label>
						<div class="col-md-4">
							<input class="form-control" type="text" name="searchString">
						</div>
						<div class="col-md-6">	
							<button class="btn btn-default" type="submit" value="findByNotesIgnoreCaseContaining"><input type="hidden" >Search</button>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</div>
					</div>
				</form>
				<!--  Search Notes -->
				<hr>
				<!--  Filter by Categorie -->
				<form class="form-horizontal" method="post" action="filterByCat">
					<div class="form-group">			
						<label for="inputCategorie" class="col-md-2 control-label">Filter Category:</label>
						<div class="col-md-10">
							<select name="id" class="selectpicker show-tick">
								<option value="0">None</option>
								<c:forEach items="${cats}" var="cat">
									<option data-icon="${cat.icon }" value="${cat.id}">${cat.name}</option>
								</c:forEach>
							</select>
							<button class="btn btn-default" type="submit">Filter</button>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</div>
					</div>
				</form>
				<!--  Filter by Categorie -->
				<hr>
				<!--  Filter by SubCategorie -->
				<form class="form-horizontal" method="post" action="filterBySubCat">
					<div class="form-group">			
						<label for="inputCategorie" class="col-md-2 control-label">Filter SubCategory:</label>
						<div class="col-md-10">
							<select name="id" class="selectpicker show-tick">
								<c:set var="i" value="${1}"/>
								<option value="3">None</option>
								<c:forEach items="${cats}" var="cat" >
									<optgroup label="${cat.name}">
									<c:forEach items="${subcats}" var="subcat">
										<c:if test="${subcat.maincat == i }">
											<option data-icon="${subcat.icon}" value="${subcat.id}">${subcat.name}</option>
										</c:if>
									</c:forEach>
									</optgroup>
								<c:set var="i" value="${i+1}"/>
								</c:forEach>
							</select>
							<button class="btn btn-default" type="submit">Filter</button>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</div>
					</div>
				</form>
				<!--  Filter by SubCategorie -->
				<hr>
				<!--  Search Date -->
				<form class="form-horizontal" method="post" action="findDate">
					<div class="form-group">
						<label class="control-label col-md-2" for="searchValue">Search Date:</label>
						<div class="col-md-2">
							<input id="searchDate" class="form-control form_datetime" type="text" name="searchDate">
						</div>
						<div class="col-md-6">	
							<button class="btn btn-default" type="submit" >Search</button>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</div>
					</div>
				</form>
				<!-- Search Date -->     
	        </div>
	     </div>
	     <!-- End Collapse -->
	    </div> 
	  	</div>
		<!--  list all finances ----------------------------------------------------------- -->
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<h1>Finances</h1>
				<!-- <a href="fill"><button type="button" class="btn btn-success">FillList</button></a> -->
				<a href="add"><button type="button" class="btn btn-success">Add</button>
				</a>
				<table data-toggle="table" class="table table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th>Payment</th>
							<th>Book Date</th>
							<th>Value</th>
							<th>Notes</th>
							<th>Category</th>
							<th>SubCategory</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${finances}" var="finance">
							<tr>
								<td>${finance.id}</td>
								<td>${finance.payment}</td>
								<td><fmt:formatDate value="${finance.bookDate}" pattern="dd.MM.yyyy" /></td>
								<td>${finance.value}</td>
								<td>${finance.notes}</td>
								<td><span class="${finance.categorie.icon }" aria-hidden="true" ></span> ${finance.categorie.name}</td>
								<td><span class="${finance.subcategorie.icon }" style="color:${finance.subcategorie.color};" aria-hidden="true" ></span> ${finance.subcategorie.name}</td>
								<td><a href="edit?id=${finance.id}">
										<button type="button" class="btn btn-xs btn-success">
											<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
											Edit
										</button></a>
									<a href="delete?id=${finance.id}">
										<button type="button" class="btn btn-xs btn-danger">
											<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
											Delete
										</button></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!--  list all finances  ----------------------------------------------------------- -->
	</div>
</div>
	<!--  end of container -->
	<%@include file="includes/bootstrapJs.js"%>
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