<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="${s}/js/ourFunctions.js"></script>

<%@ include file="../jspf/header.jspf"%>
<section class="probootstrap-cover">
	<div class="container">
		<div class="row justify-content-center">
			<sec:authorize access="isAuthenticated()">
				<sec:authorize access="hasRole('TECHNICIAN')">
					<div class="col-md-8">
				</sec:authorize>
				<sec:authorize access="hasRole('USER')">
					<div class="col-md-10">
				</sec:authorize>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
				<div class="col-md-10">
			</sec:authorize>

			<div class="panel panel-default panel--styled">
				<div class="panel-body">
					<div class="row panelTop">
						<div class="col-md-4">
							<img class="img-responsive" src="photo/offer/${offer.id}" alt="" />
						</div>
						<div class="col-md-8 probootstrap_p-15">
							<h3 class="probootstrap_text-green">${offer.title}</h3>
							<div class="probootstrap-listing-category for-sale">
								${offer.device}</div>
							<p class="probootstrap_text-gray-400">${offer.description}</p>
						</div>
					</div>
					<div class="row panelBottom probootstrap_m-0">
						<div class="col-md-4 text-left">
							<h5>
								Date <span class="itemPrice">${offer.date}</span>
							</h5>
						</div>
						<div class="col-md-8 justify-content-center">
							<img src="photo/user/${offer.publisher.id}" class="img-mini" />
							<h3
								class="probootstrap_font-14 probootstrap_font-regular probootstrap-card-heading">${offer.publisher.realFirstName}</h3>
						</div>
						<div class="col-md-4">
							<div class="stars">
								<div id="stars" class="starrr"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<sec:authorize access="isAuthenticated()">
			<sec:authorize access="hasRole('TECHNICIAN')">
				<div id="Tech"
					class="col-md-3 text-center justify-content-center panel panel-default panel--styled">
					<div class="form-check">
						<label> Do you want to repair this device?</label>
						<button type="button" class="btn btn-success" id="offer_button"
							onclick="showOfferForm()">Accept</button>
					</div>

					<div id="offer_form" style="display: none">
						<form action="/addNegociacion" method="post">
							<input type="hidden" name="idOffer" value="${offer.id}" />
							<div class="form-group">
								<label for="technicalDescription">Estimated Price </label> <input
									class="form-control" type="number"
									placeholder="Estimated price €" name="price" required />
							</div>
							<div class="form-group">
								<label for="skills">Estimated Time </label> <input
									class="form-control" type="number"
									placeholder="Estimated time (days)" name="duration" required />
							</div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="form-actions">
								<button type="submit" class="btn btn-success">Send</button>
							</div>
						</form>
					</div>
					<script>
						var offerOwner = ${offer.publisher.id};
						var rootId = ${rootID};
						compareTech(offerOwner, rootId, "Tech");
					</script>
				</div>
			</sec:authorize>
		</sec:authorize>
	</div>
	</div>
</section>
<%@ include file="../jspf/footer.jspf"%>