<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRepositorioArchivosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('repositorio_archivos', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("repositorio_id");
            $table->string("archivo", 255);
            $table->string("ext", 255);
            $table->string("tipo", 255);
            $table->timestamps();

            $table->foreign("repositorio_id")->on("repositorios")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('repositorio_archivos');
    }
}
