
	let editarUsuario=idForm=>{
		let i = 0;
		let datos = new FormData();
		
		while(i < document.forms.item(idForm).length){
			if(document.forms.item(idForm)[i].name == ""){	
	   i++;
	continue;
	} 
			datos.append(document.forms.item(idForm)[i].name,document.forms.item(idForm)[i].value);
	//		alert(document.forms.item(idForm)[i].name);
	//		alert(document.forms.item(idForm)[i].value);
			i++;
		}
		fetch('/Codigo_php/Modulos/Gestion_Usuario.php', {
			method: "POST",
			body: datos
		})
    .then(res=>res.text())
    .then(data=>{
	document.getElementById('mesajesDelServidor').innerHTML = data;
	cosultarUsuarios();
  	
    })
    .catch(err=>document.getElementById('mesajesDelServidor').innerHTML =err);
     };
        
		
	
