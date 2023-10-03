<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    use HasFactory;

    protected $fillable = [
        "nombre",
        "descripcion",
        "precio",
        "cantidad_stock",
        "catalogo_id",
        "imagen",
    ];

    protected $appends = ["url_imagen"];
    public function getUrlImagenAttribute()
    {
        if (!$this->imagen || $this->imagen == '' || $this->imagen == 'default.png') {
            return asset("imgs/productos/default.png");
        }
        return asset("imgs/productos/" . $this->imagen);
    }

    public function catalogo()
    {
        return $this->belongsTo(Catalogo::class, 'catalogo_id');
    }
}
