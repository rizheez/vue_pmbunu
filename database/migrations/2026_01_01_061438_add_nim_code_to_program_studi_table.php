<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Mapping nama prodi ke kode NIM (4 digit)
     */
    private array $prodiCodes = [
        'Arsitektur' => '0101',
        'Desain Interior' => '0102',
        'Farmasi' => '0103',
        'Teknik Industri' => '0104',
        'Teknik Informatika' => '0105',
        'Teknologi Industri Pertanian' => '0106',
        'Hubungan Internasional' => '0201',
        'Ilmu Komunikasi' => '0202',
        'Akuntansi' => '0203',
        'Pendidikan Anak Usia Dini' => '0204',
    ];

    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Add nim_code column (nullable initially)
        Schema::table('program_studi', function (Blueprint $table) {
            $table->string('nim_code', 4)->nullable()->after('code');
        });

        // Populate nim_code for existing prodi
        foreach ($this->prodiCodes as $name => $nimCode) {
            DB::table('program_studi')
                ->where('name', $name)
                ->update(['nim_code' => $nimCode]);
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('program_studi', function (Blueprint $table) {
            $table->dropColumn('nim_code');
        });
    }
};
