<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html lang="en">
<head>
<jsp:include page="includes/head.jsp"></jsp:include>
</head>
<body>

	<!-- Wrapper -->
    <div id="wrapper">
    
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <!-- navbar-header -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="list">F4U - finance for you</a>
            </div>
            <!-- navbar-header -->
			<!-- navbar-top-links -->
            <ul class="nav navbar-top-links navbar-right">
            	<li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  ${user.username} <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="editUser"><i class="fa fa-user fa-fw"></i> Edit Profile</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <li>
                	<c:url value="/logout" var="logoutUrl" />
					<form action="${logoutUrl }" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<button class="btn btn-xs btn-danger" type="submit" value="Logout">
						<span class="glyphicon glyphicon-log-out"></span> Logout
						</button>
					</form>
                </li>
            </ul>
            <!-- navbar-top-links -->
			<!-- navbar-static-sidebar -->
            <div class="navbar-default sidebar" role="navigation">
            	<!-- sidebar-collapse -->
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="list"><i class="fa fa-eye fa-fw"></i> Finance Overview</a>
                        </li>
                        <li>
                            <a href="listCat"><i class="fa fa-table fa-fw"></i> Manage Categories</a>
                        </li>
                        <li>
                            <a href="report"><i class="fa fa-edit fa-fw"></i> Reports</a>
                        </li>
                    </ul>
                </div>
                <!-- sidebar-collapse -->
            </div>
            <!-- navbar-static-side -->
        </nav>
        <!-- Navigation -->

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-10">
                    <h1 class="page-header">Finance Overview</h1>
                </div>
                <div class="col-lg-10">
                	<jsp:include page="includes/errors.jsp"></jsp:include>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
            	<a href="add">
	                <div class="col-lg-10">
	                    <div class = "panel-group">
		                    <div class="panel panel-primary">
		                        <div class="panel-heading">
		                            <div class="row">
		                                <div class="col-xs-3">
		                                    <i class="fa fa-plus-circle fa-4x"></i>
		                                </div>
		                                <div class="col-xs-9 text-right">
		                                    <div class="huge">Add Finance</div>   
		                                </div>
		                            </div>
		                        </div>
	                    	</div>
	                    </div>
	                </div>
                </a>
            </div>
            <!-- Search & Filter Accordion -->
            <div class="row">
	            <div class="col-lg-10">
	            	<div class = "panel-group" id = "accordion">
		  				<div class = "panel panel-green">     
				     		<a data-toggle = "collapse" data-parent = "#accordion" href = "#collapseOne">
					     		<div class = "panel-heading">
					     			<div class="row">
		                                <div class="col-xs-3">
		                                    <i class="fa fa-search-plus fa-4x"></i>
		                                </div>
		                                <div class="col-xs-9 text-right">
		                                    <div class="huge">Search & Filter <i class="fa fa-angle-double-down"></i></div>
		                                    
		                                </div>
		                            </div>
		                        </div>
	                        </a>
				     </div>
		     
				     <div id = "collapseOne" class = "panel-collapse collapse">
				        <div class = "panel-body">
							<!-- Search Panel -->
							<!-- Filter All/Income/Outcome -->	
							<form class="form-horizontal" method="post" action="findBool">
								<div class="form-group">						
									<label class="control-label col-lg-2" for="findBool">Filter:</label>
									<div class="col-lg-6">
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
							<jsp:useBean id="now" class="java.util.Date" />
							<form class="form-horizontal" method="post" action="findDate">
								<div class="form-group">
									<label class="control-label col-md-2" for="searchValue">Search Date:</label>
									<div class="col-md-2">
										<input id="searchDate" class="form-control form_datetime" value="<fmt:formatDate pattern="dd.MM.yyyy" value="${now}" />" type="text" name="searchDate">
									</div>
									<div class="col-md-6">	
										<button class="btn btn-default" type="submit" >Search</button>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</div>
								</div>
							</form>
							<!-- Search Date -->
							<!-- Search Date Between -->
							<form class="form-horizontal" method="post" action="findDateBeetween">
								<div class="form-group">
									<label class="control-label col-md-2" for="searchValue">Search Date Between:</label>
									<div class="col-md-2">
										<input id="searchDate" class="form-control form_datetime" value="<fmt:formatDate pattern="dd.MM.yyyy" value="${now}" />" type="text" name="searchDate1">
									</div>
									<div class="col-md-2">
										<input id="searchDate" class="form-control form_datetime" value="<fmt:formatDate pattern="dd.MM.yyyy" value="${now}" />" type="text" name="searchDate2">
									</div>
									<div class="col-md-6">
										<button class="btn btn-default" type="submit">Search</button>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</div>
								</div>
							</form>
							<!-- Search Date Between -->  
				        </div>
				    	</div>
		    			<!-- End Collapse -->
		    		</div> 
		  		</div>
		  	</div>
		  	<!-- End Search & Filter Accordion -->
		  	<!--  list all finances ----------------------------------------------------------- -->
			<div class="row">
				<div class="col-lg-10">
					<table data-toggle="table"
							data-pagination="true">
						<thead>
							<tr>
								<th>Date</th>
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
									<td><fmt:formatDate value="${finance.bookDate}" pattern="dd.MM.yyyy" /></td>
									<c:choose>
										<c:when test="${finance.payment == true }">
											<td>${finance.value}</td>
										</c:when>
										<c:otherwise>
											<td class="text-danger">-${finance.value}</td>
										</c:otherwise>
									</c:choose>
									</td>
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
        	
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    
<!-- java scripts -->
<jsp:include page="includes/scripts.jsp"></jsp:include>
</body>
</html>