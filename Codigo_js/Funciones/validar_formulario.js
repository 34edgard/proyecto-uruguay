
let formularioValido = datos=>{
	let i= 0;
	let dato  = "";
	while(datos[i]){
		dato = datos[i].value.trim();
		if(dato == ""){
			datos[i].classList.add('is-invalid');
		return false;
		}else datos[i].classList.remove('is-invalid');
		
		if(dato.includes('-') || dato.includes('|') || dato.includes('&') || dato.includes('=')){
			
			datos[i].classList.add('is-invalid');
		return false;
		}else datos[i].classList.remove('is-invalid');
		i++;
	}
	
	return true;
};