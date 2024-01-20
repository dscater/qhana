<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HistoriaRecepcion extends Model
{
    use HasFactory;

    protected $fillable = [
        "recepcion_pedido_id",
        "user_id",
        "solicitud_pedido_id",
        "distribucion_pedido_id",
        "fecha"
    ];

    public function recepcion_pedido()
    {
        return $this->belongsTo(RecepcionPedido::class, 'recepcion_pedido_id');
    }

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

    public function historia_recepcion_detalles()
    {
        return $this->hasMany(HistoriaRecepcionDetalle::class, 'historia_recepcion_id');
    }
}
