<?php

use App\Http\Controllers\ActividadController;
use App\Http\Controllers\AdminProductoController;
use App\Http\Controllers\ApiController;
use App\Http\Controllers\BannerController;
use App\Http\Controllers\CajaController;
use App\Http\Controllers\CatalogoController;
use App\Http\Controllers\ClienteController;
use App\Http\Controllers\ConceptoController;
use App\Http\Controllers\ConfiguracionController;
use App\Http\Controllers\ContactoController;
use App\Http\Controllers\DistribucionPedidoController;
use App\Http\Controllers\IngresoMaterialController;
use App\Http\Controllers\IngresoProductoController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\MaterialController;
use App\Http\Controllers\MovimientoCajaController;
use App\Http\Controllers\NosotrosController;
use App\Http\Controllers\PedidoController;
use App\Http\Controllers\ProductoController;
use App\Http\Controllers\RecepcionPedidoController;
use App\Http\Controllers\RedSocialController;
use App\Http\Controllers\ReporteController;
use App\Http\Controllers\RepositorioArchivoController;
use App\Http\Controllers\RepositorioController;
use App\Http\Controllers\SalidaMaterialController;
use App\Http\Controllers\SalidaProductoController;
use App\Http\Controllers\SolicitudPedidoController;
use App\Http\Controllers\TarifaPagoController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;


// PORTAL
Route::get('/url_asset', [ConfiguracionController::class, 'url_asset'])->name("url_asset");

// VACIAR CACHE
Route::get('/cache_clear', function () {
    Artisan::call("route:clear");
    Artisan::call("route:cache");
    Artisan::call("view:clear");
    Artisan::call("config:cache");
    Artisan::call("optimize");

    return 'Cache borrada correctamente<br/><a href="' . url("/") . '">Volver al inicio<a>';
});

// LOGIN
Route::post('/login', [LoginController::class, 'login']);
Route::post('/logout', [LoginController::class, 'logout']);

// CONFIGURACIÓN
Route::get('/configuracion/getConfiguracion', [ConfiguracionController::class, 'getConfiguracion']);

// ACCIONES PORTAL
// sliders
Route::get('portal/getSliders', [BannerController::class, 'index']);
// actividades
Route::get('portal/listaActividades', [ActividadController::class, 'listaActividades']);
Route::get('portal/getActividad/{actividad}', [ActividadController::class, 'show']);
Route::get('portal/ultimasActividades', [ActividadController::class, 'ultimasActividades']);
// nosotros
Route::get('portal/getNosotros', [NosotrosController::class, 'index']);
// contacto
Route::get('portal/getContacto', [ContactoController::class, 'index']);
Route::post('portal/enviarcorreo', [ContactoController::class, 'enviarcorreo']);
// redes sociales
Route::get('portal/getRedSocial', [RedSocialController::class, 'index']);
// productos
Route::get('portal/listaProductos', [ProductoController::class, 'listaProductos']);
Route::get('portal/ultimosProductos', [ProductoController::class, 'ultimosProductos']);
Route::get('portal/getProducto/{producto}', [ProductoController::class, 'show']);
// catalogos
Route::get('portal/getCatalogos', [CatalogoController::class, 'index']);
// pedidos
Route::post('portal/solicitudPedido', [PedidoController::class, 'solicitudPedido']);

