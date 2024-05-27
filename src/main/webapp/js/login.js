/**
 * 
 */
function validateEmail(email){
    if (email.length == 0) {
        document.getElementById("error").innerHTML = "* Fill in username and password feild";
        document.getElementById("error").style.color = "red";
        document.getElementById("email").style.borderColor = "red";
    } else {
        document.getElementById("error").style.display = "none";
    }
}
function validatePassword(password){
    if (password.length == 0) {
        document.getElementById("error").innerHTML = "* Fill in username and password feild";
        document.getElementById("error").style.color = "red";
        document.getElementById("password").style.borderColor = "red";
    } else {
        document.getElementById("error").style.display = "none";
    }
}
function changeEmailBorderColor(){
	document.getElementById("email").style.borderColor = "black";
}

function changePasswordBorderColor(){
	document.getElementById("password").style.borderColor = "black";
}


function login(event){
	var email = document.getElementById("email").value.trimStart();
	var password = document.getElementById("password").value.trimStart();
	if(document.getElementById("remember-me").checked){
		document.getElementById("hidden").value = "checked";
	}else{
		document.getElementById("hidden").value = "unchecked";
	}
	if(email.length == 0 || password.length == 0){
		validatePassword(password);
		validateEmail(email);
		document.getElementById("error").style.display = "inline";
		event.preventDefault();
	}
	else{
		document.getElementById("form-login").submit();
	}
}