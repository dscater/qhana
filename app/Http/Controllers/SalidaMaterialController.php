<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\Material;
use App\Models\MovimientoMaterial;
use App\Models\SalidaMaterial;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SalidaMaterialController extends Controller
{
    public $validacion = [
        'material_id' => 'required',
        'cantidad' => 'required',
        'fecha_salida' => 'required|date',
    ];

    public $mensajes = [
        'material_id.required' => 'Este campo es obligatorio',
        'cantidad.required' => 'Este campo es obligatorio',
        'fecha_salida.required' => 'Este campo es obligatorio',
        'fecha_salida.date' => 'Debes ingresar una fecha valida',
    ];

    public function index(Request $request)
    {
        $salida_materials = SalidaMaterial::with(["material"])->orderBy("id", "desc")->get();
        return response()->JSON(['salida_materials' => $salida_materials, 'total' => count($salida_materials)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        $request["fecha_registro"] = date("Y-m-d");
        DB::beginTransaction();
        try {
            // VALIDAR STOCK
            $material = Material::findOrFail($request->material_id);
            if ($material->stock < $request->cantidad) {
                throw new Exception("No es posible registrar la salida debido a que la cantidad ingresada supera al stock actual de: " . $material->stock);
            }

            // crear el SalidaMaterial
            $nueva_salida_material = SalidaMaterial::create(array_map('mb_strtoupper', $request->all()));
            $datos_original = HistorialAccion::getDetalleRegistro($nueva_salida_material, "salida_materials");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->salida_material . ' REGISTRO UNA SALIDA DE MATERIAL',
                'datos_original' => $datos_original,
                'modulo' => 'SALIDA DE MATERIAL',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            // ACTUALIZAR STOCK
            $nueva_salida_material->material->stock = $nueva_salida_material->material->stock - $nueva_salida_material->cantidad;
            $nueva_salida_material->material->save();

            // REGISTRAR MOVIMIENTO
            MovimientoMaterial::create([
                "registro_id" => $nueva_salida_material->id,
                "tipo" => "SALIDA",
                "cantidad" => $nueva_salida_material->cantidad,
                "fecha_registro" => date("Y-m-d"),
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'salida_material' => $nueva_salida_material,
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

    public function update(Request $request, SalidaMaterial $salida_material)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // REINICIAR CANTIDAD
            $salida_material->material->stock = $salida_material->material->stock + $salida_material->cantidad;
            $salida_material->material->save();

            // VALIDAR STOCK
            $material = $salida_material->material;
            if ($material->stock < $request->cantidad) {
                throw new Exception("No es posible registrar la salida debido a que la cantidad ingresada supera al stock actual de: " . $material->stock);
            }

            // BUSCAR MOVIMIENTO
            $movimiento = MovimientoMaterial::where("tipo", "SALIDA")->where("registro_id", $salida_material->id)->get()->first();
            if (!$movimiento) {
                // REGISTRAR MOVIMIENTO
                $movimiento = MovimientoMaterial::create([
                    "registro_id" => $salida_material->id,
                    "tipo" => "SALIDA",
                    "cantidad" => $salida_material->cantidad,
                    "fecha_registro" => date("Y-m-d"),
                ]);
            }

            $datos_original = HistorialAccion::getDetalleRegistro($salida_material, "salida_materials");
            $salida_material->update(array_map('mb_strtoupper', $request->all()));
            $datos_nuevo = HistorialAccion::getDetalleRegistro($salida_material, "salida_materials");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->salida_material . ' MODIFICÓ UNA SALIDA DE MATERIAL',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'SALIDA DE MATERIALS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            // ACTUALIZAR STOCK
            $salida_material->material->stock = $salida_material->material->stock - $salida_material->cantidad;
            $salida_material->material->save();
            // ACTUALIZAR MOVIMIENTO
            $movimiento->update([
                "cantidad" => $salida_material->cantidad,
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'salida_material' => $salida_material,
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
    public function show(SalidaMaterial $salida_material)
    {
        return response()->JSON([
            'sw' => true,
            'salida_material' => $salida_material
        ], 200);
    }
    public function destroy(SalidaMaterial $salida_material)
    {
        DB::beginTransaction();
        try {
            $movimiento = MovimientoMaterial::where("tipo", "SALIDA")->where("registro_id", $salida_material->id)->get()->first();
            if ($movimiento) {
                $movimiento->delete();
            }
            $salida_material->material->stock = $salida_material->material->stock + $salida_material->cantidad;
            $salida_material->material->save();
            $datos_original = HistorialAccion::getDetalleRegistro($salida_material, "salida_materials");
            $salida_material->delete();

            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->salida_material . ' ELIMINÓ UNA SALIDA DE MATERIAL',
                'datos_original' => $datos_original,
                'modulo' => 'SALIDA DE MATERIALS',
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
