<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Repositorio extends Model
{
    use HasFactory;

    protected $fillable = ["descripcion"];

    public function repositorio_archivos()
    {
        return $this->hasMany(RepositorioArchivo::class, 'repositorio_id');
    }
}
