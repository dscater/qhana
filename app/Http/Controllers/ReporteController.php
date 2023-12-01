<?php

namespace App\Http\Controllers;

use App\Models\Caja;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use PDF;

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
        $saldo = 0;
        $fecha_anterior = "";
        $fecha_ini =  Caja::orderBy("id", "asc")->get()->first()->fecha;
        $fecha_fin =  Caja::orderBy("id", "asc")->get()->last()->fecha;

        $cajas = Caja::orderBy("id", "asc")->get();
        if ($filtro == 'Ingresos') {
            $fecha_ini =  Caja::where("tipo_movimiento", "INGRESO")->orderBy("id", "asc")->get()->first()->fecha;
            $fecha_fin =  Caja::where("tipo_movimiento", "INGRESO")->orderBy("id", "asc")->get()->last()->fecha;
            $cajas = Caja::where('tipo_movimiento', 'INGRESO')->orderBy("id", "asc")->get();
        }
        if ($filtro == 'Egresos') {
            $fecha_ini =  Caja::where("tipo_movimiento", "EGRESO")->orderBy("id", "asc")->get()->first()->fecha;
            $fecha_fin =  Caja::where("tipo_movimiento", "EGRESO")->orderBy("id", "asc")->get()->last()->fecha;
            $cajas = Caja::where('tipo_movimiento', 'EGRESO')->orderBy("id", "asc")->get();
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
            Log::debug($saldo);
            $fecha_anterior = date("Y-m-d", strtotime($fecha_ini . "-1days"));
            $cajas = Caja::whereBetween('fecha', [$fecha_ini, $fecha_fin])->orderBy("id", "asc")->get();
        }
        $pdf = PDF::loadView('reportes.cajas', compact('cajas', 'saldo', 'fecha_anterior', 'filtro', 'fecha_ini', 'fecha_fin'))->setPaper('legal', 'landscape');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->download('caja.pdf');
    }
}
