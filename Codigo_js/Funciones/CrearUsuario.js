
	let btnCrearUsuario = document.getElementById('formulario-crearUsuario');
	btnCrearUsuario.addEventListener('click',()=>{
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
		fetch('../Codigo_php/Modulos/Gestion_Usuario.php', {
			method: "POST",
			body: datos
		})
    .then(res=>res.text())
    .then(data=>{
      alert(data);
	cosultarUsuarios();
  //navigation.load()
//	navigation.navigate('Pag_3.2.php');
  	
    })
    .catch(err=>alert(err));
        });
        
		
	
