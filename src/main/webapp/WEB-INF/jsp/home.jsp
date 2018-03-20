<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="../jspf/header.jspf"%>

<div class="starter-template">
	<h1>Home</h1>

  <section class="probootstrap-slider flexslider">
	<div class="probootstrap-wrap-banner">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="probootstrap-home-search probootstrap-animate">
						<form action="" method="post">
						
							<h2 class="heading">Deja tu dispositivo mascadito</h2>
							<div class="probootstrap-field-group">
								<div class="probootstrap-fields">
								
									<div class="search-field">
										<i class="icon-location2"></i> <input type="text"
											class="form-control"
											placeholder="Introduce dispositivo, avería, ciudad">
									</div>
									<div class="search-category">
										<i class="icon-chevron-down"></i> <select name="#" id=""
											class="form-control">
											<option value="">Técnico</option>
											<option value="">Cliente</option>
										</select>
									</div>
								</div>
								<button class="btn btn-success" type="submit">
									<i class="icon-magnifying-glass t2"></i> Start Search
								</button>
							</div>
						</form>
						
					</div>

				</div>
			</div>
		</div>
	</div>
	<ul class="slides">
		<li style="background-image: url(${s}/img/slider_1.jpg);" class="overlay"></li>
		<li style="background-image: url(${s}/img/slider_4.jpg);" class="overlay"></li>
		<li style="background-image: url(${s}/img/slider_2.jpg);" class="overlay"></li>
	</ul>
</section>
  <script src="${s}/js/js/scripts.min.js"></script>
  <script src="${s}/js/js/main.min.js"></script>
  <script src="${s}/js/js/custom.js"></script>

	<%@ include file="../jspf/authinfo.jspf"%>
</div>
<section class="probootstrap-slider flexslider">
<%@ include file="../jspf/footer.jspf"%>
