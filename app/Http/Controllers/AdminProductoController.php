<?php

namespace App\Http\Controllers;

use App\Models\AdminProducto;
use App\Models\HistorialAccion;
use App\Models\IngresoProducto;
use App\Models\SalidaProducto;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AdminProductoController extends Controller
{
    public $validacion = [
        'codigo_color' => 'required|min:2',
        'descripcion' => 'required|min:2',
        'titulo' => 'required|min:2',
    ];

    public $mensajes = [
        'codigo_color.required' => 'Este campo es obligatorio',
        'codigo_color.min' => 'Debes ingresar al menos :min caracteres',
        'descripcion.required' => 'Este campo es obligatorio',
        'descripcion.min' => 'Debes ingresar al menos :min caracteres',
        'titulo.required' => 'Este campo es obligatorio',
        'titulo.min' => 'Debes ingresar al menos :min caracteres',
    ];

    public function index(Request $request)
    {
        $admin_productos = AdminProducto::orderBy("id", "desc")->get();
        return response()->JSON(['admin_productos' => $admin_productos, 'total' => count($admin_productos)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        $request["fecha_registro"] = date("Y-m-d");
        DB::beginTransaction();
        try {
            // crear el AdminProducto
            $nuevo_admin_producto = AdminProducto::create(array_map('mb_strtoupper', $request->all()));
            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_admin_producto, "admin_productos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->admin_producto . ' REGISTRO UN PRODUCTO',
                'datos_original' => $datos_original,
                'modulo' => 'ADMIN-PRODUCTOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'admin_producto' => $nuevo_admin_producto,
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

    public function update(Request $request, AdminProducto $admin_producto)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($admin_producto, "admin_productos");
            $admin_producto->update(array_map('mb_strtoupper', $request->all()));
            $datos_nuevo = HistorialAccion::getDetalleRegistro($admin_producto, "admin_productos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->admin_producto . ' MODIFICÓ UN PRODUCTO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'ADMIN-PRODUCTOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'admin_producto' => $admin_producto,
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
    public function show(AdminProducto $admin_producto)
    {
        return response()->JSON([
            'sw' => true,
            'admin_producto' => $admin_producto
        ], 200);
    }
    public function destroy(AdminProducto $admin_producto)
    {
        DB::beginTransaction();
        try {
            $existe_uso = IngresoProducto::where("admin_producto_id", $admin_producto->id)->get();
            if (count($existe_uso) > 0) {
                throw new Exception("No se puede eliminar el registro debido a que existen registros que lo usan");
            }
            $existe_uso = SalidaProducto::where("admin_producto_id", $admin_producto->id)->get();
            if (count($existe_uso) > 0) {
                throw new Exception("No se puede eliminar el registro debido a que existen registros que lo usan");
            }
            $datos_original = HistorialAccion::getDetalleRegistro($admin_producto, "admin_productos");
            $admin_producto->delete();

            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->admin_producto . ' ELIMINÓ UN PRODUCTO',
                'datos_original' => $datos_original,
                'modulo' => 'ADMIN-PRODUCTOS',
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
