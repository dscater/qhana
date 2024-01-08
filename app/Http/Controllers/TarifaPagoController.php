<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\TarifaDetalle;
use App\Models\TarifaPago;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class TarifaPagoController extends Controller
{
    public $validacion = [
        'cliente_id' => 'required',
        'solicitud_pedido_id' => 'required',
    ];

    public $mensajes = [
        'cliente_id.required' => 'Este campo es obligatorio',
        'solicitud_pedido_id.required' => 'Este campo es obligatorio',
    ];

    public function index(Request $request)
    {
        $tarifa_pagos = TarifaPago::with(["cliente", "solicitud_pedido", "tarifa_detalles.solicitud_detalle"])->orderBy("id", "desc")->get();
        return response()->JSON(['tarifa_pagos' => $tarifa_pagos, 'total' => count($tarifa_pagos)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);

        if (!isset($request->tarifa_detalles) || !$request->tarifa_detalles || count($request->tarifa_detalles) <= 0) {
            throw new Exception("La solicitud seleccionada no tiene productos asignados");
        }
        $errors = self::validarArray($request["tarifa_detalles"]);
        if (count($errors) > 0) {
            return response()->JSON([
                "errors" => $errors
            ], 422);
        }

        $request["fecha_registro"] = date("Y-m-d");

        DB::beginTransaction();
        try {
            // crear el TarifaPago
            $nueva_tarifa_pago = TarifaPago::create(array_map('mb_strtoupper', $request->except("tarifa_detalles")));
            $datos_original = HistorialAccion::getDetalleRegistro($nueva_tarifa_pago, "tarifa_pagos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->tarifa_pago . ' REGISTRO UNA TARIFA DE PAGO',
                'datos_original' => $datos_original,
                'modulo' => 'TARIFA DE PAGOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            $tarifa_detalles = $request->tarifa_detalles;
            foreach ($tarifa_detalles as $value) {
                // registrar recepcion detalle
                $nueva_tarifa_pago->tarifa_detalles()->create([
                    "solicitud_detalle_id" => $value["solicitud_detalle_id"],
                    "cantidad" => $value["cantidad"],
                    "peso" => $value["peso"],
                    "mano_obra" => $value["mano_obra"],
                    "mano_obra_pagar" => $value["mano_obra_pagar"],
                    "depreciacion" => $value["depreciacion"],
                    "depreciacion_pagar" => $value["depreciacion_pagar"],
                    "ganancia" => $value["ganancia"],
                    "ganancia_pagar" => $value["ganancia_pagar"],
                ]);
            }

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'tarifa_pago' => $nueva_tarifa_pago,
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

    public function update(Request $request, TarifaPago $tarifa_pago)
    {
        $request->validate($this->validacion, $this->mensajes);
        if (!isset($request->tarifa_detalles) || !$request->tarifa_detalles || count($request->tarifa_detalles) <= 0) {
            throw new Exception("Debes ingresar al menos un producto");
        }
        $errors = self::validarArray($request["tarifa_detalles"]);
        if (count($errors) > 0) {
            return response()->JSON([
                "errors" => $errors
            ], 422);
        }
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($tarifa_pago, "tarifa_pagos");
            $tarifa_pago->update(array_map('mb_strtoupper', $request->except("tarifa_detalles", "solicitud_pedido", "cliente")));
            $datos_nuevo = HistorialAccion::getDetalleRegistro($tarifa_pago, "tarifa_pagos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->tarifa_pago . ' MODIFICÓ UNA TARIFA DE PAGO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'TARIFA DE PAGOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);
            $tarifa_detalles = $request->tarifa_detalles;
            foreach ($tarifa_detalles as $value) {
                // registrar recepcion detalle
                $tarifa_detalle = TarifaDetalle::find($value["id"]);
                if ($tarifa_detalle) {
                    $tarifa_detalle->update([
                        "solicitud_detalle_id" => $value["solicitud_detalle_id"],
                        "cantidad" => $value["cantidad"],
                        "peso" => $value["peso"],
                        "mano_obra" => $value["mano_obra"],
                        "mano_obra_pagar" => $value["mano_obra_pagar"],
                        "depreciacion" => $value["depreciacion"],
                        "depreciacion_pagar" => $value["depreciacion_pagar"],
                        "ganancia" => $value["ganancia"],
                        "ganancia_pagar" => $value["ganancia_pagar"],
                    ]);
                }
            }

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'tarifa_pago' => $tarifa_pago,
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
    public function show(TarifaPago $tarifa_pago)
    {
        return response()->JSON([
            'sw' => true,
            'tarifa_pago' => $tarifa_pago->load(["cliente", "solicitud_pedido", "tarifa_detalles.solicitud_detalle"])
        ], 200);
    }
    public function destroy(TarifaPago $tarifa_pago)
    {
        DB::beginTransaction();
        try {
            $tarifa_pago->tarifa_detalles()->delete();
            $datos_original = HistorialAccion::getDetalleRegistro($tarifa_pago, "tarifa_pagos");
            $tarifa_pago->delete();

            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->tarifa_pago . ' ELIMINÓ UNA TARIFA DE PAGO',
                'datos_original' => $datos_original,
                'modulo' => 'TARIFA DE PAGOS',
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
            if (trim($value["mano_obra"]) == '' || !$value["mano_obra"]) {
                $errors["mano_obra_" . $key] = ["Debes ingresar la mano de obra"];
            }
            if (trim($value["depreciacion"]) == '' || !$value["depreciacion"]) {
                $errors["depreciacion_" . $key] = ["Debes ingresar la depreciación"];
            }
            if (trim($value["ganancia"]) == '' || !$value["ganancia"]) {
                $errors["ganancia_" . $key] = ["Debes ingresar la ganancia"];
            }
        }
        return $errors;
    }
}
