<?php

namespace App\Http\Controllers;

use App\Models\AdminProducto;
use App\Models\Caja;
use App\Models\Cliente;
use App\Models\Configuracion;
use App\Models\DistribucionPedido;
use App\Models\IngresoMaterial;
use App\Models\IngresoProducto;
use App\Models\Material;
use App\Models\RecepcionPedido;
use App\Models\SalidaMaterial;
use App\Models\SolicitudPedido;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use PDF;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;

class ReporteController extends Controller
{


    public function usuarios(Request $request)
    {
        $filtro =  $request->filtro;
        $usuarios = User::where('id', '!=', 1)->orderBy("paterno", "ASC")->get();

        if ($filtro == 'Tipo de usuario') {
            $request->validate([
                'tipo' => 'required',
            ]);
            $usuarios = User::where('id', '!=', 1)->where('tipo', $request->tipo)->orderBy("paterno", "ASC")->get();
        }

        $pdf = PDF::loadView('reportes.usuarios', compact('usuarios'))->setPaper('legal', 'landscape');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->download('Usuarios.pdf');
    }

    public function cajas(Request $request)
    {
        $filtro =  $request->filtro;
        $concepto =  $request->concepto;
        $saldo = 0;
        $fecha_anterior = "";
        $fecha_ini =  Caja::orderBy("id", "asc")->get()->first()->fecha;
        $fecha_fin =  Caja::orderBy("id", "asc")->get()->last()->fecha;

        $cajas = Caja::orderBy("id", "asc");
        if ($filtro == 'Ingresos') {
            $fecha_ini =  Caja::where("tipo_movimiento", "INGRESO")->orderBy("id", "asc")->get()->first()->fecha;
            $fecha_fin =  Caja::where("tipo_movimiento", "INGRESO")->orderBy("id", "asc")->get()->last()->fecha;
            $cajas = Caja::where('tipo_movimiento', 'INGRESO')->orderBy("id", "asc");
        }
        if ($filtro == 'Egresos') {
            $fecha_ini =  Caja::where("tipo_movimiento", "EGRESO")->orderBy("id", "asc")->get()->first()->fecha;
            $fecha_fin =  Caja::where("tipo_movimiento", "EGRESO")->orderBy("id", "asc")->get()->last()->fecha;
            $cajas = Caja::where('tipo_movimiento', 'EGRESO')->orderBy("id", "asc");
        }
        if ($filtro == 'Rango de fechas') {
            $request->validate([
                "fecha_ini" => "required|date",
                "fecha_fin" => "required|date",
            ], [
                "fecha_ini.required" => "Debes ingresar una fecha inicial",
                "fecha_ini.date" => "Debes ingresar una fecha valida",
                "fecha_fin.required" => "Debes ingresar una fecha fin",
                "fecha_fin.date" => "Debes ingresar una fecha valida",
            ]);
            $fecha_ini =  $request->fecha_ini;
            $fecha_fin =  $request->fecha_fin;
            $saldo = Caja::getSaldoCajaFechaAnteriorTodos($fecha_ini);
            $fecha_anterior = date("Y-m-d", strtotime($fecha_ini . "-1days"));
            $cajas = Caja::whereBetween('fecha', [$fecha_ini, $fecha_fin])->orderBy("id", "asc");
        }

        if ($concepto != "todos") {
            $cajas = $cajas->where("concepto_id", $concepto);
        }

        $cajas = $cajas->get();

        if ($request->tipo == 'PDF') {

            $pdf = PDF::loadView('reportes.cajas', compact('cajas', 'saldo', 'fecha_anterior', 'filtro', 'fecha_ini', 'fecha_fin'))->setPaper('legal', 'landscape');

            // ENUMERAR LAS PÁGINAS USANDO CANVAS
            $pdf->output();
            $dom_pdf = $pdf->getDomPDF();
            $canvas = $dom_pdf->get_canvas();
            $alto = $canvas->get_height();
            $ancho = $canvas->get_width();
            $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

            return $pdf->download('caja.pdf');
        } else {
            $spreadsheet = new Spreadsheet();
            $spreadsheet->getProperties()
                ->setCreator("ADMIN")
                ->setLastModifiedBy('Administración')
                ->setTitle('Reporte')
                ->setSubject('Reporte')
                ->setDescription('Reporte')
                ->setKeywords('PHPSpreadsheet')
                ->setCategory('Listado');

            $sheet = $spreadsheet->getActiveSheet();

            $spreadsheet->getDefaultStyle()->getFont()->setName('Arial');

            $styleTexto = [
                'font' => [
                    'bold' => true,
                    'size' => 12,
                    'family' => 'Times New Roman'
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE,
                    ],
                ],
            ];

            $styleTextoForm = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                ],
            ];

            $styleArray = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                    'color' => ['argb' => 'ffffff'],
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
                'fill' => [
                    'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                    'color' => ['rgb' => 'c57a40']
                ],
            ];

            $estilo_conenido = [
                'font' => [
                    'size' => 10,
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                    // 'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
            ];

            $fila = 1;
            if (file_exists(public_path() . '/imgs/' . Configuracion::first()->logo)) {
                $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
                $drawing->setName('logo');
                $drawing->setDescription('logo');
                $drawing->setPath(public_path() . '/imgs/' . Configuracion::first()->logo);
                $drawing->setCoordinates('A' . $fila);
                $drawing->setOffsetX(5);
                $drawing->setOffsetY(0);
                $drawing->setHeight(60);
                $drawing->setWorksheet($sheet);
            }

            $fila = 2;
            $sheet->setCellValue('A' . $fila, "REPORTE DE CAJA");
            $sheet->mergeCells("A" . $fila . ":H" . $fila);  //COMBINAR CELDAS
            $sheet->getStyle('A' . $fila . ':H' . $fila)->getAlignment()->setHorizontal('center');
            $sheet->getStyle('A' . $fila . ':H' . $fila)->applyFromArray($styleTexto);
            $fila++;
            $fila++;
            $sheet->setCellValue('A' . $fila, 'Fecha');
            $sheet->setCellValue('B' . $fila, 'Detalle');
            $sheet->setCellValue('C' . $fila, 'Encargado');
            $sheet->setCellValue('D' . $fila, 'Rec/Fac');
            $sheet->setCellValue('E' . $fila, 'Ingreso');
            $sheet->setCellValue('F' . $fila, 'Egreso');
            $sheet->setCellValue('G' . $fila, 'Saldo');
            $sheet->setCellValue('H' . $fila, 'Observación');
            $sheet->getStyle('A' . $fila . ':H' . $fila)->applyFromArray($styleArray);
            $fila++;
            $cont = 1;
            $total = 0;
            $styleArray = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ],
            ];


            $cont = 1;
            $total = 0;
            $saldo_caja = 0;
            $suma_ingresos = 0;
            $suma_egresos = 0;
            if (isset($saldo) && $saldo != 0) {
                $saldo_caja = $saldo;
            }

            if (isset($saldo) && $saldo != 0) {
                if ($saldo > 0) {
                    $sheet->setCellValue('A' . $fila, $fecha_anterior);
                    $sheet->setCellValue('B' . $fila, 'SALDO');
                    $sheet->setCellValue('E' . $fila,  number_format($saldo, 2, '.', ''));
                    $sheet->setCellValue('G' . $fila,  number_format($saldo, 2, '.', ''));
                    $fila++;
                } else {
                    $sheet->setCellValue('A' . $fila, $fecha_anterior);
                    $sheet->setCellValue('B' . $fila, 'SALDO');
                    $sheet->setCellValue('F' . $fila,  number_format($saldo, 2, '.', ''));
                    $sheet->setCellValue('G' . $fila,  number_format($saldo, 2, '.', ''));
                    $fila++;
                }
            }
            foreach ($cajas as $caja) {

                if ($caja->tipo_movimiento == 'INGRESO') {
                    $suma_ingresos += (float) $caja->monto;
                    $saldo_caja += (float) $caja->monto;
                } else {
                    $suma_egresos += (float) $caja->monto;
                    $saldo_caja -= (float) $caja->monto;
                }


                $sheet->setCellValue('A' . $fila, $caja->fecha);
                $sheet->setCellValue('B' . $fila, $caja->concepto->nombre);
                $sheet->setCellValue('C' . $fila, $caja->encargado ? $caja->encargado->full_name : '');
                $txt_rec_fac = '';
                if ($caja->nro_factura || $caja->nro) {
                    if ($caja->tipo == 'NORMAL') {
                        $txt_rec_fac = 'F/' . $caja->nro_factura;
                    } else {
                        $txt_rec_fac = 'C/' . $caja->nro;
                    }
                }
                $sheet->setCellValue('D' . $fila, $txt_rec_fac);
                if ($caja->tipo_movimiento == 'INGRESO') {
                    $sheet->setCellValue('E' . $fila, $caja->monto);
                } else {
                    $sheet->setCellValue('F' . $fila, $caja->monto);
                }
                $sheet->setCellValue('G' . $fila, number_format($saldo_caja, 2, '.', ''));
                $sheet->setCellValue('H' . $fila, $caja->descripcion);
                $sheet->getStyle('A' . $fila . ':H' . $fila)->applyFromArray($estilo_conenido);
                $sheet->getStyle('A' . $fila . ':H' . $fila)->getAlignment()->setWrapText(true);
                $fila++;
            }

            $sheet->setCellValue('A' . $fila, "TOTAL");
            $sheet->mergeCells("A" . $fila . ":D" . $fila);  //COMBINAR CELDAS
            $sheet->setCellValue('E' . $fila, number_format($suma_ingresos, 2, '.', ''));
            $sheet->setCellValue('F' . $fila, number_format($suma_egresos, 2, '.', ''));
            $sheet->setCellValue('G' . $fila, number_format($saldo_caja, 2, '.', ''));
            $sheet->getStyle('A' . $fila . ':H' . $fila)->applyFromArray($styleArray);

            $sheet->getColumnDimension('A')->setWidth(10);
            $sheet->getColumnDimension('B')->setWidth(25);
            $sheet->getColumnDimension('C')->setWidth(35);
            $sheet->getColumnDimension('D')->setWidth(15);
            $sheet->getColumnDimension('E')->setWidth(15);
            $sheet->getColumnDimension('F')->setWidth(15);
            $sheet->getColumnDimension('G')->setWidth(15);
            $sheet->getColumnDimension('H')->setWidth(45);


            foreach (range('A', 'E') as $columnID) {
                $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
            }

            $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
            $sheet->getPageMargins()->setTop(0.5);
            $sheet->getPageMargins()->setRight(0.1);
            $sheet->getPageMargins()->setLeft(0.1);
            $sheet->getPageMargins()->setBottom(0.1);
            $sheet->getPageSetup()->setPrintArea('A:H');
            $sheet->getPageSetup()->setFitToWidth(1);
            $sheet->getPageSetup()->setFitToHeight(0);

            // DESCARGA DEL ARCHIVO
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename="reporte.xlsx"');
            header('Cache-Control: max-age=0');
            $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
            $writer->save('php://output');
        }
    }

    public function ingreso_general(Request $request)
    {
        $fecha_ini = $request->fecha_ini;
        $fecha_fin = $request->fecha_fin;

        if ($fecha_ini && $fecha_fin) {
            $ingresos_caja = Caja::whereBetween("fecha", [$fecha_ini, $fecha_fin])->where("tipo_movimiento", "INGRESO")->orderBy("fecha", "asc")->get();
        } else {
            $ingresos_caja = Caja::where("tipo_movimiento", "INGRESO")->orderBy("fecha", "asc")->get();
        }

        if ($request->tipo == 'PDF') {
            $pdf = PDF::loadView('reportes.ingreso_general', compact('ingresos_caja'))->setPaper('letter', 'portrait');

            // ENUMERAR LAS PÁGINAS USANDO CANVAS
            $pdf->output();
            $dom_pdf = $pdf->getDomPDF();
            $canvas = $dom_pdf->get_canvas();
            $alto = $canvas->get_height();
            $ancho = $canvas->get_width();
            $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

            return $pdf->download('ingreso_general.pdf');
        } else {
            $spreadsheet = new Spreadsheet();
            $spreadsheet->getProperties()
                ->setCreator("ADMIN")
                ->setLastModifiedBy('Administración')
                ->setTitle('Reporte')
                ->setSubject('Reporte')
                ->setDescription('Reporte')
                ->setKeywords('PHPSpreadsheet')
                ->setCategory('Listado');

            $sheet = $spreadsheet->getActiveSheet();

            $spreadsheet->getDefaultStyle()->getFont()->setName('Arial');

            $styleTexto = [
                'font' => [
                    'bold' => true,
                    'size' => 12,
                    'family' => 'Times New Roman'
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE,
                    ],
                ],
            ];

            $styleTextoForm = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                ],
            ];

            $styleArray = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                    'color' => ['argb' => 'ffffff'],
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
                'fill' => [
                    'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                    'color' => ['rgb' => 'c57a40']
                ],
            ];

            $estilo_conenido = [
                'font' => [
                    'size' => 10,
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                    // 'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
            ];

            $fila = 1;
            if (file_exists(public_path() . '/imgs/' . Configuracion::first()->logo)) {
                $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
                $drawing->setName('logo');
                $drawing->setDescription('logo');
                $drawing->setPath(public_path() . '/imgs/' . Configuracion::first()->logo);
                $drawing->setCoordinates('A' . $fila);
                $drawing->setOffsetX(5);
                $drawing->setOffsetY(0);
                $drawing->setHeight(60);
                $drawing->setWorksheet($sheet);
            }

            $fila = 2;
            $sheet->setCellValue('A' . $fila, "INGRESO GENERAL");
            $sheet->mergeCells("A" . $fila . ":G" . $fila);  //COMBINAR CELDAS
            $sheet->getStyle('A' . $fila . ':G' . $fila)->getAlignment()->setHorizontal('center');
            $sheet->getStyle('A' . $fila . ':G' . $fila)->applyFromArray($styleTexto);
            $fila++;
            $fila++;
            $sheet->setCellValue('A' . $fila, 'N°');
            $sheet->setCellValue('B' . $fila, 'Fecha');
            $sheet->setCellValue('C' . $fila, 'Tipo');
            $sheet->setCellValue('D' . $fila, 'Concepto');
            $sheet->setCellValue('E' . $fila, 'Responsable');
            $sheet->setCellValue('F' . $fila, 'Descripción');
            $sheet->setCellValue('G' . $fila, 'Monto');
            $sheet->getStyle('A' . $fila . ':G' . $fila)->applyFromArray($styleArray);
            $fila++;
            $cont = 1;
            $total = 0;
            $styleArray = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ],
            ];
            foreach ($ingresos_caja as $item) {
                $sheet->setCellValue('A' . $fila, $cont++);
                $sheet->setCellValue('B' . $fila, $item->fecha);
                $sheet->setCellValue('C' . $fila, $item->tipo);
                $sheet->setCellValue('D' . $fila, $item->concepto->nombre);
                $sheet->setCellValue('E' . $fila, $item->responsable->full_name);
                $sheet->setCellValue('F' . $fila, $item->descripcion);
                $sheet->setCellValue('G' . $fila, $item->monto);
                $sheet->getStyle('A' . $fila . ':G' . $fila)->applyFromArray($estilo_conenido);
                $total += (float)$item->monto;
                $fila++;
            }
            $sheet->setCellValue('A' . $fila, "TOTAL");
            $sheet->mergeCells("A" . $fila . ":F" . $fila);  //COMBINAR CELDAS
            $sheet->setCellValue('G' . $fila, $total);
            $sheet->getStyle('A' . $fila . ':G' . $fila)->applyFromArray($styleArray);
            $sheet->getColumnDimension('A')->setWidth(5);
            $sheet->getColumnDimension('B')->setWidth(15);
            $sheet->getColumnDimension('C')->setWidth(15);
            $sheet->getColumnDimension('D')->setWidth(25);
            $sheet->getColumnDimension('E')->setWidth(25);
            $sheet->getColumnDimension('F')->setWidth(30);
            $sheet->getColumnDimension('G')->setWidth(15);

            foreach (range('A', 'G') as $columnID) {
                $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
            }

            $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
            $sheet->getPageMargins()->setTop(0.5);
            $sheet->getPageMargins()->setRight(0.1);
            $sheet->getPageMargins()->setLeft(0.1);
            $sheet->getPageMargins()->setBottom(0.1);
            $sheet->getPageSetup()->setPrintArea('A:G');
            $sheet->getPageSetup()->setFitToWidth(1);
            $sheet->getPageSetup()->setFitToHeight(0);

            // DESCARGA DEL ARCHIVO
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename="reporte.xlsx"');
            header('Cache-Control: max-age=0');
            $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
            $writer->save('php://output');
        }
    }
    public function inventario(Request $request)
    {
        $admin_producto_id = $request->admin_producto_id;

        $admin_productos = AdminProducto::all();
        if ($admin_producto_id != 'todos') {
            $admin_productos = AdminProducto::where("id", $admin_producto_id)->get();
        }

        if ($request->tipo == 'PDF') {
            $pdf = PDF::loadView('reportes.inventario', compact('admin_productos'))->setPaper('letter', 'portrait');

            // ENUMERAR LAS PÁGINAS USANDO CANVAS
            $pdf->output();
            $dom_pdf = $pdf->getDomPDF();
            $canvas = $dom_pdf->get_canvas();
            $alto = $canvas->get_height();
            $ancho = $canvas->get_width();
            $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

            return $pdf->download('inventario.pdf');
        } else {
            $spreadsheet = new Spreadsheet();
            $spreadsheet->getProperties()
                ->setCreator("ADMIN")
                ->setLastModifiedBy('Administración')
                ->setTitle('Reporte')
                ->setSubject('Reporte')
                ->setDescription('Reporte')
                ->setKeywords('PHPSpreadsheet')
                ->setCategory('Listado');

            $sheet = $spreadsheet->getActiveSheet();

            $spreadsheet->getDefaultStyle()->getFont()->setName('Arial');

            $styleTexto = [
                'font' => [
                    'bold' => true,
                    'size' => 12,
                    'family' => 'Times New Roman'
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE,
                    ],
                ],
            ];

            $styleTextoForm = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                ],
            ];

            $styleArray = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                    'color' => ['argb' => 'ffffff'],
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
                'fill' => [
                    'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                    'color' => ['rgb' => 'c57a40']
                ],
            ];

            $estilo_conenido = [
                'font' => [
                    'size' => 10,
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                    // 'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
            ];

            $fila = 1;
            if (file_exists(public_path() . '/imgs/' . Configuracion::first()->logo)) {
                $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
                $drawing->setName('logo');
                $drawing->setDescription('logo');
                $drawing->setPath(public_path() . '/imgs/' . Configuracion::first()->logo);
                $drawing->setCoordinates('A' . $fila);
                $drawing->setOffsetX(5);
                $drawing->setOffsetY(0);
                $drawing->setHeight(60);
                $drawing->setWorksheet($sheet);
            }

            $fila = 2;
            $sheet->setCellValue('A' . $fila, "INVENTARIO DE PRODUCTOS");
            $sheet->mergeCells("A" . $fila . ":G" . $fila);  //COMBINAR CELDAS
            $sheet->getStyle('A' . $fila . ':G' . $fila)->getAlignment()->setHorizontal('center');
            $sheet->getStyle('A' . $fila . ':G' . $fila)->applyFromArray($styleTexto);
            $fila++;
            $fila++;
            $sheet->setCellValue('A' . $fila, 'N°');
            $sheet->setCellValue('B' . $fila, 'Código de color');
            $sheet->setCellValue('C' . $fila, 'Descripción');
            $sheet->setCellValue('D' . $fila, 'Título');
            $sheet->setCellValue('E' . $fila, 'Stock kg');
            $sheet->setCellValue('F' . $fila, 'Stock conos');
            $sheet->setCellValue('G' . $fila, 'Fecha de registro');
            $sheet->getStyle('A' . $fila . ':G' . $fila)->applyFromArray($styleArray);
            $fila++;
            $cont = 1;
            $total = 0;
            $styleArray = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ],
            ];
            foreach ($admin_productos as $item) {
                $sheet->setCellValue('A' . $fila, $cont++);
                $sheet->setCellValue('B' . $fila, $item->codigo_color);
                $sheet->setCellValue('C' . $fila, $item->descripcion);
                $sheet->setCellValue('D' . $fila, $item->titulo);
                $sheet->setCellValue('E' . $fila, $item->stock_kg);
                $sheet->setCellValue('F' . $fila, $item->stock_conos);
                $sheet->setCellValue('G' . $fila, $item->fecha_registro);
                $sheet->getStyle('A' . $fila . ':G' . $fila)->applyFromArray($estilo_conenido);
                $total += (float)$item->monto;
                $fila++;
            }
            $sheet->getColumnDimension('A')->setWidth(5);
            $sheet->getColumnDimension('B')->setWidth(15);
            $sheet->getColumnDimension('C')->setWidth(15);
            $sheet->getColumnDimension('D')->setWidth(25);
            $sheet->getColumnDimension('E')->setWidth(25);
            $sheet->getColumnDimension('F')->setWidth(30);
            $sheet->getColumnDimension('G')->setWidth(15);

            foreach (range('A', 'G') as $columnID) {
                $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
            }

            $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
            $sheet->getPageMargins()->setTop(0.5);
            $sheet->getPageMargins()->setRight(0.1);
            $sheet->getPageMargins()->setLeft(0.1);
            $sheet->getPageMargins()->setBottom(0.1);
            $sheet->getPageSetup()->setPrintArea('A:G');
            $sheet->getPageSetup()->setFitToWidth(1);
            $sheet->getPageSetup()->setFitToHeight(0);

            // DESCARGA DEL ARCHIVO
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename="reporte.xlsx"');
            header('Cache-Control: max-age=0');
            $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
            $writer->save('php://output');
        }
    }
    public function solicitud_productos(Request $request)
    {
        $filtro = $request->filtro;
        $cliente_id = $request->cliente_id;
        $solicitud_pedido_id = $request->solicitud_pedido_id;

        $solicitud_pedidos = SolicitudPedido::all();

        if ($filtro != 'todos') {
            if ($filtro == 'Cliente' && $cliente_id != "todos") {
                $solicitud_pedidos = SolicitudPedido::where("cliente_id", $cliente_id)->get();
            }
            if ($filtro == 'Código de Solicitud' && $solicitud_pedido_id != "todos") {
                $solicitud_pedidos = SolicitudPedido::where("id", $solicitud_pedido_id)->get();
            }
        }

        if ($request->tipo == 'PDF') {
            $pdf = PDF::loadView('reportes.solicitud_productos', compact('solicitud_pedidos'))->setPaper('letter', 'portrait');

            // ENUMERAR LAS PÁGINAS USANDO CANVAS
            $pdf->output();
            $dom_pdf = $pdf->getDomPDF();
            $canvas = $dom_pdf->get_canvas();
            $alto = $canvas->get_height();
            $ancho = $canvas->get_width();
            $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

            return $pdf->download('solicitud_productos.pdf');
        } else {
            $spreadsheet = new Spreadsheet();
            $spreadsheet->getProperties()
                ->setCreator("ADMIN")
                ->setLastModifiedBy('Administración')
                ->setTitle('Reporte')
                ->setSubject('Reporte')
                ->setDescription('Reporte')
                ->setKeywords('PHPSpreadsheet')
                ->setCategory('Listado');

            $sheet = $spreadsheet->getActiveSheet();

            $spreadsheet->getDefaultStyle()->getFont()->setName('Arial');

            $styleTexto = [
                'font' => [
                    'bold' => true,
                    'size' => 12,
                    'family' => 'Times New Roman'
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE,
                    ],
                ],
            ];

            $styleTextoForm = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                ],
            ];

            $styleArray = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                    'color' => ['argb' => 'ffffff'],
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
                'fill' => [
                    'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                    'color' => ['rgb' => 'c57a40']
                ],
            ];

            $estilo_conenido = [
                'font' => [
                    'size' => 10,
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                    // 'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
            ];

            $fila = 1;
            if (file_exists(public_path() . '/imgs/' . Configuracion::first()->logo)) {
                $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
                $drawing->setName('logo');
                $drawing->setDescription('logo');
                $drawing->setPath(public_path() . '/imgs/' . Configuracion::first()->logo);
                $drawing->setCoordinates('A' . $fila);
                $drawing->setOffsetX(5);
                $drawing->setOffsetY(0);
                $drawing->setHeight(60);
                $drawing->setWorksheet($sheet);
            }

            $fila = 2;
            $sheet->setCellValue('A' . $fila, "SOLICITUD DE PRODUCTOS");
            $sheet->mergeCells("A" . $fila . ":I" . $fila);  //COMBINAR CELDAS
            $sheet->getStyle('A' . $fila . ':I' . $fila)->getAlignment()->setHorizontal('center');
            $sheet->getStyle('A' . $fila . ':I' . $fila)->applyFromArray($styleTexto);
            $fila++;
            $fila++;
            $styleArray = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ],
            ];

            foreach ($solicitud_pedidos as $item) {
                $sheet->setCellValue('A' . $fila, 'Código de pedido');
                $sheet->mergeCells("A" . $fila . ":B" . $fila);  //COMBINAR CELDAS
                $sheet->setCellValue('C' . $fila, $item->codigo);
                $sheet->mergeCells("C" . $fila . ":I" . $fila);  //COMBINAR CELDAS
                $fila++;
                $sheet->setCellValue('A' . $fila, 'Cliente');
                $sheet->mergeCells("A" . $fila . ":B" . $fila);  //COMBINAR CELDAS
                $sheet->setCellValue('C' . $fila, $item->cliente->empresa);
                $sheet->mergeCells("C" . $fila . ":I" . $fila);  //COMBINAR CELDAS
                $fila++;
                $sheet->setCellValue('A' . $fila, 'Fecha de Recepción');
                $sheet->mergeCells("A" . $fila . ":B" . $fila);  //COMBINAR CELDAS
                $sheet->setCellValue('C' . $fila, $item->fecha_recepcion);
                $sheet->mergeCells("C" . $fila . ":I" . $fila);  //COMBINAR CELDAS
                $fila++;
                $fila++;
                $fila++;

                $sheet->setCellValue('A' . $fila, 'Código de Producto');
                $sheet->setCellValue('B' . $fila, 'Descripción');
                $sheet->setCellValue('C' . $fila, 'Talla');
                $sheet->setCellValue('D' . $fila, 'Cantidad');
                $sheet->setCellValue('E' . $fila, 'Elaborado');
                $sheet->setCellValue('F' . $fila, 'Título');
                $sheet->setCellValue('G' . $fila, 'Color Código');
                $sheet->setCellValue('H' . $fila, 'Peso Uni. (gr)');
                $sheet->setCellValue('I' . $fila, 'Peso Total (gr)');
                $sheet->getStyle('A' . $fila . ':I' . $fila)->applyFromArray($styleArray);
                $fila++;

                foreach ($item->solicitud_detalles as $value) {
                    $sheet->setCellValue('A' . $fila, $value->codigo);
                    $sheet->setCellValue('B' . $fila, $value->descripcion);
                    $sheet->setCellValue('C' . $fila, $value->talla);
                    $sheet->setCellValue('D' . $fila, $value->cantidad);
                    $sheet->setCellValue('E' . $fila, $value->elaborado);
                    $sheet->setCellValue('F' . $fila, $value->titulo);
                    $sheet->setCellValue('G' . $fila, $value->codigo_color);
                    $sheet->setCellValue('H' . $fila, $value->peso);
                    $sheet->setCellValue('I' . $fila, $value->peso_total);
                    $sheet->getStyle('A' . $fila . ':I' . $fila)->applyFromArray($estilo_conenido);
                    $fila++;
                }
                $fila++;
                $fila++;
                $fila++;
            }

            $sheet->getColumnDimension('A')->setWidth(15);
            $sheet->getColumnDimension('B')->setWidth(20);
            $sheet->getColumnDimension('C')->setWidth(15);
            $sheet->getColumnDimension('D')->setWidth(25);
            $sheet->getColumnDimension('E')->setWidth(25);
            $sheet->getColumnDimension('F')->setWidth(30);
            $sheet->getColumnDimension('G')->setWidth(15);
            $sheet->getColumnDimension('H')->setWidth(15);
            $sheet->getColumnDimension('I')->setWidth(15);

            foreach (range('A', 'I') as $columnID) {
                $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
            }

            $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
            $sheet->getPageMargins()->setTop(0.5);
            $sheet->getPageMargins()->setRight(0.1);
            $sheet->getPageMargins()->setLeft(0.1);
            $sheet->getPageMargins()->setBottom(0.1);
            $sheet->getPageSetup()->setPrintArea('A:I');
            $sheet->getPageSetup()->setFitToWidth(1);
            $sheet->getPageSetup()->setFitToHeight(0);

            // DESCARGA DEL ARCHIVO
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename="reporte.xlsx"');
            header('Cache-Control: max-age=0');
            $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
            $writer->save('php://output');
        }
    }
    public function distribucion_pedidos(Request $request)
    {
        $filtro = $request->filtro;
        $user_id = $request->user_id;
        $solicitud_pedido_id = $request->solicitud_pedido_id;

        $distribucion_pedidos = DistribucionPedido::all();

        if ($filtro != 'todos') {
            if ($filtro == 'Socios' && $user_id != "todos") {
                $distribucion_pedidos = DistribucionPedido::where("user_id", $user_id)->get();
            }
            if ($filtro == 'Código de Solicitud' && $solicitud_pedido_id != "todos") {
                $distribucion_pedidos = DistribucionPedido::where("solicitud_pedido_id", $solicitud_pedido_id)->get();
            }
        }

        if ($request->tipo == 'PDF') {
            $pdf = PDF::loadView('reportes.distribucion_pedidos', compact('distribucion_pedidos'))->setPaper('letter', 'portrait');

            // ENUMERAR LAS PÁGINAS USANDO CANVAS
            $pdf->output();
            $dom_pdf = $pdf->getDomPDF();
            $canvas = $dom_pdf->get_canvas();
            $alto = $canvas->get_height();
            $ancho = $canvas->get_width();
            $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

            return $pdf->download('distribucion_pedidos.pdf');
        } else {
            $spreadsheet = new Spreadsheet();
            $spreadsheet->getProperties()
                ->setCreator("ADMIN")
                ->setLastModifiedBy('Administración')
                ->setTitle('Reporte')
                ->setSubject('Reporte')
                ->setDescription('Reporte')
                ->setKeywords('PHPSpreadsheet')
                ->setCategory('Listado');

            $sheet = $spreadsheet->getActiveSheet();

            $spreadsheet->getDefaultStyle()->getFont()->setName('Arial');

            $styleTexto = [
                'font' => [
                    'bold' => true,
                    'size' => 12,
                    'family' => 'Times New Roman'
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE,
                    ],
                ],
            ];

            $styleTextoForm = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                ],
            ];

            $styleArray = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                    'color' => ['argb' => 'ffffff'],
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
                'fill' => [
                    'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                    'color' => ['rgb' => 'c57a40']
                ],
            ];

            $estilo_conenido = [
                'font' => [
                    'size' => 10,
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                    // 'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
            ];

            $fila = 1;
            if (file_exists(public_path() . '/imgs/' . Configuracion::first()->logo)) {
                $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
                $drawing->setName('logo');
                $drawing->setDescription('logo');
                $drawing->setPath(public_path() . '/imgs/' . Configuracion::first()->logo);
                $drawing->setCoordinates('A' . $fila);
                $drawing->setOffsetX(5);
                $drawing->setOffsetY(0);
                $drawing->setHeight(60);
                $drawing->setWorksheet($sheet);
            }

            $fila = 2;
            $sheet->setCellValue('A' . $fila, "DISTRIBUCIÓN DE PEDIDOS");
            $sheet->mergeCells("A" . $fila . ":E" . $fila);  //COMBINAR CELDAS
            $sheet->getStyle('A' . $fila . ':E' . $fila)->getAlignment()->setHorizontal('center');
            $sheet->getStyle('A' . $fila . ':E' . $fila)->applyFromArray($styleTexto);
            $fila++;
            $fila++;
            $styleArray = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ],
            ];

            foreach ($distribucion_pedidos as $item) {
                $sheet->setCellValue('A' . $fila, 'Código de pedido');
                $sheet->setCellValue('B' . $fila, $item->solicitud_pedido->codigo);
                $sheet->mergeCells("B" . $fila . ":E" . $fila);  //COMBINAR CELDAS
                $fila++;
                $sheet->setCellValue('A' . $fila, 'Socio/Taller');
                $sheet->setCellValue('B' . $fila, $item->user->full_name);
                $sheet->mergeCells("B" . $fila . ":E" . $fila);  //COMBINAR CELDAS
                $fila++;
                $sheet->setCellValue('A' . $fila, 'Fecha de Distribución');
                $sheet->setCellValue('B' . $fila, $item->fecha_distribución);
                $sheet->mergeCells("B" . $fila . ":E" . $fila);  //COMBINAR CELDAS
                $fila++;
                $fila++;
                $fila++;

                $sheet->setCellValue('A' . $fila, 'Detalle Producto');
                $sheet->setCellValue('B' . $fila, 'Cantidad Restante');
                $sheet->setCellValue('C' . $fila, 'Peso Restante (gr)');
                $sheet->setCellValue('D' . $fila, 'Cantidad Distribución');
                $sheet->setCellValue('E' . $fila, 'Peso Distribución (gr)');
                $sheet->getStyle('A' . $fila . ':E' . $fila)->applyFromArray($styleArray);
                $fila++;

                foreach ($item->distribucion_detalles as $value) {
                    $detalle_producto = "Codigo: " . $value->solicitud_detalle->codigo;
                    $detalle_producto .= "\nDescripción: " . $value->solicitud_detalle->descripcion;
                    $detalle_producto .= "\nTalla: " . $value->solicitud_detalle->talla;
                    $detalle_producto .= "\nCantidad: " . $value->solicitud_detalle->cantidad;
                    $detalle_producto .= "\nPeso Uni.(gr): " . $value->solicitud_detalle->peso;
                    $detalle_producto .= "\nElaborado: " . $value->solicitud_detalle->elaborado;
                    $detalle_producto .= "\nTítulo: " . $value->solicitud_detalle->titulo;
                    $detalle_producto .= "\nColor Código: " . $value->solicitud_detalle->codigo_color;
                    $detalle_producto .= "\nPeso Total(gr): " . $value->solicitud_detalle->peso_total;

                    $sheet->setCellValue('A' . $fila, $detalle_producto);
                    $sheet->setCellValue('B' . $fila, $value->solicitud_detalle->cantidad_restante);
                    $sheet->setCellValue('C' . $fila, $value->solicitud_detalle->peso_restante);
                    $sheet->setCellValue('D' . $fila, $value->cantidad);
                    $sheet->setCellValue('E' . $fila, $value->peso);
                    $sheet->getStyle('A' . $fila . ':E' . $fila)->applyFromArray($estilo_conenido);
                    $fila++;
                }
                $fila++;
                $fila++;
                $fila++;
            }

            $sheet->getColumnDimension('A')->setWidth(35);
            $sheet->getColumnDimension('B')->setWidth(20);
            $sheet->getColumnDimension('C')->setWidth(15);
            $sheet->getColumnDimension('D')->setWidth(25);
            $sheet->getColumnDimension('E')->setWidth(25);
            $sheet->getColumnDimension('F')->setWidth(30);
            $sheet->getColumnDimension('G')->setWidth(15);
            $sheet->getColumnDimension('H')->setWidth(15);
            $sheet->getColumnDimension('I')->setWidth(15);

            foreach (range('A', 'E') as $columnID) {
                $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
            }

            $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
            $sheet->getPageMargins()->setTop(0.5);
            $sheet->getPageMargins()->setRight(0.1);
            $sheet->getPageMargins()->setLeft(0.1);
            $sheet->getPageMargins()->setBottom(0.1);
            $sheet->getPageSetup()->setPrintArea('A:E');
            $sheet->getPageSetup()->setFitToWidth(1);
            $sheet->getPageSetup()->setFitToHeight(0);

            // DESCARGA DEL ARCHIVO
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename="reporte.xlsx"');
            header('Cache-Control: max-age=0');
            $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
            $writer->save('php://output');
        }
    }
    public function recepcion_pedidos(Request $request)
    {
        $filtro = $request->filtro;
        $user_id = $request->user_id;
        $solicitud_pedido_id = $request->solicitud_pedido_id;

        $recepcion_pedidos = RecepcionPedido::all();

        if ($filtro != 'todos') {
            if ($filtro == 'Socios' && $user_id != "todos") {
                $recepcion_pedidos = RecepcionPedido::where("user_id", $user_id)->get();
            }
            if ($filtro == 'Código de Solicitud' && $solicitud_pedido_id != "todos") {
                $recepcion_pedidos = RecepcionPedido::where("solicitud_pedido_id", $solicitud_pedido_id)->get();
            }
        }

        if ($request->tipo == 'PDF') {
            $pdf = PDF::loadView('reportes.recepcion_pedidos', compact('recepcion_pedidos'))->setPaper('letter', 'portrait');

            // ENUMERAR LAS PÁGINAS USANDO CANVAS
            $pdf->output();
            $dom_pdf = $pdf->getDomPDF();
            $canvas = $dom_pdf->get_canvas();
            $alto = $canvas->get_height();
            $ancho = $canvas->get_width();
            $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

            return $pdf->download('recepcion_pedidos.pdf');
        } else {
            $spreadsheet = new Spreadsheet();
            $spreadsheet->getProperties()
                ->setCreator("ADMIN")
                ->setLastModifiedBy('Administración')
                ->setTitle('Reporte')
                ->setSubject('Reporte')
                ->setDescription('Reporte')
                ->setKeywords('PHPSpreadsheet')
                ->setCategory('Listado');

            $sheet = $spreadsheet->getActiveSheet();

            $spreadsheet->getDefaultStyle()->getFont()->setName('Arial');

            $styleTexto = [
                'font' => [
                    'bold' => true,
                    'size' => 12,
                    'family' => 'Times New Roman'
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE,
                    ],
                ],
            ];

            $styleTextoForm = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                ],
            ];

            $styleArray = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                    'color' => ['argb' => 'ffffff'],
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
                'fill' => [
                    'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                    'color' => ['rgb' => 'c57a40']
                ],
            ];

            $estilo_conenido = [
                'font' => [
                    'size' => 10,
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                    // 'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
            ];

            $fila = 1;
            if (file_exists(public_path() . '/imgs/' . Configuracion::first()->logo)) {
                $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
                $drawing->setName('logo');
                $drawing->setDescription('logo');
                $drawing->setPath(public_path() . '/imgs/' . Configuracion::first()->logo);
                $drawing->setCoordinates('A' . $fila);
                $drawing->setOffsetX(5);
                $drawing->setOffsetY(0);
                $drawing->setHeight(60);
                $drawing->setWorksheet($sheet);
            }

            $fila = 2;
            $sheet->setCellValue('A' . $fila, "RECEPCIÓN DE PEDIDOS");
            $sheet->mergeCells("A" . $fila . ":E" . $fila);  //COMBINAR CELDAS
            $sheet->getStyle('A' . $fila . ':E' . $fila)->getAlignment()->setHorizontal('center');
            $sheet->getStyle('A' . $fila . ':E' . $fila)->applyFromArray($styleTexto);
            $fila++;
            $fila++;
            $styleArray = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ],
            ];

            foreach ($recepcion_pedidos as $item) {
                $sheet->setCellValue('A' . $fila, 'Código de pedido');
                $sheet->setCellValue('B' . $fila, $item->solicitud_pedido->codigo);
                $sheet->mergeCells("B" . $fila . ":E" . $fila);  //COMBINAR CELDAS
                $fila++;
                $sheet->setCellValue('A' . $fila, 'Socio/Taller');
                $sheet->setCellValue('B' . $fila, $item->user->full_name);
                $sheet->mergeCells("B" . $fila . ":E" . $fila);  //COMBINAR CELDAS
                $fila++;
                $fila++;
                $fila++;

                foreach ($item->historia_recepcions as $index => $historia) {
                    $sheet->setCellValue('A' . $fila, 'Fecha de recepción:');
                    $sheet->setCellValue('B' . $fila, $historia->fecha);
                    $fila++;

                    $sheet->setCellValue('A' . $fila, 'Detalle Producto');
                    $sheet->setCellValue('B' . $fila, 'Cantidad Asignada');
                    $sheet->setCellValue('C' . $fila, 'Peso Asignado (gr)');
                    $sheet->setCellValue('D' . $fila, 'Cantidad recibida');
                    $sheet->setCellValue('E' . $fila, 'Peso recibido (gr)');
                    $sheet->getStyle('A' . $fila . ':E' . $fila)->applyFromArray($styleArray);
                    $fila++;

                    foreach ($historia->historia_recepcion_detalles as $value) {
                        $detalle_producto = "Codigo: " . $value->solicitud_detalle->codigo;
                        $detalle_producto .= "\nDescripción: " . $value->solicitud_detalle->descripcion;
                        $detalle_producto .= "\nTalla: " . $value->solicitud_detalle->talla;
                        $detalle_producto .= "\nCantidad: " . $value->solicitud_detalle->cantidad;
                        $detalle_producto .= "\nPeso Uni.(gr): " . $value->solicitud_detalle->peso;
                        $detalle_producto .= "\nElaborado: " . $value->solicitud_detalle->elaborado;
                        $detalle_producto .= "\nTítulo: " . $value->solicitud_detalle->titulo;
                        $detalle_producto .= "\nColor Código: " . $value->solicitud_detalle->codigo_color;
                        $detalle_producto .= "\nPeso Total(gr): " . $value->solicitud_detalle->peso_total;

                        $sheet->setCellValue('A' . $fila, $detalle_producto);
                        $sheet->setCellValue('B' . $fila, $value->recepcion_detalle->cantidad);
                        $sheet->setCellValue('C' . $fila, $value->recepcion_detalle->peso);
                        $sheet->setCellValue('D' . $fila, $value->cantidad);
                        $sheet->setCellValue('E' . $fila, $value->peso);
                        $sheet->getStyle('A' . $fila . ':E' . $fila)->applyFromArray($estilo_conenido);
                        $fila++;
                    }
                    $fila++;
                    $fila++;
                    $fila++;
                }
            }

            $sheet->getColumnDimension('A')->setWidth(35);
            $sheet->getColumnDimension('B')->setWidth(20);
            $sheet->getColumnDimension('C')->setWidth(15);
            $sheet->getColumnDimension('D')->setWidth(25);
            $sheet->getColumnDimension('E')->setWidth(25);
            $sheet->getColumnDimension('F')->setWidth(30);
            $sheet->getColumnDimension('G')->setWidth(15);
            $sheet->getColumnDimension('H')->setWidth(15);
            $sheet->getColumnDimension('I')->setWidth(15);

            foreach (range('A', 'E') as $columnID) {
                $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
            }

            $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
            $sheet->getPageMargins()->setTop(0.5);
            $sheet->getPageMargins()->setRight(0.1);
            $sheet->getPageMargins()->setLeft(0.1);
            $sheet->getPageMargins()->setBottom(0.1);
            $sheet->getPageSetup()->setPrintArea('A:E');
            $sheet->getPageSetup()->setFitToWidth(1);
            $sheet->getPageSetup()->setFitToHeight(0);

            // DESCARGA DEL ARCHIVO
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename="reporte.xlsx"');
            header('Cache-Control: max-age=0');
            $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
            $writer->save('php://output');
        }
    }
    public function clientes(Request $request)
    {
        $clientes = Cliente::all();

        if ($request->fecha_ini && $request->fecha_fin) {
            $clientes = Cliente::whereBetween("fecha_registro", [$request->fecha_ini, $request->fecha_fin])->get();
        }

        if ($request->tipo == 'PDF') {
            $pdf = PDF::loadView('reportes.clientes', compact('clientes'))->setPaper('letter', 'portrait');

            // ENUMERAR LAS PÁGINAS USANDO CANVAS
            $pdf->output();
            $dom_pdf = $pdf->getDomPDF();
            $canvas = $dom_pdf->get_canvas();
            $alto = $canvas->get_height();
            $ancho = $canvas->get_width();
            $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

            return $pdf->download('clientes.pdf');
        } else {
            $spreadsheet = new Spreadsheet();
            $spreadsheet->getProperties()
                ->setCreator("ADMIN")
                ->setLastModifiedBy('Administración')
                ->setTitle('Reporte')
                ->setSubject('Reporte')
                ->setDescription('Reporte')
                ->setKeywords('PHPSpreadsheet')
                ->setCategory('Listado');

            $sheet = $spreadsheet->getActiveSheet();

            $spreadsheet->getDefaultStyle()->getFont()->setName('Arial');

            $styleTexto = [
                'font' => [
                    'bold' => true,
                    'size' => 12,
                    'family' => 'Times New Roman'
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE,
                    ],
                ],
            ];

            $styleTextoForm = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                ],
            ];

            $styleArray = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                    'color' => ['argb' => 'ffffff'],
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
                'fill' => [
                    'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                    'color' => ['rgb' => 'c57a40']
                ],
            ];

            $estilo_conenido = [
                'font' => [
                    'size' => 10,
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                    // 'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
            ];

            $fila = 1;
            if (file_exists(public_path() . '/imgs/' . Configuracion::first()->logo)) {
                $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
                $drawing->setName('logo');
                $drawing->setDescription('logo');
                $drawing->setPath(public_path() . '/imgs/' . Configuracion::first()->logo);
                $drawing->setCoordinates('A' . $fila);
                $drawing->setOffsetX(5);
                $drawing->setOffsetY(0);
                $drawing->setHeight(60);
                $drawing->setWorksheet($sheet);
            }

            $fila = 2;
            $sheet->setCellValue('A' . $fila, "LISTA DE CLIENTES");
            $sheet->mergeCells("A" . $fila . ":G" . $fila);  //COMBINAR CELDAS
            $sheet->getStyle('A' . $fila . ':G' . $fila)->getAlignment()->setHorizontal('center');
            $sheet->getStyle('A' . $fila . ':G' . $fila)->applyFromArray($styleTexto);
            $fila++;
            $fila++;
            $sheet->setCellValue('A' . $fila, 'N°');
            $sheet->setCellValue('B' . $fila, 'Empresa');
            $sheet->setCellValue('C' . $fila, 'Nombre del Encargado');
            $sheet->setCellValue('D' . $fila, 'Teléfonos');
            $sheet->setCellValue('E' . $fila, 'Dirección');
            $sheet->setCellValue('F' . $fila, 'Correo');
            $sheet->setCellValue('G' . $fila, 'Fecha de registro');
            $sheet->getStyle('A' . $fila . ':G' . $fila)->applyFromArray($styleArray);
            $fila++;
            $cont = 1;
            $total = 0;
            $styleArray = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ],
            ];
            foreach ($clientes as $item) {
                $sheet->setCellValue('A' . $fila, $cont++);
                $sheet->setCellValue('B' . $fila, $item->empresa);
                $sheet->setCellValue('C' . $fila, $item->nombre_encargado);
                $sheet->setCellValue('D' . $fila, $item->fonos);
                $sheet->setCellValue('E' . $fila, $item->dir);
                $sheet->setCellValue('F' . $fila, $item->correo);
                $sheet->setCellValue('G' . $fila, $item->fecha_registro);
                $sheet->getStyle('A' . $fila . ':G' . $fila)->applyFromArray($estilo_conenido);
                $total += (float)$item->monto;
                $fila++;
            }
            $sheet->getColumnDimension('A')->setWidth(5);
            $sheet->getColumnDimension('B')->setWidth(25);
            $sheet->getColumnDimension('C')->setWidth(25);
            $sheet->getColumnDimension('D')->setWidth(15);
            $sheet->getColumnDimension('E')->setWidth(25);
            $sheet->getColumnDimension('F')->setWidth(30);
            $sheet->getColumnDimension('G')->setWidth(15);

            foreach (range('A', 'G') as $columnID) {
                $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
            }

            $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
            $sheet->getPageMargins()->setTop(0.5);
            $sheet->getPageMargins()->setRight(0.1);
            $sheet->getPageMargins()->setLeft(0.1);
            $sheet->getPageMargins()->setBottom(0.1);
            $sheet->getPageSetup()->setPrintArea('A:G');
            $sheet->getPageSetup()->setFitToWidth(1);
            $sheet->getPageSetup()->setFitToHeight(0);

            // DESCARGA DEL ARCHIVO
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename="reporte.xlsx"');
            header('Cache-Control: max-age=0');
            $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
            $writer->save('php://output');
        }
    }
    public function inventario_materiales(Request $request)
    {
        $material_id = $request->material_id;

        $materials = Material::all();
        if ($material_id != 'todos') {
            $materials = Material::where("id", $material_id)->get();
        }

        if ($request->tipo == 'PDF') {
            $pdf = PDF::loadView('reportes.inventario_materiales', compact('materials'))->setPaper('letter', 'portrait');

            // ENUMERAR LAS PÁGINAS USANDO CANVAS
            $pdf->output();
            $dom_pdf = $pdf->getDomPDF();
            $canvas = $dom_pdf->get_canvas();
            $alto = $canvas->get_height();
            $ancho = $canvas->get_width();
            $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

            return $pdf->download('inventario_materiales.pdf');
        } else {
            $spreadsheet = new Spreadsheet();
            $spreadsheet->getProperties()
                ->setCreator("ADMIN")
                ->setLastModifiedBy('Administración')
                ->setTitle('Reporte')
                ->setSubject('Reporte')
                ->setDescription('Reporte')
                ->setKeywords('PHPSpreadsheet')
                ->setCategory('Listado');

            $sheet = $spreadsheet->getActiveSheet();

            $spreadsheet->getDefaultStyle()->getFont()->setName('Arial');

            $styleTexto = [
                'font' => [
                    'bold' => true,
                    'size' => 12,
                    'family' => 'Times New Roman'
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE,
                    ],
                ],
            ];

            $styleTextoForm = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                ],
            ];

            $styleArray = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                    'color' => ['argb' => 'ffffff'],
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
                'fill' => [
                    'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                    'color' => ['rgb' => 'c57a40']
                ],
            ];

            $estilo_conenido = [
                'font' => [
                    'size' => 10,
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                    // 'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
            ];

            $fila = 1;
            if (file_exists(public_path() . '/imgs/' . Configuracion::first()->logo)) {
                $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
                $drawing->setName('logo');
                $drawing->setDescription('logo');
                $drawing->setPath(public_path() . '/imgs/' . Configuracion::first()->logo);
                $drawing->setCoordinates('A' . $fila);
                $drawing->setOffsetX(5);
                $drawing->setOffsetY(0);
                $drawing->setHeight(60);
                $drawing->setWorksheet($sheet);
            }

            $fila = 2;
            $sheet->setCellValue('A' . $fila, "INVENTARIO DE MATERIALES");
            $sheet->mergeCells("A" . $fila . ":E" . $fila);  //COMBINAR CELDAS
            $sheet->getStyle('A' . $fila . ':E' . $fila)->getAlignment()->setHorizontal('center');
            $sheet->getStyle('A' . $fila . ':E' . $fila)->applyFromArray($styleTexto);
            $fila++;
            $fila++;
            $sheet->setCellValue('A' . $fila, 'N°');
            $sheet->setCellValue('B' . $fila, 'Nombre');
            $sheet->setCellValue('C' . $fila, 'Descripción');
            $sheet->setCellValue('D' . $fila, 'Stock');
            $sheet->setCellValue('E' . $fila, 'Fecha de registro');
            $sheet->getStyle('A' . $fila . ':E' . $fila)->applyFromArray($styleArray);
            $fila++;
            $cont = 1;
            $total = 0;
            $styleArray = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ],
            ];
            foreach ($materials as $item) {
                $sheet->setCellValue('A' . $fila, $cont++);
                $sheet->setCellValue('B' . $fila, $item->nombre);
                $sheet->setCellValue('C' . $fila, $item->descripcion);
                $sheet->setCellValue('D' . $fila, $item->stock);
                $sheet->setCellValue('E' . $fila, $item->fecha_registro);
                $sheet->getStyle('A' . $fila . ':E' . $fila)->applyFromArray($estilo_conenido);
                $total += (float)$item->monto;
                $fila++;
            }
            $sheet->getColumnDimension('A')->setWidth(5);
            $sheet->getColumnDimension('B')->setWidth(25);
            $sheet->getColumnDimension('C')->setWidth(35);
            $sheet->getColumnDimension('D')->setWidth(15);
            $sheet->getColumnDimension('E')->setWidth(15);

            foreach (range('A', 'E') as $columnID) {
                $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
            }

            $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
            $sheet->getPageMargins()->setTop(0.5);
            $sheet->getPageMargins()->setRight(0.1);
            $sheet->getPageMargins()->setLeft(0.1);
            $sheet->getPageMargins()->setBottom(0.1);
            $sheet->getPageSetup()->setPrintArea('A:E');
            $sheet->getPageSetup()->setFitToWidth(1);
            $sheet->getPageSetup()->setFitToHeight(0);

            // DESCARGA DEL ARCHIVO
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename="reporte.xlsx"');
            header('Cache-Control: max-age=0');
            $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
            $writer->save('php://output');
        }
    }
    public function ingreso_salida_materiales(Request $request)
    {
        $material_id = $request->material_id;
        $fecha_ini = "";
        $fecha_fin = "";

        if ($request->fecha_ini && $request->fecha_fin) {
            $fecha_ini = $request->fecha_ini;
            $fecha_fin = $request->fecha_fin;
        }

        $materials = Material::all();

        if ($material_id != 'todos') {
            $materials = Material::where("id", $material_id)->get();
        }

        if ($request->tipo == 'PDF') {
            $pdf = PDF::loadView('reportes.ingreso_salida_materiales', compact('materials', 'fecha_ini', "fecha_fin"))->setPaper('letter', 'portrait');

            // ENUMERAR LAS PÁGINAS USANDO CANVAS
            $pdf->output();
            $dom_pdf = $pdf->getDomPDF();
            $canvas = $dom_pdf->get_canvas();
            $alto = $canvas->get_height();
            $ancho = $canvas->get_width();
            $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

            return $pdf->download('ingreso_salida_materiales.pdf');
        } else {
            $spreadsheet = new Spreadsheet();
            $spreadsheet->getProperties()
                ->setCreator("ADMIN")
                ->setLastModifiedBy('Administración')
                ->setTitle('Reporte')
                ->setSubject('Reporte')
                ->setDescription('Reporte')
                ->setKeywords('PHPSpreadsheet')
                ->setCategory('Listado');

            $sheet = $spreadsheet->getActiveSheet();

            $spreadsheet->getDefaultStyle()->getFont()->setName('Arial');

            $styleTexto = [
                'font' => [
                    'bold' => true,
                    'size' => 12,
                    'family' => 'Times New Roman'
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE,
                    ],
                ],
            ];

            $styleTextoForm = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                ],
            ];

            $styleArray = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                    'color' => ['argb' => 'ffffff'],
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
                'fill' => [
                    'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                    'color' => ['rgb' => 'c57a40']
                ],
            ];

            $estilo_conenido = [
                'font' => [
                    'size' => 10,
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                    // 'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
            ];

            $fila = 1;
            if (file_exists(public_path() . '/imgs/' . Configuracion::first()->logo)) {
                $drawing = new \PhpOffice\PhpSpreadsheet\Worksheet\Drawing();
                $drawing->setName('logo');
                $drawing->setDescription('logo');
                $drawing->setPath(public_path() . '/imgs/' . Configuracion::first()->logo);
                $drawing->setCoordinates('A' . $fila);
                $drawing->setOffsetX(5);
                $drawing->setOffsetY(0);
                $drawing->setHeight(60);
                $drawing->setWorksheet($sheet);
            }

            $fila = 2;
            $sheet->setCellValue('A' . $fila, "INGRESOS Y SALIDAS DE MATERIALES");
            $sheet->mergeCells("A" . $fila . ":E" . $fila);  //COMBINAR CELDAS
            $sheet->getStyle('A' . $fila . ':E' . $fila)->getAlignment()->setHorizontal('center');
            $sheet->getStyle('A' . $fila . ':E' . $fila)->applyFromArray($styleTexto);
            $fila++;
            $fila++;
            $styleArray = [
                'font' => [
                    'bold' => true,
                    'size' => 10,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    ],
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ],
            ];

            foreach ($materials as $item) {
                $sheet->setCellValue('A' . $fila, $item->nombre);
                $sheet->mergeCells("B" . $fila . ":D" . $fila);  //COMBINAR CELDAS
                $fila++;
                $fila++;
                $sheet->setCellValue('A' . $fila, "Ingresos");
                $sheet->mergeCells("B" . $fila . ":D" . $fila);  //COMBINAR CELDAS
                $fila++;

                $ingresos = IngresoMaterial::where('material_id', $item->id)->orderBy('fecha_registro', 'asc');
                if ($fecha_ini && $fecha_fin) {
                    $ingresos->whereBetween('fecha_registro', [$fecha_ini, $fecha_fin]);
                }
                $ingresos = $ingresos->get();

                $salidas = SalidaMaterial::where('material_id', $item->id)->orderBy('fecha_registro', 'asc');
                if ($fecha_ini && $fecha_fin) {
                    $salidas->whereBetween('fecha_registro', [$fecha_ini, $fecha_fin]);
                }
                $salidas = $salidas->get();


                $sheet->setCellValue('A' . $fila, 'N°');
                $sheet->setCellValue('B' . $fila, 'Cantidad');
                $sheet->setCellValue('C' . $fila, 'Fecha de Ingreso');
                $sheet->setCellValue('D' . $fila, 'Fecha de Registro');
                $sheet->getStyle('A' . $fila . ':D' . $fila)->applyFromArray($styleArray);
                $fila++;
                $cont = 1;
                foreach ($ingresos as $value) {
                    $sheet->setCellValue('A' . $fila, $cont++);
                    $sheet->setCellValue('B' . $fila, $value->cantidad);
                    $sheet->setCellValue('C' . $fila, $value->fecha_ingreso);
                    $sheet->setCellValue('D' . $fila, $value->fecha_registro);
                    $sheet->getStyle('A' . $fila . ':D' . $fila)->applyFromArray($estilo_conenido);
                    $fila++;
                }
                $fila++;

                $sheet->setCellValue('A' . $fila, "Salidas");
                $fila++;
                $sheet->setCellValue('A' . $fila, 'N°');
                $sheet->setCellValue('B' . $fila, 'Cantidad');
                $sheet->setCellValue('C' . $fila, 'Fecha de Salida');
                $sheet->setCellValue('D' . $fila, 'Fecha de Registro');
                $sheet->getStyle('A' . $fila . ':D' . $fila)->applyFromArray($styleArray);

                $cont = 1;
                foreach ($salidas as $value) {
                    $sheet->setCellValue('A' . $fila, $cont++);
                    $sheet->setCellValue('B' . $fila, $value->cantidad);
                    $sheet->setCellValue('C' . $fila, $value->fecha_salida);
                    $sheet->setCellValue('D' . $fila, $value->fecha_registro);
                    $sheet->getStyle('A' . $fila . ':D' . $fila)->applyFromArray($estilo_conenido);
                    $fila++;
                }
                $fila++;
                $fila++;
                $fila++;
            }

            $sheet->getColumnDimension('A')->setWidth(15);
            $sheet->getColumnDimension('B')->setWidth(20);
            $sheet->getColumnDimension('C')->setWidth(20);
            $sheet->getColumnDimension('D')->setWidth(20);

            foreach (range('A', 'D') as $columnID) {
                $sheet->getStyle($columnID)->getAlignment()->setWrapText(true);
            }

            $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
            $sheet->getPageMargins()->setTop(0.5);
            $sheet->getPageMargins()->setRight(0.1);
            $sheet->getPageMargins()->setLeft(0.1);
            $sheet->getPageMargins()->setBottom(0.1);
            $sheet->getPageSetup()->setPrintArea('A:D');
            $sheet->getPageSetup()->setFitToWidth(1);
            $sheet->getPageSetup()->setFitToHeight(0);

            // DESCARGA DEL ARCHIVO
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename="reporte.xlsx"');
            header('Cache-Control: max-age=0');
            $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
            $writer->save('php://output');
        }
    }
}
