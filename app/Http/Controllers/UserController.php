<?php

namespace App\Http\Controllers;

use App\Models\Catalogo;
use App\Models\Empresa;
use App\Models\HistorialAccion;
use App\Models\Pedido;
use App\Models\Producto;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use PDF;

class UserController extends Controller
{
    public $validacion = [
        'nombre' => 'required|min:4',
        'paterno' => 'required|min:4',
        'ci' => 'required|numeric|digits_between:4, 20|unique:users,ci',
        'ci_exp' => 'required',
        'fecha_nac' => 'required|date',
        'genero' => 'required',
        'cargo' => 'required',
        'fecha_ingreso' => 'required|date',
        'taller' => 'required',
        'estado' => 'required',
        'fono' => 'required',
        'dir' => 'required',
        'tipo_personal' => 'required',
        'p_discapacidad' => 'required|numeric|min:0',
        'validez_credencial' => 'required',

    ];

    public $mensajes = [
        'nombre.required' => 'Este campo es obligatorio',
        'nombre.min' => 'Debes ingressar al menos 4 carácteres',
        'paterno.required' => 'Este campo es obligatorio',
        'paterno.min' => 'Debes ingresar al menos 4 carácteres',
        'ci.required' => 'Este campo es obligatorio',
        'ci.numeric' => 'Debes ingresar un valor númerico',
        'ci.unique' => 'Este número de C.I. ya fue registrado',
        'ci_exp.required' => 'Este campo es obligatorio',
        'dir.required' => 'Este campo es obligatorio',
        'dir.min' => 'Debes ingresar al menos 4 carácteres',
        'fono.required' => 'Este campo es obligatorio',
        'fono.min' => 'Debes ingresar al menos 4 carácteres',
        'cel.required' => 'Este campo es obligatorio',
        'cel.min' => 'Debes ingresar al menos 4 carácteres',
        'tipo.required' => 'Este campo es obligatorio',
    ];

    public $permisos = [
        'ADMINISTRADOR' => [
            // personal
            'usuarios.index',
            'usuarios.create',
            'usuarios.edit',
            'usuarios.destroy',

            // usuarios
            'users.index',
            'users.create',
            'users.edit',
            'users.destroy',

            'portals.index',

            'banners.index',
            'banners.create',
            'banners.edit',
            'banners.destroy',

            'actividads.index',
            'actividads.create',
            'actividads.edit',
            'actividads.destroy',

            'productos.index',
            'productos.create',
            'productos.edit',
            'productos.destroy',

            'catalogos.index',
            'catalogos.create',
            'catalogos.edit',
            'catalogos.destroy',

            'pedidos.index',
            'pedidos.create',
            'pedidos.edit',
            'pedidos.destroy',

            'personals.index',

            'distribucions.index',

            'pagos.index',

            'conceptos.index',
            'conceptos.create',
            'conceptos.edit',
            'conceptos.destroy',

            'cajas.index',
            'cajas.create',
            'cajas.edit',
            'cajas.destroy',

            'repositorios.index',
            'repositorios.create',
            'repositorios.edit',
            'repositorios.destroy',

            'admin_productos.index',
            'admin_productos.create',
            'admin_productos.edit',
            'admin_productos.destroy',

            'ingreso_productos.index',
            'ingreso_productos.create',
            'ingreso_productos.edit',
            'ingreso_productos.destroy',

            'salida_productos.index',
            'salida_productos.create',
            'salida_productos.edit',
            'salida_productos.destroy',

            'clientes.index',
            'clientes.create',
            'clientes.edit',
            'clientes.destroy',

            'solicitud_pedidos.index',
            'solicitud_pedidos.create',
            'solicitud_pedidos.edit',
            'solicitud_pedidos.destroy',

            'distribucion_pedidos.index',
            'distribucion_pedidos.create',
            'distribucion_pedidos.edit',
            'distribucion_pedidos.destroy',

            'recepcion_pedidos.index',
            'recepcion_pedidos.create',
            'recepcion_pedidos.edit',
            'recepcion_pedidos.destroy',

            'tarifa_pagos.index',
            'tarifa_pagos.create',
            'tarifa_pagos.edit',
            'tarifa_pagos.destroy',

            'materials.index',
            'materials.create',
            'materials.edit',
            'materials.destroy',

            'ingreso_materials.index',
            'ingreso_materials.create',
            'ingreso_materials.edit',
            'ingreso_materials.destroy',

            'salida_materials.index',
            'salida_materials.create',
            'salida_materials.edit',
            'salida_materials.destroy',

            'configuracion.index',
            'configuracion.edit',

            "reportes.usuarios",
            "reportes.cajas",

            "reportes.ingreso_general",
            "reportes.inventario",
            "reportes.solicitud_productos",
            "reportes.distribucion_pedidos",
            "reportes.recepcion_pedidos",
            "reportes.clientes",
            "reportes.inventario_materiales",
            "reportes.ingreso_salida_materiales",
        ],
        "REPRESENTANTE" => [
            'portals.index',

            'cajas.index',
            'cajas.create',
            'cajas.edit',
            'cajas.destroy',

            'repositorios.index',
            'repositorios.create',
            'repositorios.edit',
            'repositorios.destroy',
        ],
        "SOCIO" => [],
        "CAJA" => [
            'cajas.index',
            'cajas.create',
            'cajas.edit',
            'cajas.destroy',

            "reportes.cajas"
        ],
    ];


