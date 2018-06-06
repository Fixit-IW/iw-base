<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="../jspf/header.jspf"%>
<section class="probootstrap-cover">
	<div class="container">
		<div class="col-md-10 col-md-offset-5">
			<legend>Contact With Us</legend>
			<form action="/sendMessage" method="post">
				<div class="form-group">
					<sec:authorize access="isAnonymous()">
					<div class="form-group">
							<label for="exampleFormControlInput1">Name</label> <input
								type="text" class="form-control" name="name" id="exampleFormControlInput1"
								placeholder="Zangano">
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">Email address</label> <input
								type="email" class="form-control" name="email"
								placeholder="name@example.com">
						</div>
					</sec:authorize>
					<label for="exampleFormControlTextarea1">Example text area</label>
					<textarea class="form-control" name="text"
						id="exampleFormControlTextarea1" rows="3"></textarea>
				</div>
				<input type="submit" name="submit" value="Send Now"
					class="submit btn btn-success"> <input type="hidden"
					name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</div>
	</div>
</section>


</div>

<%@ include file="../jspf/footer.jspf"%>