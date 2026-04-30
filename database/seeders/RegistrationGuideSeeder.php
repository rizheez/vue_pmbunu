<?php

namespace Database\Seeders;

use App\Models\LandingPageSetting;
use Illuminate\Database\Seeder;

class RegistrationGuideSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $settings = [
            // Section Title and Description
            [
                'key' => 'registration_guide_title',
                'value' => 'Alur Pendaftaran PMB',
                'type' => 'text',
                'group' => 'registration_guide',
            ],
            [
                'key' => 'registration_guide_description',
                'value' => 'Ikuti langkah-langkah berikut untuk menyelesaikan pendaftaran mahasiswa baru',
                'type' => 'text',
                'group' => 'registration_guide',
            ],

            // Step 1: Registrasi Akun
            [
                'key' => 'registration_step_1_title',
                'value' => 'Registrasi Akun',
                'type' => 'text',
                'group' => 'registration_guide',
            ],
            [
                'key' => 'registration_step_1_description',
                'value' => 'Buat akun dengan email aktif Anda. Verifikasi email untuk mengaktifkan akun.',
                'type' => 'text',
                'group' => 'registration_guide',
            ],
            [
                'key' => 'registration_step_1_icon',
                'value' => 'user-plus',
                'type' => 'text',
                'group' => 'registration_guide',
            ],

            // Step 2: Lengkapi Biodata
            [
                'key' => 'registration_step_2_title',
                'value' => 'Lengkapi Biodata',
                'type' => 'text',
                'group' => 'registration_guide',
            ],
            [
                'key' => 'registration_step_2_description',
                'value' => 'Isi data pribadi, data orang tua, dan upload dokumen yang diperlukan.',
                'type' => 'text',
                'group' => 'registration_guide',
            ],
            [
                'key' => 'registration_step_2_icon',
                'value' => 'file-text',
                'type' => 'text',
                'group' => 'registration_guide',
            ],

            // Step 3: Pilih Program Studi
            [
                'key' => 'registration_step_3_title',
                'value' => 'Pilih Program Studi',
                'type' => 'text',
                'group' => 'registration_guide',
            ],
            [
                'key' => 'registration_step_3_description',
                'value' => 'Pilih program studi yang diminati dan jalur pendaftaran yang sesuai.',
                'type' => 'text',
                'group' => 'registration_guide',
            ],
            [
                'key' => 'registration_step_3_icon',
                'value' => 'graduation-cap',
                'type' => 'text',
                'group' => 'registration_guide',
            ],

            // Step 4: Verifikasi Data
            [
                'key' => 'registration_step_4_title',
                'value' => 'Verifikasi Data',
                'type' => 'text',
                'group' => 'registration_guide',
            ],
            [
                'key' => 'registration_step_4_description',
                'value' => 'Tunggu verifikasi data dari admin. Pendaftaran dan daftar ulang gratis.',
                'type' => 'text',
                'group' => 'registration_guide',
            ],
            [
                'key' => 'registration_step_4_icon',
                'value' => 'shield-check',
                'type' => 'text',
                'group' => 'registration_guide',
            ],

            // Step 5: Daftar Ulang
            [
                'key' => 'registration_step_5_title',
                'value' => 'Daftar Ulang',
                'type' => 'text',
                'group' => 'registration_guide',
            ],
            [
                'key' => 'registration_step_5_description',
                'value' => 'Finalisasi data daftar ulang setelah dinyatakan diterima.',
                'type' => 'text',
                'group' => 'registration_guide',
            ],
            [
                'key' => 'registration_step_5_icon',
                'value' => 'user-check',
                'type' => 'text',
                'group' => 'registration_guide',
            ],
        ];

        foreach ($settings as $setting) {
            LandingPageSetting::updateOrCreate(
                ['key' => $setting['key']],
                $setting
            );
        }
    }
}
