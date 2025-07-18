function cambiarTitulo(titulo) {
            const tituloElement = document.getElementById('titulo');
            
            const  parrafoElement = document.getElementById('parrafo');
            
            if (tituloElement) {
                tituloElement.textContent = titulo[0];
                parrafoElement.textContent = titulo[1];
            } else {
                console.error("Elemento con ID 'titulo' no encontrado.");
            }
        }
        
        
function visibleOn(id){
    document.getElementById(id).hidden=false;
}    

function visibleOff(id){
    document.getElementById(id).hidden=true;
}
