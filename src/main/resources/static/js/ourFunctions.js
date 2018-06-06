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

	if (id == "DELIVERED") {
		divRatingButton.style.display = "block";
	} else {
		divRatingButton.style.display = "none";
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
