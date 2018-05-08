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