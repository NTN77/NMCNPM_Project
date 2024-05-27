/**
 * 
 */
function decreaseValue(id) {
	  var inputs = document.getElementsByClassName("number-input");
	  for (var i = 0; i < inputs.length; i++) {
	    var input = inputs[i];
	    var productId = input.getAttribute("data-product-id");
	    var value = parseInt(input.value);
	    if (value > 1 && id == parseInt(productId)) {
	      input.value = value - 1;
	    }
	  }
	}

	function increaseValue(id) {
	  var inputs = document.getElementsByClassName("number-input");
	  for (var i = 0; i < inputs.length; i++) {
	    var input = inputs[i];
	    var productId = input.getAttribute("data-product-id");
	    var value = parseInt(input.value);
	    if (id == parseInt(productId)) {
	      input.value = value + 1;
	    }
	  }
	}
	
	function getStepperValues() {
		var resultString = "";
		var inputQuantity = document.getElementById("quantity");
		var inputs = document.querySelectorAll('.number-input');
		var values = [];
		inputs.forEach(function(input) {
		    var productId = input.dataset.productId;
		    var quantity = parseInt(input.value);
		    values.push({ productId: productId, quantity: quantity });
		});
		  
		for(var i = 0; i < values.length; i++){
			var productID = values[i].productId;
			var quantity = values[i].quantity;
			resultString += productID + ":" + quantity + ",";
		}
		
		if(resultString.endsWith(",")){
			resultString = resultString.slice(0, -1);
		}
		inputQuantity.value = resultString;
		}
	
	function submitForm(event) {
		  event.preventDefault();
		  getStepperValues();
		  document.getElementById("formsubmit").submit();
		}