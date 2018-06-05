<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="../jspf/header.jspf"%>
<section class="probootstrap-cover overflow-hidden">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10 col-md-offset-5">
				<div class="about">
					<div class="profile-photo">
						<img src="${s}/img/sapo.png" width="127" height="154" />
					</div>
					<h1>${user.nickName}</h1>
				</div>
				<ul class="list-group">
					<li class="list-group-item"><h3>My profile</h3></li>
					<li class="list-group-item"><label>Name: </label><span>
							${user.realFirstName} ${user.realLastName}</span></li>
					<li class="list-group-item"><label>Birthdate: </label><span>
							${user.birthDate}</span></li>
					<li class="list-group-item"><label>DNI: </label><span>
							${user.dni}</span></li>
					<li class="list-group-item"><label>Zipcode: </label><span>
							${user.zipCode}</span></li>

				</ul>
			</div>
			<section class=" probootstrap-section-half">
				<div class="container">
					<div class="row">
						<c:forEach items="${user.offers}" var="o">
								<a href="offer?id=${o.id}">
									<div class="col-md-4 col-sm-6">
										<div class="probootstrap-card probootstrap-listing">
											<div class="probootstrap-card-media">
												<img src="photo/offer/${o.id}" class="img-responsive">
												<a class="probootstrap-love"><i class="ion-heart"></i></a>
											</div>
											<div class="probootstrap-card-text">
												<h1 id="tituloLista" class="probootstrap-card-heading">
													${o.title}</h1>
												<div class="probootstrap-listing-location">
													<span>${o.description}</span>
												</div>
												<div class="probootstrap-listing-category for-sale">
													<span>${o.device}</span>
												</div>
											</div>
											<div class="probootstrap-card-extra">
												<ul>
													<li><i class="ion-ios-locationLocation"></i>Location <span>${o.zipCode}</span>
													</li>
													<li>Date <span>${o.date}</span>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</a>
							</c:forEach>
					</div>
				</div>
			</section>
			<div class="container">
				<span>Negociaciones Activas</span>
			</div>
			<section class=" probootstrap-section-half">
				<div class="container">
					<div class="row">
						<c:forEach items="${user.negociaciones}" var="o">
							<div class="col-md-4 col-sm-6">
								<div class="probootstrap-card probootstrap-listing">
									<div class="probootstrap-card-media">
										<a href="#" class="probootstrap-love"><i
											class="icon-heart"></i></a>
									</div>
									<div class="probootstrap-card-text">
										<h2 class="probootstrap-card-heading">
											<a href="offer?id=${o.offer.id}">${o.offer.title}</a>
										</h2>
										<div class="probootstrap-listing-location">
											<a href="technician?id=${o.technician.id}">${o.technician.nickName}</a>
										</div>
										<div class="probootstrap-listing-location">
											<span>Price: ${o.price}€ / Duration: ${o.duration	}</span>

										</div>
										<form action="/addReparacion" method="post">

											<input type="hidden" name="idNegociacion" value="${o.id}" />

											<button type="submit" class="btn btn-success">✔</button>
											<button formaction="/dennyReparacion" type="submit"
												class="btn btn-danger">X</button>
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" />
										</form>

									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>
			<div class="container">
				<span>Reparaciones Cliente</span>
			</div>
			<sec:authorize access="isAuthenticated()">
				<sec:authorize access="hasRole('USER')">
					<section class=" probootstrap-section-half">
						<div class="container">
							<div class="row">
								<c:forEach items="${user.reparacionesPublisher}" var="r">
									<a href="repair?id=${r.id}">
										<div class="probootstrap-card probootstrap-listing">
											<div class="probootstrap-card-text">
												<h2 class="probootstrap-card-heading">
													<span>${r.offer.title}</span>
												</h2>
												<div class="probootstrap-listing-location">
													<span>${r.technician.nickName}</span>
												</div>
												<div class="probootstrap-listing-location">
													<span>Date: ${r.initDate} </span>
												</div>
											</div>
										</div>

									</a>
								</c:forEach>
							</div>
						</div>
					</section>
				</sec:authorize>
			</sec:authorize>
			<div class="container">
				<span>Reparaciones Tecnico</span>
			</div>
			<sec:authorize access="isAuthenticated()">
				<sec:authorize access="hasRole('TECHNICIAN')">
					<section class=" probootstrap-section-half">
						<div class="container">
							<div class="row">
								<c:forEach items="${user.reparacionesTechnician}" var="r">
									<a href="repair?id=${r.id}">
										<div class="probootstrap-card probootstrap-listing">
											<div class="probootstrap-card-text">
												<h2 class="probootstrap-card-heading">
													<span>${r.offer.title}</span>
												</h2>
												<div class="probootstrap-listing-location">
													<span>${r.publisher.nickName}</span>
												</div>
												<div class="probootstrap-listing-location">
													<span>Date: ${r.initDate} </span>
												</div>
											</div>
										</div>

									</a>
								</c:forEach>
							</div>
						</div>
					</section>
				</sec:authorize>
			</sec:authorize>
		</div>
	</div>
</section>

<%@ include file="../jspf/footer.jspf"%>
