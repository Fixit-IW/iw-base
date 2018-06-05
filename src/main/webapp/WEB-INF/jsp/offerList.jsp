<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="../jspf/header.jspf"%>
<section class="probootstrap-cover overflow-hidden probootstrap_p-0">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10 col-md-offset-2">
				<section class=" probootstrap-section-half probootstrap_p-0">
					<div class="container">
						<div class="row">
							<c:forEach items="${search}" var="o">
								<a href="offer?id=${o.id}">
									<div class="col-md-4 col-sm-6">
										<div class="probootstrap-card probootstrap-listing">
											<div class="probootstrap-card-media">
												<img src="photo/offer/${o.id}" class="img-responsive">
												<a class="probootstrap-love"><i class="ion-heart"></i></a>
											</div>
											<div class="probootstrap-card-text">
												<div class="probootstrap-card-heading">
													<h1 class="probootstrap_font-20 probootstrap_font-regular" id="tituloLista">${o.title}</h1>
												</div>
												<div class="probootstrap-listing-location probootstrap_font-14 probootstrap_font-regular">
													${o.description}
												</div>
												<div class="probootstrap-listing-category for-sale">
													<span>${o.device}</span>
												</div>
											</div>
											<div class="probootstrap-card-extra">
												<ul>
													<li><i class="ion-ios-locationLocation"></i>
														Location <span>${o.zipCode}</span>
													</li>
													<li>Date<span>${o.date}</span></li>
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