<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!-- Metis Menu Plugin JavaScript -->
<script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="bower_components/raphael/raphael-min.js"></script>
<script src="bower_components/morrisjs/morris.min.js"></script>
<script src="js/morris-data.js"></script>

<!-- Custom Theme JavaScript -->
<script src="dist/js/sb-admin-2.js"></script>

<!-- JS for Bootstrap -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.6.0/bootstrap-table.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script	src="http://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script>
	

<script type="text/javascript">
$(function () {
    $('.tree li').on('click', function (e) {
        var children = $(this).find('> ul > li');
        if (children.is(":visible")) children.hide('fast');
        else children.show('fast');
        e.stopPropagation();
    });
});
</script>
	
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

<script type="text/javascript">
	function checkForm(form) {
		if (form.username.value == "") {
			alert("Error: Username cannot be blank!");
			form.username.focus();
			return false;
		}
		re = /^\w+$/;
		if (!re.test(form.username.value)) {
			alert("Error: Username must contain only letters, numbers and underscores!");
			form.username.focus();
			return false;
		}

		if (form.pwd1.value != "" && form.pwd1.value == form.pwd2.value) {
			if (form.pwd1.value.length < 8) {
				alert("Error: Password must contain at least eight characters!");
				form.pwd1.focus();
				return false;
			}
			if (form.pwd1.value == form.username.value) {
				alert("Error: Password must be different from Username!");
				form.pwd1.focus();
				return false;
			}
			re = /[0-9]/;
			if (!re.test(form.pwd1.value)) {
				alert("Error: password must contain at least one number (0-9)!");
				form.pwd1.focus();
				return false;
			}
			re = /[a-z]/;
			if (!re.test(form.pwd1.value)) {
				alert("Error: password must contain at least one lowercase letter (a-z)!");
				form.pwd1.focus();
				return false;
			}
			re = /[A-Z]/;
			if (!re.test(form.pwd1.value)) {
				alert("Error: password must contain at least one uppercase letter (A-Z)!");
				form.pwd1.focus();
				return false;
			}
		} else {
			alert("Error: Please check that you've entered and confirmed your password!");
			form.pwd1.focus();
			return false;
		}

		alert("You entered valid credentials!"); /* + form.pwd1.value */
		return true;
	}
</script>