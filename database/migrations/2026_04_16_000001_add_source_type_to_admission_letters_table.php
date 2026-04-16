<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('admission_letters', function (Blueprint $table) {
            $table->string('source_type', 20)
                ->default('generate_web')
                ->after('user_id');
        });
    }

    public function down(): void
    {
        Schema::table('admission_letters', function (Blueprint $table) {
            $table->dropColumn('source_type');
        });
    }
};
