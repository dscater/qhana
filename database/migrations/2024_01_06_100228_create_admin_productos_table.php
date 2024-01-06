<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAdminProductosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('admin_productos', function (Blueprint $table) {
            $table->id();
            $table->string("codigo_color", 255);
            $table->string("descripcion", 800);
            $table->string("titulo", 600);
            $table->double("stock_kg", 8, 2)->default(0);
            $table->double("stock_conos", 8, 2)->default(0);
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
        Schema::dropIfExists('admin_productos');
    }
}
