<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DistribucionDetalle extends Model
{
    use HasFactory;

    protected $fillable = [
        "distribucion_pedido_id",
        "solicitud_detalle_id",
        "cantidad",
        "peso",
    ];

    public function distribucion_pedido()
    {
        return $this->belongsTo(DistribucionPedido::class, 'distribucion_pedido_id');
    }

    public function solicitud_detalle()
    {
        return $this->belongsTo(SolicitudDetalle::class, 'solicitud_detalle_id');
    }
}
