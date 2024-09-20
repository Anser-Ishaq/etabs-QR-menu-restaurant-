<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('transactions', function (Blueprint $table) {
            $table->id();
            $table->string('user_name');
            $table->double('amount', 8, 2);
            $table->string('currency');
            $table->double('tax', 8, 2)->nullable();
            $table->double('tip', 8, 2)->nullable();
            $table->double('service', 8, 2)->nullable();
            $table->string('brand')->nullable(); // visa, master
            $table->string('last4')->nullable();
            $table->string('payment_method')->nullable(); // card, google pay, apple pay
            $table->text('session_id')->nullable();
            $table->boolean('is_paid')->default(false);
            $table->foreignId('user_id')->nullable()->constrained()->nullOnDelete();
            $table->foreignId('order_id')->constrained()->cascadeOnDelete();
            $table->timestamps();
        });

        Schema::create('transaction_items', function (Blueprint $table) {
            $table->id();
            $table->integer('quantity')->default(1);
            $table->foreignId('order_item_id')->constrained('order_has_items')->cascadeOnDelete();
            $table->foreignId('transaction_id')->constrained()->cascadeOnDelete();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('transaction_items');
        Schema::dropIfExists('transactions');
    }
};
