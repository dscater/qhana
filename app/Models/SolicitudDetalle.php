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
        "elaborado",
        "titulo",
        "codigo_color",
        "peso",
    ];

    public function solicitud_pedido()
    {
        return $this->belongsTo(SolicitudPedido::class, 'solicitud_pedido_id');
    }
}
