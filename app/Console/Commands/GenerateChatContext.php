<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class GenerateChatContext extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'chat:generate-context';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Generate chatbot system prompt context from database to a static file';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $this->info('Generating chat context...');

        // Active Period
        $activePeriod = \App\Models\RegistrationPeriod::where('is_active', true)->first();
        $periodInfo = $activePeriod
            ? "Gelombang saat ini: {$activePeriod->name} ({$activePeriod->start_date->format('d M Y')} - {$activePeriod->end_date->format('d M Y')})."
            : "Saat ini belum ada gelombang pendaftaran yang aktif.";

        // Registration Paths
        $paths = \App\Models\RegistrationPath::where('is_active', true)->pluck('name')->implode(', ');
        $pathsInfo = $paths ? "Jalur pendaftaran yang tersedia: {$paths}." : "Belum ada jalur pendaftaran yang dibuka.";

        // Program Studi
        $prodi = \App\Models\ProgramStudi::where('is_active', true)->get()->map(function ($p) {
            return "- {$p->jenjang} {$p->name}";
        })->implode("\n");
        $prodiInfo = "Program Studi yang tersedia:\n{$prodi}";

        // Landing Page Settings (Contacts)
        $settings = \App\Models\LandingPageSetting::where('group', 'contact')->pluck('value', 'key');
        $contactPhone = $settings['contact_phone_1'] ?? '-';
        $contactEmail = $settings['contact_email'] ?? '-';
        $contactInfo = "Kontak Resmi:\nTelepon/WA: {$contactPhone}\nEmail: {$contactEmail}";

        // Chat Training Q&A (Knowledge Base)
        $knowledgeBase = \App\Models\ChatTraining::all()->map(function ($item) {
            return "Q: {$item->question}\nA: {$item->answer}";
        })->implode("\n\n");
        $knowledgeInfo = "REFERENSI PERTANYAAN UMUM:\n{$knowledgeBase}";

        $beasiswaInfo = "BEASISWA TERSEDIA: KIP-K, GratisPol (PENDIDIKAN GRATISPOL KALIMANTAN TIMUR). Jika ingin mengajukan beasiswa, silahkan menghubungi kontak resmi UNU Kaltim.";

        $content = <<<CONTEXT
[DATA REAL-TIME UNU KALTIM]
{$periodInfo}
{$pathsInfo}

{$prodiInfo}



{$contactInfo}

{$knowledgeInfo}

{$beasiswaInfo}

[AKHIR DATA REAL-TIME]
CONTEXT;

        \Illuminate\Support\Facades\Storage::put('chat_context.txt', $content);

        $this->info('Chat context generated successfully at ' . storage_path('app/chat_context.txt'));
    }
}
