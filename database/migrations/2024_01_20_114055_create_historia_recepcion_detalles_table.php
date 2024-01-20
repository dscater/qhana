<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHistoriaRecepcionDetallesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('historia_recepcion_detalles', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("historia_recepcion_id");
            $table->unsignedBigInteger("recepcion_detalle_id");
            $table->unsignedBigInteger("solicitud_detalle_id");
            $table->double("cantidad", 8, 2);
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
        Schema::dropIfExists('historia_recepcion_detalles');
    }
}
