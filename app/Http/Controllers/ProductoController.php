<?php

namespace App\Http\Controllers;

use App\Models\HistorialAccion;
use App\Models\Producto;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ProductoController extends Controller
{
    public $validacion = [
        'nombre' => 'required|min:4',
        "precio" => "required|numeric|min:1",
        "cantidad_stock" => "required|numeric|min:0",
        "catalogo_id" => "required",
    ];

    public $mensajes = [
        'nombre.required' => 'Este campo es obligatorio',
        'nombre.min' => 'Debes ingressar al menos 4 carácteres',
        'precio.required' => 'Este campo es obligatorio',
        'precio.numeric' => 'Debes ingresar un valor númerico válido',
        'precio.min' => 'Debes ingresar un valor mayor o igual que :min',
        'cantidad_stock.required' => 'Este campo es obligatorio',
        'cantidad_stock.numeric' => 'Debes ingresar un valor númerico válido',
        'cantidad_stock.min' => 'Debes ingresar un valor mayor o igual que :min',
        'catalogo_id.required' => 'Este campo es obligatorio',
    ];
    public function index(Request $request)
    {
        $productos = Producto::with("catalogo")->orderBy("id", "desc")->get();
        return response()->JSON(['productos' => $productos, 'total' => count($productos)], 200);
    }

    public function listaProductos(Request $request)
    {
        $productos = Producto::with("catalogo")->orderBy("id", "desc")->get();
        return response()->JSON(['productos' => $productos, 'total' => count($productos)], 200);
    }

    public function ultimosProductos(Request $request)
    {
        $productos = Producto::with("catalogo")->orderBy("id", "desc")->get()->take(10);
        return response()->JSON(['productos' => $productos, 'total' => count($productos)], 200);
    }

    public function store(Request $request)
    {
        if ($request->hasFile('imagen')) {
            $this->validacion['imagen'] = 'image|mimes:jpeg,jpg,png,webp|max:4096';
        }
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            // crear el Producto
            $nuevo_producto = Producto::create(array_map('mb_strtoupper', $request->except('imagen')));
            $nuevo_producto->imagen = 'default.png';
            if ($request->hasFile('imagen')) {
                $file = $request->imagen;
                $nom_imagen = time() . '_' . $nuevo_producto->id . '.' . $file->getClientOriginalExtension();
                $nuevo_producto->imagen = $nom_imagen;
                $file->move(public_path() . '/imgs/productos/', $nom_imagen);
            }
            $nuevo_producto->save();

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_producto, "productos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->producto . ' REGISTRO UN PRODUCTO',
                'datos_original' => $datos_original,
                'modulo' => 'PRODUCTOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'producto' => $nuevo_producto,
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

    public function update(Request $request, Producto $producto)
    {
        if ($request->hasFile('imagen')) {
            $this->validacion['imagen'] = 'image|mimes:jpeg,jpg,png,webp|max:4096';
        }
        if ($request["tipo_personal"] == "SOCIO") {
            $this->validacion['tipo'] = 'required';
        } else {
            $request["tipo"] = 'NINGUNO';
        }

        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($producto, "productos");
            $producto->update(array_map('mb_strtoupper', $request->except('imagen')));

            if ($request->hasFile('imagen')) {
                $antiguo = $producto->imagen;
                if ($antiguo != 'default.png') {
                    \File::delete(public_path() . '/imgs/productos/' . $antiguo);
                }
                $file = $request->imagen;
                $nom_imagen = time() . '_' . $producto->id . '.' . $file->getClientOriginalExtension();
                $producto->imagen = $nom_imagen;
                $file->move(public_path() . '/imgs/productos/', $nom_imagen);
            }
            $producto->save();

            $datos_nuevo = HistorialAccion::getDetalleRegistro($producto, "productos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->producto . ' MODIFICÓ UN PRODUCTO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'PRODUCTOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'producto' => $producto,
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
    public function show(Producto $producto)
    {
        return response()->JSON([
            'sw' => true,
            'producto' => $producto->load("catalogo")
        ], 200);
    }

    public function destroy(Producto $producto)
    {
        DB::beginTransaction();
        try {
            $antiguo = $producto->imagen;
            if ($antiguo != 'default.png') {
                \File::delete(public_path() . '/imgs/productos/' . $antiguo);
            }
            $datos_original = HistorialAccion::getDetalleRegistro($producto, "productos");
            $producto->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->producto . ' ELIMINÓ UN PRODUCTO',
                'datos_original' => $datos_original,
                'modulo' => 'PRODUCTOS',
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
