<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\ChatTraining;

class ChatTrainingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Example training data for PMB chatbot
        ChatTraining::create([
            'question' => 'Apa persyaratan pendaftaran mahasiswa baru?',
            'answer' => 'Persyaratan pendaftaran meliputi ijazah SMA/SMK, nilai rapor, dan dokumen pendukung lainnya.',
        ]);

        ChatTraining::create([
            'question' => 'Berapa biaya kuliah di UNU Kaltim?',
            'answer' => 'Biaya kuliah bervariasi tergantung program studi, mulai dari Rp 5.000.000 per semester.',
        ]);

        ChatTraining::create([
            'question' => 'Bagaimana cara mengajukan beasiswa?',
            'answer' => 'Anda dapat mengajukan beasiswa melalui portal PMB dengan mengisi formulir beasiswa dan melampirkan dokumen pendukung.',
        ]);
    }
}
?>
