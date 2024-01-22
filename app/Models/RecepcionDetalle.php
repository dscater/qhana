<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RecepcionDetalle extends Model
{
    use HasFactory;

    protected $fillable = [
        "recepcion_pedido_id",
        "solicitud_detalle_id",
        "cantidad",
        "cantidad_restante",
        "peso",
        "peso_restante",
    ];

    protected $appends = ["cantidad_res_aux", "peso_res_aux", "cantidad_usada", "peso_usado"];

    public function getCantidadUsadaAttribute()
    {
        $cantidad_usada = HistoriaRecepcionDetalle::where("recepcion_detalle_id", $this->id)->sum("cantidad");
        return $cantidad_usada;
    }
    public function getPesoUsadoAttribute()
    {
        $peso_usado = HistoriaRecepcionDetalle::where("recepcion_detalle_id", $this->id)->sum("peso");
        return $peso_usado;
    }

    public function getCantidadResAuxAttribute()
    {

        return $this->cantidad_restante;
    }
    public function getPesoResAuxAttribute()
    {
        return $this->peso_restante;
    }

    public function solicitud_detalle()
    {
        return $this->belongsTo(SolicitudDetalle::class, 'solicitud_detalle_id');
    }

    public function recepcion_pedido()
    {
        return $this->belongsTo(RecepcionPedido::class, 'recepcion_pedido_id');
    }
}
