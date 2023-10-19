<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\Repositorio;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class RepositorioController extends Controller
{
    public $validacion = [
        'descripcion' => 'required|min:2',
    ];

    public $mensajes = [
        'descripcion.required' => 'Este campo es obligatorio',
        'descripcion.min' => 'Debes ingressar al menos 2 carácteres',
    ];
    public function index(Request $request)
    {
        $repositorios = Repositorio::with(["repositorio_archivos"])->get();
        return response()->JSON(['repositorios' => $repositorios, 'total' => count($repositorios)], 200);
    }
    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear el Repositorio
            $nuevo_repositorio = Repositorio::create(array_map('mb_strtoupper', $request->all()));

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_repositorio, "repositorios");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->repositorio . ' REGISTRO UN REPOSITORIO',
                'datos_original' => $datos_original,
                'modulo' => 'REPOSITORIOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'repositorio' => $nuevo_repositorio,
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

    public function update(Request $request, Repositorio $repositorio)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($repositorio, "repositorios");
            $repositorio->update(array_map('mb_strtoupper', $request->all()));

            $datos_nuevo = HistorialAccion::getDetalleRegistro($repositorio, "repositorios");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->repositorio . ' MODIFICÓ UN REPOSITORIO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'REPOSITORIOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'repositorio' => $repositorio,
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
    public function show(Repositorio $repositorio)
    {
        return response()->JSON([
            'sw' => true,
            'repositorio' => $repositorio->load("repositorio_archivos")
        ], 200);
    }

    public function destroy(Repositorio $repositorio)
    {
        DB::beginTransaction();
        try {
            foreach ($repositorio->repositorio_archivos as $ra) {
                \File::delete(public_path("files/" . $ra->archivo));
                $ra->delete();
            }

            $datos_original = HistorialAccion::getDetalleRegistro($repositorio, "repositorios");
            $repositorio->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->repositorio . ' ELIMINÓ UN REPOSITORIO',
                'datos_original' => $datos_original,
                'modulo' => 'REPOSITORIOS',
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
