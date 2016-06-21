<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="includes/bootstrapMeta.inc"%>
<title>finance4you</title>
<%@include file="includes/bootstrapCss.css"%>
<%@include file="includes/treeView.css"%>

</head>
<body>
	<div class="container" role="main">
		<!-- Navigation -->
		<jsp:include page="includes/nav.jsp"></jsp:include>
		
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<form class="form-horizontal" enctype="multipart/form-data" method="post" action="upload?${_csrf.parameterName}=${_csrf.token}"> <%-- or action="upload?id=${employeeId} --%>
					<fieldset>
						<legend>Upload Files for user ${user.username}</legend>

						<! ----------------  username ---------------- -->
						<input type="hidden" name="username" value="<c:out value="${user.username}"/>">

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
								<a href="editUser">
									<button type="button" class="btn btn-default">Cancel</button>
								</a>
							</div>
						</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					</fieldset>

					
				</form>
			</div>
		</div>

	</div>
	<!--  End of container -->


<!-- JS for Bootstrap -->
	<%@include file="includes/bootstrapJs.js"%>
<script>
$('#inputFile').change(function(e) {
    var file_id = e.target.id;

    var file_name_arr = new Array();
    var process_path = site_url + 'public/uploads/';

    for (i = 0; i < $("#" + file_id).prop("files").length; i++) {

        var form_data = new FormData();
        var file_data = $("#" + file_id).prop("files")[i];
        form_data.append("file_name", file_data);

        if (check_multifile_logo($("#" + file_id).prop("files")[i]['name'])) {
            $.ajax({
                //url         :   site_url + "inc/upload_image.php?width=96&height=60&show_small=1",
                url: site_url + "inc/upload_contact_info.php",
                cache: false,
                contentType: false,
                processData: false,
                async: false,
                data: form_data,
                type: 'post',
                success: function(data) {
                    // display image
                }
            });
        } else {
            $("#" + html_div).html('');
            alert('We only accept JPG, JPEG, PNG, GIF and BMP files');
        }

    }
});

function check_multifile_logo(file) {
    var extension = file.substr((file.lastIndexOf('.') + 1))
    if (extension === 'jpg' || extension === 'jpeg' || extension === 'gif' || extension === 'png' || extension === 'bmp') {
        return true;
    } else {
        return false;
    }
}
</script>
</body>
</html>