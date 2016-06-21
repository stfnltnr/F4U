<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<form class="form-horizontal" enctype="multipart/form-data" method="post" action="upload"> <%-- or action="upload?id=${employeeId} --%>
					<fieldset>
						<legend>Upload Files for user ${username}</legend>

						<! ----------------  username ---------------- -->
						<input type="hidden" name="username" value="<c:out value="${username}"/>">

						<! ----------------  file ---------------- -->
						<div class="form-group">
							<label for="inputFile" class="col-md-2 control-label">File:</label>
							<div class="col-md-10">
								<input class="form-control" id="inputFile" type="file" name="myFile">
							</div>
						</div>
						<! ----------------  buttons ---------------- -->
						<div class="form-group">
							<div class="col-md-10 col-md-offset-2">
								<button type="submit" class="btn btn-primary">Upload</button>
								<a href="list">
									<button type="button" class="btn btn-default">Cancel</button>
								</a>
							</div>
						</div>

					</fieldset>
				</form>
			</div>
		</div>

	</div>
	<!--  End of container -->


<!-- JS for Bootstrap -->
	<%@include file="includes/bootstrapJs.js"%>

</body>
</html>