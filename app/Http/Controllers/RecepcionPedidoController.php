<?php

namespace App\Http\Controllers;

use App\Models\DistribucionPedido;
use App\Models\HistorialAccion;
use App\Models\RecepcionDetalle;
use App\Models\RecepcionPedido;
use App\Models\SolicitudDetalle;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class RecepcionPedidoController extends Controller
{
    public $validacion = [
        'user_id' => 'required',
        'distribucion_pedido_id' => 'required',
        'fecha_recepcion' => 'required|date',
    ];

    public $mensajes = [
        'user_id.required' => 'Este campo es obligatorio',
        'distribucion_pedido_id.required' => 'Este campo es obligatorio',
        'fecha_recepcion.required' => 'Este campo es obligatorio',
        'fecha_recepcion.date' => 'Debes ingresar una fecha valida',
    ];

    public function index(Request $request)
    {
        $recepcion_pedidos = RecepcionPedido::with(["solicitud_pedido", "user", "recepcion_detalles.solicitud_detalle"])->orderBy("id", "desc")->get();
        return response()->JSON(['recepcion_pedidos' => $recepcion_pedidos, 'total' => count($recepcion_pedidos)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);

        if (!isset($request->recepcion_detalles) || !$request->recepcion_detalles || count($request->recepcion_detalles) <= 0) {
            throw new Exception("La solicitud seleccionada no tiene productos asignados");
        }
        $errors = self::validarArray($request["recepcion_detalles"]);
        if (count($errors) > 0) {
            return response()->JSON([
                "errors" => $errors
            ], 422);
        }

        $distribucion_pedido = DistribucionPedido::findOrFail($request->distribucion_pedido_id);
        $request["solicitud_pedido_id"] = $distribucion_pedido->solicitud_pedido_id;
        $request["fecha_registro"] = date("Y-m-d");

        DB::beginTransaction();
        try {
            // crear el RecepcionPedido
            $nueva_recepcion_pedido = RecepcionPedido::create(array_map('mb_strtoupper', $request->except("recepcion_detalles")));
            $datos_original = HistorialAccion::getDetalleRegistro($nueva_recepcion_pedido, "recepcion_pedidos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->recepcion_pedido . ' REGISTRO UNA RECEPCIÓN DE PEDIDO',
                'datos_original' => $datos_original,
                'modulo' => 'RECEPCIÓN DE PEDIDOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            $recepcion_detalles = $request->recepcion_detalles;
            foreach ($recepcion_detalles as $value) {
                // registrar recepcion detalle
                $nueva_recepcion_pedido->recepcion_detalles()->create([
                    "solicitud_detalle_id" => $value["solicitud_detalle"]["id"],
                    "cantidad" => $value["cantidad"],
                    "peso" => $value["peso"],
                ]);
            }

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'recepcion_pedido' => $nueva_recepcion_pedido,
                'msj' => 'El registro se realizó de forma correcta',
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function update(Request $request, RecepcionPedido $recepcion_pedido)
    {
        $request->validate($this->validacion, $this->mensajes);
        if (!isset($request->recepcion_detalles) || !$request->recepcion_detalles || count($request->recepcion_detalles) <= 0) {
            throw new Exception("Debes ingresar al menos un producto");
        }
        $errors = self::validarArray($request["recepcion_detalles"]);
        if (count($errors) > 0) {
            return response()->JSON([
                "errors" => $errors
            ], 422);
        }
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($recepcion_pedido, "recepcion_pedidos");
            $recepcion_pedido->update(array_map('mb_strtoupper', $request->except("recepcion_detalles", "solicitud_pedido", "user")));
            $datos_nuevo = HistorialAccion::getDetalleRegistro($recepcion_pedido, "recepcion_pedidos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->recepcion_pedido . ' MODIFICÓ UNA RECEPCIÓN DE PEDIDO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'RECEPCIÓN DE PEDIDOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            $recepcion_detalles = $request->recepcion_detalles;
            foreach ($recepcion_detalles as $value) {
                $solicitud_detalle = SolicitudDetalle::findOrFail($value["solicitud_detalle"]["id"]);
                // registrar recepcion detalle
                $recepcion_detalle = RecepcionDetalle::findOrFail($value["id"]);
                $recepcion_detalle->update([
                    "solicitud_detalle_id" => $solicitud_detalle["id"],
                    "cantidad" => $value["cantidad"],
                    "peso" => $value["peso"],
                ]);
            }

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'recepcion_pedido' => $recepcion_pedido,
                'msj' => 'El registro se actualizó de forma correcta'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }
    public function show(RecepcionPedido $recepcion_pedido)
    {
        return response()->JSON([
            'sw' => true,
            'recepcion_pedido' => $recepcion_pedido->load(["user", "solicitud_pedido", "recepcion_detalles.solicitud_detalle"])
        ], 200);
    }
    public function destroy(RecepcionPedido $recepcion_pedido)
    {
        DB::beginTransaction();
        try {
            $recepcion_pedido->recepcion_detalles()->delete();
            $datos_original = HistorialAccion::getDetalleRegistro($recepcion_pedido, "recepcion_pedidos");
            $recepcion_pedido->delete();

            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->recepcion_pedido . ' ELIMINÓ UNA RECEPCIÓN DE PEDIDO',
                'datos_original' => $datos_original,
                'modulo' => 'RECEPCIÓN DE PEDIDOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'msj' => 'El registro se eliminó correctamente'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public static function validarArray($array)
    {
        $errors = [];
        foreach ($array as $key => $value) {
            if (trim($value["cantidad"]) == '' || !$value["cantidad"]) {
                $errors["cantidad_" . $key] = ["Debes ingresar la cantidad"];
            }
            if (trim($value["peso"]) == '' || !$value["peso"]) {
                $errors["peso_" . $key] = ["Debes ingresar el peso"];
            }
        }
        return $errors;
    }
}
