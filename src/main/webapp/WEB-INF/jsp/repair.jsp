<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="../jspf/header.jspf"%>
<script src="${s}/js/ourFunctions.js"></script>

<div class="container justify-content-center"
	style="padding: 4em; align-items: center; margin-top: 7em;">
	<div class="col-md-12">
		<div class="progress" style="height: 20px;">
			<div class="progress-bar bg-success" role="progressbar"
				style="height: 20px; width: 20%" aria-valuenow="15"
				aria-valuemin="0" aria-valuemax="100">Accepted</div>
			<div class="progress-bar" id="in_proccessP" role="progressbar"
				style="height: 20px; width: 20%" aria-valuenow="0" aria-valuemin="0"
				aria-valuemax="100">In process</div>
			<div class="progress-bar" id="finishedP" role="progressbar"
				style="height: 20px; width: 20%" aria-valuenow="0" aria-valuemin="0"
				aria-valuemax="100">Finished</div>
			<div class="progress-bar" id="deliveredP" role="progressbar"
				style="height: 20px; width: 20%" aria-valuenow="0" aria-valuemin="0"
				aria-valuemax="100">Sent</div>
			<div class="progress-bar" id="sent" role="progressbar"
				style="height: 20px; width: 20%" aria-valuenow="0" aria-valuemin="0"
				aria-valuemax="100">Delivered</div>

		</div>
	</div>
</div>
<section class="probootstrap-cover probootstrap_p-0">
	<div class="container">
		<div class="probootstrap_p-0 row justify-content-center">
			<div id="panel1" class="col-md-8">
				<div class="panel panel-default panel--styled">
					<div class="panel-body">
						<div class="row panelTop">
							<div class="col-md-4">
								<img class="img-responsive" src="photo/offer/${repair.offer.id}"
									alt="" />
							</div>
							<div class="col-md-8 probootstrap_p-15">
								<h3 class="probootstrap_text-green">${repair.offer.title}</h3>
								<div class="probootstrap-listing-category for-sale">
									${repair.offer.device}</div>
								<p class="probootstrap_text-gray-400">${repair.offer.description}</p>
							</div>
						</div>
						<div class="row panelBottom probootstrap_m-0">
							<div class="col-md-4 text-left">
								<h5 class="probootstrap_m-0">
									Price <span class="itemPrice">${repair.price}</span>
								</h5>
								Date: ${repair.initDate}
							</div>
							<div class="col-md-4 justify-content-center">
								Client: <img src="photo/user/${repair.publisher.id}"
									class="img-mini" />
								<h3
									class="probootstrap_font-14 probootstrap_font-regular probootstrap-card-heading">${repair.publisher.realFirstName}
									${repair.publisher.realLastName}</h3>
							</div>
							<div class="col-md-4 justify-content-center">
								Technician <img src="photo/user/${repair.technician.id}"
									class="img-mini" />
								<h3
									class="probootstrap_font-14 probootstrap_font-regular probootstrap-card-heading">${repair.technician.realFirstName}
									${repair.technician.realLastName}</h3>
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

			<div id="Tech"
				class="col-md-3 text-center justify-content-center panel panel-default panel--styled">
				<form action="/changeState" method="post">
					<input type="hidden" name="idRepair" value="${repair.id}" />
					<sec:authorize access="isAuthenticated()">
						<sec:authorize access="hasRole('TECHNICIAN')">
							<div>Change State</div>
							<div class="form-check" id="in_proccess">
								<button type="submit" class="btn btn-success">In
									process</button>
							</div>
							<div class="form-check" id="finished">
								<button type="submit" class="btn btn-success">Finish</button>
							</div>
							<div class="form-check" id="delivered">
								<button type="submit" class="btn btn-success">Deliver</button>
							</div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<body>
								<script>
										var value = "${stringState}";
										showTechnicianButtons(value);
									</script>
							</body>
						</sec:authorize>
					</sec:authorize>
				</form>

				<form action="/confirmDelivery" method="post">
					<input type="hidden" name="idRepair" value="${repair.id}" />
					<sec:authorize access="isAuthenticated()">
						<sec:authorize access="hasRole('USER')">
							<div>Delivery State</div>
							<div class="form-check" id="confirm" style="display: none">
								<button type="button" onClick="showRatingForm()"
									class="btn btn-success">Delivered?</button>
							</div>
							<div id="ratingForm" style="display: none">
								<label for="device">Valorate</label> <select name="rate">
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
								<div class="form-actions">
									<button type="submit" class="btn btn-primary">Confirm
										Delivery</button>
								</div>
							</div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<body>
								<script>
									var value = "${stringState}";
									showUserButtons(value);
								</script>
							</body>
						</sec:authorize>
					</sec:authorize>
				</form>
			</div>
		</div>
	</div>
</section>




<%@ include file="../jspf/footer.jspf"%>
