
	let crearDocente = document.getElementById('crearDocente');
	crearDocente.addEventListener('click',()=>{
		let mensaje = document.getElementById('mensaje');
		mensaje.innerHTML= `<div class="spinner-border text-primary" role="status">
          <span class="visually-hidden">Loading...</span>
        </div>`;
		let i = 0;
		let datos = new FormData();
		
		while(i < document.forms.item(0).length){
			if(document.forms.item(0)[i].name == ""){	
	   i++;
	continue;
	} 
			datos.append(document.forms.item(0)[i].name,document.forms.item(0)[i].value);
			
			i++;
		}
		fetch('../Codigo_php/Modulos/Gestionar_Docente.php', {
			method: "POST",
			body: datos
		})
    .then(res=>res.text())
    .then(data=>{
	mensaje.innerHTML= data;
  consultarDatosDeDocente();
	
    })
    .catch(err=>alert(err));
        });
        
		
	
