<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\IngresoMaterial;
use App\Models\Material;
use App\Models\SalidaMaterial;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class MaterialController extends Controller
{
    public $validacion = [
        'nombre' => 'required|min:2',
        'descripcion' => 'required|min:2',
    ];

    public $mensajes = [
        'nombre.required' => 'Este campo es obligatorio',
        'nombre.min' => 'Debes ingresar al menos :min caracteres',
        'descripcion.required' => 'Este campo es obligatorio',
        'descripcion.min' => 'Debes ingresar al menos :min caracteres',
    ];

    public function index(Request $request)
    {
        $materials = Material::orderBy("id", "desc")->get();
        return response()->JSON(['materials' => $materials, 'total' => count($materials)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        $request["fecha_registro"] = date("Y-m-d");
        DB::beginTransaction();
        try {
            // crear el Material
            $nuevo_material = Material::create(array_map('mb_strtoupper', $request->all()));
            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_material, "materials");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->material . ' REGISTRO UN MATERIAL',
                'datos_original' => $datos_original,
                'modulo' => 'MATERIALES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'material' => $nuevo_material,
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

    public function update(Request $request, Material $material)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($material, "materials");
            $material->update(array_map('mb_strtoupper', $request->all()));
            $datos_nuevo = HistorialAccion::getDetalleRegistro($material, "materials");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->material . ' MODIFICÓ UN MATERIAL',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'MATERIALES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'material' => $material,
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
    public function show(Material $material)
    {
        return response()->JSON([
            'sw' => true,
            'material' => $material
        ], 200);
    }
    public function destroy(Material $material)
    {
        DB::beginTransaction();
        try {
            $existe_uso = IngresoMaterial::where("material_id", $material->id)->get();
            if (count($existe_uso) > 0) {
                throw new Exception("No se puede eliminar el registro debido a que existen registros que lo usan");
            }
            $existe_uso = SalidaMaterial::where("material_id", $material->id)->get();
            if (count($existe_uso) > 0) {
                throw new Exception("No se puede eliminar el registro debido a que existen registros que lo usan");
            }
            $datos_original = HistorialAccion::getDetalleRegistro($material, "materials");
            $material->delete();

            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->material . ' ELIMINÓ UN MATERIAL',
                'datos_original' => $datos_original,
                'modulo' => 'MATERIALES',
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
