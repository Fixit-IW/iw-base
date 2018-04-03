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

				<h1>Admin</h1>
				<p class="lead">Información muy confidencial</p>

				<hr />

				<form action="/admin/addUser" method="post">
					<div class="form-group">
						<label for="nickName">User name </label> <input class="form-control"
							name="nickName" />
					</div>

					<div class="form-group">
						<label for="password">password <input class="form-control"
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
							type="number" name="DNI" />
					</div>
					
					<div class="form-group">
						<label for="birthDate">Birth date </label> <input class="form-control"
							type="date" name="birthDate" />
					</div>
					<div class="input-group date" data-provide="datepicker">
					    <input type="text" class="form-control">
						    <div class="input-group-addon">
						        <span class="glyphicon glyphicon-th"></span>
						    </div>
					</div>
					
					<div class="form-check">
						<label class="form-check-label" for="isAdmin">Is admin?</label> <input
							type="checkbox" class="form-check-input" name="isAdmin">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</div>
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">Create user</button>
					</div>
				</form>

				<hr />

				<table>
					<thead>
						<tr>
							<th>id
							<th>login
							<th>roles
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${users}" var="u">
							<tr>
								<td>${u.id}
								<td>${u.nickName}
								<td>${u.roles}
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>
<section class=" probootstrap-section-half">
	<div class="container">
		<div class="row">
			<c:forEach items="${users}" var="u">
				<div class="col-md-4 col-sm-6">
					<div class="probootstrap-card probootstrap-listing">
						<div class="probootstrap-card-media">
							<img src="admin/photo/${u.login}" class="img-fluid"> <a
								href="#" class="probootstrap-love"><i class="icon-heart"></i></a>
						</div>
						<div class="probootstrap-card-text">
							<h2 class="probootstrap-card-heading">
								<a href="#">${u.login }</a>
							</h2>
							<div class="probootstrap-listing-location">
								<span>${u.id}</span>
							</div>
							<div class="probootstrap-listing-category for-sale">
								<span>${u.roles}</span>
							</div>
							<div class="probootstrap-listing-price">
								<strong>$1,121,000</strong>
								<p>/ month</p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>

<%@ include file="../jspf/authinfo.jspf"%>
</div>

<%@ include file="../jspf/footer.jspf"%>