<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MovimientoCaja extends Model
{
    use HasFactory;

    protected $fillable = [
        "ingresos",
        "egresos",
        "total",
        "fecha",
        "hora",
    ];

    public function cajas()
    {
        return $this->hasMany(Caja::class, 'movimiento_caja_id');
    }
}
