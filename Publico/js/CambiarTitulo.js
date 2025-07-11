function cambiarTitulo(titulo) {
            const tituloElement = document.getElementById('titulo');
            if (tituloElement) {
                tituloElement.textContent = titulo;
            } else {
                console.error("Elemento con ID 'titulo' no encontrado.");
            }
        }