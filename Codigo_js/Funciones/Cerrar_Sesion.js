let cerrar_sesion = document.getElementById('cerrarSesion');

cerrar_sesion.addEventListener('click',()=>{
	fetch('../Codigo_php/Modulos/Gestion_Sesion.php?cerrar_sesion=true')
	.then(res=>res.text())
	.then(res=>navigation.reload())
	.catch(err=>alert(err));
});