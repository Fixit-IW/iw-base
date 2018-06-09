<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<script src="${s}/js/ourFunctions.js"></script>

<%@ include file="../jspf/header.jspf"%>
<section class="probootstrap-cover overflow-hidden">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-12 col-md-offset-5">
				<div class="about">
					<div class="justify-content-center gradient-profile ">
						<img class="img-profile-responsive"
							src="photo/user/${technician.id}" />
					</div>
					<div class="probootstrap_md_py-30">

						<ul class="list-group">
							<li class="list-group-item"><h3>${technician.nickName}'s profile</h3></li>
							
							<li class="list-group-item"><label>Name: </label><span>
									${technician.realFirstName} ${technician.realLastName}</span></li>
							<li class="list-group-item"><label>Zipcode: </label><span>
									${technician.zipCode}</span></li>
							<li class="list-group-item"><label>Skills: </label><span>
									${technician.skills}</span></li>
									<li class="list-group-item"><label>Description: </label><span>
									${technician.technicalDescription}</span></li>
									<li class="list-group-item"><label>Average Rate: </label>
										<body>
											<script>
													var value = "${technician.nota}";
													showStars(value);
													</script>
										</body></li>
					
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../jspf/footer.jspf"%>