<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="../jspf/header.jspf"%>
<section class="probootstrap-cover">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10 col-md-offset-5">
				<div class="about">
					<div class="profile-photo">
						<img src="${s}/img/sapo.png" width="127" height="154" />
					</div>
					<h1>${offer.title}</h1>
					<img class="photo" src="photo/offer/${offer.id}" />
					<sec:authorize access="isAuthenticated()">
						<sec:authorize access="hasRole('TECHNICIAN')">
							<div class="form-check">
								<button type="button" class="btn btn-success" id="offer_button"
									onclick="showOfferForm()">Accept?</button>
							</div>
						</sec:authorize>
					</sec:authorize>

					<div id="offer_form" style="display: none">
						<form action="/addNegociacion" method="post">
							<input type="hidden" name="idOffer" value="${offer.id}" />
							<div class="form-group">
								<label for="technicalDescription">Estimated Price </label> <input
									class="form-control" type="number"
									placeholder="Estimated price €" name="price" />

							</div>
							<div class="form-group">
								<label for="skills">Estimated Time </label> <input
									class="form-control" type="text" placeholder="Estimated time (days)"
									name="duration" />
							</div>


							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="form-actions">
								<button type="submit" class="btn btn-success">Send</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script src="${s}/js/ourFunctions.js"></script>
<%@ include file="../jspf/footer.jspf"%>
