<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\IngresoProducto;
use App\Models\MovimientoProducto;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class IngresoProductoController extends Controller
{
    public $validacion = [
        'admin_producto_id' => 'required',
        'cantidad' => 'required',
        'cantidad_conos' => 'required',
        'precio' => 'required|numeric|min:0',
        'fecha_ingreso' => 'required|date',
    ];

    public $mensajes = [
        'admin_producto_id.required' => 'Este campo es obligatorio',
        'cantidad.required' => 'Este campo es obligatorio',
        'cantidad_conos.required' => 'Este campo es obligatorio',
        'precio.required' => 'Este campo es obligatorio',
        'fecha_ingreso.required' => 'Este campo es obligatorio',
        'fecha_ingreso.date' => 'Debes ingresar una fecha valida',
    ];

    public function index(Request $request)
    {
        $ingreso_productos = IngresoProducto::with(["admin_producto"])->orderBy("id", "desc")->get();
        return response()->JSON(['ingreso_productos' => $ingreso_productos, 'total' => count($ingreso_productos)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        $request["fecha_registro"] = date("Y-m-d");
        DB::beginTransaction();
        try {
            // crear el IngresoProducto
            $nuevo_ingreso_producto = IngresoProducto::create(array_map('mb_strtoupper', $request->all()));
            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_ingreso_producto, "ingreso_productos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->ingreso_producto . ' REGISTRO EL INGRESO DE UN PRODUCTO',
                'datos_original' => $datos_original,
                'modulo' => 'INGRESO DE PRODUCTOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            // ACTUALIZAR STOCK
            $nuevo_ingreso_producto->admin_producto->stock_kg = $nuevo_ingreso_producto->admin_producto->stock_kg + $nuevo_ingreso_producto->cantidad;
            $nuevo_ingreso_producto->admin_producto->stock_conos = $nuevo_ingreso_producto->admin_producto->stock_conos + $nuevo_ingreso_producto->cantidad_conos;
            $nuevo_ingreso_producto->admin_producto->save();

            // REGISTRAR MOVIMIENTO
            MovimientoProducto::create([
                "registro_id" => $nuevo_ingreso_producto->id,
                "tipo" => "INGRESO",
                "cantidad" => $nuevo_ingreso_producto->cantidad,
                "cantidad_conos" => $nuevo_ingreso_producto->cantidad_conos,
                "fecha_registro" => date("Y-m-d"),
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'ingreso_producto' => $nuevo_ingreso_producto,
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

    public function update(Request $request, IngresoProducto $ingreso_producto)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {

            // REINICIAR CANTIDAD
            $ingreso_producto->admin_producto->stock_kg = $ingreso_producto->admin_producto->stock_kg - $ingreso_producto->cantidad;
            $ingreso_producto->admin_producto->stock_conos = $ingreso_producto->admin_producto->stock_conos - $ingreso_producto->cantidad_conos;
            $ingreso_producto->admin_producto->save();

            // BUSCAR MOVIMIENTO
            $movimiento = MovimientoProducto::where("tipo", "INGRESO")->where("registro_id", $ingreso_producto->id)->get()->first();
            if (!$movimiento) {
                // REGISTRAR MOVIMIENTO
                $movimiento = MovimientoProducto::create([
                    "registro_id" => $ingreso_producto->id,
                    "tipo" => "INGRESO",
                    "cantidad" => $ingreso_producto->cantidad,
                    "cantidad_conos" => $ingreso_producto->cantidad_conos,
                    "fecha_registro" => date("Y-m-d"),
                ]);
            }

            $datos_original = HistorialAccion::getDetalleRegistro($ingreso_producto, "ingreso_productos");
            $ingreso_producto->update(array_map('mb_strtoupper', $request->all()));
            $datos_nuevo = HistorialAccion::getDetalleRegistro($ingreso_producto, "ingreso_productos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->ingreso_producto . ' MODIFICÓ EL INGRESO DE UN PRODUCTO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'INGRESO DE PRODUCTOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            // ACTUALIZAR STOCK
            $ingreso_producto->admin_producto->stock_kg = $ingreso_producto->admin_producto->stock_kg + $ingreso_producto->cantidad;
            $ingreso_producto->admin_producto->stock_conos = $ingreso_producto->admin_producto->stock_conos + $ingreso_producto->cantidad_conos;
            $ingreso_producto->admin_producto->save();
            // ACTUALIZAR MOVIMIENTO
            $movimiento->update([
                "cantidad" => $ingreso_producto->cantidad,
                "cantidad_conos" => $ingreso_producto->cantidad_conos,
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'ingreso_producto' => $ingreso_producto,
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
    public function show(IngresoProducto $ingreso_producto)
    {
        return response()->JSON([
            'sw' => true,
            'ingreso_producto' => $ingreso_producto
        ], 200);
    }
    public function destroy(IngresoProducto $ingreso_producto)
    {
        DB::beginTransaction();
        try {
            $movimiento = MovimientoProducto::where("tipo", "INGRESO")->where("registro_id", $ingreso_producto->id)->get()->first();
            if ($movimiento) {
                $movimiento->delete();
            }
            $ingreso_producto->admin_producto->stock_kg = $ingreso_producto->admin_producto->stock_kg - $ingreso_producto->cantidad;
            $ingreso_producto->admin_producto->stock_conos = $ingreso_producto->admin_producto->stock_conos - $ingreso_producto->cantidad_conos;
            $ingreso_producto->admin_producto->save();
            $datos_original = HistorialAccion::getDetalleRegistro($ingreso_producto, "ingreso_productos");
            $ingreso_producto->delete();

            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->ingreso_producto . ' ELIMINÓ EL INGRESO DE UN PRODUCTO',
                'datos_original' => $datos_original,
                'modulo' => 'INGRESO DE PRODUCTOS',
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
}
