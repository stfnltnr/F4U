<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="includes/bootstrapMeta.inc" />
<title>editTest</title>
<jsp:include page="includes/bootstrapCss.css" />
<link
	href="http://www.malot.fr/bootstrap-datetimepicker/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css"
	rel="stylesheet">
</head>
<body>
	<div class="container" role="main">

		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<form class="form-horizontal" method="post" action="addTest">
					<fieldset>
						<legend>Edit Test ${test.id }</legend>

						<!-- id -->
						<div class="form-group">
							<label for="inputID" class="col-md-2 control-label">id</label>
							<div class="col-md-10">
								<input class="form-control" id="inputID" type="text" name="id" value="${test.id}"/>">
							</div>
						</div>

						<!-- name -->
						<div class="form-group">
							<label for="inputName" class="col-md-2 control-label">name</label>
							<div class="col-md-10">
								<input class="form-control" id="inputName" type="text"
									name="name" value="<c:out value="${test.name}"/>">
							</div>
						</div>

						<!--  buttons  -->
						<div class="form-group">
							<div class="col-md-10 col-md-offset-2">
								<button type="submit" class="btn btn-primary">Submit</button>
								<a href="test">
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
<!-- JS for Bootstrap -->

</body>
</html>