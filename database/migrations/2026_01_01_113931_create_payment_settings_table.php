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
        Schema::create('payment_settings', function (Blueprint $table) {
            $table->id();
            $table->string('key')->unique();
            $table->text('value')->nullable();
            $table->string('type')->default('text'); // text, number, textarea
            $table->timestamps();
        });

        // Seed default values
        DB::table('payment_settings')->insert([
            ['key' => 'payment_type', 'value' => 'bank_transfer', 'type' => 'select', 'created_at' => now(), 'updated_at' => now()],
            ['key' => 'payment_bank_name', 'value' => 'BRI', 'type' => 'text', 'created_at' => now(), 'updated_at' => now()],
            ['key' => 'payment_account_number', 'value' => '0123-01-012345-50-8', 'type' => 'text', 'created_at' => now(), 'updated_at' => now()],
            ['key' => 'payment_account_name', 'value' => 'Universitas Nahdlatul Ulama Kaltim', 'type' => 'text', 'created_at' => now(), 'updated_at' => now()],
            ['key' => 'payment_amount', 'value' => '300000', 'type' => 'number', 'created_at' => now(), 'updated_at' => now()],
            ['key' => 'payment_instructions', 'value' => 'Transfer sesuai nominal yang tertera. Pastikan menyimpan bukti transfer.', 'type' => 'textarea', 'created_at' => now(), 'updated_at' => now()],
        ]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payment_settings');
    }
};
