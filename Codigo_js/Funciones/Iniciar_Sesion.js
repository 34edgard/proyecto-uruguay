
	let usu = document.getElementById('cedula');
	let pass = document.getElementById('contraseña');
	
	let caja = document.getElementById('caja');
	let btn = document.getElementById('enviar');
let pedirDatos = ()=> {
		if(!formularioValido([usu,pass])) return;
		let nuevaData = new FormData();
		
		nuevaData.append('contraseña',pass.value);
		nuevaData.append('cedula',usu.value);
		nuevaData.append('Inicio_secion',btn.value);
			
		caja.innerHTML =`        <div class="spinner-border text-primary" role="status">
          <span class="visually-hidden">Loading...</span>
        </div>`;
		fetch('/Codigo_php/Modulos/Gestion_Sesion.php', {
			method: "POST",
			body: nuevaData
		})
		.then(res => res.json())
		.then(res =>{
	//	  caja.innerHTML= res;
	
	//	caja.innerHTML =res;
	//		return;
			if(!res.error){
			  navigation.navigate('/Publico/Paginas/pag_1.php');
			//caja.innerHTML =res.data;
			  return;
			}
			caja.innerHTML =res.data;
			usu.value ="";
			pass.value ="";
			
		})
		.catch(err => caja.innerHTML = '<p class="text-center text-danger" >a ocurrido un error al conectar con el servidor</p>'+err);
	};
	btn.addEventListener('click', pedirDatos
	);

