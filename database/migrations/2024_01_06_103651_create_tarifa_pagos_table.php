<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTarifaPagosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tarifa_pagos', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("cliente_id");
            $table->unsignedBigInteger("solicitud_pedido_id");
            $table->double("cantidad", 8, 2);
            $table->double("peso", 8, 2);
            $table->decimal("mano_obra", 24, 2);
            $table->decimal("depreciacion", 24, 2);
            $table->decimal("ganancia", 24, 2);
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
        Schema::dropIfExists('tarifa_pagos');
    }
}
