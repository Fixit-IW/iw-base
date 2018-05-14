<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="../jspf/header.jspf"%>
<section class="probootstrap-cover">
	<div class="container"">
		<div class="row justify-content-center">
			<div class="col-md-10 col-md-offset-5">
				<div class="about">
					<div class="profile-photo">
						<img src="${s}/img/sapo.png" width="127" height="154" />
					</div>
					<h1>
						${user.nickName}
					</h1>
					
					
				</div>

				<ul class="list-group">
					<li class="list-group-item"><h3>My profile</h3></li>
					<li class="list-group-item"><label>Name: </label><span> ${user.realFirstName} ${user.realLastName}</span></li>					
					<li class="list-group-item"><label>Birthdate: </label><span> ${user.birthDate}</span></li>
					<li class="list-group-item"><label>DNI: </label><span> ${user.dni}</span></li>
					<li class="list-group-item"><label>Zipcode: </label><span> ${user.zipCode}</span></li>

				</ul>
			</div>
			<section class=" probootstrap-section-half">
	<div class="container">
		<div class="row">
			<c:forEach items="${user.offers}" var="o">
				<div class="col-md-4 col-sm-6">
					<div class="probootstrap-card probootstrap-listing">
						<div class="probootstrap-card-media">
							 <img src="admin/${u.}" class="img-fluid"> <a
								href="#" class="probootstrap-love"><i class="icon-heart"></i></a> 
						</div>
						<div class="probootstrap-card-text">
							<h2 class="probootstrap-card-heading">
								<a href="#">${o.title}</a>
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
			</c:forEach>
		</div>
	</div>
</section>
			
				<div class="col-md-10 col-md-offset-5">
					<div class="skills-section">
						<h3 class="main-heading">
						My active offers
						</h3>
						<ul class="skills">
							<li>
								<h4>Iphone X screen display fix</h4>
							</li>
							
						</ul>
					</div>
				</div>
			
			</div>
			
			
		</div>
		
		<ul>
		<c:forEach items="${user.offers}" var="v">
			<li>ha ofertado ${v.publisher.id}
		</c:forEach>
		</ul>
		
		
		<ul>
		<c:forEach items="${user.salientes}" var="v">
			<li>ha valorado a ${v.destino.id}
		</c:forEach>
		</ul>

		<ul>
		<c:forEach items="${user.entrantes}" var="v">
			<li>ha sido valorado por ${v.origen.id}
		</c:forEach>
		</ul>

	
</section>

<%@ include file="../jspf/footer.jspf"%>
