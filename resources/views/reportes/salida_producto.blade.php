<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Salida de Producto</title>
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

        .bg-principal {
            background: #c57a40;
            color: white;
        }

        .bold {
            font-weight: bold;
        }

        .txt-right {
            text-align: right;
        }

        .img_celda img {
            width: 45px;
        }

        .firmas {
            width: 90%;
            margin: auto;
            margin-top: 90px;
            border-collapse: separate;
            border-spacing: 50px 0px;
        }

        .firma {
            border-top: dotted 1px black;
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
        <h4 class="texto">SALIDA DE PRODUCTO</h4>
        <h4 class="fecha">Expedido: {{ date('d-m-Y') }}</h4>
    </div>

    <table border="1">
        <tbody>
            <tr>
                <td class="bg-principal bold txt-right" width="20%">Producto: </td>
                <td>{{ $salida_producto->admin_producto->full_name }}</td>
            </tr>
            <tr>
                <td class="bg-principal bold txt-right">Cantidad: </td>
                <td>{{ $salida_producto->cantidad }}</td>
            </tr>
            <tr>
                <td class="bg-principal bold txt-right">Cantidad Conos: </td>
                <td>{{ $salida_producto->cantidad_conos }}</td>
            </tr>
            <tr>
                <td class="bg-principal bold txt-right">Socio: </td>
                <td>{{ $salida_producto->user ? $salida_producto->user->full_name : '' }}</td>
            </tr>
            <tr>
                <td class="bg-principal bold txt-right">Código Solicitud Pedido: </td>
                <td>{{ $salida_producto->solicitud_pedido ? $salida_producto->solicitud_pedido->codigo : '' }}</td>
            </tr>
            <tr>
                <td class="bg-principal bold txt-right">Detalle(Otros): </td>
                <td>{{ $salida_producto->detalle }}</td>
            </tr>
            <tr>
                <td class="bg-principal bold txt-right">Fecha Salida: </td>
                <td>{{ $salida_producto->fecha_salida }}</td>
            </tr>
        </tbody>
    </table>

    <table class="firmas">
        <tbody>
            <tr>
                <td class="centreado firma">ENTREGUÉ CONFORME</td>
                <td class="centreado firma">RECIBÍ CONFORME</td>
            </tr>
        </tbody>
    </table>
</body>

</html>
