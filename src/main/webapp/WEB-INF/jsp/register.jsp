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
				<form action="/register/addUser" enctype="multipart/form-data"
					method="post" data-toggle="validator" role="form">
					<div class="form-group">
						<label for="nickName">User name </label> <input
							class="form-control" name="nickName" required />
					</div>
					<div class="form-group">
						<label for="photos">Photo</label> <input type="file" name="photo" />
					</div>
					<div class="form-group">
						<label for="Email">Email</label> <input id="Email" name="email"
							placeholder="you@example.com" class="form-input" size="30"
							type="email" required>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="control-label">Password</label>
						<div class="form-inline row">
							<div class="form-group col-sm-6">
								<input type="password" data-minlength="6" class="form-control"
									id="inputPassword" placeholder="Password" required>
								<div class="help-block">Minimum of 6 characters</div>
							</div>
							<div class="form-group col-sm-6">
								<input type="password" name="password" class="form-control"
									id="inputPasswordConfirm" data-match="#inputPassword"
									data-match-error="Whoops, these don't match"
									placeholder="Confirm" required>
								<div class="help-block with-errors"></div>
							</div>
						</div>
					</div>


					<div class="form-group">
						<label for="firstName">First name </label> <input
							class="form-control" name="firstName" required />
					</div>
					<div class="form-group">
						<label for="lastName">Last name </label> <input
							class="form-control" name="lastName" required />
					</div>
					<div class="form-group">
						<label for="DNI">DNI </label> <input class="form-control"
							type="text" name="DNI" required />
					</div>
					<div class="form-group">
						<label for="zipCode">Zip code </label> <input class="form-control"
							type="text" name="zipCode" />
					</div>
					<div class="form-group">
						<label for="birthDate">Birthdate </label> <input
							class="form-control" type="date" name="birthDate" />
					</div>
					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="roles"
							onclick="myFunction()" name="checkBox"> <label
							class="form-check-label">Are you technician?</label>
					</div>

					<div id="tecnico" style="display: none">
						<div class="form-group">
							<label for="technicalDescription">Description </label> <input
								class="form-control" type="text"
								placeholder="Experience details..." name="technicalDescription" />

						</div>
						<div class="form-group">
							<label for="skills">Device knowledge </label> <input
								class="form-control" type="text" placeholder="Iphone, Laptop..."
								name="skills" />
						</div>

					</div>
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">Create user</button>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
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