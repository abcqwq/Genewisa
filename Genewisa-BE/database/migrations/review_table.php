<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('review', function (Blueprint $table) {
            $table->id();
            $table->string('username');
            $table->foreign('username')
                ->references('username')->on('user')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreignId('id_tempatwisata')
                ->constrained('tempatwisata')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->integer('rating');
            $table->text('comment')->nullable(true);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('review');
    }
};