    public function index(Request $request)
    {
        $usuarios = User::where('id', '!=', 1)->where("tipo", "!=", "CAJA")->get();
        return response()->JSON(['usuarios' => $usuarios, 'total' => count($usuarios)], 200);
    }

    public function index_users()
    {
        User::verificaUsuarioCaja();
        $usuarios = User::where('id', '!=', 1)->whereIn("tipo", ["CAJA"])->get();
        return response()->JSON(['usuarios' => $usuarios, 'total' => count($usuarios)], 200);
    }

    public function store(Request $request)
    {
        if ($request->hasFile('foto')) {
            $this->validacion['foto'] = 'image|mimes:jpeg,jpg,png|max:2048';
        }

        if ($request["tipo_personal"] == "SOCIO") {
            $this->validacion['tipo'] = 'required';
        } else {
            $request["tipo"] = 'NINGUNO';
        }

        $request->validate($this->validacion, $this->mensajes);

        $cont = 0;
        do {
            $nombre_usuario = User::getNombreUsuario($request->nombre, $request->paterno);
            if ($cont > 0) {
                $nombre_usuario = $nombre_usuario . $cont;
            }
            $request['usuario'] = $nombre_usuario;
            $cont++;
        } while (User::where('usuario', $nombre_usuario)->get()->first());

        $request['password'] = 'NoNulo';
        $request['fecha_registro'] = date('Y-m-d');
        DB::beginTransaction();
        try {
            // crear el Usuario
            $nuevo_usuario = User::create(array_map('mb_strtoupper', $request->except('foto')));
            $nuevo_usuario->password = Hash::make($request->ci);
            $nuevo_usuario->save();
            $nuevo_usuario->foto = 'default.png';
            if ($request->hasFile('foto')) {
                $file = $request->foto;
                $nom_foto = time() . '_' . $nuevo_usuario->usuario . '.' . $file->getClientOriginalExtension();
                $nuevo_usuario->foto = $nom_foto;
                $file->move(public_path() . '/imgs/users/', $nom_foto);
            }
            $nuevo_usuario->save();

            $datos_original = HistorialAccion::getDetalleRegistro($nuevo_usuario, "users");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' REGISTRO UN USUARIO',
                'datos_original' => $datos_original,
                'modulo' => 'USUARIOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'usuario' => $nuevo_usuario,
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

    public function update(Request $request, User $usuario)
    {
        $this->validacion['ci'] = 'required|min:4|numeric|unique:users,ci,' . $usuario->id;
        if ($request->hasFile('foto')) {
            $this->validacion['foto'] = 'image|mimes:jpeg,jpg,png|max:2048';
        }
        if ($request["tipo_personal"] == "SOCIO") {
            $this->validacion['tipo'] = 'required';
        } else {
            $request["tipo"] = 'NINGUNO';
        }

        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($usuario, "users");
            $usuario->update(array_map('mb_strtoupper', $request->except('foto')));

            if ($request->hasFile('foto')) {
                $antiguo = $usuario->foto;
                if ($antiguo != 'default.png') {
                    \File::delete(public_path() . '/imgs/users/' . $antiguo);
                }
                $file = $request->foto;
                $nom_foto = time() . '_' . $usuario->usuario . '.' . $file->getClientOriginalExtension();
                $usuario->foto = $nom_foto;
                $file->move(public_path() . '/imgs/users/', $nom_foto);
            }
            $usuario->save();

            $datos_nuevo = HistorialAccion::getDetalleRegistro($usuario, "users");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' MODIFICÓ UN USUARIO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'USUARIOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'usuario' => $usuario,
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

    public function asignarConfiguracion(User $usuario)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($usuario, "users");
            DB::update("UPDATE users SET configuracion=0;");
            $usuario->configuracion = 1;
            $usuario->save();
            $datos_nuevo = HistorialAccion::getDetalleRegistro($usuario, "users");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' LE ASIGNÓ LA CONFIGURACIÓN DEL SISTEMA AL USUARIO ' . $usuario->usuario,
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'USUARIOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'usuario' => $usuario,
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

    public function show(User $usuario)
    {
        return response()->JSON([
            'sw' => true,
            'usuario' => $usuario
        ], 200);
    }

    public function actualizaContrasenia(User $usuario, Request $request)
    {
        $request->validate([
            'password_actual' => ['required', function ($attribute, $value, $fail) use ($usuario, $request) {
                if (!\Hash::check($request->password_actual, $usuario->password)) {
                    return $fail(__('La contraseña no coincide con la actual.'));
                }
            }],
            'password' => 'required|confirmed|min:4',
            'password_confirmation' => 'required|min:4'
        ]);


        DB::beginTransaction();
        try {
            $usuario->password = Hash::make($request->password);
            $usuario->save();
            DB::commit();
            return response()->JSON([
                'sw' => true,
                'msj' => 'La contraseña se actualizó correctamente'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function actualizaFoto(User $usuario, Request $request)
    {
        DB::beginTransaction();
        try {

            if ($request->hasFile('foto')) {
                $antiguo = $usuario->foto;
                if ($antiguo != 'default.png') {
                    \File::delete(public_path() . '/imgs/users/' . $antiguo);
                }
                $file = $request->foto;
                $nom_foto = time() . '_' . $usuario->usuario . '.' . $file->getClientOriginalExtension();
                $usuario->foto = $nom_foto;
                $file->move(public_path() . '/imgs/users/', $nom_foto);
            }
            $usuario->save();
            DB::commit();
            return response()->JSON([
                'sw' => true,
                'usuario' => $usuario,
                'msj' => 'Foto actualizada con éxito'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function destroy(User $usuario)
    {
        DB::beginTransaction();
        try {
            $antiguo = $usuario->foto;
            if ($antiguo != 'default.png') {
                \File::delete(public_path() . '/imgs/users/' . $antiguo);
            }
            $datos_original = HistorialAccion::getDetalleRegistro($usuario, "users");
            $usuario->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->usuario . ' ELIMINÓ UN USUARIO',
                'datos_original' => $datos_original,
                'modulo' => 'USUARIOS',
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

    public function imprimirCredencial(User $usuario)
    {
        $pdf = PDF::loadView('reportes.credencial', compact('usuario'))->setPaper('letter', 'portrait');
        $pdf->setPaper([0, 0, 350, 150], 'cm');
        return $pdf->download('Credencial.pdf');
    }

    public function getPermisos(User $usuario)
    {
        $tipo = $usuario->tipo;
        return response()->JSON($this->permisos[$tipo]);
    }

    public function getInfoBox()
    {
        $tipo = Auth::user()->tipo;
        $array_infos = [];
        if (in_array('usuarios.index', $this->permisos[$tipo])) {
            $array_infos[] = [
                'label' => 'Personal',
                'cantidad' => count(User::where('id', '!=', 1)->get()),
                'color' => 'bg-dark',
                'icon' => asset("imgs/people.png"),
                "url" => "usuarios.index"
            ];
        }
        if (in_array('pedidos.index', $this->permisos[$tipo])) {
            $array_infos[] = [
                'label' => 'Pedidos',
                'cantidad' => count(Pedido::all()),
                'color' => 'bg-dark',
                'icon' => asset("imgs/checklist.png"),
                "url" => "pedidos.index"
            ];
        }

        if (in_array('catalogos.index', $this->permisos[$tipo])) {
            $array_infos[] = [
                'label' => 'Catálogos',
                'cantidad' => count(Catalogo::all()),
                'color' => 'bg-dark',
                'icon' => asset("imgs/catalogue.png"),
                "url" => "catalogos.index"
            ];
        }

        if (in_array('productos.index', $this->permisos[$tipo])) {
            $array_infos[] = [
                'label' => 'Lana',
                'cantidad' => count(Producto::all()),
                'color' => 'bg-dark',
                'icon' => asset("imgs/product-development.png"),
                "url" => "productos.index"
            ];
        }
        return response()->JSON($array_infos);
    }

    public function userActual()
    {
        return response()->JSON(Auth::user());
    }

    public function getUsuario(User $usuario)
    {
        return response()->JSON($usuario);
    }

    public function getUsuarioTipo(Request $request)
    {
        $tipo = $request->tipo;
        $usuarios = [];
        if ($tipo != "todos") {
            if (is_array($tipo)) {
                $usuarios = User::where("id", "!=", 1)->whereIn("tipo", $tipo)->get();
            } else {
                $usuarios = User::where("id", "!=", 1)->where("tipo", $tipo)->get();
            }
        } else {
            $usuarios = User::where("id", "!=", 1)->get();
        }
        return response()->JSON($usuarios);
    }

    public function getUsuarioTipoPersonal(Request $request)
    {
        $tipo = $request->tipo;
        $usuarios = [];
        if ($tipo != "todos") {
            if (is_array($tipo)) {
                $usuarios = User::where("id", "!=", 1)->whereIn("tipo_personal", $tipo)->get();
            } else {
                $usuarios = User::where("id", "!=", 1)->where("tipo_personal", $tipo)->get();
            }
        } else {
            $usuarios = User::where("id", "!=", 1)->get();
        }
        return response()->JSON($usuarios);
    }
}
