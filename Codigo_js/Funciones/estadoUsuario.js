let activoUsuario = ci =>{
  fetch(`../Codigo_php/Modulos/Gestion_Usuario.php?activarUsuario&ci=${ci}`)
  .then(res=>res.text())
  .then(res=>{
    
  
  cosultarUsuarios()})
  .catch(err=>alert(err));
};
let desactivoUsuario = ci =>{
  fetch(`../Codigo_php/Modulos/Gestion_Usuario.php?desactivarUsuario&ci=${ci}`)
  .then(res=>res.text())
  .then(res=>{
    
    cosultarUsuarios();
    
  })
  .catch(err=>alert(err));
};