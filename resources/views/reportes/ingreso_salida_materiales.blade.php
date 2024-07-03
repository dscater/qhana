<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Ingresos y Salidas de Materiales</title>
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

        .subtitulo {
            font-size: 0.9em;
            text-align: center;
            width: 100%;
        }

        .info_fecha {
            width: 100%;
            font-size: 0.75em;
            text-align: left;
        }
    </style>
</head>

<body>
    @php
        $contador = 0;
    @endphp
    @inject('configuracion', 'App\Models\Configuracion')
    @foreach ($materials as $item)
        <div class="encabezado">
            <div class="logo">
                <img src="{{ asset('imgs/' . $configuracion->first()->logo) }}">
                {{ $configuracion->first()->logo }}
            </div>
            <h2 class="titulo">
                {{ $configuracion->first()->razon_social }}
            </h2>
            <h4 class="texto">INGRESOS Y SALIDAS DE MATERIALES</h4>
            <h4 class="fecha">Expedido: {{ date('d-m-Y') }}</h4>
        </div>

        <h4 class="subtitulo">{{ $item->nombre }}</h4>

        @php
            $ingresos = App\Models\IngresoMaterial::where('material_id', $item->id)->orderBy('fecha_registro', 'asc');
            if ($fecha_ini && $fecha_fin) {
                $ingresos->whereBetween('fecha_registro', [$fecha_ini, $fecha_fin]);
            }
            $ingresos = $ingresos->get();

            $salidas = App\Models\SalidaMaterial::where('material_id', $item->id)->orderBy('fecha_registro', 'asc');
            if ($fecha_ini && $fecha_fin) {
                $salidas->whereBetween('fecha_registro', [$fecha_ini, $fecha_fin]);
            }
            $salidas = $salidas->get();
        @endphp
        <p class="info_fecha">Ingresos</p>
        @php
            $cont = 1;
        @endphp
        @foreach ($ingresos as $value)
            <table border="1">
                <thead>
                    <tr>
                        <th width="5%">N°</th>
                        <th>Cantidad</th>
                        <th>Fecha de Ingreso</th>
                        <th>Fecha de Registro</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>{{ $cont++ }}</td>
                        <td>{{ $value->cantidad }}</td>
                        <td>{{ $value->fecha_ingreso }}</td>
                        <td>{{ $value->fecha_registro }}</td>
                    </tr>
                </tbody>
            </table>
        @endforeach
        <p class="info_fecha">Salidas</p>
        @php
            $cont = 1;
        @endphp
        @foreach ($salidas as $value)
            <table border="1">
                <thead>
                    <tr>
                        <th width="5%">N°</th>
                        <th>Cantidad</th>
                        <th>Fecha de Salida</th>
                        <th>Fecha de Registro</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>{{ $cont++ }}</td>
                        <td>{{ $value->cantidad }}</td>
                        <td>{{ $value->fecha_salida }}</td>
                        <td>{{ $value->fecha_registro }}</td>
                    </tr>
                </tbody>
            </table>
        @endforeach
        @php
            $contador++;
        @endphp
        @if ($contador < count($materials))
            <div class="nueva_pagina"></div>
        @endif
    @endforeach
</body>

</html>
