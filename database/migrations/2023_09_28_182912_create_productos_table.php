<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('productos', function (Blueprint $table) {
            $table->id();
            $table->string("nombre", 255);
            $table->text("descripcion");
            $table->decimal("precio", 24, 2);
            $table->double("cantidad_stock", 8, 2);
            $table->unsignedBigInteger("catalogo_id");
            $table->string("imagen", 255)->nullable();
            $table->timestamps();

            $table->foreign("catalogo_id")->on("catalogos")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('productos');
    }
}
