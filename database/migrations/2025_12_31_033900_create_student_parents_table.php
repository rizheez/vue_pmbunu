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
        Schema::create('student_parents', function (Blueprint $table) {
            $table->id();
            $table->foreignId('student_biodata_id')->constrained()->cascadeOnDelete();

            // Parent type
            $table->enum('type', ['ayah', 'ibu', 'wali']);

            // Personal info
            $table->string('name');
            $table->string('nik')->nullable();
            $table->year('birth_year')->nullable();
            $table->boolean('is_alive')->default(true);

            // Education (Neo Feeder standard)
            $table->enum('education', [
                'tidak_sekolah',
                'sd',
                'smp',
                'sma',
                'd1',
                'd2',
                'd3',
                'd4_s1',
                's2',
                's3',
            ])->nullable();

            // Occupation
            $table->string('occupation')->nullable();

            // Monthly income range (Neo Feeder standard)
            $table->enum('income', [
                'tidak_berpenghasilan',
                'kurang_500rb',
                '500rb_1jt',
                '1jt_2jt',
                '2jt_3jt',
                '3jt_5jt',
                'lebih_5jt',
            ])->nullable();

            // Contact
            $table->string('phone')->nullable();

            // Address (can be different from student)
            $table->text('address')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('student_parents');
    }
};
