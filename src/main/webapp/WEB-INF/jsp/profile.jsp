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
						${u.nickName}
					</h1>
					
					
				</div>

				<ul class="list-group">
					<li class="list-group-item"><h3>My profile</h3></li>
					<li class="list-group-item"><label>Name: </label><span> ${u.realFirstName} ${u.realLastName}</span></li>					
					<li class="list-group-item"><label>Birthdate: </label><span> 01/12/1997</span></li>
					<li class="list-group-item"><label>DNI: </label><span> ${u.dni}</span></li>
					<li class="list-group-item"><label>Zipcode: </label><span> ${u.zipCode}</span></li>

				</ul>
			</div>
			
			
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
	
</section>

<%@ include file="../jspf/footer.jspf"%>
