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
			<form>
				<div class="form-group">
					<label for="exampleFormControlInput1">Email address</label> <input
						type="email" class="form-control" id="exampleFormControlInput1"
						placeholder="name@example.com">
				</div>

				<div class="form-group">
					<label for="exampleFormControlTextarea1">Example text area</label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="3"></textarea>
				</div>
				<input type="submit" name="submit" value="Send Now"
								class="submit btn btn-success">
			</form>
		</div>
	</div>
</section>


</div>

<%@ include file="../jspf/footer.jspf"%>