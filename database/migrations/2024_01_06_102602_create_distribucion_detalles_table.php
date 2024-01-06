<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDistribucionDetallesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('distribucion_detalles', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("distribucion_pedido_id");
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
        Schema::dropIfExists('distribucion_detalles');
    }
}
