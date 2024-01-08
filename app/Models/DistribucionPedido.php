<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DistribucionPedido extends Model
{
    use HasFactory;

    protected $fillable = [
        "solicitud_pedido_id",
        "user_id",
        "fecha_distribucion",
        "fecha_registro",
    ];

    public function solicitud_pedido()
    {
        return $this->belongsTo(SolicitudPedido::class, 'solicitud_pedido_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function distribucion_detalles()
    {
        return $this->hasMany(DistribucionDetalle::class, 'distribucion_pedido_id');
    }
}
