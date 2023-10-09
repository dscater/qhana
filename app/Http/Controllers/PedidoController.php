<?php

namespace App\Http\Controllers;

use App\Mail\SolicitudPedido;
use App\Models\Configuracion;
use App\Models\HistorialAccion;
use App\Models\Pedido;
use App\Models\Producto;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class PedidoController extends Controller
{
    public function index(Request $request)
    {
        $pedidos = Pedido::with("detalle_pedidos")->orderBy("id", "desc")->get();
        return response()->JSON(['pedidos' => $pedidos, 'total' => count($pedidos)], 200);
    }

    public function update(Request $request, Pedido $pedido)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($pedido, "pedidos");
            $pedido->update(array_map('mb_strtoupper', $request->all()));
            $datos_nuevo = HistorialAccion::getDetalleRegistro($pedido, "pedidos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->pedido . ' MODIFICÓ UN PEDIDO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'PEDIDOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'pedido' => $pedido,
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

    public function eliminarPedido(Request $request, Pedido $pedido)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($pedido, "pedidos");
            $pedido->update(array_map('mb_strtoupper', $request->all()));
            $datos_nuevo = HistorialAccion::getDetalleRegistro($pedido, "pedidos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->pedido . ' ELIMINÓ UN PEDIDO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'PEDIDOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            // restablecer stock de los productos
            foreach ($pedido->detalle_pedidos as $dp) {
                $producto = Producto::find($dp->producto_id);
                $producto->cantidad_stock = (float)$producto->cantidad_stock + (float)$dp->cantidad;
                $producto->save();
            }

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'pedido' => $pedido,
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

    public function restablecerPedido(Request $request, Pedido $pedido)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($pedido, "pedidos");
            $pedido->update(array_map('mb_strtoupper', $request->all()));
            $datos_nuevo = HistorialAccion::getDetalleRegistro($pedido, "pedidos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->pedido . ' RESTABLECIÓ UN PEDIDO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'PEDIDOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            // restablecer stock de los productos
            foreach ($pedido->detalle_pedidos as $dp) {
                $producto = Producto::find($dp->producto_id);
                if ($dp->cantidad > $producto->cantidad_stock) {
                    throw new Exception("No se pudo reestablecer el pedido debido a que la cantidad requerida del producto " . $dp->producto->nombre . " supera al stock disponible");
                }
                $producto->cantidad_stock = (float)$producto->cantidad_stock - (float)$dp->cantidad;
                $producto->save();
            }

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'pedido' => $pedido,
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

    public function atenderPedido(Request $request, Pedido $pedido)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($pedido, "pedidos");
            $pedido->update(array_map('mb_strtoupper', $request->all()));
            $datos_nuevo = HistorialAccion::getDetalleRegistro($pedido, "pedidos");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->pedido . ' CAMBIO UN PEDIDO A ATENDIDO',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'PEDIDOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'pedido' => $pedido,
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

    public function show(Pedido $pedido)
    {
        return response()->JSON([
            'sw' => true,
            'pedido' => $pedido->load("detalle_pedidos.producto")
        ], 200);
    }

    public function solicitudPedido(Request $request)
    {
        $request->validate([
            "nombres" => "required|min:4",
            "apellidos" => "required|min:4",
            "pec" => "required|min:4",
            "fono" => "required|min:4",
            "monto_total" => "required|numeric",
        ], [
            "nombres.required" => "Este campo es obligatorio",
            "nombres.min" => "Debes ingresar al menos :min carácteres",
            "apellidos.required" => "Este campo es obligatorio",
            "apellidos.min" => "Debes ingresar al menos :min carácteres",
            "pec.required" => "Este campo es obligatorio",
            "pec.min" => "Debes ingresar al menos :min carácteres",
            "fono.required" => "Este campo es obligatorio",
            "fono.min" => "Debes ingresar al menos :min carácteres",
            "monto_total.required" => "Este campo es obligatorio",
            "monto_total.numeric" => "Debes ingresar un valor númerico",
        ]);

        DB::beginTransaction();
        try {
            $request["estado"] = "PENDIENTE";
            $request["fecha_registro"] = date("Y-m-d");
            $nuevo_pedido = Pedido::create(array_map("mb_strtoupper", $request->except("detalle_pedidos")));

            $detalle_pedidos = $request->detalle_pedidos;
            foreach ($detalle_pedidos as $dp) {
                $nuevo_pedido->detalle_pedidos()->create([
                    "producto_id" => $dp["producto_id"],
                    "precio" => $dp["precio"],
                    "cantidad" => $dp["cantidad"],
                    "subtotal" => $dp["subtotal"]
                ]);

                $producto = Producto::find($dp["producto_id"]);
                if ($dp["cantidad"] > $producto->cantidad_stock) {
                    throw new Exception("Sentimos las molestias, pero la cantidad que seleccionó del producto " . $producto->nombre . " supera al stock disponible (" . $producto->cantidad_stock . " unidades)");
                }
                $producto->cantidad_stock = (float)$producto->cantidad_stock - (float)$dp["cantidad"];
                $producto->save();
            }
            $detalle_pedidos = $nuevo_pedido->detalle_pedidos;


            $configuracion = Configuracion::first();
            if ($configuracion) {
                $name = "QHANA";
                $correo_envio = "correosyseventos@gmail.com";
                $password = "gywdptczpyhtkghm";
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
                    ->send(new SolicitudPedido($nuevo_pedido, $detalle_pedidos));

                Mail::to($configuracion->correo_pedido2)
                    ->send(new SolicitudPedido($nuevo_pedido, $detalle_pedidos));
            }
            DB::commit();
            return response()->JSON([
                "sw" => true,
                "message" => "Pedido enviado con éxito",
            ], 200);
        } catch (\Exception $e) {
            return response()->JSON([
                "sw" => false,
                "message" => "Ocurrió un error: " . $e->getMessage(),
            ], 500);
        }
    }
}
