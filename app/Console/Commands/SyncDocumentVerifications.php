<?php

namespace App\Console\Commands;

use App\Models\StudentBiodata;
use Illuminate\Console\Command;

class SyncDocumentVerifications extends Command
{
    protected $signature = 'pmb:sync-verifications';
    protected $description = 'Sync document verification records based on existing file uploads';

    public function handle()
    {
        $this->info('Starting sync...');

        $biodatas = StudentBiodata::all();
        $count = 0;

        foreach ($biodatas as $biodata) {
            // Biodata verification
            if ($biodata->verifications()->where('document_type', 'biodata')->doesntExist()) {
                $biodata->updateVerificationStatus('biodata');
                $count++;
            }

            if ($biodata->photo_path) {
                if ($biodata->verifications()->where('document_type', 'photo')->doesntExist()) {
                    $biodata->updateVerificationStatus('photo');
                    $count++;
                }
            }
            if ($biodata->ktp_path) {
                if ($biodata->verifications()->where('document_type', 'ktp')->doesntExist()) {
                    $biodata->updateVerificationStatus('ktp');
                    $count++;
                }
            }
            if ($biodata->kk_path) {
                if ($biodata->verifications()->where('document_type', 'kk')->doesntExist()) {
                    $biodata->updateVerificationStatus('kk');
                    $count++;
                }
            }
            if ($biodata->certificate_path) {
                if ($biodata->verifications()->where('document_type', 'certificate')->doesntExist()) {
                    $biodata->updateVerificationStatus('certificate');
                    $count++;
                }
            }
        }

        $this->info("Synced {$count} verification records.");
    }
}
