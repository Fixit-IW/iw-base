<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="../jspf/header.jspf"%>
<section class=" probootstrap-cover ">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10 col-md-offset-2">

				<h1>Sign Up</h1>
				<p class="lead">Información muy confidencial</p>

				<hr />

				<form action="/register/addUser" method="post">
					<div class="form-group">
						<label for="nickName">User name </label> <input class="form-control"
							name="nickName" />
					</div>

					<div class="form-group">
						<label for="password">Password <input class="form-control"
							type="password" name="password" />
						</label>
					</div>


					<div class="form-group">
						<label for="firstName">First name </label> <input class="form-control"
							name="firstName" />
					</div>
					<div class="form-group">
						<label for="lastName">Last name </label> <input class="form-control"
							name="lastName" />
					</div>
					<div class="form-group">
						<label for="DNI">DNI </label> <input class="form-control" 
							type="text" name="DNI" />
					</div>
					<div class="form-group">
						<label for="zipCode">Zip code </label> <input class="form-control" 
							type="text" name="zipCode" />
							</div>
					<div class="form-check">
    				<input type="checkbox" class="form-check-input" id="roles" onclick="myFunction()">
   						 <label class="form-check-label" >Are you technician?</label>
  						</div>
					
					<div id="tecnico" style= "display:none">
						<div class="form-group">
						<label for="zipCode">PatriNoTePiques </label> <input class="form-control" 
							type="text" placeholder="Sí, sí me pico" name="zipCode" />
							
					</div>
					
					</div>
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">Create user</button>
					</div>
					<input
						type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>

				<hr />

				
			</div>
		</div>
	</div>
</section>

<script src="${s}/js/ourFunctions.js"></script>

<%@ include file="../jspf/authinfo.jspf"%>
</div>

<%@ include file="../jspf/footer.jspf"%>