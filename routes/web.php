<?php

use App\Http\Controllers\ActividadController;
use App\Http\Controllers\BannerController;
use App\Http\Controllers\CatalogoController;
use App\Http\Controllers\ConfiguracionController;
use App\Http\Controllers\ContactoController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\NosotrosController;
use App\Http\Controllers\PortalController;
use App\Http\Controllers\ProductoController;
use App\Http\Controllers\RedSocialController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;


// PORTAL
Route::get('/url_asset', [ConfiguracionController::class, 'url_asset'])->name("url_asset");

// LOGIN
Route::post('/login', [LoginController::class, 'login']);
Route::post('/logout', [LoginController::class, 'logout']);

// CONFIGURACIÓN
Route::get('/configuracion/getConfiguracion', [ConfiguracionController::class, 'getConfiguracion']);

// ACCIONES PORTAL
Route::get('portal/getSliders', [BannerController::class, 'index']);
Route::get('portal/getActividades', [ActividadController::class, 'index']);
Route::get('portal/getActividad/{actividad}', [ActividadController::class, 'show']);
Route::get('portal/ultimasActividades', [ActividadController::class, 'ultimasActividades']);
Route::get('portal/getNosotros', [NosotrosController::class, 'index']);
Route::get('portal/getContacto', [ContactoController::class, 'index']);
Route::get('portal/getRedSocial', [RedSocialController::class, 'index']);
Route::get('portal/listaProductos', [ProductoController::class, 'listaProductos']);
Route::get('portal/getCatalogos', [CatalogoController::class, 'index']);
Route::get('portal/ultimosProductos', [ProductoController::class, 'ultimosProductos']);
Route::get('portal/getProducto/{producto}', [ProductoController::class, 'show']);

Route::middleware(['auth'])->group(function () {
    Route::post('/configuracion/update', [ConfiguracionController::class, 'update']);

    Route::prefix('admin')->group(function () {
        // Usuarios
        Route::post('usuarios/imprimirCredencial/{usuario}', [UserController::class, 'imprimirCredencial']);
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
