<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Actividad extends Model
{
    use HasFactory;

    protected $fillable = [
        "imagen",
        "descripcion",
    ];

    protected $appends = ["url_imagen"];
    public function getUrlImagenAttribute()
    {
        return asset("imgs/actividads/" . $this->imagen);
    }
}
