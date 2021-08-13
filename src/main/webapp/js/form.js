window.addEventListener("load", function() {
	const inputDDDTelefone1 = document.querySelector("#dddTelefone1");
	inputDDDTelefone1.addEventListener("keypress", function(e){
		const keyCode = e.keyCode;
		if((keyCode < 48 || keyCode > 57 ) && (keyCode != 8 && keyCode != 9)){
			e.preventDefault();
		}
	});
	
	const inputDDDTelefone2 = document.querySelector("#dddTelefone2");
	inputDDDTelefone2.addEventListener("keypress", function(e){
		const keyCode = e.keyCode;
		if((keyCode < 48 || keyCode > 57 ) && (keyCode != 8 && keyCode != 9)){
			e.preventDefault();
		}
	});
	const inputnumeroTelefone1 = document.querySelector("#numeroTelefone1");
	inputnumeroTelefone1.addEventListener("keypress", function(e){
		const keyCode = e.keyCode;
		if((keyCode < 48 || keyCode > 57 ) && (keyCode != 8 && keyCode != 9)){
			e.preventDefault();
		}
	});
	const inputnumeroTelefone2 = document.querySelector("#numeroTelefone2");
	inputnumeroTelefone2.addEventListener("keypress", function(e){
		const keyCode = e.keyCode;
		if((keyCode < 48 || keyCode > 57 ) && (keyCode != 8 && keyCode != 9)){
			e.preventDefault();
		}
	});
});