<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SolicitudDetalle extends Model
{
    use HasFactory;

    protected $fillable = [
        "solicitud_pedido_id",
        "codigo",
        "descripcion",
        "talla",
        "cantidad",
        "cantidad_restante",
        "elaborado",
        "titulo",
        "codigo_color",
        "peso",
        "peso_total",
        "peso_restante",
    ];

    protected $appends = ["cantidad_restante_aux", "peso_restante_aux"];

    public function getCantidadRestanteAuxAttribute()
    {
        return $this->cantidad_restante;
    }
    public function getPesoRestanteAuxAttribute()
    {
        return $this->peso_restante;
    }

    public function solicitud_pedido()
    {
        return $this->belongsTo(SolicitudPedido::class, 'solicitud_pedido_id');
    }

    public function distribucion_detalles()
    {
        return $this->hasMany(DistribucionDetalle::class, 'solicitud_detalle_id');
    }
}
