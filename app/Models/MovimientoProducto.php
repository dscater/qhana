<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MovimientoProducto extends Model
{
    use HasFactory;

    protected $fillable = [
        "registro_id",
        "tipo",
        "cantidad",
        "cantidad_conos",
        "fecha_registro",
    ];

    public function ingreso_producto()
    {
        return $this->belongsTo(IngresoProducto::class, 'registro_id');
    }

    public function salida_producto()
    {
        return $this->belongsTo(SalidaProducto::class, 'registro_id');
    }
}
