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
        Schema::create('student_special_needs', function (Blueprint $table) {
            $table->id();
            $table->foreignId('student_biodata_id')->constrained()->cascadeOnDelete();

            // Special need type (Neo Feeder standard - Kebutuhan Khusus)
            $table->enum('type', [
                'tidak_ada',
                'tunanetra',
                'tunarungu',
                'tunawicara',
                'tunadaksa',
                'tunagrahita',
                'tunalaras',
                'autis',
                'adhd',
                'kesulitan_belajar',
                'down_syndrome',
                'lainnya',
            ])->default('tidak_ada');

            // Additional description if needed
            $table->text('description')->nullable();

            // Assistance needed
            $table->text('assistance_needed')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('student_special_needs');
    }
};
