<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<div class="navbar-dark">
	<%@ include file="../jspf/header.jspf"%>
</div>
<section class="probootstrap-cover overflow-hidden  gradient">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-5 box">
				<h1 style="text-align: center;"> Login</h1>
				<form action="/login" method="post">
					<div style="text-align: center; padding-bottom: 5px" >Please enter your username and password</div>
					<fieldset>
						<div class="form-group">
							<label for="username"> Username </label> <input type="text"
								class="form-control" id="username" name="username"
								placeholder="Username" />
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								class="form-control" id="password" name="password"
								placeholder="Password" /> <input type="hidden"
								name="${_csrf.parameterName}" value="${_csrf.token}" />
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