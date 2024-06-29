<?php

namespace App\Http\Controllers;

use App\Models\AdminProducto;
use App\Models\HistorialAccion;
use App\Models\MovimientoProducto;
use App\Models\SalidaProducto;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use PDF;

class SalidaProductoController extends Controller
{
    public $validacion = [
        'admin_producto_id' => 'required',
        'fecha_salida' => 'required|date',
    ];

    public $mensajes = [
        'admin_producto_id.required' => 'Este campo es obligatorio',
        'cantidad.required' => 'Este campo es obligatorio',
        'cantidad_conos.required' => 'Este campo es obligatorio',
        'fecha_salida.required' => 'Este campo es obligatorio',
        'fecha_salida.date' => 'Debes ingresar una fecha valida',
    ];

    public function index(Request $request)
    {
        $salida_productos = SalidaProducto::with(["admin_producto", "user", "solicitud_pedido"])->orderBy("id", "desc")->get();
        return response()->JSON(['salida_productos' => $salida_productos, 'total' => count($salida_productos)], 200);
    }

    public function store(Request $request)
    {
        if (!isset($request->cantidad) && !isset($request->cantidad_conos)) {
            $this->validacion["cantidad"] = "required";
            $this->validacion["cantidad_conos"] = "required";
        }

        if (trim($request->cantidad) != '') {
            $this->validacion["cantidad"] = "required|numeric|min:1";
        } else {
            unset($request["cantidad"]);
        }

        if (trim($request->cantidad_conos) != '') {
            $this->validacion["cantidad_conos"] = "required|numeric|min:1";
        } else {
            unset($request["cantidad_conos"]);
        }

        $request->validate($this->validacion, $this->mensajes);


        $request["fecha_registro"] = date("Y-m-d");
        DB::beginTransaction();
        try {
            // VALIDAR STOCK
            $admin_producto = AdminProducto::findOrFail($request->admin_producto_id);
            if ($admin_producto->stock_kg < $request->cantidad) {
                throw new Exception("No es posible registrar la salida debido a que la cantidad ingresada supera al stock actual de: " . $admin_producto->stock_kg);
            }

            // crear el SalidaProducto
            $nuevo_salida_producto = SalidaProducto::create(array_map('mb_strtoupper', $request->all()));
            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_salida_producto, "salida_productos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->salida_producto . ' REGISTRO UNA SALIDA DE PRODUCTO',
                'datos_original' => $datos_original,
                'modulo' => 'SALIDA DE PRODUCTOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            // ACTUALIZAR STOCK
            $nuevo_salida_producto->admin_producto->stock_kg = $nuevo_salida_producto->admin_producto->stock_kg - $nuevo_salida_producto->cantidad;
            $nuevo_salida_producto->admin_producto->stock_conos = $nuevo_salida_producto->admin_producto->stock_conos - $nuevo_salida_producto->cantidad_conos;
            $nuevo_salida_producto->admin_producto->save();

            // REGISTRAR MOVIMIENTO
            MovimientoProducto::create([
                "registro_id" => $nuevo_salida_producto->id,
                "tipo" => "SALIDA",
                "cantidad" => $nuevo_salida_producto->cantidad ? $nuevo_salida_producto->cantidad : 0,
                "cantidad_conos" => $nuevo_salida_producto->cantidad_conos ? $nuevo_salida_producto->cantidad_conos : 0,
                "fecha_registro" => date("Y-m-d"),
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'salida_producto' => $nuevo_salida_producto,
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

    public function update(Request $request, SalidaProducto $salida_producto)
    {
        $request->validate($this->validacion, $this->mensajes);

        if (!$request->user_id) {
            unset($request["user_id"]);
        }
        if (!$request->solicitud_pedido_id) {
            unset($request["solicitud_pedido_id"]);
        }

        DB::beginTransaction();
        try {
            // REINICIAR CANTIDAD
            $salida_producto->admin_producto->stock_kg = $salida_producto->admin_producto->stock_kg + $salida_producto->cantidad;
            $salida_producto->admin_producto->stock_conos = $salida_producto->admin_producto->stock_conos + $salida_producto->cantidad_conos;
            $salida_producto->admin_producto->save();

            // VALIDAR STOCK
            $admin_producto = $salida_producto->admin_producto;
            if ($admin_producto->stock_kg < $request->cantidad) {
                throw new Exception("No es posible registrar la salida debido a que la cantidad ingresada supera al stock actual de: " . $admin_producto->stock_kg);
            }

            // BUSCAR MOVIMIENTO
            $movimiento = MovimientoProducto::where("tipo", "SALIDA")->where("registro_id", $salida_producto->id)->get()->first();
            if (!$movimiento) {
                // REGISTRAR MOVIMIENTO
                $movimiento = MovimientoProducto::create([
                    "registro_id" => $salida_producto->id,
                    "tipo" => "SALIDA",
                    "cantidad" => $salida_producto->cantidad,
                    "cantidad_conos" => $salida_producto->cantidad_conos,
                    "fecha_registro" => date("Y-m-d"),
                ]);
            }

            $datos_original = HistorialAccion::getDetalleRegistro($salida_producto, "salida_productos");
            $salida_producto->update(array_map('mb_strtoupper', $request->all()));
            if (!$request->user_id) {
                $salida_producto->user_id = null;
            }
            if (!$request->solicitud_pedido_id) {
                $salida_producto->solicitud_pedido_id = null;
            }
            $salida_producto->save();


            $datos_nuevo = HistorialAccion::getDetalleRegistro($salida_producto, "salida_productos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->salida_producto . ' MODIFICÓ UNA SALIDA DE PRODUCTO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'SALIDA DE PRODUCTOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            // ACTUALIZAR STOCK
            $salida_producto->admin_producto->stock_kg = $salida_producto->admin_producto->stock_kg - $salida_producto->cantidad;
            $salida_producto->admin_producto->stock_conos = $salida_producto->admin_producto->stock_conos - $salida_producto->cantidad_conos;
            $salida_producto->admin_producto->save();
            // ACTUALIZAR MOVIMIENTO
            $movimiento->update([
                "cantidad" => $salida_producto->cantidad ? $salida_producto->cantidad : 0,
                "cantidad_conos" => $salida_producto->cantidad_conos ? $salida_producto->cantidad_conos : 0,
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'salida_producto' => $salida_producto,
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
    public function show(SalidaProducto $salida_producto)
    {
        return response()->JSON([
            'sw' => true,
            'salida_producto' => $salida_producto
        ], 200);
    }

    public function pdf(SalidaProducto $salida_producto)
    {
        $pdf = PDF::loadView('reportes.salida_producto', compact('salida_producto'))->setPaper('letter', 'portrait');
        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->download('salida_producto.pdf');
    }

    public function destroy(SalidaProducto $salida_producto)
    {
        DB::beginTransaction();
        try {
            $movimiento = MovimientoProducto::where("tipo", "SALIDA")->where("registro_id", $salida_producto->id)->get()->first();
            if ($movimiento) {
                $movimiento->delete();
            }
            $salida_producto->admin_producto->stock_kg = $salida_producto->admin_producto->stock_kg + $salida_producto->cantidad;
            $salida_producto->admin_producto->stock_conos = $salida_producto->admin_producto->stock_conos + $salida_producto->cantidad_conos;
            $salida_producto->admin_producto->save();
            $datos_original = HistorialAccion::getDetalleRegistro($salida_producto, "salida_productos");
            $salida_producto->delete();

            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->salida_producto . ' ELIMINÓ UNA SALIDA DE PRODUCTO',
                'datos_original' => $datos_original,
                'modulo' => 'SALIDA DE PRODUCTOS',
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
