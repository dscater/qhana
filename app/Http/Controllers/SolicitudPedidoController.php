<?php

namespace App\Http\Controllers;

use App\Models\DistribucionDetalle;
use App\Models\DistribucionPedido;
use App\Models\HistorialAccion;
use App\Models\RecepcionPedido;
use App\Models\SolicitudDetalle;
use App\Models\SolicitudPedido;
use App\Models\TarifaPago;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class SolicitudPedidoController extends Controller
{
    public $validacion = [
        'codigo' => 'required|min:2',
        'cliente_id' => 'required',
        'fecha_recepcion' => 'required|date',
    ];

    public $mensajes = [
        'codigo.required' => 'Este campo es obligatorio',
        'codigo.min' => 'Debes ingresar al menos :min caracteres',
        'cliente_id.required' => 'Este campo es obligatorio',
        'fecha_recepcion.required' => 'Este campo es obligatorio',
        'fecha_recepcion.date' => 'Debes ingresar una fecha valida',
    ];

    public function index(Request $request)
    {
        $solicitud_pedidos = SolicitudPedido::with(["cliente", "solicitud_detalles"])->orderBy("id", "desc")->get();
        return response()->JSON(['solicitud_pedidos' => $solicitud_pedidos, 'total' => count($solicitud_pedidos)], 200);
    }

    public function byUser(Request $request)
    {
        $solicitud_pedidos = SolicitudPedido::where("user_id", $request->user_id)->with(["cliente", "solicitud_detalles"])->orderBy("id", "desc")->get();
        return response()->JSON(['solicitud_pedidos' => $solicitud_pedidos, 'total' => count($solicitud_pedidos)], 200);
    }

    public function byCliente(Request $request)
    {
        $solicitud_pedidos = SolicitudPedido::where("cliente_id", $request->cliente_id)->with(["cliente", "solicitud_detalles"])->orderBy("id", "desc")->get();
        return response()->JSON(['solicitud_pedidos' => $solicitud_pedidos, 'total' => count($solicitud_pedidos)], 200);
    }


    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);

        if (!isset($request->solicitud_detalles) || !$request->solicitud_detalles || count($request->solicitud_detalles) <= 0) {
            throw new Exception("Debes ingresar al menos un producto");
        }
        $errors = self::validarArray($request["solicitud_detalles"]);
        if (count($errors) > 0) {
            return response()->JSON([
                "errors" => $errors
            ], 422);
        }
        $request["fecha_registro"] = date("Y-m-d");

        DB::beginTransaction();
        try {
            // crear el SolicitudPedido
            $nueva_solicitud_pedido = SolicitudPedido::create(array_map('mb_strtoupper', $request->except("solicitud_detalles")));
            $datos_original = HistorialAccion::getDetalleRegistro($nueva_solicitud_pedido, "solicitud_pedidos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->solicitud_pedido . ' REGISTRO UNA SOLICITUD DE PEDIDO',
                'datos_original' => $datos_original,
                'modulo' => 'SOLICITUD DE PEDIDOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            $solicitud_detalles = $request->solicitud_detalles;
            $total_cantidad_resante = 0;
            $total_peso_resante = 0;
            foreach ($solicitud_detalles as $value) {
                $nueva_solicitud_pedido->solicitud_detalles()->create([
                    "codigo" => mb_strtoupper($value["codigo"]),
                    "descripcion" => mb_strtoupper($value["descripcion"]),
                    "talla" => mb_strtoupper($value["talla"]),
                    "cantidad" => $value["cantidad"],
                    "cantidad_restante" => $value["cantidad"],
                    "elaborado" => mb_strtoupper($value["elaborado"]),
                    "titulo" => mb_strtoupper($value["titulo"]),
                    "codigo_color" => mb_strtoupper($value["codigo_color"]),
                    "peso" => $value["peso"],
                    "peso_restante" => $value["peso"],
                ]);
                $total_cantidad_resante += (float)$value["cantidad"];
                $total_peso_resante += (float)$value["peso"];
            }

            $nueva_solicitud_pedido->cantidad_restante = $total_cantidad_resante;
            $nueva_solicitud_pedido->peso_restante = $total_peso_resante;
            $nueva_solicitud_pedido->save();

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'solicitud_pedido' => $nueva_solicitud_pedido,
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

    public function update(Request $request, SolicitudPedido $solicitud_pedido)
    {
        $request->validate($this->validacion, $this->mensajes);
        if (!isset($request->solicitud_detalles) || !$request->solicitud_detalles || count($request->solicitud_detalles) <= 0) {
            throw new Exception("Debes ingresar al menos un producto");
        }
        $errors = self::validarArray($request["solicitud_detalles"]);
        if (count($errors) > 0) {
            return response()->JSON([
                "errors" => $errors
            ], 422);
        }
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($solicitud_pedido, "solicitud_pedidos");
            $solicitud_pedido->update(array_map('mb_strtoupper', $request->except("solicitud_detalles", "eliminados")));
            $datos_nuevo = HistorialAccion::getDetalleRegistro($solicitud_pedido, "solicitud_pedidos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->solicitud_pedido . ' MODIFICÓ UNA SOLICITUD DE PEDIDO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'SOLICITUD DE PEDIDOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);


            if (isset($request->eliminados)) {
                $eliminados = $request->eliminados;
                foreach ($eliminados as $value) {
                    $solicitud_detalle = SolicitudDetalle::findOrFail($value);
                    $solicitud_detalle->delete();
                }
            }

            $solicitud_detalles = $request->solicitud_detalles;
            $total_cantidad_resante = 0;
            $total_peso_resante = 0;
            foreach ($solicitud_detalles as $value) {
                if ($value["id"] != 0) {
                    $solicitud_detalle = SolicitudDetalle::findOrFail($value["id"]);
                    $solicitud_detalle->update([
                        "codigo" => mb_strtoupper($value["codigo"]),
                        "descripcion" => mb_strtoupper($value["descripcion"]),
                        "talla" => mb_strtoupper($value["talla"]),
                        "cantidad" => $value["cantidad"],
                        "elaborado" => mb_strtoupper($value["elaborado"]),
                        "titulo" => mb_strtoupper($value["titulo"]),
                        "codigo_color" => mb_strtoupper($value["codigo_color"]),
                        "peso" => $value["peso"],
                    ]);

                    $suma_cantidad_distribucion = DistribucionDetalle::where("solicitud_detalle_id", $solicitud_detalle->id)->sum("cantidad");
                    $suma_peso_distribucion = DistribucionDetalle::where("solicitud_detalle_id", $solicitud_detalle->id)->sum("peso");

                    if ($suma_cantidad_distribucion > $solicitud_detalle->cantidad) {
                        throw new Exception("No es posible actualizar el producto con código <strong>" . $solicitud_detalle->codigo . "</strong>, debido a que existe una o varias distribuciones y la suma de la cantidad (" . $suma_cantidad_distribucion . ") de estas supera a la cantidad ingresada de: " . $solicitud_detalle->cantidad);
                    }
                    if ($suma_peso_distribucion > $solicitud_detalle->peso) {
                        throw new Exception("No es posible actualizar el producto con código <strong>" . $solicitud_detalle->codigo . "</strong>, debido a que existe una o varias distribuciones y la suma del peso (" . $suma_peso_distribucion . ") de estas supera al peso ingresado de: " . $solicitud_detalle->peso);
                    }

                    if ($suma_cantidad_distribucion > 0) {
                        $solicitud_detalle->update([
                            "cantidad_restante" => $solicitud_detalle->cantidad - $suma_cantidad_distribucion,
                        ]);
                    } else {
                        $solicitud_detalle->update([
                            "cantidad_restante" => $value["cantidad"],
                        ]);
                    }
                    if ($suma_peso_distribucion > 0) {
                        $solicitud_detalle->update([
                            "peso_restante" => $solicitud_detalle->peso - $suma_peso_distribucion,
                        ]);
                    } else {
                        $solicitud_detalle->update([
                            "peso_restante" => $value["peso"],
                        ]);
                    }
                    $total_cantidad_resante += (float)$solicitud_detalle["cantidad_restante"];
                    $total_peso_resante += (float)$solicitud_detalle["peso_restante"];
                } else {
                    $solicitud_pedido->solicitud_detalles()->create([
                        "codigo" => mb_strtoupper($value["codigo"]),
                        "descripcion" => mb_strtoupper($value["descripcion"]),
                        "talla" => mb_strtoupper($value["talla"]),
                        "cantidad" => $value["cantidad"],
                        "cantidad_restante" => $value["cantidad"],
                        "elaborado" => mb_strtoupper($value["elaborado"]),
                        "titulo" => mb_strtoupper($value["titulo"]),
                        "codigo_color" => mb_strtoupper($value["codigo_color"]),
                        "peso" => $value["peso"],
                        "peso_restante" => $value["peso"],
                    ]);
                    $total_cantidad_resante += (float)$value["cantidad"];
                    $total_peso_resante += (float)$value["peso"];
                }
            }
            $solicitud_pedido->cantidad_restante = $total_cantidad_resante;
            $solicitud_pedido->peso_restante = $total_peso_resante;
            $solicitud_pedido->save();
            DB::commit();
            return response()->JSON([
                'sw' => true,
                'solicitud_pedido' => $solicitud_pedido,
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
    public function show(SolicitudPedido $solicitud_pedido)
    {
        return response()->JSON([
            'sw' => true,
            'solicitud_pedido' => $solicitud_pedido->load(["solicitud_detalles"])
        ], 200);
    }
    public function destroy(SolicitudPedido $solicitud_pedido)
    {
        DB::beginTransaction();
        try {
            $existe_registros = DistribucionPedido::where("solicitud_pedido_id", $solicitud_pedido->id)->get();
            if (count($existe_registros) > 0) {
                throw new Exception("No se puede eliminar el registro debido a que existen registros que lo usan");
            }
            $existe_registros = RecepcionPedido::where("solicitud_pedido_id", $solicitud_pedido->id)->get();
            if (count($existe_registros) > 0) {
                throw new Exception("No se puede eliminar el registro debido a que existen registros que lo usan");
            }
            $existe_registros = TarifaPago::where("solicitud_pedido_id", $solicitud_pedido->id)->get();
            if (count($existe_registros) > 0) {
                throw new Exception("No se puede eliminar el registro debido a que existen registros que lo usan");
            }

            $solicitud_pedido->solicitud_detalles()->delete();
            $datos_original = HistorialAccion::getDetalleRegistro($solicitud_pedido, "solicitud_pedidos");
            $solicitud_pedido->delete();

            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->solicitud_pedido . ' ELIMINÓ UNA SOLICITUD DE PEDIDO',
                'datos_original' => $datos_original,
                'modulo' => 'SOLICITUD DE PEDIDOS',
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
        // Log::debug($array);
        foreach ($array as $key => $value) {
            if (trim($value["codigo"]) == '' || !$value["codigo"]) {
                $errors["codigo_" . $key] = ["Debes ingresar el código"];
            }
            if (trim($value["descripcion"]) == '' || !$value["descripcion"]) {
                $errors["descripcion_" . $key] = ["Debes ingresar la descripción"];
            }
            if (trim($value["talla"]) == '' || !$value["talla"]) {
                $errors["talla_" . $key] = ["Debes ingresar la talla"];
            }
            if (trim($value["cantidad"]) == '' || !$value["cantidad"]) {
                $errors["cantidad_" . $key] = ["Debes ingresar la cantidad"];
            }
            if (trim($value["elaborado"]) == '' || !$value["elaborado"]) {
                $errors["elaborado_" . $key] = ["Debes ingresar la forma de elaboración"];
            }
            if (trim($value["titulo"]) == '' || !$value["titulo"]) {
                $errors["titulo_" . $key] = ["Debes ingresar el título"];
            }
            if (trim($value["codigo_color"]) == '' || !$value["codigo_color"]) {
                $errors["codigo_color_" . $key] = ["Debes ingresar el código de color"];
            }
            if (trim($value["peso"]) == '' || !$value["peso"]) {
                $errors["peso_" . $key] = ["Debes ingresar el peso"];
            }
        }
        return $errors;
    }
}
