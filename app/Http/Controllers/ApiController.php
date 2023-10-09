<?php

namespace App\Http\Controllers;

use App\Models\Api;
use App\Models\HistorialAccion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ApiController extends Controller
{
    public $validacion = [
        "correo" => "required|email",
        "nombre" => "required|min:4",
        "password" => "required|min:4",
        "api_google" => "required",
    ];

    public $mensajes = [
        "correo.required" => "Este campo es obligatorio",
        "correo.email" => "Debes ingresar un correo valido",
        "nombre.required" => "Este campo es obligatorio",
        "nombre.min" => "Debes ingresar al menos :min carácteres",
        "password.required" => "Este campo es obligatorio",
        "password.min" => "Debes ingresar al menos :min carácteres",
        "api_google.required" => "Este campo es obligatorio",
    ];

    public function index(Request $request)
    {
        $api = Api::get()->first();
        return response()->JSON(['api' => $api, 200]);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear el Api
            $api = Api::get()->first();
            if (!$api) {
                $api = Api::create($request->all());
            } else {
                $api->update($request->all());
            }
            $datos_original = HistorialAccion::getDetalleRegistro($api, "apis");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ACTUALIZÓ LA SECCIÓN APIS',
                'datos_original' => $datos_original,
                'modulo' => 'APIS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'api' => $api,
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
