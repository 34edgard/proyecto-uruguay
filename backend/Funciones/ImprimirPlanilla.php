<?php
 // Asegúrate de que la ruta a fpdf.php sea correcta

namespace Funciones;
use liki\Files\Planilla;



class ImprimirPlanilla{
public static function imprimirPlanilla($estudiante){
    extract($estudiante);
// Creación del objeto PDF
$pdf = new Planilla();
$pdf->AddPage();
$pdf->SetMargins(20, 10, 20); // Márgenes: izquierda, arriba, derecha

// Título principal del documento
$pdf->SetFont('Arial', 'B', 14);
$pdf->Cell(0, 10, utf8_decode('REPÚBLICA BOLIVARIANA DE VENEZUELA'), 0, 1, 'C'); 
$pdf->Cell(0, 10, utf8_decode('MINISTERIO DEL PODER POPULAR PARA LA EDUCACIÓN'), 0, 1, 'C'); 
$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(0, 10, utf8_decode('P.E. "JOSÉ AGUSTÍN MÉNDEZ GARCÍA"'), 0, 1, 'C'); 
$pdf->Cell(0, 10, utf8_decode('MATURÍN - MONAGAS.'), 0, 1, 'C'); 
$pdf->Ln(5);

$pdf->SetFont('Arial', 'B', 14);
$pdf->Cell(0, 10, utf8_decode('PLANILLA DE INSCRIPCIÓN DE EDUCACIÓN INICIAL.'), 0, 1, 'C'); 
$pdf->Ln(10);

// 1- DATOS DE LA INSTITUCIÓN
$pdf->AddSectionTitle('1- DATOS DE LA INSTITUCIÓN:'); 
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(70, 7, utf8_decode('Nombre del plantel: P.E. José Agustín Méndez García'), 0, 0, 'L'); 
$pdf->Cell(0, 7, utf8_decode('Dirección: calle Mariño con calle Barreto, centro'), 0, 1, 'L'); 
$pdf->Cell(50, 7, utf8_decode('Teléfono: 0291-6432889'), 0, 0, 'L');
$pdf->Cell(50, 7, utf8_decode('Ubicación: Maturín.'), 0, 0, 'L'); 
$pdf->Cell(0, 7, utf8_decode('Año Escolar:'), 0, 1, 'L'); 
$pdf->Ln(5);

// 2-DATOS DEL NIÑO O NIÑA
$pdf->AddSectionTitle('2-DATOS DEL NIÑO O NIÑA:'); 
$pdf->AddInlineField('Apellidos', $apellidos, 30, 80); 
$pdf->AddInlineField('Nombres', $nombres, 30, 0); 
$pdf->Ln(7);
$pdf->AddInlineField('Fecha De Nacimiento', $fecha_nacimiento, 50, 50);
$pdf->AddInlineField('Edad', Edad($fecha_nacimiento), 20, 20); 
$pdf->AddInlineField('Meses', '', 20, 0); 
$pdf->Ln(7);
$pdf->AddInlineField('Lugar',consultar_lugar_nacimiento($id_lugar_nacimiento) , 20, 70); 
$pdf->AddInlineField('Municipio', '', 30, 50); 
$pdf->AddInlineField('Estado', '', 20, 0); 
$pdf->Ln(7);
$pdf->AddInlineField('Nacionalidad', $nacionalidad, 30, 60); 
$pdf->AddInlineField('Sexo', $sexo, 20, 0); 
$pdf->Ln(7);
$pdf->AddField('Dirección', ''); 
$pdf->AddInlineField('Teléfono', '', 25, 60); 
$pdf->Ln(10);

$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(0, 7, utf8_decode('Procedencia:'), 0, 1, 'L'); 
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(30, 7, utf8_decode('Hogar [ ]'), 0, 0, 'L'); 
$pdf->Cell(30, 7, utf8_decode('De Otro Plantel [ ]'), 0, 0, 'L'); 
$pdf->Cell(30, 7, utf8_decode('Guardería [ ]'), 0, 0, 'L'); 
$pdf->Cell(30, 7, utf8_decode('Multihogar [ ]'), 0, 0, 'L'); 
$pdf->Cell(30, 7, utf8_decode('Hogar De Cuidado [ ]'), 0, 0, 'L'); 
$pdf->Cell(0, 7, utf8_decode('Del Mismo Plantel [ ]'), 0, 1, 'L'); 
$pdf->Cell(0, 7, utf8_decode('Otro:'), 0, 1, 'L'); 
$pdf->Ln(5);

$pdf->AddInlineField('Talla De Camisa', '', 40, 40); 
$pdf->AddInlineField('Pantalón', '', 30, 40); 
$pdf->AddInlineField('Zapato', '', 25, 0); 
$pdf->Ln(10);

// 3- DATOS FAMILIARES
$pdf->AddSectionTitle('3- DATOS FAMILIARES:'); 

// Datos de la Madre
$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(0, 7, utf8_decode('Apellidos y nombres de la Madre:'), 0, 1, 'L'); 
$pdf->SetFont('Arial', '', 10);
$pdf->AddInlineField('C.I', '', 15, 30); 
$pdf->AddInlineField('Fecha De Nacimiento', '', 50, 40); 
$pdf->AddInlineField('Edad', '', 20, 0); 
$pdf->Ln(7);
$pdf->AddInlineField('Nacionalidad', '', 30, 40); 
$pdf->AddInlineField('Nivel De Instrucción', '', 45, 0); 
$pdf->Ln(7);
$pdf->AddField('Ocupación', ''); 
$pdf->AddField('Dirección De Habitación', ''); 
$pdf->AddField('Dirección De Trabajo', ''); 
$pdf->AddField('Teléfonos', ''); 
$pdf->Ln(5);

// Datos del Padre
$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(0, 7, utf8_decode('Apellidos y nombres del Padre:'), 0, 1, 'L'); 
$pdf->SetFont('Arial', '', 10);
$pdf->AddInlineField('C.I', '', 15, 30); 
$pdf->AddInlineField('Fecha De Nacimiento', '', 50, 40); 
$pdf->AddInlineField('Edad', '', 20, 0); 
$pdf->Ln(7);
$pdf->AddInlineField('Nacionalidad', '', 30, 40);
$pdf->AddInlineField('Nivel De Instrucción', '', 45, 0); 
$pdf->Ln(7);
$pdf->AddField('Ocupación', ''); 
$pdf->AddField('Dirección De Habitación', ''); 
$pdf->AddField('Dirección De Trabajo', ''); 
$pdf->AddField('Teléfonos', ''); 
$pdf->Ln(5);

// Datos del Representante (si es diferente)
$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(0, 7, utf8_decode('Apellidos y nombres del Representante:'), 0, 1, 'L'); 
$pdf->SetFont('Arial', '', 10);
$pdf->AddInlineField('C.I', '', 15, 30); 
$pdf->AddInlineField('Fecha De Nacimiento', '', 50, 40); 
$pdf->AddInlineField('Edad', '', 20, 0); 
$pdf->Ln(7);
$pdf->AddInlineField('Nacionalidad', '', 30, 40); 
$pdf->AddInlineField('Nivel De Instrucción', '', 45, 0); 
$pdf->Ln(7);
$pdf->AddField('Ocupación', ''); 
$pdf->AddField('Dirección De Habitación', ''); 
$pdf->AddField('Dirección De Trabajo', ''); 
$pdf->AddField('Teléfonos', ''); 
$pdf->Ln(5);

$pdf->AddInlineField('Nº De Hermanos Menores De 6 Años', '', 70, 20); 
$pdf->AddInlineField('Edad', '', 20, 0); 
$pdf->Ln(7);
$pdf->Cell(0, 7, utf8_decode('Tiene Niños Menores De 6 Años: Si [ ] No [ ]'), 0, 1, 'L'); 
$pdf->AddInlineField('Edad', '', 20, 0); 
$pdf->Ln(10);


// 4- DIAGNÓSTICOS PRENATALES
$pdf->AddSectionTitle('4- DIAGNÓSTICOS PRENATALES:'); 
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(0, 7, utf8_decode('A- ¿Está usted embarazada? Si [ ] No [ ]'), 0, 1, 'L'); 
$pdf->AddInlineField('Meses de Embarazo', '', 50, 30); 
$pdf->AddInlineField('¿Está en Control?', '', 40, 20); 
$pdf->AddInlineField('¿Donde?', '', 25, 0); 
$pdf->Ln(7);
$pdf->Cell(0, 7, utf8_decode('B- ¿Vive en su Hogar otra persona que esté embarazada? Si [ ] No [ ]'), 0, 1, 'L'); 
$pdf->Cell(0, 7, utf8_decode('En caso de ser afirmativo completa el siguiente cuadro:'), 0, 1, 'L'); 

// Tabla de personas embarazadas en el hogar
$pdf->SetFont('Arial', 'B', 9);
$pdf->SetFillColor(200, 220, 255);
$pdf->Cell(45, 7, utf8_decode('Apellidos y Nombres'), 1, 0, 'C', true); 
$pdf->Cell(25, 7, utf8_decode('Parentesco'), 1, 0, 'C', true); 
$pdf->Cell(45, 7, utf8_decode('Nº de hijos menores de 6 años que viven en el hogar.'), 1, 0, 'C', true); 
$pdf->Cell(50, 7, utf8_decode('Dirección'), 1, 0, 'C', true); 
$pdf->Cell(25, 7, utf8_decode('Teléfono'), 1, 1, 'C', true); 
$pdf->SetFont('Arial', '', 9);
// Filas de ejemplo (se pueden llenar dinámicamente)
for ($i = 0; $i < 3; $i++) {
    $pdf->Cell(45, 7, '', 1, 0);
    $pdf->Cell(25, 7, '', 1, 0);
    $pdf->Cell(45, 7, '', 1, 0);
    $pdf->Cell(50, 7, '', 1, 0);
    $pdf->Cell(25, 7, '', 1, 1);
}
$pdf->Ln(10);

// DOCUMENTOS PRESENTADOS
$pdf->AddSectionTitle('DOCUMENTOS PRESENTADOS:'); 
$pdf->SetFont('Arial', 'B', 10);
$pdf->SetFillColor(200, 220, 255);
$pdf->Cell(80, 7, utf8_decode('Documentos'), 1, 0, 'C', true); 
$pdf->Cell(20, 7, utf8_decode('Copia'), 1, 1, 'C', true); 
$pdf->SetFont('Arial', '', 10);

$documents = [
    'Partida de Nacimiento', 
    'Copia de la cedula de la Madre', 
    'Copia de la Cedula del Padre', 
    '4 Fotos tipo carnet', 
    'Copia del Certificado de Vacunas.', 
];

foreach ($documents as $doc) {
    $pdf->Cell(80, 7, utf8_decode($doc), 1, 0, 'L');
    $pdf->Cell(20, 7, '', 1, 1, 'C'); // Checkbox vacío para copia
}
$pdf->Ln(10);

// REGISTRO DE INSCRIPCIÓN ESCOLAR DEL ESTUDIANTE
$pdf->AddSectionTitle('REGISTRO DE INSCRIPCIÓN ESCOLAR DEL ESTUDIANTE'); 

// Cabecera de la tabla de registro
$pdf->SetFont('Arial', 'B', 8);
$pdf->SetFillColor(200, 220, 255);
$pdf->Cell(20, 15, utf8_decode('NIVEL'), 1, 0, 'C', true); 
$pdf->Cell(25, 15, utf8_decode('AÑO ESCOLAR'), 1, 0, 'C', true); 
$pdf->Cell(30, 15, utf8_decode('FECHA DE INSCRIPCIÓN'), 1, 0, 'C', true); 
$pdf->Cell(30, 15, utf8_decode('EDAD DEL ESTUDIANTE'), 1, 0, 'C', true); 
$pdf->Cell(20, 15, utf8_decode('TALLAS PC Z'), 1, 0, 'C', true); 
$pdf->Cell(30, 15, utf8_decode('FIRMA DEL REPRESENTANTE'), 1, 0, 'C', true); 
$pdf->Cell(35, 15, utf8_decode('NOMBRE Y APELLIDO DEL DOCENTE'), 1, 1, 'C', true); 

$pdf->SetFont('Arial', '', 9);
// Filas para los niveles
$levels = ['1ER NIVEL', '2DO NIVEL', '3ER NIVEL']; 
foreach ($levels as $level) {
    $pdf->Cell(20, 10, utf8_decode($level), 1, 0, 'C');
    $pdf->Cell(25, 10, '', 1, 0);
    $pdf->Cell(30, 10, '', 1, 0);
    $pdf->Cell(30, 10, '', 1, 0);
    $pdf->Cell(20, 10, '', 1, 0);
    $pdf->Cell(30, 10, '', 1, 0);
    $pdf->Cell(35, 10, '', 1, 1);
}

// Salida del PDF
$pdf->Output('D', 'FICHA_DE_INSCRIPCION_INICIAL_2025.pdf');
}
}