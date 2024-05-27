/**
 * 
 */
function validateEmailOffer(email){
    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	if (!emailRegex.test(email)) {
		document.getElementById("email-offer").style.borderColor = "red";
		return false;
	}
	return true;
}

function changeEmailOfferBorderColor(){
	document.getElementById("email-offer").style.borderColor = "black";
}

function registerOffer(event){
	var email = document.getElementById("email-offer").value.trim();
	if(!validateEmailOffer(email)){
		event.preventDefault();
	}
	else{
		document.getElementById("register-offer").submit();
	}
}