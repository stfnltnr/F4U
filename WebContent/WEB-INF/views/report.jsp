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
            	<li>
                	<a href="editUser"><i class="fa fa-user fa-fw"></i> ${user.username}</a>
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
                            <a href="#"><i class="fa fa-edit fa-fw"></i> Reports</a>
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
                    <h1 class="page-header">Reports</h1>
                </div>
                <div class="col-lg-10">
                	<jsp:include page="includes/errors.jsp"></jsp:include>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
      
            	<a href="reportAll">
	                <div class="col-lg-10">
	                    <div class = "panel-group">
		                    <div class="panel panel-green">
		                        <div class="panel-heading">
		                            <div class="row">
		                                <div class="col-xs-3">
		                                    <i class="fa fa-file-excel-o fa-4x"></i>
		                                </div>
		                                <div class="col-xs-9 text-right">
		                                    <div class="huge">Create Report all Data</div>   
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
		                                    <div class="huge">more Reports <i class="fa fa-angle-double-down"></i></div>
		                                    
		                                </div>
		                            </div>
		                        </div>
	                        </a>
				     </div>
		     
				     <div id = "collapseOne" class = "panel-collapse collapse">
				        <div class = "panel-body">
							<!-- Report Panel -->				
							<hr>
							<!--  Report Date -->
							 <jsp:useBean id="now" class="java.util.Date" />
							<form class="form-horizontal" method="post" action="reportDate">
								<div class="form-group">
									<label class="control-label col-md-2">Report Date between:</label>
								<div class="col-md-2">
							<input id="reportDate" class="form-control form_datetime" value="<fmt:formatDate pattern="dd.MM.yyyy" value="${now}" />" type="text" name="searchDate1">
						</div>
						<div class="col-md-2">
							<input id="reportDate" class="form-control form_datetime" value="<fmt:formatDate pattern="dd.MM.yyyy" value="${now}" />" type="text" name="searchDate2">
						</div>
									<div class="col-md-6">	
										<button class="btn btn-default" type="submit" >Report</button>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</div>
								</div>
							</form>
							<!-- Report Date -->     
							<hr>
							<!-- Report Category -->
							<form class="form-horizontal" method="post" action="reportCategorie">
								<div class="form-group">
									<label class="control-label col-md-2">Report Category:</label>
									<div class="col-md-10">
											<c:forEach items="${cats}" var="cat">
												<td><input type="checkbox" name="categorieId" value="${cat.id}">${cat.name}</td>
											</c:forEach>
									</div>
									<div class="col-md-6">	
										<button class="btn btn-default" type="submit" >Report</button>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</div>
								</div>
							</form>
							<!-- Report Category -->
							<hr>
							<!-- Report Payment -->
							<form class="form-horizontal" method="post" action="reportPayment">
								<div class="form-group">
									<label class="control-label col-md-2">Report Payment:</label>
									<div class="col-md-10">
										<label class="checkbox-inline"><input type="radio" name="type" value="findIncome" />Income</label>
										<label class="checkbox-inline"><input type="radio" name="type" value="findOutcome" />Outcome</label>
									</div>
									<div class="col-md-6">	
										<button class="btn btn-default" type="submit" >Report</button>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</div>
								</div>
							</form>
							<!-- Report Payment -->
							<hr>
														
				        </div>
				    	</div>
		    			<!-- End Collapse -->
		    		</div> 
		  		</div>
		  	</div>
		  
        </div>
        	
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    
<!-- java scripts -->

<jsp:include page="includes/scripts.jsp"></jsp:include>
</body>
</html>