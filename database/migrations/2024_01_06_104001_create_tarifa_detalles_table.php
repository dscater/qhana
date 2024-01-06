<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTarifaDetallesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tarifa_detalles', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("tarifa_pago_id");
            $table->unsignedBigInteger("solicitud_detalle_id");
            $table->double("cantidad", 8, 2);
            $table->double("peso", 8, 2);
            $table->decimal("mano_obra", 24, 2);
            $table->decimal("depreciacion", 24, 2);
            $table->decimal("ganancia", 24, 2);
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
        Schema::dropIfExists('tarifa_detalles');
    }
}
