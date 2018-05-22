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

				<h1>Admin</h1>
				<p class="lead">Información muy confidencial</p>

				<hr />



				<hr />

				<c:forEach items="${search}" var="o">
					<a href="offer?id=${o.id}">
						<div class="col-md-4 col-sm-6">
							<div class="probootstrap-card probootstrap-listing">
								<div class="probootstrap-card-media">
								</div>
								<div class="probootstrap-card-text">
									<h2 class="probootstrap-card-heading">
										<span>${o.title}</span>
									</h2>
									<div class="probootstrap-listing-location">
										<span>${o.device}</span>
									</div>
									<div class="probootstrap-listing-location">
										<span>${o.date}</span>
									</div>
								</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
	</div>
</section>


<%@ include file="../jspf/authinfo.jspf"%>
</div>

<%@ include file="../jspf/footer.jspf"%>