let cosultarUsuarios = async()=>{
let contenedor = document.getElementById('usuarios');
contenedor.innerHTML = `<div class="spinner-border text-primary" role="status">
          <span class="visually-hidden">Loading...</span>
        </div>`;
await	fetch('/Codigo_php/Modulos/Gestion_Usuario.php')
     	.then(res=>res.json())
     	.then(res=>{
     	  
    //  alert(res);
    //   return
     	  let resul = '',usuarioEstado='',estado='';
 for(let usuario of res.lista_usuarios){
     
      
  
      if(usuario.estado == 'activo'){
        usuarioEstado = 'desactivo';
        estado = 'success';
      }else{
        usuarioEstado = 'activo';
        
        estado = 'secondary';
      }
     resul +=  `<tr>
          <td>${usuario.ci}</td>
          <td>${usuario.nombre}</td>
          <td>${usuario.apellido}</td>
          <td>${usuario.id_rol}</td>
          <td><button class='btn btn-${estado}'  onclick="${usuarioEstado}Usuario(${usuario.ci})">${usuario.estado}</button></td>
      <td><button class='btn btn-warning' data-bs-toggle='modal' data-bs-target='#firefoxModal' onclick="insertarDatosUsuario(${usuario.ci})">editar</button></td>`;
          
     if(res.rol ==1){
  resul +=  `<td><button class='btn btn-danger' onclick="eliminarUsuario(${usuario.ci})">eliminar</button></td>`;
    }
     resul += "</tr>";
    }
     	  
     	  contenedor.innerHTML= resul;
     	  
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
     campos[0].value = userDate.ci;
     campos[1].value = userDate.nombre;
     campos[2].value = userDate.apellido;
     
     campos[4].value =userDate. id_rol;
     
     
     	})
     	.catch(err=>alert(err));
};

