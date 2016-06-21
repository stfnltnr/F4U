<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--  Navigation  -->
<!--  Messages -->
<center>
<!--  Error message ----------------------------------------------------------- -->
<c:if test="${not empty errorMessage}">
	<div class="alert alert-danger" role="alert">${errorMessage}</div>
</c:if>
<!--  Error message ----------------------------------------------------------- -->

<!--  Warning message ----------------------------------------------------------- -->
<c:if test="${not empty warningMessage}">
	<div class="alert alert-warning" role="warning">
		${warningMessage}</div>
</c:if>
<!--  Warning message ----------------------------------------------------------- -->

<!--   message ----------------------------------------------------------- -->
<c:if test="${not empty message}">
	<div class="alert alert-success" role="warning">${message}</div>
</c:if>
<!--   message ----------------------------------------------------------- -->
</center>
<!-- Messages -->