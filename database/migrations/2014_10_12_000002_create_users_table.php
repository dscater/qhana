<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('usuario')->unique();
            $table->string("nombre", 255);
            $table->string("paterno", 255);
            $table->string("materno", 255)->nullable();
            $table->string("ci", 40);
            $table->string("ci_exp", 20);
            $table->date("fecha_nac");
            $table->string("genero", 255);
            $table->string("cargo", 255);
            $table->date("fecha_ingreso");
            $table->string("taller");
            $table->string("dir", 255);
            $table->string("fono", 255)->nullable();
            $table->string("tipo_personal");
            $table->double("p_discapacidad", 8, 2);
            $table->enum("tipo", ["NINGUNO", "ADMINISTRADOR", "REPRESENTANTE", "SOCIO"]);
            $table->string("foto", 255)->nullable();
            $table->string("validez_credencial");
            $table->string('password');
            $table->integer("estado");
            $table->date("fecha_registro");
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
        Schema::dropIfExists('users');
    }
}
