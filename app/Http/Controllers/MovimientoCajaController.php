<?php

namespace App\Http\Controllers;

use App\Models\Caja;
use App\Models\HistorialAccion;
use App\Models\MovimientoCaja;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class MovimientoCajaController extends Controller
{
    public function index()
    {
        $movimiento_cajas = MovimientoCaja::orderBy("id", "desc")->get();
        return response()->JSON(['movimiento_cajas' => $movimiento_cajas, 'total' => count($movimiento_cajas)], 200);
    }
    public function create()
    {
    }
    public function store()
    {
        DB::beginTransaction();
        try {
            $total_ingresos = Caja::where("estado", 1)->where("tipo_movimiento", "INGRESO")->sum("monto");
            $total_egresos = Caja::where("estado", 1)->where("tipo_movimiento", "EGRESO")->sum("monto");
            $total = (float)$total_ingresos - (float)$total_egresos;
            $nuevo_movimiento_caja = MovimientoCaja::create([
                "ingresos" => $total_ingresos,
                "egresos" => $total_egresos,
                "total" => $total,
                "fecha" => date("Y-m-d"),
                "hora" => date("H:i:s"),
            ]);

            DB::update("UPDATE cajas SET movimiento_caja_id = $nuevo_movimiento_caja->id WHERE estado = 1 AND movimiento_caja_id = 0");
            DB::update("UPDATE cajas SET estado = 2 WHERE estado = 1");

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_movimiento_caja, "movimiento_cajas");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->movimiento_caja . ' REALIZÓ UN CIERRE DE CAJA',
                'datos_original' => $datos_original,
                'modulo' => 'MOVIMIENTO DE CAJAS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'movimiento_caja' => $nuevo_movimiento_caja,
                'msj' => 'La movimiento_caja se cerró correctamente',
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }
}
