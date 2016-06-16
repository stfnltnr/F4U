<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<!-- navigation -->
	<jsp:include page="includes/nav.jsp"></jsp:include>
	<!-- navigation -->
		<center>
			<h1>${type}</h1>
			<!--   message ----------------------------------------------------------- -->
			<!--  search by Id ----------------------------------------------------------- -->
			<form action="findById" method="post">
				Find by Id: <input type="text" name="id"> <input
					type="submit" value="Do it"> <input type="hidden"
					name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
			<hr>

			<!--  paging ----------------------------------------------------------- -->
			<form action="getPage" method="post">
				Paging: Page:<input type="text" name="page" value="0"> Size:<input
					type="text" name="size" value="5"> <input type="submit"
					value="Do it"> <input type="hidden"
					name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
			<hr>
			
			<!-- Eingang oder Ausgang --------------------------------------------------- -->
	<div class="row">
<%-- 				<form method="post" action="findBool">
					<label for="searchValue">Search Value:</label> <select name="type">
						<option value="findIncome">Income</option>			

					</select><input
						type="submit" value="Do it"> <input type="hidden"
						name="${_csrf.parameterName}" value="${_csrf.token}" />

				</form> --%>
	 		<form method="post" action="findBool">
       <fieldset>
                <legend>What are you search for?</legend>
                        <input type="radio" name="type" value="findAll" />All<br />
                        <input type="radio" name="type" value="findIncome" />Income<br />
                        <input type="radio" name="type" value="findOutcome" />Outcome<br />
                        <input type="submit" value="Submit now" /><input type="hidden"
						name="${_csrf.parameterName}" value="${_csrf.token}" />
       </fieldset>
</form> 
</div>
		<hr>	
			<!-- Betragssuche ----------------------------------------------------------- -->
			<div class="row">
				<form method="post" action="findValue">
					<label for="searchValue">Search Value:</label> <select name="type">
						<option value="findByValue">genauer Betrag</option>
						<option value="findByValueBetween">von bis</option>
						<option value="findByValueGreaterThanEqual">>=</option>
						<option value="findByValueLessThanEqual"><=</option>
					

					</select> <input type="text" name="searchValue"> <input
						type="submit" value="Do it"> <input type="hidden"
						name="${_csrf.parameterName}" value="${_csrf.token}" />

				</form>
			</div>
			<!--  Betragssuche ----------------------------------------------------------- -->
			
			<hr>	
			<!-- Search for Date ----------------------------------------------------------- -->
			<div class="row">
				<form method="post" action="findDate">
					<label for="searchDate">Search Date:</label> <select name="type">
						<option value="findByBookDate">Search for Date</option>	

					</select> 
					<input class="form_datetime" placeholder="Date"
						 name="searchDate" type="text">
					 <input	type="submit" value="Search"> <input type="hidden"
						name="${_csrf.parameterName}" value="${_csrf.token}" />

				</form>
			</div>
			<hr>
			<!--  Search for Date ----------------------------------------------------------- -->
			
			<!--  Search + Fill ----------------------------------------------------------- -->
			<div class="row">
				<form method="post" action="find">
					<label for="searchString">Search:</label> <select name="type">
						<option value="findAll" selected="selected">findAll</option>
						<option value="findByNotesIgnoreCaseContaining">Volltextsuche</option>
						<option value="findByCategorieName">findByCategorieName</option>
						<option value="findByUserLastName">findByUserLastName</option>
						<!-- <option value="findByWhateverName">findByWhateverName</option>
						<option value="doALike">doALike</option>
						<option value="countByLastName">countByLastName</option>
						<option value="removeByLastName">removeByLastName</option>
						<option value="removeByCompanyName">removeByCompanyName</option>
						<option value="findByLastNameContainingOrFirstNameContainingAllIgnoreCase">findByName</option>
						<option value="findByOrderByLastNameAsc">orderByLastName</option>
						<option value="findTop10ByOrderByLastNameAsc">orderByLastNameTOP10</option>
						<option value="findByCompanyNameOrderByLastNameAsc">findByCompanyNameOrderByLastNameAsc</option> -->

					</select> <input type="text" name="searchString"> <input
						type="submit" value="Do it"> <input type="hidden"
						name="${_csrf.parameterName}" value="${_csrf.token}" />

				</form>
			</div>

			<!--  Search + Fill ----------------------------------------------------------- -->
			<%-- <h3>Count: ${count}</h3> --%>
		</center>



		<!--  list all finances ----------------------------------------------------------- -->
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<h1>Finances</h1>
				<a href="fill"><button type="button" class="btn btn-success">FillList</button></a>
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
							<th>Categorie</th>
							<th>User</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${finances}" var="finance">
							<tr>
								<td>${finance.id}</td>
								<td>${finance.payment}</td>
								<td><fmt:formatDate value="${finance.bookDate}"
										pattern="dd.MM.yyyy" /> </td>
								<td>${finance.value}</td>
								<td>${finance.notes}</td>
								<td>${finance.categorie.name}</td>
								<td>${finance.user.lastName}</td>

								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<td><a href="edit?id=${finance.id}">
											<button type="button" class="btn btn-xs btn-success">
												<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
												Edit
											</button>
									</a> <a href="delete?id=${finance.id}">
											<button type="button" class="btn btn-xs btn-danger">
												<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
												Delete
											</button>
									</a></td>
								</sec:authorize>


							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!--  list all finances  ----------------------------------------------------------- -->
	</div>
		

	<!--  end of container -->
	<%@include file="includes/bootstrapJs.js"%>
	
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
