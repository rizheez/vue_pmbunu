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
        Schema::table('student_parents', function (Blueprint $table) {
            $table->date('birth_date')->nullable()->after('birth_year');
        });

        Schema::table('student_parents', function (Blueprint $table) {
            $table->dropColumn('birth_year');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('student_parents', function (Blueprint $table) {
            $table->year('birth_year')->nullable()->after('birth_date');
        });

        Schema::table('student_parents', function (Blueprint $table) {
            $table->dropColumn('birth_date');
        });
    }
};
