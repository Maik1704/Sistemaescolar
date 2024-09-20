<?php

if (!empty ($_GET["txtfechainicio"]) and !empty ($_GET["txtfechafinal"]) and !empty ($_GET["txtpersonal"])) {
   require ('./fpdf.php');

   $fechainicio = $_GET["txtfechainicio"];
   $fechafinal = $_GET["txtfechafinal"];
   $personal = $_GET["txtpersonal"];

   class PDF extends FPDF
   {

      // Cabecera de página
      function Header()
      {
         include "../../../model/conexion.php"; //llamamos a la conexion BD

         $consulta_info = $conexion->query(" select * from colegio "); //traemos datos de la empresa desde BD
         $dato_info = $consulta_info->fetch_object();
         $this->Image('logo.png', 185, 5, 20); //logo de la empresa,moverDerecha,moverAbajo,tamañoIMG
         $this->SetFont('Arial', 'B', 19); //tipo fuente, negrita(B-I-U-BIU), tamañoTexto
         $this->Cell(35); // Movernos a la derecha
         $this->SetTextColor(0, 0, 0); //color
         //creamos una celda o fila
         $this->Cell(110, 15, utf8_decode($dato_info->nombre), 1, 1, 'C', 0); // AnchoCelda,AltoCelda,titulo,borde(1-0),saltoLinea(1-0),posicion(L-C-R),ColorFondo(1-0)
         $this->Ln(3); // Salto de línea
         $this->SetTextColor(103); //color

         /* TITULO DE LA TABLA */
         //color
         $this->SetTextColor(0, 95, 189);
         $this->Cell(100); // mover a la derecha
         $this->SetFont('Arial', 'B', 15);
         $this->Cell(-15, 10, utf8_decode("REPORTE DE ASISTENCIAS POR FECHAS "), 0, 1, 'C', 0);
         $this->Ln(7);

         /* CAMPOS DE LA TABLA */
         //color
         $this->SetFillColor(125, 173, 221); //colorFondo
         $this->SetTextColor(0, 0, 0); //colorTexto
         $this->SetDrawColor(163, 163, 163); //colorBorde
         $this->SetFont('Arial', 'B', 11);
         $this->Cell(10, 10, utf8_decode('N°'), 1, 0, 'C', 1);
         $this->Cell(75, 10, utf8_decode('PERSONAL'), 1, 0, 'C', 1);
         $this->Cell(28, 10, utf8_decode('CURSO'), 1, 0, 'C', 1);
         $this->Cell(42, 10, utf8_decode('ENTRADA'), 1, 0, 'C', 1);
         $this->Cell(42, 10, utf8_decode('SALIDA'), 1, 1, 'C', 1);
      }

      // Pie de página
      function Footer()
      {
         $this->SetY(-15); // Posición: a 1,5 cm del final
         $this->SetFont('Arial', 'I', 8); //tipo fuente, negrita(B-I-U-BIU), tamañoTexto
         $this->Cell(0, 10, utf8_decode('Página ') . $this->PageNo() . '/{nb}', 0, 0, 'C'); //pie de pagina(numero de pagina)

         $this->SetY(-15); // Posición: a 1,5 cm del final
         $this->SetFont('Arial', 'I', 8); //tipo fuente, cursiva, tamañoTexto
      }
   }

   include "../../../model/conexion.php";
   /* CONSULTA INFORMACION DEL HOSPEDAJE */

   $pdf = new PDF();
   $pdf->AddPage("portrait"); /* aqui entran dos para parametros (horientazion,tamaño)V->portrait H->landscape tamaño (A3.A4.A5.letter.legal) */
   $pdf->AliasNbPages(); //muestra la pagina / y total de paginas

   $i = 0;
   $pdf->SetFont('Arial', '', 12);
   $pdf->SetDrawColor(163, 163, 163); //colorBorde

   if ($personal == "todos") {
      $sql = $conexion->query("Select asistencia.id_asistencia, asistencia.id_empleado, date_format(asistencia.entrada, '%m-%d-%Y %H:%i:%s') as 'entrada', date_format(asistencia.salida, '%m-%d-%Y %H:%i:%s') as 'salida', TIMEDIFF(asistencia.salida, asistencia.entrada) as 'totalHR', empleado.nombre, empleado.apellido, cargo.nombre as 'cargo' FROM asistencia INNER JOIN empleado ON asistencia.id_empleado = empleado.id_empleado INNER JOIN cargo ON empleado.cargo = cargo.id_cargo where entrada BETWEEN '$fechainicio' and '$fechafinal' order by id_empleado asc ");
   } else {
      $sql = $conexion->query("Select asistencia.id_asistencia, asistencia.id_empleado, date_format(asistencia.entrada, '%m-%d-%Y %H:%i:%s') as 'entrada', date_format(asistencia.salida, '%m-%d-%Y %H:%i:%s') as 'salida', TIMEDIFF(asistencia.salida, asistencia.entrada) as 'totalHR', empleado.nombre, empleado.apellido, cargo.nombre as 'cargo' FROM asistencia INNER JOIN empleado ON asistencia.id_empleado = empleado.id_empleado INNER JOIN cargo ON empleado.cargo = cargo.id_cargo where asistencia.id_empleado=$personal and entrada BETWEEN '$fechainicio' and '$fechafinal' order by id_empleado asc ");
   }


   while ($datos_reporte = $sql->fetch_object()) {
      $i = $i + 1;
      /* TABLA */
      $pdf->Cell(10, 10, utf8_decode($i), 1, 0, 'C', 0);
      $pdf->Cell(75, 10, utf8_decode($datos_reporte->nombre . " " . $datos_reporte->apellido), 1, 0, 'C', 0);
      $pdf->Cell(28, 10, utf8_decode($datos_reporte->curso), 1, 0, 'C', 0);
      $pdf->Cell(42, 10, utf8_decode($datos_reporte->entrada), 1, 0, 'C', 0);
      $pdf->Cell(42, 10, utf8_decode($datos_reporte->salida), 1, 1, 'C', 0);
   }


   $pdf->Output('Reporte Asistencia.pdf', 'I');//nombreDescarga, Visor(I->visualizar - D->descargar)
}


