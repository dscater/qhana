<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class IngresoProducto extends Model
{
    use HasFactory;

    protected $fillable = [
        "admin_producto_id",
        "cantidad",
        "cantidad_conos",
        "fecha_ingreso",
        "precio",
        "fecha_registro",
    ];

    public function admin_producto()
    {
        return $this->belongsTo(AdminProducto::class, 'admin_producto_id');
    }
}
