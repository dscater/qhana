<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSolicitudDetallesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('solicitud_detalles', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("solicitud_pedido_id");
            $table->string("codigo", 255);
            $table->string("descripcion", 600);
            $table->string("talla", 100);
            $table->double("cantidad", 8, 2);
            $table->string("elaborado", 255);
            $table->string("titulo", 300);
            $table->string("codigo_color", 255);
            $table->double("peso", 8, 2);
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
        Schema::dropIfExists('solicitud_detalles');
    }
}
