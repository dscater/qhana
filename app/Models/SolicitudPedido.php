<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SolicitudPedido extends Model
{
    use HasFactory;

    protected $fillable = [
        "codigo",
        "cliente_id",
        "cantidad_restante",
        "peso_restante",
        "fecha_recepcion",
        "fecha_registro",
    ];

    public function cliente()
    {
        return $this->belongsTo(Cliente::class, 'cliente_id');
    }

    public function solicitud_detalles()
    {
        return $this->hasMany(SolicitudDetalle::class, 'solicitud_pedido_id');
    }

    public static function actualizaCantidadPesoSolicitud($id)
    {
        $solicitud_pedido = SolicitudPedido::find($id);
        $solicitud_detalles = $solicitud_pedido->solicitud_detalles;
        $total_cantidad_resante = 0;
        $total_peso_resante = 0;
        foreach ($solicitud_detalles as $value) {
            $solicitud_detalle = SolicitudDetalle::findOrFail($value["id"]);
            $total_cantidad_resante += (float)$solicitud_detalle["cantidad_restante"];
            $total_peso_resante += (float)$solicitud_detalle["peso_restante"];
        }
        $solicitud_pedido->cantidad_restante = $total_cantidad_resante;
        $solicitud_pedido->peso_restante = $total_peso_resante;
        $solicitud_pedido->save();

        return true;
    }
}
