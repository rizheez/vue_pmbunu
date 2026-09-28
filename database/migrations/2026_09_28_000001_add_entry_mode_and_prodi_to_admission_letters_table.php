<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('admission_letters', function (Blueprint $table) {
            $table->string('entry_mode')->default('registered')->after('user_id');
            $table->foreignId('program_studi_id')->nullable()->after('entry_mode')->constrained('program_studi')->nullOnDelete();
            $table->string('registration_number')->nullable()->after('program_studi_id');
        });

        // Backfill existing letters and clean up dummy registrations
        $letters = DB::table('admission_letters')->get();
        foreach ($letters as $letter) {
            $registration = DB::table('registrations')->where('user_id', $letter->user_id)->first();
            if ($registration) {
                // If it was created through manual admission letter (no choices and no path)
                $isManual = is_null($registration->choice_1) && is_null($registration->registration_path_id);

                DB::table('admission_letters')
                    ->where('id', $letter->id)
                    ->update([
                        'entry_mode' => $isManual ? 'manual' : 'registered',
                        'program_studi_id' => $registration->accepted_program_studi_id,
                        'registration_number' => $registration->registration_number,
                    ]);

                if ($isManual) {
                    // Remove dummy registration so this student doesn't appear in "Calon Mahasiswa"
                    DB::table('registrations')->where('id', $registration->id)->delete();
                }
            }
        }
    }

    public function down(): void
    {
        Schema::table('admission_letters', function (Blueprint $table) {
            $table->dropForeign(['program_studi_id']);
            $table->dropColumn(['entry_mode', 'program_studi_id', 'registration_number']);
        });
    }
};
