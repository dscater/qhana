<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Distribución de Pedidos</title>
    <style type="text/css">
        * {
            font-family: sans-serif;
        }

        @page {
            margin-top: 0.5cm;
            margin-bottom: 0.5cm;
            margin-left: 1.5cm;
            margin-right: 0.5cm;
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
            font-size: 9pt;
        }

        table tbody tr td {
            font-size: 8pt;
        }


        .encabezado {
            width: 100%;
        }

        .logo img {
            position: absolute;
            height: 90px;
            top: 0px;
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

        .bg-principal {
            background: #c57a40;
            color: white;
        }

        .txt_rojo {}

        .img_celda img {
            width: 45px;
        }

        .nueva_pagina {
            page-break-after: always;
        }

        .info_cliente {
            width: 70%;
            margin: auto;
            margin-top: 20px;
        }
    </style>
</head>

<body>
    @php
        $contador = 0;
    @endphp
    @inject('configuracion', 'App\Models\Configuracion')
    @foreach ($distribucion_pedidos as $item)
        <div class="encabezado">
            <div class="logo">
                <img src="{{ asset('imgs/' . $configuracion->first()->logo) }}">
                {{ $configuracion->first()->logo }}
            </div>
            <h2 class="titulo">
                {{ $configuracion->first()->razon_social }}
            </h2>
            <h4 class="texto">DISTRIBUCIÓN DE PEDIDOS</h4>
            <h4 class="fecha">Expedido: {{ date('d-m-Y') }}</h4>
        </div>
        <table class="info_cliente">
            <tbody>
                <tr>
                    <td width="25%">Código de pedido: </td>
                    <td>{{ $item->solicitud_pedido->codigo }}</td>
                </tr>
                <tr>
                    <td>Socio/Taller: </td>
                    <td>{{ $item->user->full_name }}</td>
                </tr>
                <tr>
                    <td>Fecha de Distribución: </td>
                    <td>{{ $item->fecha_distribución }}</td>
                </tr>
            </tbody>
        </table>

        <table border="1">
            <thead>
                <tr>
                    <th width="35%">Detalle Producto</th>
                    <th>Cantidad Restante</th>
                    <th>Peso Restante (gr)</th>
                    <th>Cantidad Distribución</th>
                    <th>Peso Distribución (gr)</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($item->distribucion_detalles as $value)
                    <tr>
                        <td>
                            <div class="desc codigo">
                                <strong>Código: </strong><span>{{ $value->solicitud_detalle->codigo }}</span>
                            </div>
                            <div class="desc descripcion">
                                <strong>Descripción:
                                </strong><span>{{ $value->solicitud_detalle->descripcion }}</span>
                            </div>
                            <div class="desc talla">
                                <strong>Talla: </strong><span>{{ $value->solicitud_detalle->talla }}</span>
                            </div>
                            <div class="desc cantidad">
                                <strong>Cantidad: </strong><span
                                    class="badge badge-primary text-md">{{ $value->solicitud_detalle->cantidad }}</span>
                            </div>
                            <div class="desc peso">
                                <strong>Peso Uni.(gr): </strong><span
                                    class="badge badge-info text-md">{{ $value->solicitud_detalle->peso }}</span>
                            </div>
                            <div class="desc elaborado">
                                <strong>Elaborado: </strong><span>{{ $value->solicitud_detalle->elaborado }}</span>
                            </div>
                            <div class="desc titulo">
                                <strong>Título: </strong><span>{{ $value->solicitud_detalle->titulo }}</span>
                            </div>
                            <div class="desc codigo_color">
                                <strong>Color Código:
                                </strong><span>{{ $value->solicitud_detalle->codigo_color }}</span>
                            </div>
                            <div class="desc peso">
                                <strong>Peso Total (gr): </strong><span
                                    class="badge badge-info text-md">{{ $value->solicitud_detalle->peso_total }}</span>
                            </div>

                        </td>
                        <td>{{ $value->solicitud_detalle->cantidad_restante }}</td>
                        <td>{{ $value->solicitud_detalle->peso_restante }}</td>
                        <td>{{ $value->cantidad }}</td>
                        <td>{{ $value->peso }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        @php
            $contador++;
        @endphp
        @if ($contador < count($distribucion_pedidos))
            <div class="nueva_pagina"></div>
        @endif
    @endforeach
</body>

</html>
