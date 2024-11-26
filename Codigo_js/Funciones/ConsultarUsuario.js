let cosultarUsuarios = async()=>{
let contenedor = document.getElementById('usuarios');
contenedor.innerHTML = `<div class="spinner-border text-primary" role="status">
          <span class="visually-hidden">Loading...</span>
        </div>`;
await	fetch('../Codigo_php/Modulos/Gestion_Usuario.php')
     	.then(res=>res.json())
     	.then(res=>{
     	  let resul = '',usuarioEstado='',estado='';
 for(let usuario of res.lista_usuarios){
   
      if(usuario[4] == 'activo'){
        usuarioEstado = 'desactivo';
        estado = 'success';
      }else{
        usuarioEstado = 'activo';
        
        estado = 'secondary';
      }
     resul +=  `<tr>
          <td>${usuario[0]}</td>
          <td>${usuario[1]}</td>
          <td>${usuario[2]}</td>
          <td>${usuario[3]}</td>
          <td><button class='btn btn-${estado}'  onclick="${usuarioEstado}Usuario(${usuario[0]})">${usuario[4]}</button></td>
      <td><button class='btn btn-warning' data-bs-toggle='modal' data-bs-target='#firefoxModal' onclick="insertarDatosUsuario(${usuario[0]})">editar</button></td>`;
          
     if(res.rol ==1){
  resul +=  `<td><button class='btn btn-danger' onclick="eliminarUsuario(${usuario[0]})">eliminar</button></td>`;
    }
     resul += "</tr>";
    }
     	  
     	  contenedor.innerHTML= resul;
     	  
     	})
     	.catch(err=>contenedor.innerHTML ='ubo un error '+ err);
};

cosultarUsuarios();
let insertarDatosUsuario =ci=>{
  fetch(`../Codigo_php/Modulos/Gestion_Usuario.php?ci=${ci}&consultar_usuario_ci`)
     	.then(res=>res.json())
     	.then(res=>{
     for (let usuario of res.lista_usuarios){
      
         let i= 0;
    for(let input of document.forms.item(1)){
      if(input.name != ''){
        
   input.value = usuario[i];
   i++;
      }
    
       }
     }
     	})
     	.catch(err=>alert(err));
};

