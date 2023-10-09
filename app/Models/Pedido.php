<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pedido extends Model
{
    use HasFactory;

    protected $fillable = [
        "nombres",
        "apellidos",
        "pec",
        "fono",
        "correo",
        "estado",
        "monto_total",
        "fecha_registro",
    ];

    public function detalle_pedidos()
    {
        return $this->hasMany(DetallePedido::class, 'pedido_id');
    }
}
