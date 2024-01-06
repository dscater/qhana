<?php

namespace App\Http\Controllers;

use App\Models\Catalogo;
use App\Models\HistorialAccion;
use App\Models\Producto;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CatalogoController extends Controller
{
    public $validacion = [
        'nombre' => 'required|min:4',
    ];

    public $mensajes = [
        'nombre.required' => 'Este campo es obligatorio',
    ];

    public function index(Request $request)
    {
        $catalogos = Catalogo::orderBy("id", "desc")->get();
        return response()->JSON(['catalogos' => $catalogos, 'total' => count($catalogos)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear el Catalogo
            $nuevo_catalogo = Catalogo::create(array_map('mb_strtoupper', $request->all()));
            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_catalogo, "catalogos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->catalogo . ' REGISTRO UN CATALOGO',
                'datos_original' => $datos_original,
                'modulo' => 'CATALOGOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'catalogo' => $nuevo_catalogo,
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

    public function update(Request $request, Catalogo $catalogo)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($catalogo, "catalogos");
            $catalogo->update(array_map('mb_strtoupper', $request->all()));
            $datos_nuevo = HistorialAccion::getDetalleRegistro($catalogo, "catalogos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->catalogo . ' MODIFICÓ UN CATALOGO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'CATALOGOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'catalogo' => $catalogo,
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
    public function show(Catalogo $catalogo)
    {
        return response()->JSON([
            'sw' => true,
            'catalogo' => $catalogo
        ], 200);
    }
    public function destroy(Catalogo $catalogo)
    {
        DB::beginTransaction();
        try {
            $tiene_productos = Producto::where("catalogo_id", $catalogo->id)->get();
            if (count($tiene_productos) > 0) {
                throw new Exception("No se puede eliminar el registro debido a que existen productos que lo usan");
            }

            $antiguo = $catalogo->foto;
            if ($antiguo != 'default.png') {
                \File::delete(public_path() . '/imgs/catalogos/' . $antiguo);
            }
            $datos_original = HistorialAccion::getDetalleRegistro($catalogo, "catalogos");
            $catalogo->delete();

            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->catalogo . ' ELIMINÓ UN CATALOGO',
                'datos_original' => $datos_original,
                'modulo' => 'CATALOGOS',
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
