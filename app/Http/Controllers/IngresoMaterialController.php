<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\IngresoMaterial;
use App\Models\MovimientoMaterial;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class IngresoMaterialController extends Controller
{
    public $validacion = [
        'material_id' => 'required',
        'cantidad' => 'required',
        'fecha_ingreso' => 'required|date',
    ];

    public $mensajes = [
        'material_id.required' => 'Este campo es obligatorio',
        'cantidad.required' => 'Este campo es obligatorio',
        'fecha_ingreso.required' => 'Este campo es obligatorio',
        'fecha_ingreso.date' => 'Debes ingresar una fecha valida',
    ];

    public function index(Request $request)
    {
        $ingreso_materials = IngresoMaterial::with(["material"])->orderBy("id", "desc")->get();
        return response()->JSON(['ingreso_materials' => $ingreso_materials, 'total' => count($ingreso_materials)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        $request["fecha_registro"] = date("Y-m-d");
        DB::beginTransaction();
        try {
            // crear el IngresoMaterial
            $nuevo_ingreso_material = IngresoMaterial::create(array_map('mb_strtoupper', $request->all()));
            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_ingreso_material, "ingreso_materials");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->ingreso_material . ' REGISTRO EL INGRESO DE UN MATERIAL',
                'datos_original' => $datos_original,
                'modulo' => 'INGRESO DE MATERIAL',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            // ACTUALIZAR STOCK
            $nuevo_ingreso_material->material->stock = $nuevo_ingreso_material->material->stock + $nuevo_ingreso_material->cantidad;
            $nuevo_ingreso_material->material->save();

            // REGISTRAR MOVIMIENTO
            MovimientoMaterial::create([
                "registro_id" => $nuevo_ingreso_material->id,
                "tipo" => "INGRESO",
                "cantidad" => $nuevo_ingreso_material->cantidad,
                "fecha_registro" => date("Y-m-d"),
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'ingreso_material' => $nuevo_ingreso_material,
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

    public function update(Request $request, IngresoMaterial $ingreso_material)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {

            // REINICIAR CANTIDAD
            $ingreso_material->material->stock = $ingreso_material->material->stock - $ingreso_material->cantidad;
            $ingreso_material->material->save();

            // BUSCAR MOVIMIENTO
            $movimiento = MovimientoMaterial::where("tipo", "INGRESO")->where("registro_id", $ingreso_material->id)->get()->first();
            if (!$movimiento) {
                // REGISTRAR MOVIMIENTO
                $movimiento = MovimientoMaterial::create([
                    "registro_id" => $ingreso_material->id,
                    "tipo" => "INGRESO",
                    "cantidad" => $ingreso_material->cantidad,
                    "fecha_registro" => date("Y-m-d"),
                ]);
            }

            $datos_original = HistorialAccion::getDetalleRegistro($ingreso_material, "ingreso_materials");
            $ingreso_material->update(array_map('mb_strtoupper', $request->all()));
            $datos_nuevo = HistorialAccion::getDetalleRegistro($ingreso_material, "ingreso_materials");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->ingreso_material . ' MODIFICÓ EL INGRESO DE UN MATERIAL',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'INGRESO DE MATERIAL',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            // ACTUALIZAR STOCK
            $ingreso_material->material->stock = $ingreso_material->material->stock + $ingreso_material->cantidad;
            $ingreso_material->material->save();
            // ACTUALIZAR MOVIMIENTO
            $movimiento->update([
                "cantidad" => $ingreso_material->cantidad,
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'ingreso_material' => $ingreso_material,
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
    public function show(IngresoMaterial $ingreso_material)
    {
        return response()->JSON([
            'sw' => true,
            'ingreso_material' => $ingreso_material
        ], 200);
    }
    public function destroy(IngresoMaterial $ingreso_material)
    {
        DB::beginTransaction();
        try {
            $movimiento = MovimientoMaterial::where("tipo", "INGRESO")->where("registro_id", $ingreso_material->id)->get()->first();
            if ($movimiento) {
                $movimiento->delete();
            }
            $ingreso_material->material->stock = $ingreso_material->material->stock - $ingreso_material->cantidad;
            $ingreso_material->material->save();
            $datos_original = HistorialAccion::getDetalleRegistro($ingreso_material, "ingreso_materials");
            $ingreso_material->delete();

            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->ingreso_material . ' ELIMINÓ EL INGRESO DE UN MATERIAL',
                'datos_original' => $datos_original,
                'modulo' => 'INGRESO DE MATERIAL',
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
