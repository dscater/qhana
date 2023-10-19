<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RepositorioArchivo extends Model
{
    use HasFactory;

    protected $fillable = [
        "repositorio_id",
        "archivo",
        "ext",
        "tipo",
    ];

    protected $appends = ["url"];

    public function getUrlAttribute()
    {
        return asset("files/" . $this->archivo);
    }
}
