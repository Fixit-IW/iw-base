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
				<h1>Make Offer</h1>					
					<div >
						<form action="/addOffer" method="post">
					<div class="form-group">
						<label for="offerTitle">Repair title </label> <input class="form-control"
							name="offerTitle" />
					</div>
					<div class="form-group"> <!-- hacer que salga nuestro despegable -->
						<label for="device" >Type</label> 
						<select name="device">
					    <option value="0">Mobile</option>
					    <option value="1">Iphone</option>
					    <option value="2">Laptop</option>
					    <option value="3">PC</option>
					    <option value="4">Mac</option>
					    <option value="5">Macbook</option>
					    <option value="6">Headphones</option>
					    <option value="7">Monitor</option>
					    <option value="8">Mouse</option>
					    <option value="9">Keyboard</option>
					    <option value="10">Others</option>
					     </select>
					</div>
					
					<div class="form-group">
						<label for="description">Description</label>
						 <textarea class="form-control" name="description"
						rows="3"></textarea>
					</div>
					
					<div class="form-group">
					<label for="photos">Photos</label>
					<input type="file" name="photos"/>
					<div> <input
						name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
					</div>
					</div>
					
					</div>
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">Post Offer</button>
					</div>
					<input
						type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
				<hr />
				</div>

				
			</div>
		</div>
</section>

<%@ include file="../jspf/footer.jspf"%>