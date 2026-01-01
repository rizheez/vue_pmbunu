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
        // Migrate data before dropping column
        $paths = \Illuminate\Support\Facades\DB::table('registration_paths')->get();

        foreach ($paths as $path) {
            \Illuminate\Support\Facades\DB::table('registrations')
                ->where('registration_path', $path->name)
                ->whereNull('registration_path_id')
                ->update(['registration_path_id' => $path->id]);
        }

        // Handle any remaining (legacy default fallback)
        $defaultPath = \Illuminate\Support\Facades\DB::table('registration_paths')->where('name', 'Umum')->first();
        if ($defaultPath) {
            \Illuminate\Support\Facades\DB::table('registrations')
                ->whereNull('registration_path_id')
                ->update(['registration_path_id' => $defaultPath->id]);
        }

        Schema::table('registrations', function (Blueprint $table) {
            $table->dropColumn('registration_path');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('registrations', function (Blueprint $table) {
            $table->string('registration_path')->nullable();
        });
    }
};
