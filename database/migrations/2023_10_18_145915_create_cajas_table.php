<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCajasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cajas', function (Blueprint $table) {
            $table->id();
            $table->string("tipo");
            $table->string("tipo_movimiento");
            $table->unsignedBigInteger("concepto_id");
            $table->decimal("monto", 24, 2);
            $table->unsignedBigInteger("responsable_id");
            $table->integer("nro_factura");
            $table->date("fecha");
            $table->text("descripcion")->nullable();
            $table->string("a_favor")->nullable();
            $table->integer("nro");
            $table->unsignedBigInteger("user_id")->nullable();
            $table->string("nombre")->nullable();
            $table->date("fecha_registro");
            $table->integer("estado");
            $table->unsignedBigInteger("movimiento_caja_id");
            $table->timestamps();

            $table->foreign("concepto_id")->on("conceptos")->references("id");
            $table->foreign("responsable_id")->on("users")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cajas');
    }
}
