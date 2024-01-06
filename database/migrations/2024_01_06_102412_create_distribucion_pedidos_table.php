<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDistribucionPedidosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('distribucion_pedidos', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("solicitud_pedido_id");
            $table->unsignedBigInteger("user_id");
            $table->date("fecha_distribucion");
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
        Schema::dropIfExists('distribucion_pedidos');
    }
}
