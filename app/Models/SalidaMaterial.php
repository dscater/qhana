<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SalidaMaterial extends Model
{
    use HasFactory;

    protected $fillable = [
        "material_id",
        "cantidad",
        "fecha_salida",
        "fecha_registro",
    ];

    public function material()
    {
        return $this->belongsTo(Material::class, 'material_id');
    }
}
