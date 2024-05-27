/**
 * 
 */
function validateName(name){
    if (name.length == 0) {
        document.getElementById("error").innerHTML = "* Fill in your personal information";
        document.getElementById("error").style.color = "red";
        document.getElementById("customer-name").style.borderColor = "red";
    } else {
        document.getElementById("error").style.display = "none";
    }
}
function validateAddress(address){
    if (address.length == 0) {
        document.getElementById("error").innerHTML = "* Fill in your personal information";
        document.getElementById("error").style.color = "red";
        document.getElementById("customer-address").style.borderColor = "red";
    } else {
        document.getElementById("error").style.display = "none";
    }
}

function validateNumberphone(numberphone){
    if (numberphone.length == 0) {
        document.getElementById("error").innerHTML = "* Fill in your personal information";
        document.getElementById("error").style.color = "red";
        document.getElementById("number-phone").style.borderColor = "red";
    } 
    else if(!(numberphone.length === 10 && /^\d+$/.test(numberphone))){
		document.getElementById("error-phone").innerHTML = "Number phone must have 10 digits";
        document.getElementById("error-phone").style.color = "red";
        document.getElementById("error-phone").style.display = "inline";
        document.getElementById("number-phone").style.borderColor = "red";
	}
    else {
        document.getElementById("error-phone").style.display = "none";
    }
}

function changeNameBorderColor(){
	document.getElementById("customer-name").style.borderColor = "black";
}

function changeAddressBorderColor(){
	document.getElementById("customer-address").style.borderColor = "black";
}

function changeNumberphoneBorderColor(){
	document.getElementById("number-phone").style.borderColor = "black";
}

function order(event){
	var name = document.getElementById("customer-name").value.trimStart();
	var address = document.getElementById("customer-address").value.trimStart();
	var numberphone = document.getElementById("number-phone").value.trimStart();
	if(name.length == 0 || address.length == 0 || numberphone.length == 0 || !(numberphone.length === 10 && /^\d+$/.test(numberphone))){
		event.preventDefault();
		validateName(name);
		validateAddress(address);
		validateNumberphone(numberphone);
		document.getElementById("error").style.display = "inline";
	}
	else{
		document.getElementById("form-order").submit();
	}
}