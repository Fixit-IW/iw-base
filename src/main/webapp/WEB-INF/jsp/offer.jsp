<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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
							<h3>${offer.title}</h3>
							<div class="probootstrap-listing-category for-sale">
								${offer.device}</div>
							<p class="probootstrap_text-gray-400">${offer.description}</p>
						</div>
					</div>
					<div class="col-md-4 panelBottom">
						<div class="col-md-4 text-left">
							<h5>
								Date <span class="itemPrice">${offer.date}</span>
							</h5>
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
				<div class="col-md-3 text-center">
					<div class="form-check">
						<button type="button" class="btn btn-success" id="offer_button"
							onclick="showOfferForm()">Accept?</button>
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
									class="form-control" type="text" placeholder="Estimated time"
									name="duration" required />
							</div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="form-actions">
								<button type="submit" class="btn btn-success">Send</button>
							</div>
						</form>
					</div>
				</div>
			</sec:authorize>
		</sec:authorize>
	</div>
	</div>
</section>
<script src="${s}/js/ourFunctions.js"></script>
<%@ include file="../jspf/footer.jspf"%>
