let cosultarUsuarios = ()=>{
let contenedor = document.getElementById('usuarios');
contenedor.innerHTML = `<div class="spinner-border text-primary" role="status">
          <span class="visually-hidden">Loading...</span>
        </div>`;
	fetch('/Codigo_php/Modulos/Gestion_Usuario.php')
     	.then(res=>res.text())
     	.then(res=>{
     	  
      alert(res);
  
 
     	  contenedor.innerHTML= res;
     	  
     	})
     	.catch(err=>contenedor.innerHTML ='ubo un error '+ err);
};

cosultarUsuarios();
let insertarDatosUsuario =ci=>{
  fetch(`/Codigo_php/Modulos/Gestion_Usuario.php?ci=${ci}&consultar_usuario_ci`)
     	.then(res=>res.json())
     	.then(res=>{
     let inputs = document.forms.item(1);
     let userDate = res.lista_usuarios[0];
     let campos=[],i=0;
     for(let input of inputs){
       if (input.name != ''){
         campos[i] = input;
         i++;
       }
     }
     campos[0].value = userDate.ceduka;
     campos[1].value = userDate.nombres;
     campos[2].value = userDate.apellidos;
     
     campos[4].value =userDate. id_rol;
     
     
     	})
     	.catch(err=>alert(err));
};

