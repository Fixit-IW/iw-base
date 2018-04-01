<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="../jspf/header.jspf"%>

<section class="probootstrap-cover">
	<div class="container">
		<div class="row justify-content-center">
			<form action="/logout" method="post">
				<legend>Log out</legend>
				<div class="form-group">
					<label class="lead form-check-label">¿Estás seguro que
						deseas salir?</label> <input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</div>
				<button type="submit" class="btn btn-danger">Salir</button>

			</form>
		</div>
	</div>
</section>

<%@ include file="../jspf/footer.jspf"%>
