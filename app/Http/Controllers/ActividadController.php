<?php

namespace App\Http\Controllers;

use App\Models\Actividad;
use App\Models\HistorialAccion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ActividadController extends Controller
{
    public $validacion = [
        'descripcion' => 'required|min:4',
    ];

    public $mensajes = [
        'imagen.required' => 'Debes seleccionar una imagen',
        'imagen.mimes' => 'Debes seleccionar una imagen con un formato :mimes',
        'imagen.max' => 'Debes seleccionar una imagen que no pese mas de :max',
        'descripcion.required' => 'Este campo es obligatorio',
        'descripcion.min' => 'Debes ingresar un texto de al menos :min carácteres',
    ];

    public function index(Request $request)
    {
        $actividads = Actividad::orderBy("id", "desc")->get();
        return response()->JSON(['actividads' => $actividads, 'total' => count($actividads)], 200);
    }

    public function ultimaActividad()
    {
        $actividad = Actividad::orderBy("id", "asc")->get()->last();
        return response()->JSON(['actividad' => $actividad], 200);
    }

    public function ultimasActividades()
    {
        $actividads = Actividad::orderBy("id", "desc")->get()->take(3);
        return response()->JSON(['actividads' => $actividads], 200);
    }

    public function store(Request $request)
    {
        $this->validacion['imagen'] = 'required|mimes:jpeg,jpg,png,webp|max:4096';
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear el Actividad
            $file_imagen = $request->imagen;
            $request["imagen"] = "default.png";
            $request["mostrar_boton"] = (int)$request["mostrar_boton"];
            $nuevo_actividad = Actividad::create(array_map('mb_strtoupper', $request->all()));
            // cargando imagen
            $nom_imagen = time() . '_' . $nuevo_actividad->id . '.' . $file_imagen->getClientOriginalExtension();
            $nuevo_actividad->imagen = $nom_imagen;
            $file_imagen->move(public_path() . '/imgs/actividads/', $nom_imagen);
            $nuevo_actividad->save();

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_actividad, "actividads");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UNA ACTIVIDAD',
                'datos_original' => $datos_original,
                'modulo' => 'ACTIVIDADES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'actividad' => $nuevo_actividad,
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

    public function show(Actividad $actividad)
    {
        return response()->JSON(["actividad" => $actividad]);
    }

    public function update(Request $request, Actividad $actividad)
    {
        if ($request->hasFile("imagen")) {
            $this->validacion['imagen'] = 'required|mimes:jpeg,jpg,png,webp|max:4096';
        }

        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($actividad, "actividads");
            $request["mostrar_boton"] = (int)$request["mostrar_boton"];
            $actividad->update(array_map('mb_strtoupper', $request->except("imagen")));

            if ($request->hasFile("imagen")) {
                $antiguo = $actividad->imagen;
                if ($antiguo != 'default.png') {
                    \File::delete(public_path() . '/imgs/actividads/' . $antiguo);
                }
                $file_imagen = $request->imagen;
                $nom_imagen = time() . '_' . $actividad->id . '.' . $file_imagen->getClientOriginalExtension();
                $actividad->imagen = $nom_imagen;
                $file_imagen->move(public_path() . '/imgs/actividads/', $nom_imagen);
            }
            $actividad->save();

            $datos_nuevo = HistorialAccion::getDetalleRegistro($actividad, "actividads");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UNA ACTIVIDAD',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'ACTIVIDADES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'actividad' => $actividad,
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
    public function destroy(Actividad $actividad)
    {
        DB::beginTransaction();
        try {
            $antiguo = $actividad->imagen;
            if ($antiguo != 'default.png') {
                \File::delete(public_path() . '/imgs/actividads/' . $antiguo);
            }
            $datos_original = HistorialAccion::getDetalleRegistro($actividad, "actividads");
            $actividad->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UNA ACTIVIDAD',
                'datos_original' => $datos_original,
                'modulo' => 'ACTIVIDADES',
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
