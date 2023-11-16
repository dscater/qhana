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
            width: 250px;
            text-align: center;
            margin: auto;
            margin-top: 15px;
            font-weight: bold;
            font-size: 1.1em;
        }

        .fecha {
            width: 250px;
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
    </div>
    <table border="1">
        <thead class="bg-principal">
            <tr>
                <th width="3%">N°</th>
                <th>TIPO</th>
                <th>MOVIMIENTO</th>
                <th>CONCEPTO</th>
                <th>RESPONSABLE</th>
                <th>NRO. FACTURA</th>
                <th>DESCRIPCIÓN</th>
                <th>A FAVOR DE</th>
                <th>NRO. RECIBO</th>
                <th>NOMBRE</th>
                <th width="9%">FECHA DE REGISTRO</th>
                <th>MONTO</th>
            </tr>
        </thead>
        <tbody>
            @php
                $cont = 1;
                $total = 0;
            @endphp
            @foreach ($cajas as $caja)
                @php
                    $total += (float) $caja->monto;
                @endphp
                <tr>
                    <td class="centreado">{{ $cont++ }}</td>
                    <td class="centreado">{{ $caja->tipo }}</td>
                    <td class="centreado">{{ $caja->tipo_movimiento }}</td>
                    <td class="">{{ $caja->concepto->nombre }}</td>
                    <td class="centreado">
                        @if ($caja->responsable)
                            {{ $caja->responsable->full_name }}
                        @endif
                    </td>
                    <td class="centreado {{ $caja->nro_factura ? '' : 'vacio' }}">{{ $caja->nro_factura }}</td>
                    <td class="">{{ $caja->descripcion }}</td>
                    <td class="centreado {{ $caja->a_favor ? '' : 'vacio' }}">{{ $caja->a_favor }}</td>
                    <td class="centreado {{ $caja->nro ? '' : 'vacio' }}">{{ $caja->nro }}</td>
                    <td class="centreado {{ $caja->tipo == 'RECIBO' ? '' : 'vacio' }}">
                        @if ($caja->tipo == 'RECIBO')
                            @if ($caja->a_favor == 'OTRO')
                                {{ $caja->nombre }}
                            @else
                                @if ($caja->user)
                                    {{ $caja->user->full_name }}
                                @endif
                            @endif
                        @endif
                    </td>
                    <td class="centreado">{{ $caja->fecha }}</td>
                    <td class="centreado">{{ $caja->monto }}</td>
                </tr>
            @endforeach
            <tr>
                <td colspan="11" class="bg-principal derecha bold text-lg">TOTAL</td>
                <td class="bg-principal centreado bold text-lg">{{ number_format($total, 2, '.', '') }}</td>
            </tr>
        </tbody>
    </table>
</body>

</html>
