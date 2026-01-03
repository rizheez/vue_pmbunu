<?php

namespace Database\Seeders;

use App\Models\ProgramStudi;
use App\Models\Registration;
use App\Models\RegistrationPath;
use App\Models\RegistrationPeriod;
use App\Models\RegistrationType;
use App\Models\ReregistrationPayment;
use App\Models\StudentBiodata;
use App\Models\StudentParent;
use App\Models\StudentSpecialNeed;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class ReregistrationTestSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $period = RegistrationPeriod::where('is_active', true)->first();
        if (! $period) {
            $period = RegistrationPeriod::factory()->create(['is_active' => true]);
        }

        $type = RegistrationType::first();
        if (! $type) {
            $type = RegistrationType::create(['name' => 'Peserta Didik Baru', 'is_active' => true]);
        }

        $path = RegistrationPath::first();
        if (! $path) {
            $path = RegistrationPath::create(['name' => 'Umum', 'is_active' => true]);
        }

        $prodi = ProgramStudi::first();
        if (! $prodi) {
            $prodi = ProgramStudi::create(['name' => 'Teknik Informatika', 'code' => 'TI', 'jenjang' => 'S1', 'is_active' => true]);
        }

        // 1. User with Accepted Status (Needs to start re-registration form)
        $this->createUser(
            'Test Accepted',
            'accepted@example.com',
            'accepted',
            'not_started', // reregistration_status
            null, // Payment Status
            $period,
            $type,
            $path,
            $prodi
        );

        // 2. User with form completed, ready to upload payment
        $this->createUser(
            'Test Form Completed',
            'formcompleted@example.com',
            're_registration_pending',
            'form_completed', // reregistration_status
            null,
            $period,
            $type,
            $path,
            $prodi
        );

        // 3. User with Payment Pending (Has submitted payment, waiting verification)
        $this->createUser(
            'Test Payment Pending',
            'pending@example.com',
            're_registration_pending',
            'payment_pending', // reregistration_status
            'pending',
            $period,
            $type,
            $path,
            $prodi
        );

        // 4. User with Payment Verified (Ready for enrollment)
        $this->createUser(
            'Test Payment Verified',
            'verified@example.com',
            're_registration_verified',
            'completed', // reregistration_status
            'verified',
            $period,
            $type,
            $path,
            $prodi
        );

        // 5. User with Payment Rejected (Needs to re-upload)
        $this->createUser(
            'Test Payment Rejected',
            'rejected@example.com',
            're_registration_pending',
            'payment_pending', // reregistration_status
            'rejected',
            $period,
            $type,
            $path,
            $prodi
        );
    }

    private function createUser(
        string $name,
        string $email,
        string $regStatus,
        ?string $reregistrationStatus,
        ?string $paymentStatus,
        $period,
        $type,
        $path,
        $prodi
    ): void {
        $user = User::firstOrCreate(
            ['email' => $email],
            [
                'name' => $name,
                'password' => Hash::make('password'),
                'role' => 'student',
                'email_verified_at' => now(),
            ]
        );

        // Create or Update StudentBiodata with re-registration fields
        $biodata = StudentBiodata::updateOrCreate(
            ['user_id' => $user->id],
            [
                'name' => $name,
                'nik' => '3575' . rand(100000000000, 999999999999),
                'nisn' => rand(1000000000, 9999999999),
                'phone' => '08' . rand(1000000000, 9999999999),
                'birth_place' => 'Samarinda',
                'birth_date' => '2000-01-15',
                'gender' => 'Laki-laki',
                'religion' => 'Islam',
                'address' => 'Jl. Siradj Salman No. 1, Samarinda',
                'last_education' => 'SMA',
                'school_origin' => 'SMAN 1 Samarinda',
                'major' => 'IPA',
                'mother_name' => 'Ibu ' . $name,
                // Re-registration address fields
                'provinsi' => 'Kalimantan Timur',
                'kabupaten' => 'Kota Samarinda',
                'kecamatan' => 'Samarinda Kota',
                'kelurahan' => 'Bugis',
                'dusun' => 'Jl. Siradj Salman',
                'rt' => '01',
                'rw' => '02',
                'kode_pos' => '75117',
                // Additional info
                'npwp' => null,
                'kps_recipient' => false,
                'kps_number' => null,
                'residence_type' => 'bersama_orang_tua',
                'transportation' => 'sepeda_motor',
                // Status
                'reregistration_status' => $reregistrationStatus ?? 'not_started',
            ]
        );

        // Create parent data if form is completed
        if ($reregistrationStatus) {
            // Delete existing parents
            $biodata->parents()->delete();

            // Create Father
            StudentParent::create([
                'student_biodata_id' => $biodata->id,
                'type' => 'ayah',
                'name' => 'Ayah ' . $name,
                'nik' => '3575' . rand(100000000000, 999999999999),
                'birth_date' => '1970-05-10',
                'is_alive' => true,
                'education' => 'd4_s1',
                'occupation' => 'PNS',
                'income' => 'lebih_5jt',
                'phone' => '08' . rand(1000000000, 9999999999),
            ]);

            // Create Mother
            StudentParent::create([
                'student_biodata_id' => $biodata->id,
                'type' => 'ibu',
                'name' => 'Ibu ' . $name,
                'nik' => '3575' . rand(100000000000, 999999999999),
                'birth_date' => '1975-08-20',
                'is_alive' => true,
                'education' => 'sma',
                'occupation' => 'Ibu Rumah Tangga',
                'income' => 'tidak_berpenghasilan',
                'phone' => '08' . rand(1000000000, 9999999999),
            ]);

            // Create special needs (default: tidak ada)
            $biodata->specialNeeds()->delete();
            StudentSpecialNeed::create([
                'student_biodata_id' => $biodata->id,
                'type' => 'tidak_ada',
                'description' => null,
                'assistance_needed' => null,
            ]);
        }

        // Create or Update Registration
        Registration::updateOrCreate(
            ['user_id' => $user->id],
            [
                'registration_number' => Registration::generateRegistrationNumber($period),
                'registration_period_id' => $period->id,
                'registration_type_id' => $type->id,
                'registration_path_id' => $path->id,
                'choice_1' => $prodi->id,
                'status' => $regStatus,
                'accepted_program_studi_id' => $prodi->id,
                'accepted_at' => now(),
            ]
        );

        // Handle Payment
        if ($paymentStatus) {
            ReregistrationPayment::updateOrCreate(
                ['user_id' => $user->id],
                [
                    'amount' => 300000,
                    'status' => $paymentStatus,
                    'payment_proof_path' => 'reregistration-payments/dummy-proof.jpg',
                    'verified_at' => $paymentStatus === 'verified' ? now() : null,
                    'verified_by' => $paymentStatus === 'verified' ? User::where('role', 'admin')->first()?->id : null,
                    'notes' => $paymentStatus === 'rejected' ? 'Bukti pembayaran tidak jelas, silakan upload ulang.' : null,
                ]
            );
        }
    }
}
