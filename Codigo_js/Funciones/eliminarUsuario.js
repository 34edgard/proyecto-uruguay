let eliminarUsuario= ci=>{
  if(confirm('desea eliminar al usiario' + ci)){
    
  fetch(`../Codigo_php/Modulos/Gestion_Usuario.php?ci=${ci}&eliminarUsuario`)
  .then(res=>res.text())
  .then(res=>cosultarUsuarios())
  .catch(err=>alert(err));
  }
  
};