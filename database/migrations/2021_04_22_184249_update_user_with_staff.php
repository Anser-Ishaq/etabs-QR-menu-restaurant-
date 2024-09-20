<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            // $table->string('otp')->nullable();
            $table->unsignedBigInteger('restaurant_id')->nullable();
            // $table->string('restaurant_group')->nullable();
            $table->foreign('restaurant_id')->references('id')->on('restorants');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
