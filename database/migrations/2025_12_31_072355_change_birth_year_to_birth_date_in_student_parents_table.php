<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
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

        // Migrate existing data (year -> year-01-01)
        DB::statement("UPDATE student_parents SET birth_date = CONCAT(birth_year, '-01-01') WHERE birth_year IS NOT NULL");

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

        // Rollback data (year-mm-dd -> year)
        DB::statement("UPDATE student_parents SET birth_year = YEAR(birth_date) WHERE birth_date IS NOT NULL");

        Schema::table('student_parents', function (Blueprint $table) {
            $table->dropColumn('birth_date');
        });
    }
};
