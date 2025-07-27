// Datos de ejemplo

function pastel(porcentajeNinos = 63,
porcentajeNinas = 37
){

const ctx = document.getElementById('graficoPastelSexo').getContext('2d');

const myPieChart = new Chart(ctx, {
    type: 'pie', // Tipo de gráfico: pastel
    data: {
        labels: ['Niños', 'Niñas'], // Etiquetas para las secciones del pastel
        datasets: [{
            data: [porcentajeNinos, porcentajeNinas], // Datos de porcentaje
            backgroundColor: [
                'rgba(54, 162, 235, 0.8)', // Color para niños (azul)
                'rgba(255, 99, 132, 0.8)'  // Color para niñas (rosa)
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
                'rgba(255, 99, 132, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                position: 'top',
            },
            tooltip: {
                callbacks: {
                    label: function(context) {
                        let label = context.label || '';
                        if (label) {
                            label += ': ';
                        }
                        if (context.parsed !== null) {
                            label += context.parsed + '%'; // Muestra el porcentaje en el tooltip
                        }
                        return label;
                    }
                }
            }
        }
    }
});


}


//pastel();
