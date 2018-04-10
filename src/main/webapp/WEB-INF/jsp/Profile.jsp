<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="../jspf/header.jspf"%>
<section class="probootstrap-cover">
<div id="container">
	<div id="content">
		<div class="menu">
			<ul class="tabs">
				<li><a href="#profile" class="profile-tab">Profile</a></li>
				<li><a href="#resume" class="resume-tab">Resume</a></li>
				<li><a href="#portfolio" class="portfolio-tab">Portfolio</a></li>
				<li><a href="#connect" class="connect-tab">Connect</a></li>
			</ul>
		</div>
		<div id="profile">
			<div class="about">
				<div class="profile-photo">
					<img src="images/profile-picture.png" width="127" height="154" />
				</div>
				<h1><sec:authentication property="principal.username" /> </h1>
				<h3>
					<i>Web Designer/Video Editor</i>
				</h3>
				<p>is a web, graphic and video enthusiast based in Kansas City,
					Missouri, USA. Have a passion for designing detailed, creative and
					modern websites & graphics.</p>
			</div>
			<ul class="list-group">
				<li class="list-group-item"><h3>BASIC INFO</h3></li>
				<li class="list-group-item"><label>Name</label><span>${u.nickName}</span></li>
				<li class="list-group-item"><label>Birthdate</label><span>${u.dni}</span></li>
				<li class="list-group-item"><label>Address</label><span>Kansas City, Missouri</span></li>
				<li class="list-group-item"><label>Zipcode</label><span>${u.dni}</span></li>
				<li class="list-group-item"><label>Website</label><span>www.website.com</span></li>
			</ul>
		</div>
		<div id="resume">
			<div class="resume-section">
				<h3 class="main-heading">Educational Background</h3>
				<ul class="date">
					<li>
						<div class="date-box">
							<h4>
								Crest High School<span class="date-range">2003 - 2007</span>
							</h4>
							<h5>Effingham, Kansas City, Missouri</h5>
						</div>
					</li>
					<li>
						<div class="date-box">
							<h4>
								Emporia State University<span class="date-range">2007 -
									2011</span>
							</h4>
							<h5>Emporia, Missouri</h5>
						</div>
					</li>
					<div class="clear"></div>
				</ul>
				<h3 class="main-heading">Employment History</h3>
				<ul class="date">
					<li>
						<div class="date-box">
							<h4>
								EGG Graphic Design<span class="date-range">2011 - 2012</span>
							</h4>
							<h5>Kansas City, Missouri</h5>
						</div>
					</li>
					<li>
						<div class="date-box">
							<h4>
								Creative Design Mind<span class="date-range">2012 - 2013</span>
							</h4>
							<h5>New York City, USA</h5>
						</div>
					</li>
				</ul>
			</div>
			<div class="skills-section">
				<h3 class="main-heading">
					<span>Technical Skills</span>
				</h3>
				<ul class="skills">
					<li>
						<h4>* Graphic Design</h4>
					</li>
					<li>
						<h4>* Wordpress</h4>
					</li>
					<li>
						<h4>* Creative Writing</h4>
					</li>
					<li>
						<h4>* Flash Dev.</h4>
					</li>
				</ul>
			</div>
		</div>
		<div id="portfolio">
			<div class="heading">My Latest Projects</div>
			<ul id="portfolios">
				<li><a href="#"> <img
						src="images/portfolio-image-thumb.png">
						<h2 class="portfolio-title">Website 1</h2> <span class="desc">E-commerce
							Site</span>
				</a></li>
				<li><a href="#"> <img
						src="images/portfolio-image-thumb.png">
						<h2 class="portfolio-title">Website 2</h2> <span class="desc">Dating
							Site</span>
				</a></li>
				<li><a href="#"> <img
						src="images/portfolio-image-thumb.png">
						<h2 class="portfolio-title">Website 3</h2> <span class="desc">Social
							Site</span>
				</a></li>
				<li><a href="#"> <img
						src="images/portfolio-image-thumb.png">
						<h2 class="portfolio-title">Movie FX</h2> <span class="desc">Short
							Film Intro</span>
				</a></li>
			</ul>
		</div>
		<div id="connect">
			<div class="contact-form">
				<h3 class="main-heading">
					<span>Connect With Us</span>
				</h3>
				<form action="" id="connectform">
					<p>
						<label for="name">Name</label> <input type="text" name="name"
							class="input">
					</p>
					<p>
						<label for="email">Email</label> <input type="text" name="email"
							class="input">
					</p>
					<p>
						<label for="message">Message</label>
						<textarea name="message" cols="50" rows="6" class="textarea"></textarea>
					</p>
					<input type="submit" name="submit" value="Send Now" class="submit">
				</form>
			</div>
		</div>
	</div>
</div>
</section>

<%@ include file="../jspf/footer.jspf"%>