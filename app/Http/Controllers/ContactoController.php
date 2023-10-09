<?php

namespace App\Http\Controllers;

use App\Mail\EnvioCorreo;
use App\Models\Api;
use App\Models\Configuracion;
use App\Models\Contacto;
use App\Models\HistorialAccion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class ContactoController extends Controller
{
    public $validacion = [
        "direccion" => "required",
        "fonos" => "required",
        "correo" => "required|email",
    ];

    public $mensajes = [
        "direccion.required" => "Este campo es obligatorio",
        "fonos.required" => "Este campo es obligatorio",
        "correo.required" => "Este campo es obligatorio",
        "correo.email" => "Debes ingresar un correo valido",
    ];

    public function index(Request $request)
    {
        $contacto = Contacto::get()->first();
        return response()->JSON(['contacto' => $contacto, 200]);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear el Contacto
            $contacto = Contacto::get()->first();
            if (!$contacto) {
                $contacto = Contacto::create(array_map('mb_strtoupper', $request->all()));
            } else {
                $contacto->update(array_map('mb_strtoupper', $request->all()));
            }
            $contacto->correo = mb_strtolower($contacto->correo);
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

    public function enviarcorreo(Request $request)
    {
        $request->validate([
            "correo" => "required|email|min:4",
            "mensaje" => "required|min:4",
        ], [
            "correo.required" => "Este campo es obligatorio",
            "correo.email" => "Debes ingresar un correo valido",
            "correo.min" => "Debes ingresar al menos :min carácteres",
            "mensaje.required" => "Este campo es obligatorio",
            "mensaje.min" => "Debes ingresar al menos :min carácteres",
        ]);
        try {
            $configuracion = Configuracion::first();
            if ($configuracion) {
                $api = Api::first();
                if ($api) {
                    $name = $api->nombre;
                    $correo_envio = $api->correo;
                    $password = $api->password;
                } else {
                    $name = "QHANA";
                    $correo_envio = "correosyseventos@gmail.com";
                    $password = "gywdptczpyhtkghm";
                }

                // Configurar el servicio de correo con la configuración de Gmail dinámicamente
                Config::set([
                    'mail.mailers.smtp.host' => 'smtp.gmail.com',
                    'mail.mailers.smtp.port' => 465,
                    'mail.mailers.smtp.encryption' => "ssl",
                    'mail.mailers.smtp.username' => $correo_envio,
                    'mail.mailers.smtp.password' => $password,
                    'mail.from.address' => $correo_envio,
                    'mail.from.name' => $name,
                ]);

                // Llama a la clase de correo y envía la información
                Mail::to($configuracion->correo_pedido)
                    ->send(new EnvioCorreo($request->correo, $request->mensaje));

                Mail::to($configuracion->correo_pedido2)
                    ->send(new EnvioCorreo($request->correo, $request->mensaje));
            }
            return response()->JSON([
                "sw" => true,
                "message" => "Mensaje enviado con éxito",
            ], 200);
        } catch (\Exception $e) {
            return response()->JSON([
                "sw" => false,
                "message" => "Ocurrió un error: " . $e->getMessage(),
            ], 500);
        }
    }
}
