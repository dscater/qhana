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

    protected $appends = ["full_name", "nro_pedido", "fecha_pedido"];

    public function getNroPedidoAttribute()
    {
        $nro_pedido = $this->id;
        if ($nro_pedido < 10) {
            $nro_pedido = '00' . $nro_pedido;
        } elseif ($nro_pedido < 100) {
            $nro_pedido = '0' . $nro_pedido;
        }
        return $nro_pedido;
    }
    public function getFechaPedidoAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha_registro));
    }

    public function getFullNameAttribute()
    {
        return $this->nombres . " " . $this->apellidos;
    }

    public function detalle_pedidos()
    {
        return $this->hasMany(DetallePedido::class, 'pedido_id');
    }
}
