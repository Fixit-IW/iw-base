function myFunction() {
  // Get the checkbox
  var checkBox = document.getElementById("roles");
  // Get the output text
  var text = document.getElementById("tecnico");
  // If the checkbox is checked, display the output text
  if (checkBox.checked == true){
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
function showOfferForm(){
	var button = document.getElementById("offer_button");
	button.style.display = "none";
	var form = document.getElementById("offer_form");
	form.style.display = "block";
}

function changeState(id){
	var divInProccess = document.getElementById("in_proccess");
	var divFinished = document.getElementById("finished");
	var divDelivered = document.getElementById("delivered");
	
	if (id == "ACCEPTED"){
		
		divInProccess.style.display ="block";
		divFinished.style.display ="none";
		divDelivered.style.display ="none";
		
	}else if(id == "INPROCCESS"){
		divFinished.style.display ="block";
		divInProccess.style.display ="none";
		divDelivered.style.display ="none";
	}
	else{
		
		divDelivered.style.display ="block";
		divInProccess.style.display ="none";
		divFinished.style.display ="none";
	}
	
	
	
}