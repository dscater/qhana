<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RecepcionDetalle extends Model
{
    use HasFactory;

    protected $fillable = [
        "recepcion_pedido_id",
        "cantidad",
        "peso",
    ];

    public function recepcion_pedido()
    {
        return $this->belongsTo(RecepcionPedido::class, 'recepcion_pedido_id');
    }
}