Route::middleware(['auth'])->group(function () {
    Route::post('/configuracion/update', [ConfiguracionController::class, 'update']);

    Route::prefix('admin')->group(function () {
        // Usuarios
        Route::post('usuarios/imprimirCredencial/{usuario}', [UserController::class, 'imprimirCredencial']);
        Route::get('usuarios/getUsuarioTipoPersonal', [UserController::class, 'getUsuarioTipoPersonal']);
        Route::get('usuarios/getUsuarioTipo', [UserController::class, 'getUsuarioTipo']);
        Route::get('usuarios/getUsuario/{usuario}', [UserController::class, 'getUsuario']);
        Route::patch('usuarios/asignarConfiguracion/{usuario}', [UserController::class, 'asignarConfiguracion']);
        Route::get('usuarios/userActual', [UserController::class, 'userActual']);
        Route::get('usuarios/getInfoBox', [UserController::class, 'getInfoBox']);
        Route::get('usuarios/getPermisos/{usuario}', [UserController::class, 'getPermisos']);
        Route::get('usuarios/getEncargadosRepresentantes', [UserController::class, 'getEncargadosRepresentantes']);
        Route::post('usuarios/actualizaContrasenia/{usuario}', [UserController::class, 'actualizaContrasenia']);
        Route::post('usuarios/actualizaFoto/{usuario}', [UserController::class, 'actualizaFoto']);
        Route::resource('usuarios', UserController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // BANNERS
        Route::get('banners/get_banner/ultimo', [BannerController::class, 'bannerPrincipal']);
        Route::resource('banners', BannerController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // ACTIVIDADES
        Route::get('actividads/get_actividad/ultimo', [ActividadController::class, 'ultimaActividad']);
        Route::resource('actividads', ActividadController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // NOSOTROS
        Route::resource('nosotros', NosotrosController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // CONTACTOS
        Route::resource('contactos', ContactoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // APIS
        Route::resource('apis', ApiController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // REDES SOCIALES
        Route::resource('red_socials', RedSocialController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // CATALOGOS
        Route::resource('catalogos', CatalogoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // PRODUCTOS
        Route::resource('productos', ProductoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // CONCEPTOS
        Route::resource('conceptos', ConceptoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // CAJAS
        Route::post('cajas/generarRecibo/{caja}', [CajaController::class, 'generarRecibo']);
        Route::get('cajas/getSaldo', [CajaController::class, 'getSaldo']);
        Route::resource('cajas', CajaController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // MOVIMIENTOS CAJAS
        Route::resource('movimiento_cajas', MovimientoCajaController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // PEDIDOS
        Route::put('pedidos/eliminarPedido/{pedido}', [PedidoController::class, 'eliminarPedido']);
        Route::put('pedidos/atenderPedido/{pedido}', [PedidoController::class, 'atenderPedido']);
        Route::put('pedidos/restablecerPedido/{pedido}', [PedidoController::class, 'restablecerPedido']);
        Route::resource('pedidos', PedidoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // REPOSITORIOS
        Route::resource('repositorios', RepositorioController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);
        // REPOSITORIOS - ARCHIVOS
        Route::post('repositorio_archivos/store/{repositorio}', [RepositorioArchivoController::class, 'store']);
        Route::delete('repositorio_archivos/{repositorio_archivo}', [RepositorioArchivoController::class, 'destroy']);

        // ADMIN PRODUCTOS
        Route::resource('admin_productos', AdminProductoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // INGRESO PRODUCTOS
        Route::resource('ingreso_productos', IngresoProductoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // SALIDA PRODUCTOS
        Route::resource('salida_productos', SalidaProductoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // CLIENTES
        Route::resource('clientes', ClienteController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // SOLICITUD PEDIDOS
        Route::get("solicitud_pedidos/byUser", [SolicitudPedidoController::class, 'byUser']);
        Route::resource('solicitud_pedidos', SolicitudPedidoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // DISTRIBUCION PEDIDOS
        Route::get("distribucion_pedidos/byUser", [DistribucionPedidoController::class, 'byUser']);
        Route::resource('distribucion_pedidos', DistribucionPedidoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // RECEPCION PEDIDOS
        Route::resource('recepcion_pedidos', RecepcionPedidoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // TARIFA PAGOS
        Route::resource('tarifa_pagos', TarifaPagoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // MATERIALES
        Route::resource('materials', MaterialController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // INGRESO MATERIALES
        Route::resource('ingreso_materials', IngresoMaterialController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // SALIDA MATERIALES
        Route::resource('salida_materials', SalidaMaterialController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // REPORTES
        Route::post('reportes/usuarios', [ReporteController::class, 'usuarios']);
        Route::post('reportes/cajas', [ReporteController::class, 'cajas']);
    });
});




// ADMINISTRACIÓN
Route::get('/administracion/{optional?}', function () {
    return view('app');
})->name('base_path')->where('optional', '.*');


// PORTAL
Route::get('/{optional?}', function () {
    return view('portal');
})->name('portal.inicio')->where('optional', '.*');
