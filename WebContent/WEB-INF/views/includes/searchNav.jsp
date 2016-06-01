<nav class="navbar navbar-default">
	<div class="container-fluid">
		<form class="navbar-form navbar-right" role="search" method="post"
			action="searchEmployees">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search for..."
					name="searchString"> <span class="input-group-btn">
					<button class="btn btn-default" type="submit">Go!</button>
				</span>
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</div>
</nav>