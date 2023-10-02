<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\Nosotros;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class NosotrosController extends Controller
{
    public $validacion = [];

    public $mensajes = [];

    public function index(Request $request)
    {
        $nosotros = Nosotros::get()->first();
        return response()->JSON(['nosotros' => $nosotros, 200]);
    }

    public function store(Request $request)
    {
        $this->validacion['imagen'] = 'required|mimes:jpeg,jpg,png,webp|max:4096';
        // $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear el Nosotros
            $nosotros = Nosotros::get()->first();
            if (!$nosotros) {
                $nosotros = Nosotros::create([
                    "historia" => "",
                    "mision" => "",
                    "vision" => "",
                ]);
            }
            $nosotros[$request->col] = mb_strtoupper($request[$request->col]);
            $nosotros->save();
            $datos_original = HistorialAccion::getDetalleRegistro($nosotros, "nosotros");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ACTUALIZÓ LA SECCIÓN NOSOTROS',
                'datos_original' => $datos_original,
                'modulo' => 'NOSOTROS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'nosotros' => $nosotros,
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
}
