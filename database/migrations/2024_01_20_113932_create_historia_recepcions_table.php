<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHistoriaRecepcionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('historia_recepcions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("recepcion_pedido_id");
            $table->unsignedBigInteger("user_id");
            $table->unsignedBigInteger("solicitud_pedido_id");
            $table->unsignedBigInteger("distribucion_pedido_id");
            $table->date("fecha");
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
        Schema::dropIfExists('historia_recepcions');
    }
}
