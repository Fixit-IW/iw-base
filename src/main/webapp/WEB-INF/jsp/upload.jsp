<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="../jspf/header.jspf"%>
<section>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10 col-md-offset-2">
				<h1>Upload</h1>
				<p class="lead">Prueba de subida de ficheros</p>

				<form action="admin/photo/1" enctype="multipart/form-data"
					method="post">
					<p>Please specify a file, or a set of files:</p>
					<input type="file" name="photo"/> <input
						name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
					<div>
						<input class="btn btn-primary" type="submit" value="Send">
					</div>
				</form>
	
				<p>Existing photos:<p> <img class="photo" src="admin/photo/1"> <img
					class="photo" src="admin/photo/2"> <img class="photo"
					src="admin/photo/3"> <img class="photo" src="admin/photo/4">
				<img class="photo" src="admin/photo/5">
			</div>
		</div>
	</div>

</section>
<%@ include file="../jspf/footer.jspf"%>
