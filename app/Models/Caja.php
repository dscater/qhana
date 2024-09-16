<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Caja extends Model
{
    use HasFactory;
    protected $fillable = [
        "tipo",
        "tipo_movimiento",
        "concepto_id",
        "monto",
        "responsable_id",
        "encargado_id",
        "nro_factura",
        "fecha",
        "descripcion",
        "a_favor",
        "nro",
        "user_id",
        "nombre",
        "fecha_registro",
        "estado",
        "movimiento_caja_id",
    ];

    protected $appends =  ["txt_nro"];

    public function getTxtNroAttribute()
    {
        if ($this->nro) {
            if ((int)$this->nro < 10) {
                return "000000" . $this->nro;
            }
            if ((int)$this->nro < 100) {
                return "00000" . $this->nro;
            }
            if ((int)$this->nro < 1000) {
                return "0000" . $this->nro;
            }
            if ((int)$this->nro < 10000) {
                return "000" . $this->nro;
            }
            if ((int)$this->nro < 100000) {
                return "00" . $this->nro;
            }
            if ((int)$this->nro < 1000000) {
                return "0" . $this->nro;
            }

            return $this->nro;
        }
        return "";
    }

    public function concepto()
    {
        return $this->belongsTo(Concepto::class, 'concepto_id');
    }

    public function responsable()
    {
        return $this->belongsTo(User::class, 'responsable_id');
    }

    public function encargado()
    {
        return $this->belongsTo(User::class, 'encargado_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function movimiento_caja()
    {
        return $this->belongsTo(MovimientoCaja::class, 'movimiento_caja_id');
    }

    public static function getSaldoCaja()
    {
        $total_ingresos = Caja::where("estado", 1)->where("tipo_movimiento", "INGRESO")->sum("monto");
        $total_egresos = Caja::where("estado", 1)->where("tipo_movimiento", "EGRESO")->sum("monto");

        $saldo = (float)$total_ingresos - (float)$total_egresos;
        return $saldo;
    }

    public static function getSaldoCajaFechaAnteriorTodos($fecha)
    {
        $total_ingresos = Caja::whereIn("estado", [1, 2])->where("tipo_movimiento", "INGRESO")->where("fecha", "<", $fecha)->sum("monto");
        $total_egresos = Caja::whereIn("estado", [1, 2])->where("tipo_movimiento", "EGRESO")->where("fecha", "<", $fecha)->sum("monto");

        $saldo = (float)$total_ingresos - (float)$total_egresos;
        return $saldo;
    }
}
