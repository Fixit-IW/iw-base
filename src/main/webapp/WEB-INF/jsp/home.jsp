<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<div class="navbar-dark">
<%@ include file="../jspf/header.jspf"%>
</div>


<section class="probootstrap-cover overflow-hidden cover-home1">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10 col-md-offset-5">
			<h2 class="text-center probootstrap_m-1 probootstrap_font-40">Search your next dream repair here</h2>
				<div class="probootstrap-home-search probootstrap-animate">
					<form action="/searchOffers" method="get">	
						<div class="probootstrap-field-group">
							<div class="probootstrap-fields">
								<div class="search-field">
									<i class="ion-settings probootstrap_px-8"></i><input type="text"
										class="form-control"
										name="searchParam"
										placeholder="Introduce dispositivo, avería, ciudad">
								</div>
								<div class="search-category">
									 <select class="custom-select" name="offerType">
										<option value="Técnico">Técnico </option>
										<option value="Reparar">Reparar</option>
									</select>
								</div>
							</div>
							<button class="btn btn-success" type="submit" >
								<i class="ion-ios-search-strong t2"></i> Start Search
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
<%@ include file="../jspf/footer.jspf"%>