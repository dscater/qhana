<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cliente extends Model
{
    use HasFactory;

    protected $fillable = [
        "empresa",
        "nombre_encargado",
        "fonos",
        "dir",
        "correo",
        "fecha_registro",
    ];
}
