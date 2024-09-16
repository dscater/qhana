<?php

namespace App\Http\Controllers;

use App\Models\Caja;
use App\Models\Concepto;
use App\Models\HistorialAccion;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ConceptoController extends Controller
{
    public $validacion = [
        'nombre' => 'required|min:2|unique:conceptos,nombre',
    ];

    public $mensajes = [
        'nombre.required' => 'Este campo es obligatorio',
        'nombre.min' => 'Debes ingressar al menos 2 carácteres',
    ];
    public function index(Request $request)
    {
        $conceptos = [];
        if (isset($request->ordenado) && $request->ordenado) {
            $conceptos = Concepto::orderBy($request->col, $request->order)->get();
        } else {
            $conceptos = Concepto::all();
        }
        return response()->JSON(['conceptos' => $conceptos, 'total' => count($conceptos)], 200);
    }
    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear el Concepto
            $nuevo_concepto = Concepto::create(array_map('mb_strtoupper', $request->all()));

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_concepto, "conceptos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->concepto . ' REGISTRO UN CONCEPTO',
                'datos_original' => $datos_original,
                'modulo' => 'CONCEPTOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'concepto' => $nuevo_concepto,
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

    public function update(Request $request, Concepto $concepto)
    {
        $this->validacion["nombre"] = 'required|min:2|unique:conceptos,nombre,' . $concepto->id;
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($concepto, "conceptos");
            $concepto->update(array_map('mb_strtoupper', $request->all()));

            $datos_nuevo = HistorialAccion::getDetalleRegistro($concepto, "conceptos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->concepto . ' MODIFICÓ UN CONCEPTO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'CONCEPTOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'concepto' => $concepto,
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
    public function show(Concepto $concepto)
    {
        return response()->JSON([
            'sw' => true,
            'concepto' => $concepto->load("catalogo")
        ], 200);
    }

    public function destroy(Concepto $concepto)
    {
        DB::beginTransaction();
        try {
            $existe = Caja::where("concepto_id", $concepto->id)->get();
            if (count($existe) > 0) {
                throw new Exception("No se puede eliminar el registro " . $concepto->nombre . " porque esta siendo utilizado");
            }

            $datos_original = HistorialAccion::getDetalleRegistro($concepto, "conceptos");
            $concepto->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->concepto . ' ELIMINÓ UN CONCEPTO',
                'datos_original' => $datos_original,
                'modulo' => 'CONCEPTOS',
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
