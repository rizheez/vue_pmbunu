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
        Schema::create('reregistration_payments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->decimal('amount', 10, 2)->default(300000);
            $table->string('payment_proof_path')->nullable();
            $table->enum('status', ['pending', 'verified', 'rejected'])->default('pending');
            $table->foreignId('verified_by')->nullable()->constrained('users')->nullOnDelete();
            $table->timestamp('verified_at')->nullable();
            $table->text('notes')->nullable();
            $table->timestamps();
        });

        // Add reregistration_status to student_biodatas
        Schema::table('student_biodatas', function (Blueprint $table) {
            $table->enum('reregistration_status', ['not_started', 'form_completed', 'payment_pending', 'completed'])
                ->default('not_started')
                ->after('transportation');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reregistration_payments');

        Schema::table('student_biodatas', function (Blueprint $table) {
            $table->dropColumn('reregistration_status');
        });
    }
};
