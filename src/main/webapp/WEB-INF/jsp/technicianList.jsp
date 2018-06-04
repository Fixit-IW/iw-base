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
				<h1>Resultado de la búsqueda:</h1>
				<section class=" probootstrap-section-half">
					<div class="container">
						<div class="row">
							<c:forEach items="${search}" var="t">
								<a href="technician?id=${t.id}">
									<div class="col-md-4 col-sm-6">
										<div class="probootstrap-card probootstrap-listing">
											<div class="probootstrap-card-media">
												<img src="photo/offer/${t.id}" class="img-responsive">
												<a class="probootstrap-love"><i class="ion-heart"></i></a>
											</div>
											<div class="probootstrap-card-text">
												<h1 id="tituloLista" class="probootstrap-card-heading">
													${t.realFirstName}</h1>
												<div class="row probootstrap_mx-4"
													style="color: #00CA4D">
													<i id="star1" class="ion-android-star"></i> <i id="star2"
														class="ion-android-star"></i> <i id="star3"
														class="ion-android-star"></i> <i id="star4"
														class="ion-android-star"></i> <i id="star5"
														class="ion-android-star-outline"></i>
												</div>
												<div class="probootstrap-listing-location">
													<span>${t.technicalDescription}</span>
												</div>
												<div class="probootstrap-listing-category for-sale">
													<span>${t.skills}</span>
												</div>
											</div>
											<div class="probootstrap-card-extra">
												<ul>
													<li><i class="ion-ios-locationLocation"></i>Location <span>${t.zipCode}</span>
													</li>
													<li>Date</li>
												</ul>
											</div>
										</div>
									</div>
								</a>
							</c:forEach>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</section>
<script src="${s}/js/ourFunctions.js"></script>
<%@ include file="../jspf/footer.jspf"%>
