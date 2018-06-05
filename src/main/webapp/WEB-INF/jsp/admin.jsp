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
		<label>Users</label>
			<c:forEach items="${users}" var="u">
				<div class="col-md-4 col-sm-6">
					<div class="probootstrap-card probootstrap-listing">
						<div class="probootstrap-card-media">
							<img src="admin/photo/${u.nickName}" class="img-fluid"> <a
								href="#" class="probootstrap-love"><i class="icon-heart"></i></a>
						</div>
						<div class="probootstrap-card-text">
							<h2 class="probootstrap-card-heading">
								<a href="#">${u.nickName }</a>
							</h2>
							<div class="probootstrap-listing-location">
								<span>${u.id}</span>
							</div>
							<div class="probootstrap-listing-category for-sale">
								<span>${u.roles}</span>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>

<section class=" probootstrap-section-half">
	<div class="container">
		<div class="row">
			<label>Recieved Messages</label>
			<c:forEach items="${messages}" var="m">
				<div class="col-md-4 col-sm-6">
					<div class="probootstrap-card probootstrap-listing">
						<div class="probootstrap-card-media">
							<a href="#" class="probootstrap-love"></a>
						</div>
						<div class="probootstrap-card-text">
							<h2 class="probootstrap-card-heading">
								<a href="#">${m.origen.realFirstName}</a>
							</h2>
							<div class="probootstrap-listing-location">
								<span>${m.fecha}</span>
							</div>
							<div class="probootstrap-listing-location">
								<span>${m.email}</span>
							</div>
							<div class="probootstrap-listing-location">
								<span>${m.descripcion}</span>
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