<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SalidaProducto extends Model
{
    use HasFactory;

    protected $fillable = [
        "admin_producto_id",
        "cantidad",
        "cantidad_conos",
        "fecha_salida",
        "tipo_registro",
        "user_id",
        "solicitud_pedido_id",
        "detalle",
        "fecha_registro",
    ];

    public function admin_producto()
    {
        return $this->belongsTo(AdminProducto::class, 'admin_producto_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function solicitud_pedido()
    {
        return $this->belongsTo(SolicitudPedido::class, 'solicitud_pedido_id');
    }
}
