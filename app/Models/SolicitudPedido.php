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
}
