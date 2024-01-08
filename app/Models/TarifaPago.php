<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TarifaPago extends Model
{
    use HasFactory;

    protected $fillable = [
        "cliente_id",
        "solicitud_pedido_id",
        "cantidad",
        "peso",
        "mano_obra",
        "depreciacion",
        "ganancia",
        "fecha_registro",
    ];

    public function cliente()
    {
        return $this->belongsTo(Cliente::class, 'cliente_id');
    }

    public function solicitud_pedido()
    {
        return $this->belongsTo(SolicitudPedido::class, 'solicitud_pedido_id');
    }
    public function tarifa_detalles()
    {
        return $this->hasMany(TarifaDetalle::class, 'tarifa_pago_id');
    }
}
