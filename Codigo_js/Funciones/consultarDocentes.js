!(async()=>{
		let tablaDocente = document.getElementById('tablaDeDocentes');
		tablaDocente.innerHTML=`        <div class="spinner-border text-primary" role="status">
          <span class="visually-hidden">Loading...</span>
        </div>`;
		await fetch('/Codigo_php/Modulos/Gestionar_Docente.php')
		.then(res=>res.text())
		.then(res=>tablaDocente.innerHTML=res)
		.catch(err=>tablaDocente.innerHTML='error ');
	})();