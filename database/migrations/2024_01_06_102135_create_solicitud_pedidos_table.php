<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSolicitudPedidosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('solicitud_pedidos', function (Blueprint $table) {
            $table->id();
            $table->string("codigo", 255);
            $table->unsignedBigInteger("cliente_id");
            $table->double("cantidad_restante", 8, 2)->default(0);
            $table->double("peso_restante", 8, 2)->default(0);
            $table->date("fecha_recepcion");
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
        Schema::dropIfExists('solicitud_pedidos');
    }
}
