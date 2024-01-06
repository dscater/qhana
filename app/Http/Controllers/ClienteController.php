<?php

namespace App\Http\Controllers;

use App\Models\SolicitudPedido;
use App\Models\Cliente;
use App\Models\HistorialAccion;
use App\Models\TarifaPago;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ClienteController extends Controller
{
    public $validacion = [
        'empresa' => 'required|min:2',
        'nombre_encargado' => 'required|min:2',
        'fonos' => 'required|min:2',
    ];

    public $mensajes = [
        'empresa.required' => 'Este campo es obligatorio',
        'empresa.min' => 'Debes ingresar al menos :min caracteres',
        'nombre_encargado.required' => 'Este campo es obligatorio',
        'nombre_encargado.min' => 'Debes ingresar al menos :min caracteres',
        'fonos.required' => 'Este campo es obligatorio',
        'fonos.min' => 'Debes ingresar al menos :min caracteres',
    ];

    public function index(Request $request)
    {
        $clientes = Cliente::orderBy("id", "desc")->get();
        return response()->JSON(['clientes' => $clientes, 'total' => count($clientes)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        $request["fecha_registro"] = date("Y-m-d");
        DB::beginTransaction();
        try {
            // crear el Cliente
            $nuevo_cliente = Cliente::create(array_map('mb_strtoupper', $request->all()));
            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_cliente, "clientes");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->cliente . ' REGISTRO UN CLIENTE',
                'datos_original' => $datos_original,
                'modulo' => 'CLIENTES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'cliente' => $nuevo_cliente,
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

    public function update(Request $request, Cliente $cliente)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($cliente, "clientes");
            $cliente->update(array_map('mb_strtoupper', $request->all()));
            $datos_nuevo = HistorialAccion::getDetalleRegistro($cliente, "clientes");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->cliente . ' MODIFICÓ UN CLIENTE',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'CLIENTES',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'cliente' => $cliente,
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
    public function show(Cliente $cliente)
    {
        return response()->JSON([
            'sw' => true,
            'cliente' => $cliente
        ], 200);
    }
    public function destroy(Cliente $cliente)
    {
        DB::beginTransaction();
        try {
            $existe_uso = SolicitudPedido::where("cliente_id", $cliente->id)->get();
            if (count($existe_uso) > 0) {
                throw new Exception("No se puede eliminar el registro debido a que existen registros que lo usan");
            }
            $existe_uso = TarifaPago::where("cliente_id", $cliente->id)->get();
            if (count($existe_uso) > 0) {
                throw new Exception("No se puede eliminar el registro debido a que existen registros que lo usan");
            }

            $antiguo = $cliente->foto;
            if ($antiguo != 'default.png') {
                \File::delete(public_path() . '/imgs/clientes/' . $antiguo);
            }
            $datos_original = HistorialAccion::getDetalleRegistro($cliente, "clientes");
            $cliente->delete();

            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->cliente . ' ELIMINÓ UN CLIENTE',
                'datos_original' => $datos_original,
                'modulo' => 'CLIENTES',
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
