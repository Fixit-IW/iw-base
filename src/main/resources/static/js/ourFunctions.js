function myFunction() {
	// Get the checkbox
	var checkBox = document.getElementById("roles");
	// Get the output text
	var text = document.getElementById("tecnico");
	// If the checkbox is checked, display the output text
	if (checkBox.checked == true) {
		text.style.display = "block";
	} else {
		text.style.display = "none";
	}
}

function showClientOffer() {
	// Get the output text
	var text = document.getElementById("client_offer");
	text.style.display = "block";
}

function showTechnicianOffer() {
	// Get the output text
	var text = document.getElementById("technician_offer");
	text.style.display = "block";
}
function showOfferForm() {
	var button = document.getElementById("offer_button");
	button.style.display = "none";
	var form = document.getElementById("offer_form");
	form.style.display = "block";
}

function showTechnicianButtons(id) {
	var divInProccess = document.getElementById("in_proccess");
	var divFinished = document.getElementById("finished");
	var divDelivered = document.getElementById("delivered");
	
	botones(id);

	if (id == "ACCEPTED") {
		divInProccess.style.display = "block";
		divFinished.style.display = "none";
		divDelivered.style.display = "none";
	} else if (id == "INPROCCESS") {
		divFinished.style.display = "block";
		divInProccess.style.display = "none";
		divDelivered.style.display = "none";
	} else if (id == "FINISHED") {
		divDelivered.style.display = "block";
		divInProccess.style.display = "none";
		divFinished.style.display = "none";
	} else {
		divDelivered.style.display = "none";
		divInProccess.style.display = "none";
		divFinished.style.display = "none";
	}
}

function showUserButtons(id) {
	var divRatingButton = document.getElementById("confirm");
	botones(id);
	if (id == "DELIVERED") {
		divRatingButton.style.display = "block";
	} else {
		divRatingButton.style.display = "none";
	}

}
function botones(id){

	var InProccess = document.getElementById("in_proccessP");
	var Finished = document.getElementById("finishedP");
	var Delivered = document.getElementById("deliveredP");
	var sent= document.getElementById("sent");
	var tech = document.getElementById("Tech");
	var div = document.getElementById("panel1");
	if(id=="ACCEPTED"){
		
	}
	else if (id == "INPROCCESS") {
		InProccess.classList.add("bg-success");
	} else if (id == "FINISHED") {
		InProccess.classList.add("bg-success");
		Finished.classList.add("bg-success");
	}else if (id == "DELIVERED"){
		InProccess.classList.add("bg-success");
		Finished.classList.add("bg-success");
		Delivered.classList.add("bg-success");
	}
	else{
		tech.style.display="none";
		div.classList.remove("col-md-8");
		div.classList.add("col-md-10");
		InProccess.classList.add("bg-success");
		Finished.classList.add("bg-success");
		sent.classList.add("bg-success");
		Delivered.classList.add("bg-success");
	}
}

function showRatingForm() {
	var divButton = document.getElementById("confirm");
	var divForm = document.getElementById("ratingForm");

	divButton.style.display = "none";
	divForm.style.display = "block";

}
function show(id){
	var div = document.getElementById(id);
	if(div.style.display =="none"){
		div.style.display = "table";
	} else {
		div.style.display = "none";
	}
}
function compareTech(id1, id2, div_){
	console.log(id1 + "  " + id2);
	var div = document.getElementById(div_);
	if(id1 == id2)
		div.style.display = "none";
}
function showEditForm(){
	var profile = document.getElementById("profile");
	var editForm = document.getElementById("editForm");	
	profile.style.display = "none";
	editForm.style.display = "block";
}
function showStars(nota){
	var i;
	for ( i = 0 ; i < 5 ; i++){
		if(nota > i)
			document.write('<i  class="ion-android-star"></i>' );
		else
			document.write('<i  class="ion-android-star-outline"></i>');
	}
}
