let activoUsuario = ci =>{
  fetch(`/Codigo_php/Modulos/Gestion_Usuario.php?activarUsuario&ci=${ci}`)
  .then(res=>res.text())
  .then(res=>{
    
//  alert(res);
  cosultarUsuarios()})
  .catch(err=>alert(err));
};
let desactivoUsuario = ci =>{
  let url = `/Codigo_php/Modulos/Gestion_Usuario.php?desactivarUsuario&ci=${ci}`;
  
  fetch(url)
  .then(res=>res.text())
  .then(res=>{
  //alert(res);
    
    cosultarUsuarios();
    
  })
  .catch(err=>alert(err));
};