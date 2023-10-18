<?php

namespace App\Http\Controllers;

use App\Models\Caja;
use App\Models\HistorialAccion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use PDF;
use App\library\numero_a_letras\src\NumeroALetras;

class CajaController extends Controller
{
    public $validacion = [
        'tipo' => 'required',
        'tipo_movimiento' => 'required',
        'concepto_id' => 'required',
        "monto" => "required|numeric|min:1",
        "monto" => "required|numeric|min:1",
        "fecha" => "required|date",
    ];

    public $mensajes = [
        'tipo.required' => 'Este campo es obligatorio',
        'tipo_movimiento.required' => 'Este campo es obligatorio',
        'concepto_id.required' => 'Este campo es obligatorio',
        'monto.required' => 'Este campo es obligatorio',
        'monto.numeric' => 'Debes ingresar un valor númerico válido',
        'monto.min' => 'Debes ingresar un valor mayor o igual que :min',
        'fecha.required' => 'Este campo es obligatorio',
        'fecha.date' => 'Debes ingresar una fecha valida',
        'user_id.required' => 'Este campo es obligatorio',
        'nombre.required' => 'Este campo es obligatorio',
    ];
    public function index(Request $request)
    {
        $cajas = Caja::with(["concepto", "responsable"])->where("estado", 1)->orderBy("id", "desc")->get();
        return response()->JSON(['cajas' => $cajas, 'total' => count($cajas)], 200);
    }

    public function getSaldo()
    {
        $saldo = Caja::getSaldoCaja();
        $saldo_texto = number_format($saldo, 2, ".", ",");
        return response()->JSON([
            "saldo" => $saldo,
            "saldo_texto" => $saldo_texto,
        ]);
    }

    public function store(Request $request)
    {
        if ($request["tipo"] == 'RECIBO') {
            $this->validacion["a_favor"] = "required";
            if ($request["a_favor"] != 'OTRO') {
                $this->validacion["user_id"] = "required";
            } else {
                $this->validacion["nombre"] = "required";
            }
        }

        $request["estado"] = 1;
        $request["movimiento_caja_id"] = 0;
        $request["fecha_registro"] = date("Y-m-d");
        $request["responsable_id"] = Auth::user()->id;
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            if ($request["tipo"] == 'RECIBO') {
                $ultimo_recibo = Caja::where("tipo", "RECIBO")->get()->last();
                $nro = 1;
                if ($ultimo_recibo) {
                    $nro = (int)$ultimo_recibo->nro + 1;
                }
                $request["nro"] = $nro;
            }

            // crear el Caja
            if ($request["tipo"] == 'NORMAL') {
                $nueva_caja = Caja::create(array_map('mb_strtoupper', $request->except("a_favor", "nro", "nombre", "user_id")));
            } else {
                if ($request["a_favor"] != 'OTRO') {
                    $nueva_caja = Caja::create(array_map('mb_strtoupper', $request->except("nro_factura", "nombre")));
                } else {
                    $nueva_caja = Caja::create(array_map('mb_strtoupper', $request->except("nro_factura", "user_id")));
                }
            }

            $nueva_caja->save();

            $datos_original = HistorialAccion::getDetalleRegistro($nueva_caja, "cajas");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->caja . ' CREÓ UN REGISTRO DE CAJA',
                'datos_original' => $datos_original,
                'modulo' => 'CAJAS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'caja' => $nueva_caja,
                'msj' => 'El registro se realizó de forma correcta',
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function update(Request $request, Caja $caja)
    {
        if ($request["tipo"] == 'RECIBO') {
            $this->validacion["a_favor"] = "required";
            if ($request["a_favor"] != 'OTRO') {
                $this->validacion["user_id"] = "required";
            } else {
                $this->validacion["nombre"] = "required";
            }
        }

        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($caja, "cajas");

            if ($request["tipo"] == 'NORMAL') {
                $caja->update(array_map('mb_strtoupper', $request->except("a_favor", "nro", "nombre", "user_id")));
            } else {
                if ($request["a_favor"] != 'OTRO') {
                    $caja->update(array_map('mb_strtoupper', $request->except("nro_factura", "nombre")));
                } else {
                    $caja->update(array_map('mb_strtoupper', $request->except("nro_factura", "user_id")));
                }
            }
            $datos_nuevo = HistorialAccion::getDetalleRegistro($caja, "cajas");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->caja . ' MODIFICÓ UN REGISTRO DE CAJA',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'CAJAS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'caja' => $caja,
                'msj' => 'El registro se actualizó de forma correcta'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }
    public function show(Caja $caja)
    {
        return response()->JSON([
            'sw' => true,
            'caja' => $caja->load("catalogo")
        ], 200);
    }

    public function destroy(Caja $caja)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($caja, "cajas");
            $caja->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL USUARIO ' . Auth::user()->caja . ' ELIMINÓ UN REGISTRO DE CAJA',
                'datos_original' => $datos_original,
                'modulo' => 'CAJAS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'msj' => 'El registro se eliminó correctamente'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function generarRecibo(Caja $caja)
    {
        $convertir = new NumeroALetras();
        $array_monto = explode('.', $caja->monto);
        $literal = $convertir->convertir($array_monto[0]);
        $literal .= " " . $array_monto[1] . "/100." . " BOLIVIANOS";

        $pdf = PDF::loadView('reportes.recibo_pdf', compact('caja', 'literal'))->setPaper('letter', 'portrait');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->download('Recibo.pdf');
    }
}
