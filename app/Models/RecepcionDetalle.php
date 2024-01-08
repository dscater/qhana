<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RecepcionDetalle extends Model
{
    use HasFactory;

    protected $fillable = [
        "recepcion_pedido_id",
        "solicitud_detalle_id",
        "cantidad",
        "peso",
    ];

    protected $appends = ["cantidad_asignada", "peso_asignada"];

    public function getCantidadAsignadaAttribute()
    {
        $distribucion_detalle = DistribucionDetalle::where("distribucion_pedido_id", $this->recepcion_pedido->distribucion_pedido_id)->where("solicitud_detalle_id", $this->solicitud_detalle_id)->get()->first();
        if ($distribucion_detalle) {
            return $distribucion_detalle->cantidad;
        }
        return 0;
    }
    public function getPesoAsignadaAttribute()
    {
        $distribucion_detalle = DistribucionDetalle::where("distribucion_pedido_id", $this->recepcion_pedido->distribucion_pedido_id)->where("solicitud_detalle_id", $this->solicitud_detalle_id)->get()->first();
        if ($distribucion_detalle) {
            return $distribucion_detalle->peso;
        }
        return 0;
    }

    public function solicitud_detalle()
    {
        return $this->belongsTo(SolicitudDetalle::class, 'solicitud_detalle_id');
    }

    public function recepcion_pedido()
    {
        return $this->belongsTo(RecepcionPedido::class, 'recepcion_pedido_id');
    }
}
