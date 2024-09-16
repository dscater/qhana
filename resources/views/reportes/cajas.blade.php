<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Caja</title>
    <style type="text/css">
        * {
            font-family: sans-serif;
        }

        @page {
            margin-top: 1.5cm;
            margin-bottom: 0.3cm;
            margin-left: 0.3cm;
            margin-right: 0.3cm;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
            margin-top: 20px;
            page-break-before: avoid;
        }

        table thead tr th,
        tbody tr td {
            padding: 3px;
            word-wrap: break-word;
        }

        table thead tr th {
            font-size: 7pt;
        }

        table tbody tr td {
            font-size: 6pt;
        }


        .encabezado {
            width: 100%;
        }

        .logo img {
            position: absolute;
            width: 200px;
            height: 90px;
            top: -20px;
            left: 0px;
        }

        h2.titulo {
            width: 450px;
            margin: auto;
            margin-top: 0PX;
            margin-bottom: 15px;
            text-align: center;
            font-size: 14pt;
        }

        .texto {
            width: 500px;
            text-align: center;
            margin: auto;
            margin-top: 15px;
            font-weight: bold;
            font-size: 1.1em;
        }

        .fecha {
            width: 500px;
            text-align: center;
            margin: auto;
            margin-top: 15px;
            font-weight: normal;
            font-size: 0.85em;
        }

        .total {
            text-align: right;
            padding-right: 15px;
            font-weight: bold;
        }

        table {
            width: 100%;
        }

        table thead {
            background: rgb(236, 236, 236)
        }

        tr {
            page-break-inside: avoid !important;
        }

        .centreado {
            padding-left: 0px;
            text-align: center;
        }

        .datos {
            margin-left: 15px;
            border-top: solid 1px;
            border-collapse: collapse;
            width: 250px;
        }

        .txt {
            font-weight: bold;
            text-align: right;
            padding-right: 5px;
        }

        .txt_center {
            font-weight: bold;
            text-align: center;
        }

        .cumplimiento {
            position: absolute;
            width: 150px;
            right: 0px;
            top: 86px;
        }

        .b_top {
            border-top: solid 1px black;
        }

        .gray {
            background: rgb(202, 202, 202);
        }

        .vacio {
            background: rgb(146, 145, 145);
        }

        .bg-principal {
            background: #c57a40;
            color: white;
        }

        .txt_rojo {}

        .img_celda img {
            width: 45px;
        }

        .derecha {
            text-align: right;
            padding-right: 5px;
        }

        .bold {
            font-weight: bold;
        }

        .text-lg {
            font-size: 0.8em;
        }
    </style>
</head>

