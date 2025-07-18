<?php

class Planilla extends FPDF
{
    // Cabecera de página
    function Header()
    {
        // No se usará una cabecera global para este formato específico, cada sección maneja su título.
    }

    // Pie de página
    function Footer()
    {
        // No se usará un pie de página global.
    }

    // Función para añadir una sección con un título
    function AddSectionTitle($title)
    {
        $this->SetFont('Arial', 'B', 12);
        $this->Cell(0, 10, utf8_decode($title), 0, 1, 'L');
        $this->Ln(2);
    }

    // Función para añadir un campo con su valor
    function AddField($label, $value = '')
    {
        $this->SetFont('Arial', '', 10);
        $this->Cell(50, 7, utf8_decode($label . ':'), 0, 0, 'L');
        $this->Cell(0, 7, utf8_decode($value), 'B', 1, 'L');
        $this->Ln(2);
    }

    // Función para añadir un campo con su valor en la misma línea (para campos cortos)
    function AddInlineField($label, $value = '', $widthLabel = 40, $widthValue = 60)
    {
        $this->SetFont('Arial', '', 10);
        $this->Cell($widthLabel, 7, utf8_decode($label . ':'), 0, 0, 'L');
        $this->Cell($widthValue, 7, utf8_decode($value), 'B', 0, 'L');
    }
}

class PDF extends FPDF
{
// Load data
function LoadData($file)
{
    // Read file lines
    $lines = file($file);
    $data = array();
    foreach($lines as $line)
        $data[] = explode(';',trim($line));
    return $data;
}

// Simple table
public function BasicTable($header, $data)
{
    // Header
    foreach($header as $col)
        $this->Cell(25,7,$col,1);
        
    $this->Ln();
    // Data
    foreach($data as $row)
    {
        foreach($row as $col)
        
            $this->Cell(25,7,$col,1);
        $this->Ln();
    }
}

// Better table
function ImprovedTable($header, $data)
{
    // Column widths
    $w = array(40, 35, 40, 45);
    // Header
    for($i=0;$i<count($header);$i++)
        $this->Cell($w[$i],7,$header[$i],1,0,'C');
    $this->Ln();
    // Data
    foreach($data as $row)
    {
        $this->Cell($w[0],6,$row[0],'LR');
        $this->Cell($w[1],6,$row[1],'LR');
        $this->Cell($w[2],6,number_format($row[2]),'LR',0,'R');
        $this->Cell($w[3],6,number_format($row[3]),'LR',0,'R');
        $this->Ln();
    }
    // Closing line
    $this->Cell(array_sum($w),0,'','T');
}

// Colored table
function FancyTable($header, $data)
{
    // Colors, line width and bold font
    $this->SetFillColor(255,0,0);
    $this->SetTextColor(255);
    $this->SetDrawColor(128,0,0);
    $this->SetLineWidth(.3);
    $this->SetFont('','B');
    // Header
    $w = array(40, 35, 40, 45);
    for($i=0;$i<count($header);$i++)
        $this->Cell($w[$i],7,$header[$i],1,0,'C',true);
    $this->Ln();
    // Color and font restoration
    $this->SetFillColor(224,235,255);
    $this->SetTextColor(0);
    $this->SetFont('');
    // Data
    $fill = false;
    foreach($data as $row)
    {
        $this->Cell($w[0],6,$row[0],'LR',0,'L',$fill);
        $this->Cell($w[1],6,$row[1],'LR',0,'L',$fill);
        $this->Cell($w[2],6,number_format($row[2]),'LR',0,'R',$fill);
        $this->Cell($w[3],6,number_format($row[3]),'LR',0,'R',$fill);
        $this->Ln();
        $fill = !$fill;
    }
    // Closing line
    $this->Cell(array_sum($w),0,'','T');
}
}


    





