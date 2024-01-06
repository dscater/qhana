<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MovimientoMaterial extends Model
{
    use HasFactory;

    protected $fillable = [
        "registro_id",
        "tipo",
        "cantidad",
        "fecha_registro",
    ];

    public function ingreso_material()
    {
        return $this->belongsTo(IngresoMaterial::class, 'registro_id');
    }

    public function salida_material()
    {
        return $this->belongsTo(SalidaMaterial::class, 'registro_id');
    }
}
