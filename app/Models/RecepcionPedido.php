<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RecepcionPedido extends Model
{
    use HasFactory;

    protected $fillable = [
        "user_id",
        "solicitud_pedido_id",
        "distribucion_pedido_id",
        "fecha_registro",
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function solicitud_pedido()
    {
        return $this->belongsTo(SolicitudPedido::class, 'solicitud_pedido_id');
    }

    public function distribucion_pedido()
    {
        return $this->belongsTo(DistribucionPedido::class, 'distribucion_pedido_id');
    }
}
