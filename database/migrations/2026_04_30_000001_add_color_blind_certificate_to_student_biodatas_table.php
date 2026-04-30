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
        Schema::table('student_biodatas', function (Blueprint $table) {
            $table->string('color_blind_certificate_path')->nullable()->after('certificate_path');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('student_biodatas', function (Blueprint $table) {
            $table->dropColumn('color_blind_certificate_path');
        });
    }
};
