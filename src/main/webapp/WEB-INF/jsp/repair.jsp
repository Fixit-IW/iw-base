<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="../jspf/header.jspf"%>
<script src="${s}/js/ourFunctions.js"></script>


<section class="probootstrap-cover">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10 col-md-offset-5">
				<div class="about">
					<div class="profile-photo">
						<img src="${s}/img/sapo.png" width="127" height="154" />
					</div>
					<h1>${repair.offer.title}</h1>
				</div>

				<ul class="list-group">
					<li class="list-group-item"><h3>My repair</h3></li>
					<li class="list-group-item"><label>Name: </label><span>
							${user.realFirstName} ${user.realLastName}</span></li>
					<li class="list-group-item"><label>Birthdate: </label><span>
							${user.birthDate}</span></li>
					<li class="list-group-item"><label>DNI: </label><span>
							${user.dni}</span></li>
					<li class="list-group-item"><label>Zipcode: </label><span>
							${user.zipCode}</span></li>

				</ul>

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
			</div>
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
</section>



<%@ include file="../jspf/footer.jspf"%>
