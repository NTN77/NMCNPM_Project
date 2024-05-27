/**
 * 
 */
function validateEmail(email){
    if (email.length == 0) {
        document.getElementById("error").innerHTML = "* Fill in your personal information";
        document.getElementById("error").style.color = "red";
        document.getElementById("email").style.borderColor = "red";
    } else {
        document.getElementById("error").style.display = "none";
    }
}
function validatePassword(password){
    if (password.length == 0) {
        document.getElementById("error").innerHTML = "* Fill in your personal information";
        document.getElementById("error").style.color = "red";
        document.getElementById("password").style.borderColor = "red";
    } else {
        document.getElementById("error").style.display = "none";
    }
}
function validateRepeatPassword(repeatPassword){
    if (repeatPassword.length == 0) {
        document.getElementById("error").innerHTML = "* Fill in your personal information";
        document.getElementById("error").style.color = "red";
        document.getElementById("repeat-password").style.borderColor = "red";
    } else {
        document.getElementById("error").style.display = "none";
    }
}

function validateName(name){
    if (name.length == 0) {
        document.getElementById("error").innerHTML = "* Fill in your personal information";
        document.getElementById("error").style.color = "red";
        document.getElementById("name").style.borderColor = "red";
    } else {
        document.getElementById("error").style.display = "none";
    }
}

function validateAddress(address){
    if (address.length == 0) {
        document.getElementById("error").innerHTML = "* Fill in your personal information";
        document.getElementById("error").style.color = "red";
        document.getElementById("address").style.borderColor = "red";
    } else {
        document.getElementById("error").style.display = "none";
    }
}

function validatePhone(phone){
    if (phone.length == 0) {
        document.getElementById("error").innerHTML = "* Fill in your personal information";
        document.getElementById("error").style.color = "red";
        document.getElementById("phone").style.borderColor = "red";
    } else if(!(phone.length === 10 && /^\d+$/.test(phone))){
		document.getElementById("error-phone").innerHTML = "Number phone must have 10 digits";
        document.getElementById("error-phone").style.color = "red";
        document.getElementById("error-phone").style.display = "inline";
        document.getElementById("phone").style.borderColor = "red";
	}
    else {
        document.getElementById("error").style.display = "none";
         document.getElementById("error-phone").style.display = "none";
    }
}

function changeEmailBorderColor(){
	document.getElementById("email").style.borderColor = "black";
}

function changePasswordBorderColor(){
	document.getElementById("password").style.borderColor = "black";
}

function changeRepeatPasswordBorderColor(){
	document.getElementById("repeat-password").style.borderColor = "black";
}


function changeNameBorderColor(){
	document.getElementById("name").style.borderColor = "black";
}

function changeAddressBorderColor(){
	document.getElementById("address").style.borderColor = "black";
}

function changePhoneBorderColor(){
	document.getElementById("phone").style.borderColor = "black";
}

function register(event){
	var email = document.getElementById("email").value.trimStart();
	var password = document.getElementById("password").value.trimStart();
	var repeatPassword = document.getElementById("repeat-password").value.trimStart();
	var name = document.getElementById("name").value.trimStart();
	var address = document.getElementById("address").value.trimStart();
	var phone = document.getElementById("phone").value.trimStart();
	if(email.length == 0 || password.length == 0 || repeatPassword.length == 0 || name.length == 0
	|| address.length == 0 || phone.length == 0 || !(phone.length === 10 && /^\d+$/.test(phone))){
		event.preventDefault();
		validateEmail(email);
		validatePassword(password);
		validateRepeatPassword(repeatPassword);
		validateName(name);
		validateAddress(address);
		validatePhone(phone);
		document.getElementById("error").style.display = "inline";
	}
	else{
		document.getElementById("form-register").submit();
	}
}