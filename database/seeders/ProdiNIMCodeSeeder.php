<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProdiNIMCodeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $prodiCodes = [
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

        foreach ($prodiCodes as $name => $nimCode) {
            DB::table('program_studi')
                ->where('name', $name)
                ->update(['nim_code' => $nimCode]);
        }
    }
}
