<?php

namespace App\Http\Controllers;

use App\Models\Contacto;
use Illuminate\Http\Request;

class ContactoController extends Controller
{
    public $validacion = [
        "direccion" => "required",
        "fonos" => "required",
        "correo" => "required|email",
        "mapa" => "required",
    ];

    public $mensajes = [
        "direccion.required" => "Este campo es obligatorio",
        "fonos.required" => "Este campo es obligatorio",
        "correo.required" => "Este campo es obligatorio",
        "correo.email" => "Debes ingresar un correo valido",
        "mapa.required" => "Este campo es obligatorio",
    ];

    public function index(Request $request)
    {
        $contacto = Contacto::get()->first();
        return response()->JSON(['contacto' => $contacto, 200]);
    }

    public function store(Request $request)
    {
        $this->validacion['imagen'] = 'required|mimes:jpeg,jpg,png,webp|max:4096';
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear el Contacto
            $contacto = Contacto::get()->first();
            if (!$contacto) {
                $contacto = Contacto::create(array_map('mb_strtoupper', $request->except("mapa")));
                $contacto->mapa = $request->mapa;
            } else {
                $contacto->update(array_map('mb_strtoupper', $request->except("mapa")));
                $contacto->mapa = $request->mapa;
            }
            $contacto->save();
            $datos_original = HistorialAccion::getDetalleRegistro($contacto, "contactos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ACTUALIZÓ LA SECCIÓN CONTACTOS',
                'datos_original' => $datos_original,
                'modulo' => 'CONTACTOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'contacto' => $contacto,
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
