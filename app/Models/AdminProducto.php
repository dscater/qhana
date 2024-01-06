<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AdminProducto extends Model
{
    use HasFactory;
    protected $fillable = [
        "codigo_color",
        "descripcion",
        "titulo",
        "stock_kg",
        "stock_conos",
        "fecha_registro",
    ];

    protected $appends = ["full_name"];

    public function getFullNameAttribute()
    {
        return $this->codigo_color . ' | ' . $this->descripcion . ' | ' . $this->titulo;
    }
}
