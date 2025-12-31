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
            // Parent info (for Neo Feeder)
            $table->string('mother_name')->nullable()->after('address');

            // Additional identification
            $table->string('npwp')->nullable()->after('mother_name');

            // Contact details
            $table->string('telephone')->nullable()->after('npwp'); // Landline
            $table->string('email')->nullable()->after('telephone');

            // Detailed address
            $table->string('dusun')->nullable()->after('email');
            $table->string('rt')->nullable()->after('dusun');
            $table->string('rw')->nullable()->after('rt');
            $table->string('kelurahan')->nullable()->after('rw');
            $table->string('kode_pos')->nullable()->after('kelurahan');
            $table->string('kecamatan')->nullable()->after('kode_pos');
            $table->string('kabupaten')->nullable()->after('kecamatan');
            $table->string('provinsi')->nullable()->after('kabupaten');

            // Additional info for Neo Feeder
            $table->boolean('kps_recipient')->default(false)->after('provinsi'); // Penerima KPS
            $table->string('kps_number')->nullable()->after('kps_recipient'); // Nomor KPS

            // Living conditions
            $table->enum('residence_type', [
                'bersama_orang_tua',
                'wali',
                'kost',
                'asrama',
                'panti_asuhan',
                'lainnya',
            ])->nullable()->after('kps_number');

            $table->enum('transportation', [
                'jalan_kaki',
                'sepeda',
                'sepeda_motor',
                'mobil_pribadi',
                'angkutan_umum',
                'ojek',
                'andong',
                'perahu',
                'lainnya',
            ])->nullable()->after('residence_type');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('student_biodatas', function (Blueprint $table) {
            $table->dropColumn([
                'mother_name',
                'npwp',
                'telephone',
                'email',
                'dusun',
                'rt',
                'rw',
                'kelurahan',
                'kode_pos',
                'kecamatan',
                'kabupaten',
                'provinsi',
                'kps_recipient',
                'kps_number',
                'residence_type',
                'transportation',
            ]);
        });
    }
};
