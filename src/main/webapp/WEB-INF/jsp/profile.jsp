<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="../jspf/header.jspf"%>
<section class="probootstrap-cover overflow-hidden">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-12 col-md-offset-5">
				<div class="about">
					<div class="justify-content-center gradient-profile ">
						<img class="img-profile-responsive" src="photo/user/${user.id}" />
					</div>
					<div class="probootstrap_md_py-30" id="profile">

						<ul class="list-group">
							<li class="list-group-item"><h3>My profile</h3></li>
							<li class="list-group-item"><label>Nickname: </label><span>
									${user.nickName}</span></li>
							<li class="list-group-item"><label>Name: </label><span>
									${user.realFirstName} ${user.realLastName}</span></li>
							<li class="list-group-item"><label>Birthdate: </label><span>
									${user.birthDate}</span></li>
							<li class="list-group-item"><label>DNI: </label><span>
									${user.dni}</span></li>
							<li class="list-group-item"><label>Zipcode: </label><span>
									${user.zipCode}</span></li>
							<sec:authorize access="isAuthenticated()">
								<sec:authorize access="hasRole('TECHNICIAN')">
									<li class="list-group-item"><label>My Description:
									</label><span> ${user.technicalDescription}</span></li>
									<li class="list-group-item"><label>Device
											knowledge: </label><span> ${user.skills}</span></li>
									<li class="list-group-item"><label>Average Rate: </label><span>
											${user.nota}</span></li>
								</sec:authorize>
							</sec:authorize>
						</ul>
						<div class="form-check">
							<button type="button" class="btn btn-success" id="editButton"
								onclick="showEditForm()">Edit</button>
						</div>
					</div>


					<div id="editForm" style="display: none">
						<form action="/editProfile" enctype="multipart/form-data"
							method="post">
							<input type="hidden" name="idUser" value="${user.id}" />
							<div class="form-group">
								<label for="photos">Photo</label> <input class="form-control"
									type="file" name="photo" />
							</div>
							<div class="form-group">
								<label for="Email">Email</label> <input id="Email" name="email"
									placeholder="${user.email}" class="form-input" size="30"
									type="email">
							</div>
							<div class="form-group">
								<label for="realFirstName">First Name </label> <input
									class="form-control" type="text"
									placeholder="${user.realFirstName}" name="realFirstName" />
							</div>
							<div class="form-group">
								<label for="realLastName">Last Name </label> <input
									class="form-control" type="text"
									placeholder="${user.realFirstName}" name="realLastName" />
							</div>
							<div class="form-group">
								<label for="DNI">DNI </label> <input class="form-control"
									type="text" placeholder="${user.dni}" name="DNI" />
							</div>
							<div class="form-group">
								<label for="zipCode"> Zip Code </label> <input
									class="form-control" type="text" placeholder="${user.zipCode}"
									name="zipCode" />
							</div>
							<div class="form-group">
								<label for="birthDate">Birthdate </label> <input
									class="form-control" type="date"
									placeholder="${user.birthDate}" name="birthDate" />
							</div>

							<sec:authorize access="isAuthenticated()">
								<sec:authorize access="hasRole('TECHNICIAN')">
									<div class="form-group">
										<label for="technicalDescription">Description </label> <input
											class="form-control" type="text"
											placeholder="${user.technicalDescription}"
											name="technicalDescription" />
									</div>
									<div class="form-group">
										<label for="skills">Device knowledge </label> <input
											class="form-control" type="text" placeholder="${user.skills}"
											name="skills" />
									</div>
								</sec:authorize>
							</sec:authorize>

							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="form-actions">
								<button type="submit" class="btn btn-success">Save</button>
							</div>
						</form>
					</div>


					<section class=" probootstrap-section-half tableBox">
						<h4>Ofertas Activas</h4>
						<div class="container">
							<div class="row">
								<c:forEach items="${user.offers}" var="o">
									<a href="offer?id=${o.id}">
										<div class="col-md-4 col-sm-6">
											<div class="probootstrap-card probootstrap-listing">
												<div class="probootstrap-card-media">
													<img src="photo/offer/${o.id}" class="img-responsive">
													<a class="probootstrap-love hide"></a>
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
														<li><i class="ion-ios-locationLocation"></i>Location
															<span>${o.zipCode}</span></li>
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

					<section class=" probootstrap-section-half">
						<h4>Negociaciones Activas</h4>
						<div class="container">
							<div class="row">
								<c:forEach items="${user.negociaciones}" var="o">
									<a href="offer?id=${o.offer.id}">
										<div class="col-md-4 col-sm-6">
											<div class="probootstrap-card probootstrap-listing">
												<div class="probootstrap-card-media">
													<img src="photo/offer/${o.offer.id}" class="img-responsive">
													<a class="probootstrap-love hide"></a>
												</div>
												<div class="probootstrap-card-text">
													<h1 id="tituloLista" class="probootstrap-card-heading">
														${o.offer.title}</h1>
													<div class="probootstrap-listing-location">
														<span>${o.technician.realFirstName}</span>
													</div>
													<div class="probootstrap-listing-category for-sale">
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
												<div class="probootstrap-card-extra">
													<ul>
														<li><i class="ion-ios-locationLocation"></i>Price <span>${o.price}€</span>
														</li>
														<li>Duration <span>${o.duration}</span>
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
						<span>Reparaciones Cliente</span>
					</div>
					<sec:authorize access="isAuthenticated()">
						<sec:authorize access="hasRole('USER')">
							<section class=" probootstrap-section-half">
								<div class="container">
									<div class="row">
										<c:forEach items="${user.reparacionesPublisher}" var="r">
											<a href="repair?id=${r.id}">
												<div class="col-md-4 col-sm-6">
													<div class="probootstrap-card probootstrap-listing">
														<div class="probootstrap-card-media">
															<img src="photo/offer/${r.offer.id}"
																class="img-responsive"> <a
																class="probootstrap-love hide"></a>
														</div>
														<div class="probootstrap-card-text">
															<h1 id="tituloLista" class="probootstrap-card-heading">
																${r.offer.title}</h1>
															<div class="probootstrap-listing-location">
																<span>${r.technician.realFirstName}</span>
															</div>
															<div class="probootstrap-listing-location">
																<span>Date: ${r.initDate}</span>
															</div>
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
												<div class="col-md-4 col-sm-6">
													<div class="probootstrap-card probootstrap-listing">
														<div class="probootstrap-card-media">
															<img src="photo/offer/${r.offer.id}"
																class="img-responsive"> <a
																class="probootstrap-love hide"></a>
														</div>
														<div class="probootstrap-card-text">
															<h1 id="tituloLista" class="probootstrap-card-heading">
																${r.offer.title}</h1>
															<div class="probootstrap-listing-location">
																<span>${r.publisher.realFirstName}</span>
															</div>
															<div class="probootstrap-listing-location">
																<span>Date: ${r.initDate}</span>
															</div>
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
<script src="${s}/js/ourFunctions.js"></script>
<%@ include file="../jspf/footer.jspf"%>
