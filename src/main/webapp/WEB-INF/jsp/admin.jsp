<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="../jspf/header.jspf"%>
<section class=" probootstrap-section overflow-hidden probootstrap_pb-1">
	<div class="container ">
		<h1>Admin</h1>
		<p class="lead">Confidential Information</p>
		<div class="table-responsive tableBox" >
			<div class="probootstrap_font-20 probootstrap_p-2" onclick="show('userT')">Users</div>
			<table id="userT" class="table table-hover">
				<thead>
					<tr>
						<th class = "th-lg">Id
						<th class = "th-lg">Login
						<th class = "th-lg">Roles
						<th class = "th-lg">Photo
						<th class = "th-lg">Name</th>
						<th class = "th-lg">Delete
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${users}" var="u">
						<tr>
							<td>${u.id}
							<td>${u.nickName}
							<td>${u.roles}
							<td>${u.realFirstName}</td>
							<td><img src="photo/user/${u.id}" class="img-mini" /></td>
							<td>
								<form action="/admin/deleteUser" method="post">
									<input type="hidden" name="idUser" value="${u.id}" />
									<button type="submit" class="btn btn-danger">Delete</button>
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</section>

<section class=" probootstrap-section-half probootstrap_p-0">
	<div class="container">
		<div class="table-responsive tableBox">
			<div class="probootstrap_font-20 probootstrap_p-2" onclick="show('offersT')">Active Offers</div>
			<table id="offersT" class="table table-hover">
				<thead>
					<tr>
						<th>Id</th>
						<th>Title</th>
						<th>Description</th>
						<th>Name</th>
						<th>Device</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${offers}" var="o">
						<tr>
							<td>${o.id}</td>
							<td><a href="offer?id=${o.id}">${o.title}</a></td>
							<td>${o.description}</td>
							<td>${o.publisher.realFirstName}</td>
							<td>${o.device}</td>
							<td>
								<form action="/admin/deleteOffer" method="post">
									<input type="hidden" name="idOffer" value="${o.id}" />
									<button type="submit" class="btn btn-danger">X</button>
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</section>

<section class=" probootstrap-section-half probootstrap_p-0">
	<div class="container">
		<div class="table-responsive tableBox" >
			<div class="probootstrap_font-20 probootstrap_p-2" onclick="show('messageT')">Received Messages</div>
			<table id="messageT" class="table table-hover">
				<thead>
					<tr>
						<th>Name</th>
						<th>Date</th>
						<th>Email</th>
						<th>Description</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${messages}" var="m">
						<tr>
							<td>${m.name}</td>
							<td>${m.fecha}</td>
							<td>${m.email}</td>
							<td>${m.descripcion}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</section>

<script src="${s}/js/ourFunctions.js"></script>

<%@ include file="../jspf/authinfo.jspf"%>
<%@ include file="../jspf/footer.jspf"%>