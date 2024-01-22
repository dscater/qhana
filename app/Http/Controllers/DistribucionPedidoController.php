<?php

namespace App\Http\Controllers;

use App\Models\DistribucionDetalle;
use App\Models\DistribucionPedido;
use App\Models\HistorialAccion;
use App\Models\RecepcionPedido;
use App\Models\SolicitudDetalle;
use App\Models\SolicitudPedido;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class DistribucionPedidoController extends Controller
{
    public $validacion = [
        'solicitud_pedido_id' => 'required',
        'user_id' => 'required',
        'fecha_distribucion' => 'required|date',
    ];

    public $mensajes = [
        'solicitud_pedido_id.required' => 'Este campo es obligatorio',
        'user_id.required' => 'Este campo es obligatorio',
        'fecha_distribucion.required' => 'Este campo es obligatorio',
        'fecha_distribucion.date' => 'Debes ingresar una fecha valida',
    ];

    public function index(Request $request)
    {
        $distribucion_pedidos = DistribucionPedido::with(["solicitud_pedido", "user", "distribucion_detalles.solicitud_detalle"])->orderBy("id", "desc")->get();
        return response()->JSON(['distribucion_pedidos' => $distribucion_pedidos, 'total' => count($distribucion_pedidos)], 200);
    }

    public function byUser(Request $request)
    {
        $distribucion_pedidos = DistribucionPedido::where("user_id", $request->user_id)->with(["solicitud_pedido", "user", "distribucion_detalles.solicitud_detalle"])->orderBy("id", "desc")->get();
        return response()->JSON(['distribucion_pedidos' => $distribucion_pedidos, 'total' => count($distribucion_pedidos)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);

        if (!isset($request->distribucion_detalles) || !$request->distribucion_detalles || count($request->distribucion_detalles) <= 0) {
            throw new Exception("La solicitud seleccionada no tiene productos asignados");
        }
        $errors = self::validarArray($request["distribucion_detalles"]);
        if (count($errors) > 0) {
            return response()->JSON([
                "errors" => $errors
            ], 422);
        }
        $request["fecha_registro"] = date("Y-m-d");

        DB::beginTransaction();
        try {
            // crear el DistribucionPedido
            $nueva_distribucion_pedido = DistribucionPedido::create(array_map('mb_strtoupper', $request->except("distribucion_detalles")));
            $datos_original = HistorialAccion::getDetalleRegistro($nueva_distribucion_pedido, "distribucion_pedidos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->distribucion_pedido . ' REGISTRO UNA DISTRIBUCIÓN DE PEDIDO',
                'datos_original' => $datos_original,
                'modulo' => 'DISTRIBUCIÓN DE PEDIDOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            $distribucion_detalles = $request->distribucion_detalles;
            foreach ($distribucion_detalles as $value) {
                // validar cantidad y peso
                if ($value["cantidad"] > $value["solicitud_detalle"]["cantidad_restante_aux"]) {
                    throw new Exception("Error la cantidad ingresada( " . $value["cantidad"] . ") del producto con código <strong>" . $value["solicitud_detalle"]["codigo"] . "</strong>, supera al restante de: " . $value["solicitud_detalle"]["cantidad_restante"]);
                }
                if ($value["peso"] > $value["solicitud_detalle"]["peso_restante_aux"]) {
                    throw new Exception("Error la peso ingresado( " . $value["peso"] . ") del producto con código <strong>" . $value["solicitud_detalle"]["codigo"] . "</strong>, supera al restante de: " . $value["solicitud_detalle"]["peso_restante"]);
                }

                // registrar distribucion detalle
                $nueva_distribucion_pedido->distribucion_detalles()->create([
                    "solicitud_detalle_id" => $value["solicitud_detalle"]["id"],
                    "cantidad" => $value["cantidad"],
                    "peso" => $value["peso"],
                ]);

                // actualizar restante
                $solicitud_detalle = SolicitudDetalle::findOrFail($value["solicitud_detalle"]["id"]);
                $solicitud_detalle->cantidad_restante = (float)$solicitud_detalle->cantidad_restante - (float)$value["cantidad"];
                $solicitud_detalle->peso_restante = (float)$solicitud_detalle->peso_restante - (float)$value["peso"];
                $solicitud_detalle->save();
            }
            SolicitudPedido::actualizaCantidadPesoSolicitud($request->solicitud_pedido_id);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'distribucion_pedido' => $nueva_distribucion_pedido,
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

    public function update(Request $request, DistribucionPedido $distribucion_pedido)
    {
        $request->validate($this->validacion, $this->mensajes);
        if (!isset($request->distribucion_detalles) || !$request->distribucion_detalles || count($request->distribucion_detalles) <= 0) {
            throw new Exception("Debes ingresar al menos un producto");
        }
        $errors = self::validarArray($request["distribucion_detalles"]);
        if (count($errors) > 0) {
            return response()->JSON([
                "errors" => $errors
            ], 422);
        }
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($distribucion_pedido, "distribucion_pedidos");
            $distribucion_pedido->update(array_map('mb_strtoupper', $request->except("distribucion_detalles", "solicitud_pedido")));
            $datos_nuevo = HistorialAccion::getDetalleRegistro($distribucion_pedido, "distribucion_pedidos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->distribucion_pedido . ' MODIFICÓ UNA DISTRIBUCIÓN DE PEDIDO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'DISTRIBUCIÓN DE PEDIDOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            $distribucion_detalles = $request->distribucion_detalles;
            foreach ($distribucion_detalles as $value) {
                $solicitud_detalle = SolicitudDetalle::findOrFail($value["solicitud_detalle"]["id"]);
                // primero reestablecer cantidades
                $solicitud_detalle->cantidad_restante = (float)$solicitud_detalle->cantidad_restante + (float)$value["cantidad_aux"];
                $solicitud_detalle->peso_restante = (float)$solicitud_detalle->peso_restante + (float)$value["peso_aux"];
                $solicitud_detalle->save();

                // validar cantidad y peso
                if ($value["cantidad"] > $solicitud_detalle["cantidad_restante"]) {
                    throw new Exception("Error la cantidad ingresada( " . $value["cantidad"] . ") del producto con código <strong>" . $solicitud_detalle["codigo"] . "</strong>, supera al restante de: " . $solicitud_detalle["cantidad_restante"]);
                }
                if ($value["peso"] > $solicitud_detalle["peso_restante"]) {
                    throw new Exception("Error la peso ingresado( " . $value["peso"] . ") del producto con código <strong>" . $solicitud_detalle["codigo"] . "</strong>, supera al restante de: " . $solicitud_detalle["peso_restante"]);
                }

                // registrar distribucion detalle
                $distribucion_detalle = DistribucionDetalle::findOrFail($value["id"]);
                $distribucion_detalle->update([
                    "solicitud_detalle_id" => $solicitud_detalle["id"],
                    "cantidad" => $value["cantidad"],
                    "peso" => $value["peso"],
                ]);
                // actualizar restante
                $solicitud_detalle->cantidad_restante = (float)$solicitud_detalle->cantidad_restante - (float)$value["cantidad"];
                $solicitud_detalle->peso_restante = (float)$solicitud_detalle->peso_restante - (float)$value["peso"];
                $solicitud_detalle->save();
            }

            SolicitudPedido::actualizaCantidadPesoSolicitud($distribucion_pedido->solicitud_pedido_id);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'distribucion_pedido' => $distribucion_pedido,
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
    public function show(DistribucionPedido $distribucion_pedido)
    {
        return response()->JSON([
            'sw' => true,
            'distribucion_pedido' => $distribucion_pedido->load(["solicitud_pedido", "distribucion_detalles.solicitud_detalle"])
        ], 200);
    }
    public function verificaRecepcion(DistribucionPedido $distribucion_pedido)
    {
        // VERIFICAR EXISTENCIA DE RECEPCION
        $recepcion_pedido = RecepcionPedido::with(["recepcion_detalles.solicitud_detalle"])->where("solicitud_pedido_id", $distribucion_pedido->solicitud_pedido_id)
            ->where("user_id", $distribucion_pedido->user_id)
            ->where("distribucion_pedido_id", $distribucion_pedido->id)
            ->get()
            ->first();

        $existe_recepcion = false;
        if ($recepcion_pedido) {
            $existe_recepcion = true;
        }

        return response()->JSON([
            'sw' => true,
            "existe_recepcion" => $existe_recepcion,
            "recepcion_pedido" => $recepcion_pedido ? $recepcion_pedido->load(["user", "solicitud_pedido", "historia_recepcions.historia_recepcion_detalles.solicitud_detalle", "historia_recepcions.historia_recepcion_detalles.recepcion_detalle", "recepcion_detalles.solicitud_detalle"]) : null,
            'distribucion_pedido' => $distribucion_pedido->load(["solicitud_pedido", "distribucion_detalles.solicitud_detalle"])
        ], 200);
    }

    public function destroy(DistribucionPedido $distribucion_pedido)
    {
        DB::beginTransaction();
        try {
            $existe_registros = RecepcionPedido::where("distribucion_pedido_id", $distribucion_pedido->id)->get();
            if (count($existe_registros) > 0) {
                throw new Exception("No se puede eliminar el registro debido a que existen registros que lo usan");
            }
            $distribucion_detalles = $distribucion_pedido->distribucion_detalles;
            foreach ($distribucion_detalles as $value) {
                $solicitud_detalle = SolicitudDetalle::findOrFail($value["solicitud_detalle"]["id"]);
                // primero reestablecer cantidades
                $solicitud_detalle->cantidad_restante = (float)$solicitud_detalle->cantidad_restante + (float)$value["cantidad"];
                $solicitud_detalle->peso_restante = (float)$solicitud_detalle->peso_restante + (float)$value["peso"];
                $solicitud_detalle->save();
                $value->delete();
            }
            SolicitudPedido::actualizaCantidadPesoSolicitud($distribucion_pedido->solicitud_pedido_id);
            $datos_original = HistorialAccion::getDetalleRegistro($distribucion_pedido, "distribucion_pedidos");
            $distribucion_pedido->delete();

            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->distribucion_pedido . ' ELIMINÓ UNA DISTRIBUCIÓN DE PEDIDO',
                'datos_original' => $datos_original,
                'modulo' => 'DISTRIBUCIÓN DE PEDIDOS',
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
            if (trim($value["cantidad"]) != '' && trim($value["peso"]) != '' && ((float)($value["peso"]) != 0 && (float)($value["cantidad"]) != 0)) {
                if (trim($value["cantidad"]) == '') {
                    $errors["cantidad_" . $key] = ["Debes ingresar la cantidad"];
                }
                if (trim($value["peso"]) == '') {
                    $errors["peso_" . $key] = ["Debes ingresar el peso"];
                }
            }
        }
        return $errors;
    }
}
