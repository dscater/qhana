<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TarifaDetalle extends Model
{
    use HasFactory;

    protected $fillable = [
        "tarifa_pago_id",
        "solicitud_detalle_id",
        "cantidad",
        "peso",
        "mano_obra",
        "mano_obra_pagar",
        "depreciacion",
        "depreciacion_pagar",
        "ganancia",
        "ganancia_pagar",
    ];

    public function tarifa_pago()
    {
        return $this->belongsTo(TarifaPago::class, 'tarifa_pago_id');
    }

    public function solicitud_detalle()
    {
        return $this->belongsTo(SolicitudDetalle::class, 'solicitud_detalle_id');
    }
}
