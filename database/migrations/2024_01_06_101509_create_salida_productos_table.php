<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSalidaProductosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('salida_productos', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("admin_producto_id");
            $table->double("cantidad", 8, 2);
            $table->double("cantidad_conos", 8, 2);
            $table->date("fecha_salida");
            $table->date("fecha_registro")->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('salida_productos');
    }
}
