<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="../jspf/header.jspf"%>
<section class="probootstrap-cover">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-4">
				<h1>Registro</h1>
				<form action="/login" method="post">
					<label>Please Login</label>
					<fieldset>
						<div class="form-group">
							<label for="username"> Username </label>
							<input type="text" class="form-control"
								id="username" name="username"
								placeholder="Username" />
						</div>
						<div class="form-group">
							<label for="password">Password</label>
							<input type="password" class="form-control"
								id="password" name="password" placeholder="Password" /> 
							<input
								type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</div>
						<div class="form-actions">
							<button type="submit" class="btn btn-success">Log in</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</section>
<%@ include file="../jspf/footer.jspf"%>