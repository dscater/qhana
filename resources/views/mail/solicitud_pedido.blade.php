<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Solicitud de Pedido</title>
    <style>
        html,
        body {
            color: black;
        }

        table {
            border-collapse: collapse;
        }

        table thead {
            background: black;

        }

        table thead tr th {
            color: white;
        }

        table thead tr th,
        table tbody tr td {
            padding: 5px;
            text-align: center;
        }
    </style>
</head>

<body>
    <h1>Solicitud de Pedido</h1>
    <p>Cliente: {{ $pedido->nombres }} {{ $pedido->apellidos }}</p>
    <p>Teléfono/Celular: {{ $pedido->fono }}</p>
    <p>País/Estado/Ciudad: {{ $pedido->pec }}</p>
    <table border="1">
        <thead>
            <tr>
                <th>Producto</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Subtotal</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($detalle_pedidos as $dp)
                <tr>
                    <td>{{ $dp->producto->nombre }}</td>
                    <td>{{ $dp->cantidad }}</td>
                    <td>{{ $dp->precio }}</td>
                    <td>{{ $dp->subtotal }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>

</html>
