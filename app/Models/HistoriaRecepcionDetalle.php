<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HistoriaRecepcionDetalle extends Model
{
    use HasFactory;

    protected $fillable = [
        "historia_recepcion_id",
        "recepcion_detalle_id",
        "solicitud_detalle_id",
        "cantidad",
        "peso",
    ];

    protected $appends = ["cantidad_aux", "peso_aux"];

    public function getCantidadAuxAttribute()
    {

        return $this->cantidad;
    }
    public function getPesoAuxAttribute()
    {
        return $this->peso;
    }

    public function historia_recepcion()
    {
        return $this->belongsTo(HistoriaRecepcion::class, 'historia_recepcion_id');
    }


    public function recepcion_detalle()
    {
        return $this->belongsTo(RecepcionDetalle::class, 'recepcion_detalle_id');
    }

    public function solicitud_detalle()
    {
        return $this->belongsTo(SolicitudDetalle::class, 'solicitud_detalle_id');
    }
}
