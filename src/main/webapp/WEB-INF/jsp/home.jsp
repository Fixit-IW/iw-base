<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<div class="navbar-dark">
<%@ include file="../jspf/header.jspf"%>
</div>


<section class="probootstrap-cover overflow-hidden relative"
	style="background-image: ${s}/img/bg_1.jpg"
	data-stellar-background-ratio="0.5" id="section-home">
	<div class="overlay"></div>

	<div class="container" style="height:100%;">
		<div class="row justify-content-center">
			<div class="col-md-10 col-md-offset-5">
				<div class="probootstrap-home-search probootstrap-animate">
					<form action="/searchOffers" method="get">
						<h2 class="text-center">Search your next dream repair here</h2>
						
						<div class="probootstrap-field-group">
							<div class="probootstrap-fields">
								<div class="search-field">
									<i class="icon icon-location"></i> <input type="text"
										class="form-control"
										name="searchParam"
										placeholder="Introduce dispositivo, avería, ciudad">
								</div>
								<div class="search-category">
									<i class="icon-chevron-down"></i> <select name="offerType" id=""
										class="form-control">
										<option value="Técnico">Técnico</option>
										<option value="Reparar">Reparar</option>
									</select>
								</div>
							</div>
							<button class="btn btn-success" type="submit" >
								<i class="icon-FA t2"></i> Start Search
							</button>
						</div>
						<input
						type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../jspf/authinfo.jspf"%>

<%@ include file="../jspf/footer.jspf"%>