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

				<h1></h1>
				<p class="lead"></p>

				<c:forEach items="${search}" var="o">
					<a href="offer?id=${o.id}">
						<div class="col-md-4 col-sm-6">
							<div class="probootstrap-card probootstrap-listing">
								<div class="probootstrap-card-media">
									<img src="img/slider_2.jpg" class="img-responsive">
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
	</div>
</section>
<%@ include file="../jspf/footer.jspf"%>