<body>
    @php
        $array_meses = [
            '01' => 'ENERO',
            '02' => 'FEBRERO',
            '03' => 'MARZO',
            '04' => 'ABRIL',
            '05' => 'MAYO',
            '06' => 'JUNIO',
            '07' => 'JULIO',
            '08' => 'AGOSTO',
            '09' => 'SEPTIEMBRE',
            '10' => 'OCTUBRE',
            '11' => 'NOVIEMBRE',
            '12' => 'DICIEMBRE',
        ];
    @endphp
    @inject('configuracion', 'App\Models\Configuracion')
    <div class="encabezado">
        <div class="logo">
            <img src="{{ asset('imgs/' . $configuracion->first()->logo) }}">
            {{ $configuracion->first()->logo }}
        </div>
        <h2 class="titulo">
            {{ $configuracion->first()->razon_social }}
        </h2>
        <h4 class="texto">REPORTE DE CAJA</h4>
        <h4 class="fecha">Expedido: {{ date('d-m-Y') }}</h4>
        @if (date('Y', strtotime($fecha_ini)) == date('Y', strtotime($fecha_fin)))
            <h4 class="fecha">DEL {{ date('d', strtotime($fecha_ini)) }} DE
                {{ $array_meses[date('m', strtotime($fecha_ini))] }} AL {{ date('d', strtotime($fecha_fin)) }} DE
                {{ $array_meses[date('m', strtotime($fecha_fin))] }} DE {{ date('Y', strtotime($fecha_fin)) }} </h4>
        @else
            <h4 class="fecha">DEL {{ date('d', strtotime($fecha_ini)) }} DE
                {{ $array_meses[date('m', strtotime($fecha_ini))] }} DE {{ date('Y', strtotime($fecha_ini)) }} AL
                {{ date('d') }} DE {{ $array_meses[date('m', strtotime($fecha_fin))] }} DE
                {{ date('Y', strtotime($fecha_fin)) }} </h4>
        @endif
    </div>
    <table border="1">
        <thead class="bg-principal">
            <tr>
                <th width="5%">FECHA</th>
                <th widht="19%">DETALLE</th>
                <th width="14%">ENCARGADO</th>
                <th width="10%">REC / FAC</th>
                <th width="10%">INGRESO</th>
                <th width="10%">EGRESO</th>
                <th width="10%">SALDO</th>
                <th>OBSERVACIÓN</th>
            </tr>
        </thead>
        <tbody>
            @php
                $cont = 1;
                $total = 0;
                $saldo_caja = 0;
                $suma_ingresos = 0;
                $suma_egresos = 0;
                if (isset($saldo) && $saldo != 0) {
                    $saldo_caja = $saldo;
                }
            @endphp
            {{-- MOSTRAR SALDO SI ES POR RANGO DE FECHAS | SI EXISTE --}}
            @if (isset($saldo) && $saldo != 0)
                @if ($saldo > 0)
                    <tr>
                        <td>{{ $fecha_anterior }}</td>
                        <td>SALDO</td>
                        <td></td>
                        <td></td>
                        <td class="centreado">{{ number_format($saldo, 2, '.', '') }}</td>
                        <td></td>
                        <td class="centreado">{{ number_format($saldo, 2, '.', '') }}</td>
                        <td></td>
                    </tr>
                @else
                    <tr>
                        <td>{{ $fecha_anterior }}</td>
                        <td>SALDO</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="centreado">{{ number_format($saldo, 2, '.', '') }}</td>
                        <td class="centreado">{{ number_format($saldo, 2, '.', '') }}</td>
                        <td></td>
                    </tr>
                @endif
            @endif

            {{-- MOSTRAR LOS REGISTROS DE CAJA --}}
            @foreach ($cajas as $caja)
                @php
                    if ($caja->tipo_movimiento == 'INGRESO') {
                        $suma_ingresos += (float) $caja->monto;
                        $saldo_caja += (float) $caja->monto;
                    } else {
                        $suma_egresos += (float) $caja->monto;
                        $saldo_caja -= (float) $caja->monto;
                    }

                @endphp
                <tr>
                    <td class="">{{ $caja->fecha }}</td>
                    <td class="">{{ $caja->concepto->nombre }}</td>
                    <td class="">
                        @if ($caja->encargado)
                            {{ $caja->encargado->full_name }}
                        @endif
                    </td>
                    <td class="">
                        @if ($caja->nro_factura || $caja->nro)
                            @if ($caja->tipo == 'NORMAL')
                                F/{{ $caja->nro_factura }}
                            @else
                                R/{{ $caja->nro }}
                            @endif
                        @endif
                    </td>
                    @if ($caja->tipo_movimiento == 'INGRESO')
                        <td class="centreado">{{ $caja->monto }}</td>
                        <td></td>
                    @else
                        <td></td>
                        <td class="centreado">{{ $caja->monto }}</td>
                    @endif
                    <td class="centreado">{{ number_format($saldo_caja, 2, '.', '') }}</td>
                    <td class="">{{ $caja->descripcion }}</td>
                </tr>
            @endforeach
            <tr>
                <td colspan="4" class="bg-principal derecha bold text-lg">TOTAL</td>
                <td class="bg-principal centreado bold text-lg">{{ number_format($suma_ingresos, 2, '.', '') }}</td>
                <td class="bg-principal centreado bold text-lg">{{ number_format($suma_egresos, 2, '.', '') }}</td>
                <td class="bg-principal centreado bold text-lg">{{ number_format($saldo_caja, 2, '.', '') }}</td>
                <td class="bg-principal"></td>
            </tr>
        </tbody>
    </table>
</body>

</html>
